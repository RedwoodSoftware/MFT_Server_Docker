/* Copyright © 2009-2024. Redwood Software Inc. All rights reserved. */
jscape.settings=jscape.settings||{};jscape.SearchingServiceConfiguration=Class.extend({initialize:function(a,b,c,d,e){this.indexingPeriod=parseInt(a)||null;this.updateFileIndexUponUpload=b||false;this.updateFileIndexUponRename=c||false;this.updateAccountIndexUponUpdating=d||false;this.updateGroupIndexUponUpdating=e||false;}});jscape.SearchingServiceConfiguration.fromJSON=function(data){return data?new jscape.SearchingServiceConfiguration(data.indexingPeriod,data.updateFileIndexUponUpload,data.updateFileIndexUponRename,data.updateAccountIndexUponUpdating,data.updateGroupIndexUponUpdating):null;};jscape.settings.SearchingModule=jscape.settings.SettingsModule.extend({onCreate:function(){this._super.apply(this,arguments);this.controller=new jscape.settings.SearchingController();this.controller.onCreate();},onStart:function(){this.controller.onStart();},onPause:function(){if(this.controller.hasChanged()){this._confirmAndApply([this.controller]);}},onResume:function(){this.controller.onResume();}});jscape.settings.SearchingController=Class.extend({DEFAULT_CONFIG:new jscape.SearchingServiceConfiguration(),config:null,view:null,onCreate:function(){this.searchIndexController=new jscape.settings.SearchIndexController();},onStart:function(){if(this.view==null){this.view=new jscape.settings.SearchingView();}
this.view.show(this);},onResume:function(){this.view.refresh();},hasChanged:function(){return this.config!=null&&!Object._equals(this.config,this._createConfiguration());},onLoadData:function(view){return jscape.API.getSearchingServiceConfiguration().catch($.proxy(function(){return null;},this)).then($.proxy(function(data){this.config=data||this.DEFAULT_CONFIG;},this)).always($.proxy(function(){this._setupView(view,this.config);},this));},onApply:function(){return jscape.API.setSearchingServiceConfiguration(this._createConfiguration()).done($.proxy(function(config){this.config=config;},this)).done($.proxy(this._fireApplySuccess,this));},onDiscard:function(){this.view.refresh();return $.Deferred().resolve().promise();},onChange:function(){return $.Deferred().resolve(this.hasChanged()).promise();},onRebuildIndex:function(){return this.searchIndexController.start();},_createConfiguration:function(){return new jscape.SearchingServiceConfiguration(this.view.getIndexingPeriod(),this.view.getUpdateFileIndexUponUpload(),this.view.getUpdateFileIndexUponRename(),this.view.getUpdateAccountIndexUponUpdate(),this.view.getUpdateGroupIndexUponUpdate());},_setupView:function(view,config){if(view&&config){view.setIndexingPeriod(config.indexingPeriod);view.setUpdateFileIndexUponUpload(config.updateFileIndexUponUpload);view.setUpdateFileIndexUponRename(config.updateFileIndexUponRename);view.setUpdateAccountIndexUponUpdate(config.updateAccountIndexUponUpdating);view.setUpdateGroupIndexUponUpdate(config.updateGroupIndexUponUpdating);this._updateIndexingState(view);}},_updateIndexingState:function(view){this.searchIndexController.isActive().catch(function(){return false;}).then(function(value){view.setRebuildIndexEnabled(!value);})},_fireApplySuccess:function(){this._broadcastMessage(window.R.string.APPLICATION_SUCCESS_APPLY);},_broadcastMessage:function(message){$(document).triggerHandler("broadcast",[message]);}});jscape.settings.SearchingView=jscape.ui.FormView.extend({INDEXING_PERIOD_FACTOR:1000*60*60,DEFAULT_INDEXING_PERIOD:24,initialize:function(){this.fieldset=$("#searching-service-fields").on("contextmenu",$.proxy(this._onForm$ContextMenu,this));this.rebuildIndexEnabled=$("input[name=reindex]:checkbox",this.fieldset);this.rebuildIndexEnabled.change($.proxy(function(){var enabled=this.rebuildIndexEnabled.is(":checked");this.rebuildIndexPeriod.numberspinner(enabled?"enable":"disable");this._onForm$Change();},this));this.rebuildIndexPeriod=$("input[name=indexperiod]",this.fieldset).numberspinner({disabled:true,min:1,max:1000,onChange:$.proxy(this._onForm$Change,this),width:60});this.updateFileIndexUponUpload=$("input[name=fileupload]:checkbox",this.fieldset).change($.proxy(this._onForm$Change,this));this.updateFileIndexUponRename=$("input[name=filerename]:checkbox",this.fieldset).change($.proxy(this._onForm$Change,this));this.updateAccountIndexUponUpdate=$("input[name=accountupdate]:checkbox",this.fieldset).change($.proxy(this._onForm$Change,this));this.updateGroupIndexUponUpdate=$("input[name=groupupdate]:checkbox",this.fieldset).change($.proxy(this._onForm$Change,this));this.rebuildButton=$("a[role=button][name=rebuild]",this.fieldset).linkbutton({onClick:$.proxy(this._onClick$RebuildButton,this)});this.applyButton=$("a[role=button][name=apply]",this.fieldset).linkbutton({disabled:true,onClick:$.proxy(this._onClick$ApplyButton,this)});this.discardButton=$("a[role=button][name=discard]",this.fieldset).linkbutton({onClick:$.proxy(this._onClick$DiscardButton,this)});},show:function(listener){this.listener=listener||jscape.settings.SearchingView.LISTENER;},refresh:function(){this.applyButton.linkbutton("disable");this.discardButton.linkbutton("disable");this.listener.onLoadData(this).always($.proxy(function(){this._onForm$Change();this.discardButton.linkbutton("enable");},this));},getIndexingPeriod:function(){return this.rebuildIndexEnabled.is(":checked")?parseInt(this.rebuildIndexPeriod.numberspinner("getValue"))*this.INDEXING_PERIOD_FACTOR:null;},setIndexingPeriod:function(value){this.rebuildIndexEnabled.prop("checked",value!=null).change();this.rebuildIndexPeriod.numberspinner("setValue",value!=null?parseInt(value)/this.INDEXING_PERIOD_FACTOR:this.DEFAULT_INDEXING_PERIOD);},getUpdateFileIndexUponUpload:function(){return this.updateFileIndexUponUpload.is(":checked");},setUpdateFileIndexUponUpload:function(value){this.updateFileIndexUponUpload.prop("checked",!!value);},getUpdateFileIndexUponRename:function(){return this.updateFileIndexUponRename.is(":checked");},setUpdateFileIndexUponRename:function(value){this.updateFileIndexUponRename.prop("checked",!!value);},getUpdateAccountIndexUponUpdate:function(){return this.updateAccountIndexUponUpdate.is(":checked");},setUpdateAccountIndexUponUpdate:function(value){this.updateAccountIndexUponUpdate.prop("checked",!!value);},getUpdateGroupIndexUponUpdate:function(){return this.updateGroupIndexUponUpdate.is(":checked");},setUpdateGroupIndexUponUpdate:function(value){this.updateGroupIndexUponUpdate.prop("checked",!!value);},setRebuildIndexEnabled:function(value){var oldValue=!this.rebuildButton.linkbutton("options").disabled;if(!value){this.rebuildButton.linkbutton({disabled:true,iconCls:'icon-loading',_indexing:true});}else{this.rebuildButton.linkbutton({disabled:false,iconCls:'',_indexing:false});}
if(oldValue!==value){this._toggleButtonText(this.rebuildButton);}},_valid:function(){return this.fieldset.form("validate");},_onClick$RebuildButton:function(){this.setRebuildIndexEnabled(false);this.listener.onRebuildIndex(this).always($.proxy(function(){this.setRebuildIndexEnabled(true);},this));},_onClick$ApplyButton:function(){if(this._valid()){this.applyButton.linkbutton("disable");this.listener.onApply().catch($.proxy(function(){this.applyButton.linkbutton("enable");},this));}},_onClick$DiscardButton:function(){this.listener.onDiscard();},_onForm$Change:function(){this.listener.onChange(this).done($.proxy(function(modified){this.applyButton.linkbutton(modified?"enable":"disable");},this));},_showContextMenu:function(e,_,parent){this._super(e,[this.rebuildButton,"-",this.applyButton,this.discardButton],parent);},_toggleButtonText:function(btn){var oldValue=btn.text().trim();var newValue=btn.data("toggle-text")||oldValue;if(oldValue!==newValue){btn.html(btn.html().replace(oldValue.trim(),newValue));btn.data("toggle-text",oldValue);btn.linkbutton("options").text=newValue;}}});jscape.settings.SearchingView.LISTENER={onRebuildIndex:$.noop,onApply:$.noop,onDiscard:$.noop};jscape.settings.SearchIndexController=Class.extend({start:function(){this.deferred=$.Deferred();var promise=this.deferred.promise();jscape.API.startSearchFileIndexing().progress($.proxy(this._onProgress,this)).then($.proxy(this._onComplete,this),$.proxy(this._onError,this,window.R.string.SETTINGS_ERROR_FILE_INDEX));return promise;},isActive:function(){return jscape.API.getSearchFileIndexingStats().then(function(stats){return stats&&"IN_PROGRESS"===stats.state;});},_onProgress:function(data){if(data&&data.state){console.log("onProgress: "+data.state);}else{console.log("onProgress..."+data);}},_onComplete:function(data){if(data&&data.valid===false){this._onError(data.message);}else{this._onSuccess(data?data.message:"");}},_onSuccess:function(message){this._broadcastMessage(message||window.R.string.SETTINGS_SUCCESS_FILE_INDEX);this.deferred.resolve();},_onError:function(message){$.messager.alert(window.R.string.APPLICATION_ERROR_TITLE,message||window.R.string.SETTINGS_ERROR_FILE_INDEX,"error");this.deferred.reject();},_broadcastMessage:function(message){$(document).triggerHandler("broadcast",[message]);}});