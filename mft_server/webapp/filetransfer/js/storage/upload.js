/* Copyright © 2009-2024. Redwood Software Inc. All rights reserved. */
jscape.storage=jscape.storage||{};jscape.UploadForm=Class.extend({initialize:function(a,b,c,d,e){this.name=a||"";this.description=b||"";this.enabled=!!c;this.batch=!!d;this.fields=e||[];}});jscape.UploadForm.fromJSON=function(data){return data?new jscape.UploadForm(data.name,data.description,data.enabled,data.batch,$.map(data.fields||[],jscape.UploadForm.Input.fromJSON)):null;};jscape.UploadForm.Input=Class.extend({initialize:function(a,b,c,d,e,f){this.type=a||jscape.UploadForm.Input.TYPE.TEXT;this.name=b||"";this.label=c||"";this.value=$.isArray(d)?d.join(","):d||"";this.required=e!==undefined?!!e:true;this.html=f||"";},values:function(){return this.multiple()?this.value.split(","):[this.value];},multiple:function(){return $.inArray(this.type,[jscape.UploadForm.Input.TYPE.DROPDOWN,jscape.UploadForm.Input.TYPE.MULTISELECT,jscape.UploadForm.Input.TYPE.RADIO])!=-1;}});jscape.UploadForm.Input.TYPE={TEXT:"TEXT",MEMO:"MEMO",DROPDOWN:"DROPDOWN",MULTISELECT:"MULTISELECT",RADIO:"RADIO"};jscape.UploadForm.Input.fromJSON=function(data){return new jscape.UploadForm.Input(data.input.type,data.input.name,data.input.label,data.input.value||data.input.values,data.input.required,data.html);};jscape.UploadSessionInfo=Class.extend({initialize:function(a,b,c,d,e,f,g,h){this.id=a||"";this.state=b||jscape.UploadSessionInfo.Status.UNKNOWN;this.progress=parseInt(c)||0;this.bytesLoaded=parseInt(d)||0;this.statusMessage=e||"";this.timeMessage=f||"";this.pausable=!!g||false;this.cancellable=!!h||false;}});jscape.UploadSessionInfo.fromJSON=function(data){return data?new jscape.UploadSessionInfo(data.id,data.state,data.progress,data.bytesLoaded,data.statusMessage,data.timeMessage,data.isPausable,data.isCancellable):null;};jscape.UploadSessionInfo.Status={QUEUED:"QUEUED",IN_PROGRESS:"IN_PROGRESS",PAUSED:"PAUSED",CANCELED:"CANCELED",COMPLETE:"COMPLETE",ERROR:"ERROR",UNKNOWN:"UNKNOWN"};jscape.storage.UploadFileController=Class.extend({deferred:null,chooser:null,initialize:function(progressView,uploadFormRequired,clearOnComplete){this.progressView=progressView;this.uploadFormRequired=!!uploadFormRequired;this.clearOnComplete=clearOnComplete===false?clearOnComplete:true;},start:function(mode,files,fileListing,dataTransfer){this.mode=mode;this.deferred=$.Deferred();var promise=this.deferred.promise();this._chooseFiles(files,dataTransfer).then($.proxy(function(files,chooser){this.chooser=chooser;if(files.length==0){return $.Deferred().reject().promise();}
return this._fillUploadFormData(files);},this)).then($.proxy(function(files,metadata){return this._confirmOverwrite(files,fileListing).then(function(){return $.Deferred().resolve(files,metadata);});},this)).then($.proxy(function(files,metadata){return this._doUpload(files,this.mode,metadata);},this)).done($.proxy(function(cancelled,failed){if(!!cancelled||!!failed){this.deferred.reject();}else{this.deferred.resolve();}},this)).fail($.proxy(function(info){this.deferred.reject(info);},this)).always($.proxy(function(){if(!!this.chooser){this.chooser.destroy();this.chooser=null;}
this.deferred=null;},this));return promise;},onSubmit:function(dialog){var files=dialog.getFiles();if(files.length!=0){this._confirmOverwrite(files).then($.proxy(function(){return this._doUpload(files,this.mode);},this)).done($.proxy(function(){this.deferred.resolve();},this)).fail($.proxy(function(){this.deferred.reject();},this)).always($.proxy(function(){dialog.destroy();this.deferred=null;},this));}else{dialog.destroy();this.deferred.reject();this.deferred=null;}},onComplete:function(){this.deferred.resolve();this.deferred=null;},_chooseFiles:function(files,dataTransfer){if(dataTransfer&&"DataTransfer"in window&&dataTransfer.items){return this._listDataTransferFiles(dataTransfer);}else if(files&&"FileList"in window&&files instanceof FileList){return $.Deferred().resolve(files).promise();}
var deferred=$.Deferred();var v=new jscape.storage.UploadFileChooser();v.show(function(view){deferred.resolve(view.getFiles(),view);});return deferred.promise();},_fillUploadFormData:function(files){return new jscape.storage.UploadFormController(this.uploadFormRequired).start(files);},_listDataTransferFiles:function(dataTransfer){var promises=[];for(var i=0,items=dataTransfer.items;i<items.length;++i){var item=items[i];if(item.kind!=="file"){continue;}
if(item.getAsEntry){promises.push(this._readEntryContentAsync(item.getAsEntry()));}else if(item.webkitGetAsEntry){promises.push(this._readEntryContentAsync(item.webkitGetAsEntry()));}else{promises.push($.Deferred().resolve(item.getAsFile()).promise());}}
return $.when.apply(jQuery,promises).then(function(){return $.map(arguments,function(f){return f;});});},_readEntryContentAsync:function(fileSystemEntry){var deferred=$.Deferred();var active=0;function _readFileSystemEntry(fse,result,useFullPath){if(fse.isFile){++active;fse.file(function(file){if(useFullPath===true){var reader=new FileReader();var path=fse.fullPath;var filename=path.replace(/(\\|\/)/g,":");reader.onload=function(e){result.push($.extend(new File([e.target.result],filename),{jscapePath:path}));_assertReadingComplete(--active,result);};reader.onerror=function(){_assertReadingComplete(--active,result);};reader.readAsArrayBuffer(file);}else{result.push(file);_assertReadingComplete(--active,result);}});}else if(fse.isDirectory){++active;(function _readDirEntries(reader){reader.readEntries(function(entries){if(entries.length){for(var i=0,len=entries.length;i<len;++i){_readFileSystemEntry(entries[i],result,true);}
_readDirEntries(reader);}else{_assertReadingComplete(--active,result);}})})(fse.createReader());}}
function _assertReadingComplete(count,result){if(count===0){deferred.resolve(result);}}
_readFileSystemEntry(fileSystemEntry,[]);return deferred.promise();},_doUpload:function(fileList,mode,metadata){if(fileList.length==0){return $.Deferred().reject().promise();}
if(!this.progressMeter){this.progressMeter=new jscape.storage.UploadProgressMeter();}
var promise=this.progressMeter.start().progress($.proxy(this._onChange$Meter,this,this.progressView));this.progressView.show(this.progressMeter);var requests=[];for(var i=0;i<fileList.length;++i){const file=fileList[i];const request=jscape.API.openUploadSession().then($.proxy(function(data){if(!data||!data.id){return $.Deferred().reject({message:window.R.string.STORAGE_ERROR_UPLOAD,force:true});}
var session=new jscape.storage.UploadSession(data.id,file);this.progressMeter.addSession(session);session.upload(mode,metadata);},this));requests.push(request);}
return $.when.apply(jQuery,requests).then(function(){return promise;}).done($.proxy(function(_,error){this._onComplete$Meter(this.progressView,error);},this)).fail($.proxy(function(data){if(data&&data.force){this._onComplete$Meter(this.progressView,true);}},this));},_confirmOverwrite:function(files,fileListing){var duplicates=$.map(files,$.proxy(function(file){return $.inArray(file.name,fileListing)!=-1?file.name:null;},this));if(duplicates.length>0){return jscape.ConfirmDialog.confirm(window.R.string.APPLICATION_TITLE,window.R.string.STORAGE_CONFIRM_OVERWRITE_MESSAGE);}
return $.Deferred().resolve().promise();},_onChange$Meter:function(view,type,data,transition){if("add"==type){view.addItem(data.id,data,transition);}else if("update"==type){view.updateItem(data.id,data,transition);}else if("remove"==type){view.removeItem(data.id);}},_onComplete$Meter:function(view,hasErrors){if(!!this.progressMeter){this.progressMeter.stop();}
if(!!view&&(!!this.clearOnComplete&&!hasErrors)){view.clear();}
this.progressMeter=null;}});jscape.storage.UploadSession=Class.extend({id:null,file:null,transport:null,info:null,loadedBytes:null,chunkLoadedBytes:null,totalBytes:null,listeners:null,initialize:function(id,file){this.id=id;this.file=file;this.info=new jscape.UploadSessionInfo(id,undefined,0,0,file.jscapePath||file.name);this.loadedBytes=0;this.chunkLoadedBytes=0;this.totalBytes=0;this.listeners=[];},upload:function(mode,metadata){this.mode=mode;this.metadata=metadata;this.totalBytes=this.file.size;this.info.cancellable=true;var ret=this._doUpload(this.file,0);var transition=this.info.state;this.info.state=jscape.UploadSessionInfo.Status.QUEUED;this._raiseEvent("onUploadStart",this.info,false,transition);return ret;},resume:function(){if(!this.file){return;}
var transition=this.info.state;jscape.API.getUploadProgress(this.id).then($.proxy(function(info){this.chunkLoadedBytes=info?parseInt(info.bytesLoaded)||0:0;var ret=this._doUpload(this.file,this.chunkLoadedBytes);this._raiseEvent("onUploadResume",info,false,transition);return ret;},this));},pause:function(){var transition=this.info.state;this._abortSafe();this._raiseEvent("onUploadPause",this.info,false,transition);},cancel:function(){var state=this.info.state;if(jscape.UploadSessionInfo.Status.CANCELED==state||jscape.UploadSessionInfo.Status.COMPLETE==state||jscape.UploadSessionInfo.Status.ERROR==state){return;}
this.file=null;jscape.API.cancelUpload(this.id).then($.proxy(function(){this.info.state=jscape.UploadSessionInfo.Status.CANCELED;this._abortSafe();this._raiseEvent("onUploadCancel",this.info);},this),$.proxy(this._abortSafe,this));},progress:function(info,force){if(!info||this.id!==info.id){return;}
var copy=$.extend({},this.info);$.extend(this.info,info);this.info.progress=Math.max(info.progress,copy.progress);this.info.statusMessage=info.statusMessage||copy.statusMessage;this._raiseEvent("onUploadProgress",this.info,force,copy.state);if(jscape.UploadSessionInfo.Status.ERROR==info.state){this._raiseEvent("onUploadError",this.info,false);}else if(jscape.UploadSessionInfo.Status.COMPLETE==info.state){this._raiseEvent("onUploadComplete",this.info,false);}},addListener:function(l){this.listeners.push(l);},removeListener:function(l){var index=$.inArray(l,this.listeners);if(index!=-1){this.listeners.splice(index,1);return true;}
return false;},_doUpload:function(file,offset){var self=this;var options={xhr:function(){var xhr=$.ajaxSettings.xhr();xhr.upload.onprogress=$.proxy(self._onProgress,self,self.id);return xhr;}};this.transport=(offset>0?jscape.API.uploadFilePart(this.id,file,this.mode,this.metadata,offset,options):jscape.API.uploadFile(this.id,file,this.mode,this.metadata,options)).fail($.proxy(this._onError,this));return this.transport.promise();},_abortSafe:function(){if(this.transport&&this.loadedBytes!=this.totalBytes){try{this.transport.abort();}catch(ignored){}finally{this.transport=null;}}},_onProgress:function(sid,e){if(!e.lengthComputable){return;}
this.loadedBytes=e.loaded;this.totalBytes=e.total;var bytesLoaded=this.chunkLoadedBytes+e.loaded;var progress=Number(Math.round(((bytesLoaded/this.totalBytes)*100)+"e0")+"e0");var data=new jscape.UploadSessionInfo(sid,jscape.UploadSessionInfo.Status.IN_PROGRESS,progress,bytesLoaded,this.info.statusMessage,this.info.timeMessage,this.info.pausable,true);this.progress(data,true);},_onError:function(error){if(error&&error.statusText!=="abort"){if(error.status==0){this._abortSafe();}else{this._raiseEvent("onUploadError",this.info,error?error.statusText:null);}}},_raiseEvent:function(){var args=$.makeArray(arguments);for(var i=0;i<this.listeners.length;++i){var entry=this.listeners[i];if(entry&&typeof entry.onEvent==="function"){entry.onEvent.apply(entry,args);}}}});jscape.storage.UploadProgressMeter=Class.extend({DEFAULT_DELAY:1000,entries:null,stopped:false,timer:null,delay:0,initialize:function(){this.entries=[];},start:function(){this.stopped=false;this.cancelled=false;this.deferred=$.Deferred();this.delay=this.DEFAULT_DELAY;this._poll(this.delay);return this.deferred.promise();},stop:function(){this.stopped=true;this._stopPoll();this.deferred.resolve(this.cancelled);},addSession:function(session){this.entries.push(session);session.addListener(this);},removeSession:function(sid){var index=this._indexOf(sid);if(index!=-1){var ret=this.entries.splice(index,1);if(ret&&ret.length){ret[0].removeListener(this);return true;}}
return false;},onLoadData:function(){return $.Deferred().resolve($.map(this.entries,function(entry){return entry.info;})).promise();},onEvent:function(type,data,force,transition){if("onUploadStart"==type){this.deferred.notify("add",data,transition);this._poll(0);}else if("onUploadProgress"==type){this.deferred.notify("update",data,transition);if(this._activeUploadsCount()!=0){this._poll(!!force?0:this.delay);}}else if("onUploadResume"==type){this.deferred.notify("update",data,transition);this._poll(this.DEFAULT_DELAY);}else if("onUploadPause"==type){this.deferred.notify("update",data,transition);this._poll(this.DEFAULT_DELAY);}else if("onUploadCancel"==type){this.deferred.notify("remove",data,transition);this._poll(0);if(this.cancelled){this._stopPoll();this.deferred.resolve(this.cancelled);}}else if("onUploadError"==type||"onUploadComplete"==type){this._poll(0);if(this._allUploadsComplete()){this._stopPoll();var hasErrors=this._countUploadsOf([jscape.UploadSessionInfo.Status.ERROR])!=0;this.deferred.resolve(this.cancelled,hasErrors);}}},onPauseUpload:function(sid){var index=this._indexOf(sid);if(index!=-1){this.entries[index].pause();}},onResumeUpload:function(sid){var index=this._indexOf(sid);if(index!=-1){this.entries[index].resume();}},onCancelUpload:function(sid){var index=this._indexOf(sid);if(index!=-1){this.entries[index].cancel();this.entries.splice(index,1);if(this.entries.length==0){this.cancelled=true;}}},onClose:function(dialog){this._stopPoll();var ids=$.map(this.entries,function(entry){return entry.id;});while(ids.length){var id=ids.pop();this.onCancelUpload(ids.pop());dialog&&dialog.removeItem(id);}
this.deferred.resolve(this.cancelled);},_indexOf:function(sid){for(var i=0,len=this.entries.length;i<len;++i){if(this.entries[i].id==sid){return i;}}
return-1;},_poll:function(delay){if(this.stopped){return;}
this._stopPoll();this.timer=setTimeout($.proxy(function(){this.timer=null;$(document).triggerHandler("_activity.user");var ids=$.map(this.entries,function(entry){return entry.id;});if(ids.length==0){return;}
jscape.API.uploadStatus(ids).done($.proxy(function(infos){this.delay=this.DEFAULT_DELAY;if(infos&&infos.length){this._processUploadProgress(infos);}},this)).fail($.proxy(function(xhr,_,error){if(xhr.status===0){this._onTimeout();}else{try{this._onError(JSON.parse(xhr.responseText));}catch(e){this._onError({});}}},this));},this),delay||0);},_stopPoll:function(){if(this.timer){clearTimeout(this.timer);this.timer=null;}},_processUploadProgress:function(data){data=$.isArray(data)?data:[data];for(var i=0,len=this.entries.length;i<len;++i){var entry=this.entries[i];for(var j=0;j<data.length;++j){if(entry.id==data[j].id){entry.progress(data[j]);break;}}}},_activeUploadsCount:function(){return this._countUploadsOf([jscape.UploadSessionInfo.Status.QUEUED,jscape.UploadSessionInfo.Status.IN_PROGRESS]);},_allUploadsComplete:function(){return this.entries.length==this._countUploadsOf([jscape.UploadSessionInfo.Status.CANCELED,jscape.UploadSessionInfo.Status.COMPLETE,jscape.UploadSessionInfo.Status.ERROR]);},_countUploadsOf:function(states){states=$.isArray(states)?states:[states];var count=0;for(var i=0,len=this.entries.length;i<len;++i){var state=this.entries[i].info.state;if($.inArray(state,states)!=-1){count++;}}
return count;},_onError:function(data){if(data&&data.code=="INVALID_OPERATION_DATA"){this._stopPoll();}},_onTimeout:function(){this.delay*=2;this._poll(this.delay);}});jscape.storage.UploadProgressListView=Class.extend({initialize:function(container){var initializing=true;this.data=$(container).find(".upload-progress-list");this.data.datalist({width:"100%",height:"auto",minHeight:60,maxHeight:350,border:false,lines:false,showHeader:false,showFooter:false,singleSelect:true,pagination:false,autoRowHeight:false,nowrap:true,data:[],idField:"id",textField:"state",textFormatter:$.proxy(this._formatRow,this),loadMsg:"",onBeforeSelect:function(){return false;},loader:$.proxy(this._onLoad$Data,this),onBeforeLoad:function(){return!initializing;},onLoadSuccess:$.proxy(this._onLoad$Success,this)});initializing=false;},show:function(listener){this.listener=listener||jscape.storage.UploadProgressListView.LISTENER;this.data.datalist("resize",{height:"100%"});},addItem:function(id,item,transition){this.data.datalist("insertRow",{index:0,row:item}).datalist("scrollTo",0);var index=this.data.datalist("getRowIndex",id);var tr=this.data.datalist("options").finder.getTr(this.data[0],index);this._initRowBar(tr);this._updateRowStatus(tr,item,transition);this.data.datalist("resize",{height:"auto"});},removeItem:function(id){var index=this.data.datalist("getRowIndex",id);this.data.datalist("deleteRow",index).datalist("resize",{height:"auto"});},updateItem:function(id,item,transition){var index=this.data.datalist("getRowIndex",id);if(index!=-1){var tr=this.data.datalist("options").finder.getTr(this.data[0],index);this._updateRowStatus(tr,item,transition);}},clear:function(){this.data.datalist("loadData",[]);},_formatRow:function(value,row){return'<div style="padding:5px 10px">'
+this._formatToolbar(row.id,value)
+'<div><span aria-label="progress-message">'+(row.statusMessage||"&nbsp;")+'</span></div>'
+'<div aria-label="progress-bar" data-options="value:'+(row.progress||0)+'"></div>'
+'<div style="font-size:smaller;"><span aria-label="remaining-message">'+(value.timeMessage||"&nbsp;")+'</span></div>'
+'</div>'},_formatToolbar:function(id){var buttons=[{id:"play",iconCls:"icon-upload-pause",selectedIconCls:"icon-upload-resume",selected:false,disabled:true,plain:true,width:32,height:32},{id:"cancel",iconCls:"icon-cancel",disabled:true,plain:true,width:32,height:32}];return buttons.length?'<div class="datagrid-row-toolbar" data-id="'+id+'" style="float:right;margin-top:0;height:32px">'
+$.map(buttons,function(b){return"<a role=\"button\" name=\""+b.id+"\" data-options=\""+$.map(b,function(v,k){return k+":"+(typeof v=="string"?"'"+v+"'":v);})+"\"></a>";}).join("")
+'</div>':"";},_initRowBar:function(target){var _self=this;target.each(function(){var pb=$(this).find("div[aria-label=progress-bar]");pb.progressbar({value:0,text:"",width:"100%",height:6});var tb=$(this).find(".datagrid-row-toolbar");var sid=tb.data("id");tb.find("[role=button]").each(function(){$(this).linkbutton({onClick:function(){_self._onClick$ToolbarButton.call(_self,sid,$(this));}});}).hide();});},_updateRowStatus:function(target,info,transition){if(!info||!(target&&target.length)){return;}
var bar=target.find("div[aria-label=progress-bar]").progressbar("setValue",info.progress);target.find("[aria-label=progress-message]").html(info.statusMessage?String(info.statusMessage).escapeXml():"&nbsp;");target.find("[aria-label=remaining-message]").html(info.timeMessage?String(info.timeMessage).escapeXml():"&nbsp;");var buttons=target.find("[role=button]");var playBtn=buttons.filter("[name=play]");var cancelBtn=buttons.filter("[name=cancel]");var resizeRequired=false;switch(info.state){case jscape.UploadSessionInfo.Status.UNKNOWN:case jscape.UploadSessionInfo.Status.QUEUED:bar.css("visibility","visible");playBtn.hide();cancelBtn.hide();break;case jscape.UploadSessionInfo.Status.IN_PROGRESS:if(jscape.UploadSessionInfo.Status.UNKNOWN==transition||jscape.UploadSessionInfo.Status.QUEUED==transition){if(bar.progressbar("options").disabled){bar.progressbar("enable");}
if(!info.pausable){playBtn.hide().linkbutton("disable");}else{playBtn.show().linkbutton("enable");resizeRequired=true;}
if(!info.cancellable){cancelBtn.hide();}else{cancelBtn.show().linkbutton("enable");resizeRequired=true;}}else if(jscape.UploadSessionInfo.Status.PAUSED==transition){this._toggleButtonIcon(playBtn);if(!info.pausable){if(!playBtn.linkbutton("options").disabled){playBtn.linkbutton("disable");}}else{playBtn.linkbutton("enable");}}else{var playBtnOpts=playBtn.linkbutton("options");if(!info.pausable){if(!playBtnOpts.disabled){playBtn.hide();playBtn.linkbutton("disable");}}else{if(playBtnOpts.disabled){playBtn.linkbutton("enable");}
if(!playBtnOpts.selected){playBtn.show();}}}
break;case jscape.UploadSessionInfo.Status.PAUSED:if(jscape.UploadSessionInfo.Status.IN_PROGRESS==transition){this._toggleButtonIcon(playBtn);if(!bar.progressbar("options").disabled){bar.progressbar("disable");}
if(!info.pausable){playBtn.linkbutton("enable");}}
break;case jscape.UploadSessionInfo.Status.CANCELED:case jscape.UploadSessionInfo.Status.COMPLETE:case jscape.UploadSessionInfo.Status.ERROR:bar.css("visibility","hidden");playBtn.hide();cancelBtn.hide();resizeRequired=true;break;}
if(!!resizeRequired){this.data.datalist("resize");}},_onLoad$Data:function(params,success,error){this.listener.onLoadData(params).then(success,error);},_onLoad$Success:function(){var rows=this.data.datalist("getRows");this.data.datalist("getPanel").find(".datagrid-row").each($.proxy(function(index,el){this._updateRowStatus($(el),rows[index]);},this));},_onClick$ToolbarButton:function(sid,button){var buttons=button.parent(".datagrid-row-toolbar").find("[role=button]");var type=String(button.attr("name")).toLocaleLowerCase();switch(type){case"play":button.linkbutton("disable");var opts=button.linkbutton("options");opts.selected=!opts.selected;return opts.selected?this.listener.onPauseUpload(sid):this.listener.onResumeUpload(sid);case"cancel":buttons.linkbutton("disable");return this.listener.onCancelUpload(sid);}},_toggleButtonIcon:function(btn){var opts=btn.linkbutton("options");if(!!opts.selectedIconCls){var icon=btn.find(".l-btn-icon");if(opts.selected){icon.removeClass(opts.iconCls).addClass(opts.selectedIconCls);}else{icon.removeClass(opts.selectedIconCls).addClass(opts.iconCls);}}
return btn;}});jscape.storage.UploadProgressListView.LISTENER={onPauseUpload:$.noop,onResumeUpload:$.noop,onCancelUpload:$.noop,onLoadData:$.noop};jscape.storage.UploadFileChooser=Class.extend({container:null,initialize:function(){var id="storagefilechooser";this.container=$("#"+id);if(this.container.length==0){this.container=$("<div/>").attr("id",id).appendTo(document.body).css({position:"absolute",left:"-100000px",visibility:"hidden"});}
this.choosers=[];},getFiles:function(){if(this.choosers.length){var input=this.choosers.pop();return"FileList"in window?input.files:input;}
return[];},show:function(callback){callback=typeof callback==="function"?callback:$.noop;var self=this;this._createChooser().one("change.upload",function(){self._onChange$File.call(self,this,callback);self=null;})[0].click();},hide:function(){},destroy:function(){while(this.choosers.length){this.choosers.pop().off(".upload").remove();}
this.choosers=null;this.container.empty().remove();},_createChooser:function(){return $('<input type="file" />').appendTo(this.container).prop("multiple",true).prop("tabindex",-1).prop("size",1).on("keypress.upload",function(e){e.stopPropagation();this.blur();});},_onChange$File:function(chooser,callback){if($(chooser).val()){this.choosers.push(chooser);}
callback.call(callback,this);}});jscape.storage.UploadProgressDialog=jscape.ui.DefaultDialog.extend({initialize:function(){this._super($("<div></div>").appendTo(document.body),{width:"35%",minWidth:450,maxWidth:800,height:"auto",modal:false,resizable:false,closable:true,closed:true,title:"&nbsp;",content:"<ul class='upload-progress-list'></ul>",buttons:null});this.listView=new jscape.storage.UploadProgressListView(this.dialog);},show:function(){this._super.apply(this,arguments);this.listView.show(this);this.dialog.dialog("resize",{height:"auto"});return this;},clear:function(){this.listView.clear();this.hide()},refresh:function(){this.data.datalist("reload");},addItem:function(){this.listView.addItem.apply(this.listView,arguments);this.dialog.dialog("resize",{height:"auto"});},updateItem:function(){this.listView.updateItem.apply(this.listView,arguments);},removeItem:function(){this.listView.removeItem.apply(this.listView,arguments);this.dialog.dialog("resize",{height:"auto"});},onPauseUpload:function(){this.listener.onPauseUpload.apply(this.listener,arguments);},onResumeUpload:function(){this.listener.onResumeUpload.apply(this.listener,arguments);},onCancelUpload:function(){this.listener.onCancelUpload.apply(this.listener,arguments);},onLoadData:function(){this.listener.onLoadData.apply(this.listener,arguments);},_onCancel:function(){this.listener.onClose(this);}});jscape.storage.UploadFormController=Class.extend({required:false,initialize:function(required){this.required=!!required;},start:function(files){this.filenames=$.map(files||[],function(file){return file.name;});var deferred=$.Deferred();jscape.API.listUploadForms().then($.proxy(function(forms){return this._selectUploadForm(forms);},this)).then(function(formName){return jscape.API.getUploadForm(formName);}).then($.proxy(function(form){return this._fillUploadFormData(form);},this)).done(function(metadata){deferred.resolve(files,metadata);}).fail(function(cancelUpload){return cancelUpload!==true?deferred.resolve(files):deferred.reject();});return deferred.promise();},_selectUploadForm:function(forms){var deferred=$.Deferred();if(forms.length==0){deferred.reject();}else if(this.required&&forms.length==1){deferred.resolve(forms[0].name);}else{var dialog=new jscape.storage.UploadFormSelectionDialog(this.required);dialog.setForms(forms);dialog.show({onSubmit:function(dialog){var name=dialog.getForm();dialog.destroy();deferred.resolve(name);},onCancel:function(d){d.destroy();deferred.reject();},onCancelUpload:function(d){d.destroy();deferred.reject(true);}});}
return deferred.promise();},_showUploadFormDialog:function(form,filename){var dialog=new jscape.storage.UploadFormDialog(this.required);dialog.setTitle(form.name);dialog.setDescription(form.description);dialog.setFilename(filename||"");var controllers=[];for(var i=0;i<form.fields.length;++i){var field=form.fields[i];dialog.addFormInput(field.html);var controller=this._createController(field,dialog.container());controller.start(field);controllers.push(controller);}
var deferred=$.Deferred();dialog.finish().show({onSubmit:$.proxy(function(d){var data={};while(controllers.length){controllers.pop().apply(data,"");}
d.destroy();deferred.resolve(data);},this),onCancel:function(d){d.destroy();deferred.reject();},onCancelUpload:function(d){d.destroy();deferred.reject(true);}});return deferred.promise();},_fillUploadFormData:function(form){if(form.batch){return this._batchUploadFormData(form);}else{var files=$.map(this.filenames,function(f){return f.replace(/:/g,"/");});return this._perFileUploadFormData(form,files,[]);}},_batchUploadFormData:function(form){return this._showUploadFormDialog(form).then(function(data){return{form:form.name,data:data};});},_perFileUploadFormData:function(form,filenames,data){var filename=filenames.pop();return this._showUploadFormDialog(form,filename).then(function(data){return{form:form.name,filename:filename,data:data};}).then($.proxy(function(metadata){data.push(metadata);if(filenames.length){return this._perFileUploadFormData(form,filenames,data);}
return data;},this));},_createController:function(field,container){var type=(field.type||"").toLowerCase();if("text"==type||"memo"==type){return new jscape.storage.FormInputController(new jscape.storage.StringFieldView(field.name,container));}else if("dropdown"==type||"multiselect"==type){return new jscape.storage.FormInputController(new jscape.storage.ComboboxFieldView(field.name,container));}else if("radio"==type){return new jscape.storage.FormInputController(new jscape.storage.RadioFieldView(field.name));}
return null;}});jscape.storage.UploadFormSelectionDialog=jscape.ui.DefaultDialog.extend({initialize:function(required){this._super($("#d-upload-formselection"),{width:"50%",minWidth:380,maxWidth:680,height:"auto",modal:true,resizable:false,closable:!required,closed:true,buttons:$.grep([{text:window.R.string.DIALOG_BUTTON_OK||"OK",handler:$.proxy(this._onSubmit,this)},required?null:{text:window.R.string.DIALOG_BUTTON_CANCEL||"Cancel",handler:$.proxy(this._onCancel,this)},{text:window.R.string.DIALOG_BUTTON_CANCEL_UPLOAD||"Cancel Upload",handler:$.proxy(this._onCancelUpload,this)}],function(b){return!!b;})});this.fieldset=$("fieldset[name=uploadformselectionfields]",this.dialog);this.uploadForm=$("select[name=uploadform]",this.fieldset).combobox({required:true,editable:false,textField:"name",valueField:"name",onChange:$.proxy(this._onChange$Form,this),width:"60%",panelHeight:"auto"});this.description=$("span[aria-label=description]",this.fieldset);},getForm:function(){return this.uploadForm.combobox("getValue");},setForms:function(values){this.uploadForm.combobox("loadData",values);},_onChange$Form:function(value){if(value){var form=this._formFor(value);if(form){this.description.text(form.description);}}},_formFor:function(value){var data=this.uploadForm.combobox("getData");var valueField=this.uploadForm.combobox("options").valueField;for(var i=0,len=data.length;i<len;++i){var form=data[i];if(form[valueField]==value){return form;}}
return null;},_onCancelUpload:function(){this.hide();this.listener.onCancelUpload(this);}});jscape.storage.UploadFormDialog=Class.extend({initialize:function(required){this.dialog=$("#d-upload-form").clone().attr("id","");this.dialog.dialog($.extend({width:650,height:"auto",modal:true,resizable:false,closable:false,closed:true},required?{buttons:[{text:window.R.string.DIALOG_BUTTON_OK||"OK",handler:$.proxy(this._onSubmit,this)},{text:window.R.string.DIALOG_BUTTON_CANCEL_UPLOAD||"Cancel Upload",handler:$.proxy(this._onCancelUpload,this)}]}:{buttons:[{text:window.R.string.DIALOG_BUTTON_OK||"OK",handler:$.proxy(this._onSubmit,this)},{text:window.R.string.DIALOG_BUTTON_CANCEL||"Cancel",handler:$.proxy(this._onCancel,this)},{text:window.R.string.STORAGE_BUTTON_CANCEL_UPLOAD||"Cancel Upload",handler:$.proxy(this._onCancelUpload,this)}],onClose:$.proxy(function(){if(!this.closing){this._onCancel();}},this)})).show();this.fieldset=$('<fieldset><legend class="hidden-label"></legend></fieldset>').appendTo(this.dialog).first();this.header=$('<h6><span aria-label="description"></span><span aria-label="filename"></span></h6>').appendTo(this.fieldset);},setTitle:function(value){this.header.html((value+"").escapeXml()+this.header.html());},setDescription:function(value){this.header.find("[aria-label=description]").text(value);},setFilename:function(value){var c=this.header.find("[aria-label=filename]");if(!!value){c.text(value).show();}else{c.empty().hide();}},addFormInput:function(html){this.fieldset.append(html);},container:function(){return this.fieldset;},finish:function(){this.dialog.dialog("resize");this.fieldset.form("validate");this.fieldset.find("input:not(:disabled):first").focus();return this;},show:function(listener){this.listener=listener;this.dialog.dialog("center").dialog("open");},hide:function(){if(!this._closed()){this.closing=true;this.dialog.dialog("close");this.fieldset.form("disableValidation");this.closing=false;}},destroy:function(){this.dialog.dialog("destroy");},_onSubmit:function(){if(this.fieldset.form("validate")){this.hide();this.listener.onSubmit(this);}},_onCancel:function(){this.hide();this.listener.onCancel(this);},_onCancelUpload:function(){this.hide();this.listener.onCancelUpload(this);},_closed:function(){return!!this.dialog.dialog("options").closed;}});jscape.storage.FormInputController=Class.extend({field:null,initialize:function(view){this.view=view;},start:function(field){this.field=field;this._setupView(field);this.view.show(this);},apply:function(context,prefix){if(this.view.valid()){var key=(prefix||"")+this.field.name;context[key]=this.view.val();}},_setupView:function(field){if(field&&field.value){if(field.multiple()){var values=field.values();if(values.length!=0){this.view.val(values[0]);}else{this.view.val(this.field.value);}}else{this.view.val(field.value);}}}});jscape.storage.StringFieldView=Class.extend({input:null,initialize:function(name,container){this.input=$("[name="+name+"]:input",container);var maxLength=parseInt(this.input.prop("maxlength"));var pattern=this.input.prop("pattern");this.input.textbox({doSize:false,multiline:this.input.is("textarea")});var opts=this.input.textbox("options");if(opts.required&&!isNaN(maxLength)){if(maxLength>0){opts.validType="length[1,"+maxLength+"]";}else{opts.validType="length[1,"+Number.MAX_VALUE+"]";opts.invalidMessage=opts.missingMessage;}}
if(pattern&&pattern.trim().length!=0){opts.validType="pattern['"+pattern+"', 'g']";opts.invalidMessage=opts.missingMessage;}},show:function(){if(this.input.textbox("options").multiline){this.input.textbox("resize",{width:"60%",height:120});}else{this.input.textbox("resize",{width:"60%"});}
this.valid();},valid:function(){return this.input.textbox("isValid");},val:function(value){if(!arguments.length){return this.input.is(":not(:disabled)")?this.input.textbox("getValue"):null;}
this.input.textbox("setValue",value);return this;}});jscape.storage.ComboboxFieldView=Class.extend({input:null,initialize:function(name,container,autocomplete){this.input=$("select[name="+name+"]",container);this.input.combobox({onLoadSuccess:function(data){var c=$(this);c.combobox("clear");if(data.length!=0&&data.length<15){c.combobox("select",data[0].value);c.combo("options").panelHeight="auto";c.combo("resize");}}});if(autocomplete){this.input.combobox("autocomplete",true);}},show:function(){this.valid();},valid:function(){return this.input.combobox("isValid");},variants:function(values){this.input.combobox("loadData",values);},val:function(value){if(!arguments.length){return this.input.combobox("options").multiple?this.input.combobox("getValues"):this.input.combobox("getValue");}
this.input.combobox("select",value);return this;}});jscape.storage.RadioFieldView=Class.extend({input:null,initialize:function(name,container){this.input=$("input[name="+name+"]:radio",container);},show:function(){},valid:function(){return this.input.filter(":checked").length>0;},variants:function(values){this.input.combobox("loadData",values);},val:function(value){if(!arguments.length){return this.input.filter(":checked").val();}
this.input.filter("[value="+value+"]").prop("checked",true).change();return this;}});