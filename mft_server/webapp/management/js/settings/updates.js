/* Copyright © 2009-2024. Redwood Software Inc. All rights reserved. */
jscape.settings=jscape.settings||{};jscape.ServerUpdateServiceConfiguration=Class.extend({initialize:function(a,b,c,d,e,f,g){this.enabled=!!a;this.dayOfWeek=parseInt(b)||0;this.hour=parseInt(c)||0;this.minute=parseInt(d)||0;this.backupDatabase={url:e||"",username:f||"",password:g||""};},toJSON:function(){return $.extend({},this,{month:"*",dayOfMonth:"?"});}});jscape.ServerUpdateServiceConfiguration.fromJSON=function(data){var backupData=data&&data.backupDatabase?data.backupDatabase:{};return new jscape.ServerUpdateServiceConfiguration(data.enabled,data.dayOfWeek,data.hour,data.minute,backupData.url,backupData.username,backupData.password);};jscape.settings.ApplicationUpdatesModule=jscape.settings.SettingsModule.extend({DEFAULT_CONFIG:new jscape.ServerUpdateServiceConfiguration(false,0,12,30,"jdbc:"),config:null,view:null,lastUpdateDate:null,initialize:function(uca){this.allowed=!!uca;},onCreate:function(){this._super.apply(this,arguments);this.historyController=new jscape.settings.AutomaticUpdatesHistoryController();this.updateLoader=new jscape.settings.AutomaticUpdatesApplicationUpdateLoader();},onStart:function(){if(this.view==null){this.view=new jscape.settings.AutomaticUpdatesView();}
this.view.show(this);},onStop:function(){this.updateLoader.stop();},onPause:function(){if(this.hasChanged()){this._confirmAndApply([this]);}},onResume:function(){return jscape.API.getUpdateServiceConfiguration().catch(function(){return this.DEFAULT_CONFIG;}).then($.proxy(function(config){this.config=config;this._setupView(config);},this));},onRefresh:function(){return this.onLoadLastUpdateDate().done($.proxy(function(date){if(!this.updating){this.view.setLastUpdateDate(date);}},this));},hasChanged:function(){return this.config!=null&&!Object._equals(this.config,this._createConfiguration());},onApply:function(){return jscape.API.setUpdateServiceConfiguration(this._createConfiguration()).done($.proxy(function(config){this.config=config;this.lastUpdateDate=null;this._setupView(config);},this)).done($.proxy(this._fireApplySuccess,this));},onDiscard:function(){this._setupView(this.config);return $.Deferred().resolve().promise();},onChange:function(){return $.Deferred().resolve(this.hasChanged()).promise();},onViewLog:function(){return this.historyController.start();},onLoadLastUpdateDate:function(){return!!this.lastUpdateDate?$.Deferred().resolve(this.lastUpdateDate).promise():jscape.API.getUpdateServiceSummary().then(function(data){return data?data.lastUpdateDate:NaN;},function(){return NaN;}).done($.proxy(function(val){this.lastUpdateDate=val;},this));},onCheckUpdate:function(){this.updating=true;this.view.showCheckUpdateMessage();return jscape.API.checkForUpdate().then($.proxy(function(data){if(data&&!!data.updateRequired){return this.updateLoader.start().then(null,null,$.proxy(function(data){if("started"===data.state){this.view.showDownloadStartedMessage();}else if("cancelled"===data.state){this.view.showDownloadCancelledMessage();}else if("error"===data.state){this.view.showDownloadCompleteMessage(false,data.message);}else{this.view.showDownloadProgressMessage(data.progress);}},this)).done($.proxy(function(success,data){this.view.showDownloadCompleteMessage(success);!!success&&this._startAppUpdate(data);},this));}else{this.view.showUpToDateMessage();return data;}},this),$.proxy(function(){this.view.showCheckUpdateErrorMessage();},this)).always($.proxy(function(){this.updating=false;},this));},onCancelDownload:function(){return this.updateLoader.cancel();},onTestParameters:function(){return jscape.API.testUpdateServiceConfiguration(this._createConfiguration()).done($.proxy(function(result){if(result){$.messager.alert(window.R.string.AUTOMATIC_UPDATES_TITLE,result.message||"Test failed.",!result.valid?"error":"info");}},this));},_startAppUpdate:function(data){var view=new jscape.settings.AutomaticUpdatesLifecycleView(data.newVersionDirectory,data.updateCommandLine);return new jscape.server.ApplicationLifecycleController(view).start(function(){return jscape.API.startApplicationUpdate();});},_createConfiguration:function(){return new jscape.ServerUpdateServiceConfiguration(this.view.getEnabled(),this.view.getDayOfWeek(),this.view.getHour(),this.view.getMinute(),this.view.getUrl(),this.view.getUsername(),this.view.getPassword());},_setupView:function(config){var view=this.view;if(view&&config){view.setEnabled(config.enabled);view.setDayOfWeek(config.dayOfWeek);view.setHour(config.hour);view.setMinute(config.minute);if(config.backupDatabase){view.setUrl(config.backupDatabase.url);view.setUsername(config.backupDatabase.username);view.setPassword(config.backupDatabase.password);}
view.refresh();}}});jscape.settings.AutomaticUpdatesView=jscape.ui.FormView.extend({initialize:function(){this.fieldset=$("#server-updates-fields").on("contextmenu",$.proxy(this._onForm$ContextMenu,this));this.enabled=$("input[name=enable]:checkbox",this.fieldset).change($.proxy(this._onForm$Change,this));this.dayOfWeek=$("select[name=weekday]",this.fieldset).combobox({required:true,autoSelectFirst:false,editable:false,data:$.map([1,2,3,4,5,6,7],function(i){return{text:window.moment().weekday(i-1).format("dddd"),value:i};}),onChange:$.proxy(this._onForm$Change,this),width:160,panelHeight:"auto"});this.time=$("input[name=time]",this.fieldset).timespinner({required:true,value:"12",onChange:$.proxy(this._onForm$Change,this),width:120});this.url=$("input[name=dburl]",this.fieldset).textbox({required:true,validType:"length[1,2048]",invalidMessage:window.R.string.AUTOMATIC_UPDATES_ERROR_BAD_DB_URL,onChange:$.proxy(this._onForm$Change,this),width:"60%"});this.username=$("input[name=dbuser]",this.fieldset).textbox({required:true,validType:"length[1,50]",invalidMessage:window.R.string.AUTOMATIC_UPDATES_ERROR_BAD_DB_USER,onChange:$.proxy(this._onForm$Change,this),width:"40%"});this.password=$("input[name=dbpwd]",this.fieldset).passwordbox2({onChange:$.proxy(this._onForm$Change,this),width:"40%"});this.testButton=$("a[role=button][name=test]",this.fieldset).linkbutton({disabled:true,onClick:$.proxy(this._onClick$TestButton,this)});this.status=$("#update-status").find("span[aria-label=status]");this.status.data("template",this.status.text()).empty();this.progressbar=$('<div id="_pb'+(1E9*Math.random()>>>0)+'" style="margin-bottom:1em"></div>').appendTo(this.status.parent()).hide().progressbar({width:"100%",height:5,text:"",value:0});this.historyButton=$("button[name=history]",this.fieldset).linkbutton({disabled:true,plain:true,onClick:$.proxy(this._onClick$HistoryButton,this)}).hide();this.cancelDloadButton=$("button[name=cancel]",this.fieldset).linkbutton({disabled:true,plain:true,onClick:$.proxy(this._onClick$CancelDowloadButton,this)}).hide();this.checkButton=$("a[role=button][name=check]",this.fieldset).linkbutton({onClick:$.proxy(this._onClick$CheckButton,this)});this.applyButton=$("a[role=button][name=apply]",this.fieldset).linkbutton({disabled:true,onClick:$.proxy(this._onClick$ApplyButton,this)});this.discardButton=$("a[role=button][name=discard]",this.fieldset).linkbutton({onClick:$.proxy(this._onClick$DiscardButton,this)});},show:function(listener){this.listener=listener||jscape.settings.AutomaticUpdatesView.LISTENER;this.enabled.change();},refresh:function(){this.listener.onRefresh();},getEnabled:function(){return this.enabled.is(":checked");},setEnabled:function(value){this.enabled.prop("checked",!!value).change();},getDayOfWeek:function(){return this.dayOfWeek.combobox("getValue");},setDayOfWeek:function(value){this.dayOfWeek.combobox("select",value);},getHour:function(){return this.time.timespinner("getHours");},setHour:function(value){var hour=parseInt(value)||0;var opts=this.time.timespinner("options");if(opts.hour12&&hour>12){hour-=12;}
return this.time.timespinner("setValue",hour+opts.separator+this.getMinute());},getMinute:function(){return this.time.timespinner("getMinutes");},setMinute:function(value){var minute=parseInt(value)||0;var opts=this.time.timespinner("options");this.time.timespinner("setValue",this.getHour()+opts.separator+minute);},getUrl:function(){return this.url.textbox("getValue");},setUrl:function(value){this.url.textbox("setValue",value).textbox("isValid");},getUsername:function(){return this.username.textbox("getValue");},setUsername:function(value){this.username.textbox("setValue",value).textbox("isValid");},getPassword:function(){return this.password.passwordbox2("getValue")||"";},setPassword:function(value){this.password.passwordbox2("setValue",value||"");},setLastUpdateDate:function(value){if(isNaN(value)){this.status.empty();this.historyButton.linkbutton("disable").hide();this.progressbar.hide();}else{var tmpl=this.status.data("template")||"";if(value!==null){this.status.text(tmpl.supplant({0:window.moment(value).format("L LT")}));this.historyButton.linkbutton("enable").show();}else{this.status.text(tmpl.supplant({0:window.R.string.AUTOMATIC_UPDATES_MESSAGE_NEVER}));this.historyButton.linkbutton("disable").hide();}
this.progressbar.hide();this.checkButton.linkbutton("enable");}},showCheckUpdateMessage:function(){this.setLastUpdateDate(NaN);this.status.text(window.R.string.AUTOMATIC_UPDATES_MESSAGE_CHECK);},showCheckUpdateErrorMessage:function(){this.status.text(window.R.string.AUTOMATIC_UPDATES_MESSAGE_CHECK_ERROR);this.checkButton.linkbutton("enable");},showUpToDateMessage:function(){this.status.text(window.R.string.AUTOMATIC_UPDATES_MESSAGE_UP_TO_DATE);this.progressbar.hide();this.historyButton.linkbutton("disable").hide();this.checkButton.linkbutton("disable");},showDownloadStartedMessage:function(){this.cancelDloadButton.linkbutton("enable").show();this.status.text(window.R.string.AUTOMATIC_UPDATES_MESSAGE_DOWNLOAD);this.progressbar.progressbar("setValue",0).show();},showDownloadProgressMessage:function(progress){this.status.text(window.R.string.AUTOMATIC_UPDATES_MESSAGE_DOWNLOAD_PROGRESS.supplant({0:(progress.percent||0)+"%"}));this.progressbar.progressbar("setValue",progress.percent).show();},showDownloadCancelledMessage:function(){this.showDownloadCompleteMessage(false,window.R.string.AUTOMATIC_UPDATES_MESSAGE_DOWNLOAD_CANCELLED);},showDownloadCompleteMessage:function(success,message){this.cancelDloadButton.linkbutton("disable").hide();this.progressbar.hide();this.checkButton.linkbutton("enable");if(!success){!message?this.status.empty():this.status.text(message);}else{this.status.text(window.R.string.AUTOMATIC_UPDATES_MESSAGE_DOWNLOAD_COMPLETE);}},_onClick$TestButton:function(){if(!this._valid()){return;}
this.testButton.linkbutton("disable");this.listener.onTestParameters(this).always($.proxy(function(){this.testButton.linkbutton("enable");},this));},_onClick$CheckButton:function(){this.checkButton.linkbutton("disable");this.listener.onCheckUpdate();},_onClick$HistoryButton:function(){this.listener.onViewLog();},_onClick$CancelDowloadButton:function(){this.listener.onCancelDownload().done($.proxy(function(){this.cancelDloadButton.linkbutton("disable").hide();},this));},_onClick$ApplyButton:function(){if(this._valid()){this.applyButton.linkbutton("disable");this.listener.onApply().catch($.proxy(function(){this.applyButton.linkbutton("enable");},this)).always($.proxy(this._adjustFieldState,this));}},_onClick$DiscardButton:function(){this.listener.onDiscard();},_onForm$Change:function(){this._adjustFieldState();this.listener.onChange(this).done($.proxy(function(modified){this.applyButton.linkbutton(modified?"enable":"disable");},this));},_valid:function(){return this.fieldset.form("validate");},_showContextMenu:function(e,_,parent){this._super(e,[this.testButton,"-",this.applyButton,this.discardButton],parent);},_adjustFieldState:function(){var enabled=this.getEnabled();this.dayOfWeek.combobox(enabled?"enable":"disable");this.time.timespinner(enabled?"enable":"disable");this.url.textbox(enabled?"enable":"disable");this.username.textbox(enabled?"enable":"disable");this.password.passwordbox2(enabled?"enable":"disable");this.testButton.linkbutton(enabled?"enable":"disable");enabled&&this.fieldset.form("validate");}});jscape.settings.AutomaticUpdatesView.LISTENER={onRefresh:$.noop,onChange:$.noop,onCheckUpdate:$.noop,onCancelDownload:$.noop,onViewLog:$.noop,onApply:$.noop,onDiscard:$.noop};jscape.settings.AutomaticUpdatesLifecycleView=Class.extend({initialize:function(versionDir,commandLine){this.message=(window.R.string.AUTOMATIC_UPDATES_MESSAGE_CONFIRM_START||"").escapeXml().replace(/[\r\n]/g,"<br/>").supplant({0:"<code>"+String(versionDir||"").escapeXml()+"</code>",1:"<code>"+String(commandLine||"").escapeXml()+"</code>"});},confirmStartDialog:function(){return jscape.ConfirmDialog.confirm("",this.message,false,{width:"40%"});},confirmUnloadMessage:function(e){return window.R.string.AUTOMATIC_UPDATES_MESSAGE_CONFIRM_LEAVE;},onProgress:function(value){$.messager.progress("bar").progressbar("setValue",Math.max(0,Math.min(100,value)));},showProgressDialog:function(){var d=$.messager.progress({title:"",icon:"",msg:window.R.string.AUTOMATIC_UPDATES_MESSAGE_UPDATING,width:"50%",closable:false,interval:0});$.messager.progress("bar").progressbar({text:"",height:5,value:0});d.dialog("resize");return d;}});jscape.settings.AutomaticUpdatesHistoryController=Class.extend({deferred:null,start:function(){this.deferred=$.Deferred();var dialog=new jscape.settings.AutomaticUpdatesHistoryDialog();jscape.API.getUpdateServiceLogs().then($.proxy(function(d,data){this._setupDialog(d,data).show(this);},this,dialog)).catch($.proxy(this.onCancel,this,dialog));return this.deferred.promise();},onSubmit:function(dialog){dialog.destroy();this.deferred.resolve();this.deferred=null;},onCancel:function(dialog){dialog.destroy();this.deferred.reject();this.deferred=null;},_setupDialog:function(dialog,data){data&&dialog.setData(data);return dialog;}});jscape.settings.AutomaticUpdatesHistoryDialog=jscape.ui.DefaultDialog.extend({initialize:function(){this._super($("#d-settings-automatic-history"),{width:"60%",minWidth:450,height:"70%",closable:true,closed:true,maximizable:true,buttons:[{text:window.R.string.DIALOG_BUTTON_CLOSE||"Close",handler:$.proxy(this._onSubmit,this)}]});this.layout=this.dialog.find("div.ui-dialog-layout").layout({fit:true,doSize:false,border:false});this.date=$("div[aria-label=created]",this.dialog);this.log=$("input[name=log]",this.dialog).textbox({fit:true,multiline:true,editable:false,readonly:true});},show:function(){this._super.apply(this,arguments);this.layout.layout("resize");},setData:function(value){this.log.textbox("setText",value);}});jscape.settings.AutomaticUpdatesApplicationUpdateLoader=jscape.server.ApplicationUpdateLoader.extend({_complete:function(data){return this._super(data)&&data&&!!data.newVersionDirectory&&!!data.updateCommandLine;}});