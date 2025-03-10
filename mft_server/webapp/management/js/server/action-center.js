/* Copyright © 2009-2024. Redwood Software Inc. All rights reserved. */
jscape.server=jscape.server||{};jscape.KeySuccessFactorSummary=Class.extend({initialize:function(a,b,c,d,e,f){this.id=a||null;this.category=b||null;this.section=c||null;this.date=parseInt(d)||null;this.maturity=jscape.MaturityLevel.valueOf(e);this.contributingFactor=f||null;},resolutionRequired:function(){return this.maturity!=jscape.MaturityLevel.OPTIMIZED&&!!this.contributingFactor;}});jscape.KeySuccessFactorSummary.fromJSON=function(data){return data?new jscape.KeySuccessFactorSummary(data.id,data.category,data.section,data.creationDate,data.maturityLevel,data.contributingFactor):null;};jscape.MaturityLevel={INHIBITED:"INHIBITED",PREDICTABLE:"PREDICTABLE",OPTIMIZED:"OPTIMIZED",values:function(){return[this.INHIBITED,this.PREDICTABLE,this.OPTIMIZED];},valueOf:function(value){return $.inArray(value,this.values())!=-1?value:null;}};jscape.KeySuccessFactorData=Class.extend({initialize:function(a,b,c,d,e,f,g,h,i){this.id=a||null;this.category=b||null;this.section=c||null;this.date=parseInt(d)||null;this.reportId=e||null;this.maturity=jscape.MaturityLevel.valueOf(f);this.overview=g||null;this.factor=h||null;this.recommendation=i||null;}});jscape.KeySuccessFactorData.fromJSON=function(data){return data?new jscape.KeySuccessFactorData(data.id,data.category,data.section,data.creationDate,data.reportId,data.maturityLevel,data.overview,data.contributingFactor,data.recommendation):null;};jscape.server.ActionCenterModule=jscape.ApplicationModule.extend({DELAY:60*1000,initialize:function(acc){this.allowed=!!acc;},getId:function(){return"action-center";},onCreate:function(){this._super.apply(this,arguments);this.viewController=new jscape.server.ViewKeySuccessFactorSummaryController(this.allowed);this.updateLoader=new jscape.server.ActionCenterApplicationUpdateLoader();this.view=new jscape.server.ActionCenterView();this.view.show(this);this.view.refresh();},onStart:function(){},onResume:function(){this._poll(0);},onPause:function(){this._stopPoll();},onLoadData:function(){return jscape.API.listKeySuccessFactors().then($.proxy(function(summaries){return $.grep(summaries,function(s){return s.resolutionRequired();})},this)).then($.proxy(function(summaries){return this._checkImmediacy(summaries);},this)).catch($.proxy(this._stopPoll,this)).done($.proxy(function(delay){this._poll(delay);},this,this.DELAY));},onViewItem:function(item){return this.viewController.start(this,item).done($.proxy(this._poll,this,0));},onResolveItem:function(item){return this._confirmResolve(item).then(function(){return jscape.API.resolveKeySuccessFactor(item.id);}).then($.proxy(function(){this.view.deleteItem(item);},this)).done($.proxy(this._poll,this,0));},onDownloadUpdate:function(item){var dialog=new jscape.server.DownloadApplicationUpdateDialog();dialog.show({onCancel:$.proxy(function(d){this.updateLoader.stop();d.destroy();},this),onCancelDownload:$.proxy(function(){this.updateLoader.cancel();},this)});return this.updateLoader.start().then(null,null,$.proxy(function(data){if("started"===data.state){dialog.setStarted();}else if("cancelled"===data.state){dialog.setCancelled(data.message);}else if("error"===data.state){dialog.setComplete(false,data.message,data);}else{dialog.setProgress(data.progress,data);}},this)).done(function(success,state){dialog.setComplete(success,undefined,state);});},_checkImmediacy:function(summaries){var dirty=false;for(var i=0,len=summaries.length;i<len;++i){var maturity=summaries[i].maturity;dirty|=jscape.MaturityLevel.INHIBITED==maturity;dirty|=jscape.MaturityLevel.PREDICTABLE==maturity;}
$(document).triggerHandler("mark_dirty",[this.getId(),dirty]);return summaries;},_confirmResolve:function(item){if(!this.allowed){return $.Deferred().reject().promise();}
return jscape.ConfirmDialog.confirm(window.R.string.ACTION_CENTER_CONFIRM_RESOLVE_TITLE,window.R.string.ACTION_CENTER_CONFIRM_RESOLVE_MESSAGE.supplant({0:item.category,1:item.section}),undefined,{width:"50%",minWidth:500});},_poll:function(delay){this._stopPoll();this.timerId=setTimeout($.proxy(function(){this.timerId=null;this.view.refresh();},this),delay||0);},_stopPoll:function(){var id=this.timerId;this.timerId=null;id&&clearTimeout(id);}});jscape.server.ActionCenterView=jscape.ui.DatagridView.extend({initialize:function(){var initializing=true;this.fieldset=$("#action-center-fields").first().layout({fit:true,doSize:false,border:false});this.data=$("table[role=grid][aria-label=ksflist]",this.fieldset);this.data.datagrid({fit:true,fitColumns:true,remoteSort:false,singleSelect:true,idField:"id",columns:[[{field:"maturity",title:$("thead th:nth-child(1)",this.data).text(),sortable:true,width:"20%",formatter:$.proxy(this._formatMaturity,this),styler:$.proxy(this._styleMaturity,this)},{field:"category",title:$("thead th:nth-child(2)",this.data).text(),sortable:true,width:"20%"},{field:"section",title:$("thead th:nth-child(3)",this.data).text(),sortable:true,width:"35%"},{field:"date",title:$("thead th:nth-child(4)",this.data).text(),sortable:true,width:"25%",formatter:$.proxy(this._formatDate,this)}]],onSelect:$.proxy(this._adjustButtonsState,this),onSelectAll:$.proxy(this._adjustButtonsState,this),onUnselect:$.proxy(this._adjustButtonsState,this),onUnselectAll:$.proxy(this._adjustButtonsState,this),onDblClickRow:$.proxy(function(){this.viewButton.click();},this),onRowContextMenu:$.proxy(this._onRow$ContextMenu,this),loader:$.proxy(this._onLoad$Data,this),onLoadSuccess:$.proxy(this._onLoad$Success,this),onBeforeLoad:function(){return!initializing;}});this.refreshButton=$("a[role=button][name=refresh]",this.fieldset).linkbutton({onClick:$.proxy(this._onClick$RefreshButton,this)});this.viewButton=$("a[role=button][name=view]",this.fieldset).linkbutton({disabled:true,onClick:$.proxy(this._onClick$ViewButton,this)});this.resolveButton=$("a[role=button][name=resolve]",this.fieldset).linkbutton({disabled:true,onClick:$.proxy(this._onClick$ResolvedButton,this)});this.fieldset.layout("panel","south").panel("resize",{height:"auto"});initializing=false;},show:function(listener){this.listener=listener||jscape.server.ActionCenterView.LISTENER;this.fieldset.layout("resize");},refresh:function(){this.data.datagrid("reload");},deleteItem:function(item){this.data.datagrid("deleteRow",this.data.datagrid("getRowIndex",item));this._adjustButtonsState();},_formatDate:function(value){return value!=null&&!isNaN(value)?window.moment(value).format("L LT"):"";},_formatMaturity:function(value){return window.R.string[("MATURITY_LEVEL_"+(value+"").toUpperCase())]||value;},_styleMaturity:function(value){switch(value){case jscape.MaturityLevel.INHIBITED:return"font-weight:700;color:red";case jscape.MaturityLevel.PREDICTABLE:return"font-weight:700;color:#F6BE00";case jscape.MaturityLevel.OPTIMIZED:return"font-weight:700;color:green";default:return"color:black";}},_onLoad$Data:function(params,success,error){this.refreshButton.linkbutton("disable");this.listener.onLoadData(params).then(success,error).always($.proxy(function(){this.refreshButton.linkbutton("enable");this._adjustButtonsState();},this));},_onClick$RefreshButton:function(){this.refresh();},_onClick$ViewButton:function(){this.viewButton.linkbutton("disable");this.listener.onViewItem(this.selection[0]).always($.proxy(this._adjustButtonsState,this));},_onClick$ResolvedButton:function(){this.resolveButton.linkbutton("disable");this.listener.onResolveItem(this.selection[0]).always($.proxy(this._adjustButtonsState,this));},_onLoad$Success:function(data){if(data.rows&&data.rows.length==0){this.data.datagrid("clearSelections");}},_showContextMenu:function(e){this._super(e,[this.viewButton,"-",this.refreshButton,"-",this.resolveButton]);},_adjustButtonsState:function(){this.selection=this.data.datagrid("getSelections");this.viewButton.linkbutton(this.selection.length==1?"enable":"disable");this.resolveButton.linkbutton(this.selection.length==1?"enable":"disable");}});jscape.server.ActionCenterView.LISTENER={onLoadData:$.noop,onViewItem:$.noop,onResolveItem:$.noop,onDownloadUpdate:$.noop};jscape.server.ViewKeySuccessFactorSummaryController=Class.extend({deferred:null,initialize:function(allowed){this.allowed=!!allowed;},start:function(listener,item){this.listener=listener||jscape.server.ViewKeySuccessFactorSummaryController.LISTENER;this.item=item;this.deferred=$.Deferred();this._setupDialog(item.id).show(this);return this.deferred.promise();},onLoadItemData:function(){return jscape.API.getKeySuccessFactorData(this.item.id,true).then(function(data){var val=/Environment Health/i.test(data["KSF"]||data.category)&&/Application Version/i.test(data["Section"]||data.section);return $.Deferred().resolve(data,val).promise();});},onResolveItem:function(dialog){return this.listener.onResolveItem(this.item).done($.proxy(this.onComplete,this,dialog));},onDownloadUpdate:function(dialog){return this.listener.onDownloadUpdate(this.item).done($.proxy(this.onComplete,this,dialog));},onComplete:function(dialog){dialog.destroy();this.deferred.resolve();this.deferred=null;},onCancel:function(dialog){dialog.destroy();this.deferred.resolve();this.deferred=null;},_setupDialog:function(alias){var dialog=new jscape.server.ViewKeySuccessFactorSummaryDialog(this.allowed);dialog.setTitle(alias);return dialog;}});jscape.server.ViewKeySuccessFactorSummaryDialog=jscape.ui.DefaultDialog.extend({initialize:function(allowed){var initializing=true;var resolveButtonId="resolve-btn"+this.getIdSuffix();var downloadButtonId="download-btn"+this.getIdSuffix();this._super($("#"+this.getId()),{width:"70%",height:"75%",buttons:allowed?[{text:window.R.string.ACTION_CENTER_BUTTON_DOWNLOAD||"Download",id:downloadButtonId,disabled:true,handler:$.proxy(this._onDownload,this)},{text:window.R.string.ACTION_CENTER_BUTTON_RESOLVE||"Resolve",id:resolveButtonId,handler:$.proxy(this._onResolve,this)},{text:window.R.string.DIALOG_BUTTON_CLOSE||"Close",handler:$.proxy(this._onCancel,this)}]:[{text:window.R.string.DIALOG_BUTTON_CLOSE||"Close",handler:$.proxy(this._onCancel,this)}],onResize:$.proxy(function(){this.data&&this.data.propertygrid("resize");},this)});this.resolveButton=allowed?$("#"+resolveButtonId):$();this.downloadButton=allowed?$("#"+downloadButtonId).hide():$();this.title=this.dialog.dialog("header").text()||"";this.data=$("table[role=grid][aria-label=summary]",this.dialog).propertygrid({fit:true,fitColumns:true,border:false,minHeight:300,nowrap:false,showHeader:false,columns:[[{field:"name",width:"25%",sortable:true,styler:function(){return"font-weight:bold;border-color:transparent;vertical-align:top";}},{field:"value",styler:function(){return"border-color:transparent;overflow-wrap:break-word;word-break:break-word;";}}]],onBeforeLoad:function(){return!initializing;},loader:$.proxy(this._onLoad$Data,this),loadFilter:$.proxy(this._onFilter$Data,this)});initializing=false;},getId:function(){return"d-actioncenter-ksf-view";},setTitle:function(value){this.dialog.dialog("setTitle",this.title.supplant({0:(""+value).escapeXml()}));},show:function(listener){this._super(listener);this.data.datagrid("reload");},_onResolve:function(){this.resolveButton.linkbutton("disable");this.listener.onResolveItem(this).catch($.proxy(function(){this.resolveButton.linkbutton("enable");},this));},_onDownload:function(){this.downloadButton.linkbutton("disable");this.listener.onDownloadUpdate(this).catch($.proxy(function(){this.downloadButton.linkbutton("enable");},this));},_onLoad$Data:function(params,success,error){this.listener.onLoadItemData(params).then($.proxy(function(data,downloadUpdate){if(!!downloadUpdate){this.downloadButton.show().linkbutton("enable");}
return data;},this)).then(success,error).done($.proxy(function(){this.data.propertygrid("resize");},this));},_onFilter$Data:function(data){var filtered={};for(var prop in data){var suffix="_timestamp";if(data.hasOwnProperty(prop)&&!prop.endsWith(suffix)){var ts=prop+suffix;filtered[prop]=data.hasOwnProperty(ts)?this._formatDate(data[ts]):data[prop];}}
return $.map(filtered,function(val,key){return{name:key,value:val};});},_formatDate:function(value){return value!=null&&!isNaN(value)?window.moment(value).format("L LT"):"";}});jscape.server.ViewKeySuccessFactorSummaryController.LISTENER={onLoadItemData:$.noop,onResolveItem:$.noop,onDownloadUpdate:$.noop};jscape.server.DownloadApplicationUpdateDialog=jscape.ui.DefaultDialog.extend({initialize:function(){var cancelButtonId="cancel-btn"+this.getIdSuffix();var closeButtonId="close-btn"+this.getIdSuffix();this._super($("#"+this.getId()),{width:"40%",maxWidth:500,height:"auto",resizable:true,closable:false,buttons:[{text:window.R.string.APPLICATION_UPDATE_BUTTON_CANCEL_DOWNLOAD||"Cancel Download",id:cancelButtonId,disabled:true,handler:$.proxy(this._onCancelDownload,this)},{text:window.R.string.DIALOG_BUTTON_CLOSE||"Close",id:closeButtonId,disabled:true,handler:$.proxy(this._onCancel,this)}]});this.cancelButton=$("#"+cancelButtonId);this.closeButton=$("#"+closeButtonId);this.status=$("#dload-status"+this.getIdSuffix());this.progress=$("#dload-progress"+this.getIdSuffix()).progressbar({height:5,text:"",value:0});this.elapsed=$("#dload-elapsed"+this.getIdSuffix());this.elapsedPattern=this.elapsed.attr("aria-label")||"";this.instructionPattern=$("#dload-instruction"+this.getIdSuffix()).attr("aria-label")||"";this.title=this.dialog.dialog("header").text()||"";},getId:function(){return"d-server-dload-update";},setStarted:function(){this.status.text(window.R.string.APPLICATION_UPDATE_MESSAGE_DOWNLOAD_PROGRESS.supplant({0:"..."}));this.cancelButton.linkbutton("enable").show();this.closeButton.linkbutton("disable").hide();},setProgress:function(progress){this.status.text(window.R.string.APPLICATION_UPDATE_MESSAGE_DOWNLOAD_PROGRESS.supplant({0:progress.percent+"%"}));this.progress.progressbar("setValue",progress.percent);this.elapsed.text(this._formatDownloadTime(progress.elapsedMillis,progress.remainingMillis));},setCancelled:function(message){$.messager.alert(this.title,message||window.R.string.APPLICATION_UPDATE_MESSAGE_DOWNLOAD_CANCELLED,"info");this.destroy();},setComplete:function(success,message,state){if(!success){!message?this.status.empty():this.status.text(message);this.elapsed.empty();this.cancelButton.hide().linkbutton("disable");this.closeButton.show().linkbutton("enable");this.dialog.dialog("resize");}else{message=message||this._formatInstruction(state);$.messager.alert({title:this.title,msg:message,icon:"",width:500});this.destroy();}},_onCancelDownload:function(){this.cancelButton.linkbutton("disable");this.listener.onCancelDownload(this);},_formatInstruction:function(state){return this.instructionPattern.supplant({0:state&&!!state.newVersionDirectory?"<code>"+String(state.newVersionDirectory).escapeXml()+"</code>":"",1:state&&!!state.updateCommandLine?"<p><code>"+String(state.updateCommandLine).escapeXml()+"</code></p>":""});},_formatDownloadTime:function(elapsedMillis,remainingMillis){var remaining=new jscape.Hours(remainingMillis||0);return this.elapsedPattern.supplant({0:new jscape.Hours(elapsedMillis||0).toString(),1:remaining.hours>0?window.R.string.APPLICATION_UPDATE_MESSAGE_REMAINING_HOURS.supplant({0:remaining.hours,1:remaining.minutes}):(remaining.minutes>0?window.R.string.APPLICATION_UPDATE_MESSAGE_REMAINING_MINUTES.supplant({0:remaining.minutes}):window.R.string.APPLICATION_UPDATE_MESSAGE_REMAINING_SECONDS.supplant({0:remaining.seconds}))});}});jscape.server.ActionCenterApplicationUpdateLoader=jscape.server.ApplicationUpdateLoader.extend({_complete:function(data){return this._super(data)&&data&&!!data.newVersionDirectory&&!!data.updateCommandLine;}});