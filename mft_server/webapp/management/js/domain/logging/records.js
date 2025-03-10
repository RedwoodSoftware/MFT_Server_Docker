/* Copyright © 2009-2024. Redwood Software Inc. All rights reserved. */
jscape.domain=jscape.domain||{};jscape.LogSearch=Class.extend({initialize:function(a,b,c,d,e,f,g,h){this.name=a||"";this.maxRecords=parseInt(b)||0;this.date=parseInt(c)||$.now();this.startDate=parseInt(d)||null;this.endDate=parseInt(e)||null;this.criteria=f||"";this.progress=parseInt(g)||0;this.error=h||null;},completed:function(){return this.progress==100||this.error;}});jscape.LogSearch.fromJSON=function(data){return data?new jscape.LogSearch(data.name,data.maxRecords,data.date,data.startDate,data.endDate,data.criteria,data.progress,data.error):null;};jscape.SearchCriteria=Class.extend({initialize:function(variable,operator,value){this.variable=variable||"";this.operator=operator||null;this.value=value||null;},toString:function(){return'{0} {1} {2}'.supplant({0:this.variable,1:this.operator,2:$.type(this.value)==="string"?'"'+this.value.replaceAll('"','\\"')+'"':this.value});}});jscape.SearchDateCriteria=Class.extend({initialize:function(variable,startDate,endDate){this.variable=variable||"";this.startDate=$.type(startDate)==="date"?startDate.getTime():(startDate||null);this.endDate=$.type(endDate)==="date"?endDate.getTime():(endDate||null);},toString:function(){return"({variable} >= {startDate} AND {variable} <= {endDate})".supplant(this);}});jscape.domain.LoggingModule=jscape.domain.DomainModule.extend({onCreate:function(){this._super.apply(this,arguments);this.recordsController=new jscape.domain.LogRecordsController();this.recordsController.onCreate(this.domainName);this.searchController=new jscape.domain.LogSearchController();this.searchController.onCreate(this.domainName);},onStart:function(){this.recordsController.onStart();this.searchController.onStart();},onStop:function(){this.recordsController.onStop();},onPause:function(){this.recordsController.onPause();this._confirmAndApply($.grep([this.recordsController,this.searchController],function(controller){return controller.hasChanged();}));},onResume:function(){this.recordsController.onResume();this.searchController.onResume();}});jscape.domain.LogRecordsController=jscape.domain.EventLogController.extend({onStart:function(){if(this.view==null){this.view=new jscape.domain.LogRecordsView();}
this.view.show(this);}});jscape.domain.LogRecordsView=jscape.domain.EventLogView.extend({initialize:function(){this._super($("#domain-log-records-content"));}});jscape.domain.LogSearchController=Class.extend({TIMER_DELAY:1000,criteriaView:null,resultsView:null,timers:null,initialize:function(){this._initValidators();},onCreate:function(domainName){this.domainName=domainName;this.timers={};this.exportController=new jscape.domain.ExportLogSearchController();this.resultController=new jscape.domain.LogSearchResultController();this.deleteController=new jscape.domain.DeleteLogSearchController();},onStart:function(){if(this.criteriaView==null){this.criteriaView=new jscape.domain.LogSearchCriteriaView();}
if(this.resultsView==null){this.resultsView=new jscape.domain.LogSearchResultsView();}
this.criteriaView.show(this);this.resultsView.show(this);},onStop:function(){for(var name in this.timers){this._stopPollSearchState(name);}},hasChanged:function(){return false;},onResume:function(){this.resultsView.refresh();},onRefresh:function(){return jscape.API.getLogSearches(this.domainName);},onSearch:function(){var search=this._createNewSearch();return jscape.API.runLogSearch(this.domainName,search).done($.proxy(this._searchComplete,this,search));},onExport:function(search){return this.exportController.start(this.domainName,search.name);},onView:function(search){return this.resultController.start(this.domainName,search);},onRerun:function(search){return jscape.API.startLogSearch(this.domainName,search.name).done($.proxy(this._pollSearchState,this,search.name));},onDelete:function(searches){return this.deleteController.start(this.domainName,searches).done($.proxy(this._searchResultDeleted,this,searches));},onLoadSuggestions:function(params){return jscape.API.getLogSearchSuggestions(this.domainName,params).then(function(data){return $.map(data||[],function(d){return d.text||[];});});},_searchResultDeleted:function(searches){for(var i=0;i<searches.length;i++){this.resultsView.deleteRecord(searches[i]);}
this.resultsView.refresh();},_searchComplete:function(search){this._navigateFrom(this.resultsView.fieldset);this.resultsView.refresh($.proxy(function(){this.resultsView.selectSearch(search);},this));},_pollSearchState:function(name,delay){this._stopPollSearchState(name);this.timers[name]=setTimeout($.proxy(function(){jscape.API.getLogSearches(this.domainName,{field:"name",query:name}).done($.proxy(function(records){if(records&&records.length==1){var search=records[0];if(search){this.resultsView.updateSearch(search);if(!search.error&&search.progress<100){this._pollSearchState(search.name,this.TIMER_DELAY);}}}},this)).fail($.proxy(this._stopPollSearchState,this,name));},this),delay||0);},_stopPollSearchState:function(name){if(this.timers.hasOwnProperty(name)){var id=this.timers[name];delete this.timers[name];clearTimeout(id);}},_createNewSearch:function(){var dateCriteria=this.criteriaView.getDateCriteria();return new jscape.LogSearch(this.criteriaView.getName(),this.criteriaView.getMaxRecords(),$.now(),dateCriteria!=null?dateCriteria.startDate:null,dateCriteria!=null?dateCriteria.endDate:null,this._createSearchCriteria());},_createSearchCriteria:function(){return $.map($.grep([this.criteriaView.getDateCriteria(),this.criteriaView.getAppInstanceIdCriteria(),this.criteriaView.getSessionIdCriteria(),this.criteriaView.getClientIpCriteria(),this.criteriaView.getClientPortCriteria(),this.criteriaView.getServerIpCriteria(),this.criteriaView.getServerPortCriteria(),this.criteriaView.getUsernameCriteria(),this.criteriaView.getClientRequestCriteria(),this.criteriaView.getClientMessageCriteria(),this.criteriaView.getServerStatusCriteria(),this.criteriaView.getServerMessageCriteria(),this.criteriaView.getInboundCriteria(),this.criteriaView.getOutboundCriteria()],function(criteria){return criteria!=null;}),function(criteria){return criteria.toString();}).join(" AND ");},_navigateFrom:function(source){source.parents(".tabs-container").each($.proxy(function(_,elem){var tabs=$(elem);var tabIndex=-1;$.each(tabs.tabs("tabs"),function(i,target){if(target.has(source).length!=0){tabIndex=i;return false;}
return true;});if(tabIndex!=-1){tabs.tabs("select",tabIndex);}
if(this.tabs!=tabs){this._navigateFrom(tabs);}},this));},_initValidators:function(){var v=new jscape.Validator();v.rule("logging_name",$.proxy(this._nameValid,this),window.R.string.LOGGING_ERROR_BAD_NAME);v.rule("logging_unique",$.proxy(this._searchNotExists,this),window.R.string.LOGGING_ERROR_BAD_NAME);v.rule("search_date_criteria",$.proxy(this._searchCriteriaDateValid,this),window.R.string.LOGGING_ERROR_BAD_CRITERIA_DATE_RANGE);},_nameValid:function(value){return value&&value.trim().length!=0&&!/[<>\\/]/g.test(value);},_searchNotExists:function(value){return $.grep(this.resultsView.getSearches(),function(search){return search.name==value;}).length==0;},_searchCriteriaDateValid:function(value,provider){if($.isFunction(provider)){var criteria=provider();if(criteria&&criteria.startDate&&criteria.endDate){return criteria.startDate<criteria.endDate;}}
return true;}});jscape.domain.LogSearchCriteriaView=Class.extend({initialize:function(){this.fieldset=$("#domain-search-criteria-fields").layout({fit:true,doSize:false,border:false});this.name=$("input[name=name]",this.fieldset).textbox({required:true,validType:["non_empty","logging_name","logging_unique"],missingMessage:window.R.string.LOGGING_ERROR_BAD_NAME,invalidMessage:window.R.string.LOGGING_ERROR_BAD_NAME,width:"60%"});this.maxRecords=$("input[name=maxrecords]",this.fieldset).numberspinner({required:true,min:1,max:100000,value:1000,increment:10,width:125});this.dateCriteria=new jscape.domain.SearchCriteriaDateView($("input[name=daterange]:checkbox",this.fieldset),$("input[name=datebegin]",this.fieldset),$("input[name=dateend]",this.fieldset));this.appInstanceIdCriteria=new jscape.domain.SearchCriteriaComboboxView($("select[name=appinstanceid]",this.fieldset),{loader:$.proxy(this._onLoad$Suggestions,this),queryParams:{field:"appInstanceId"}});this.sessionIdCriteria=new jscape.domain.SearchCriteriaTextView($("input[name=sessionid]",this.fieldset));this.clientIpCriteria=new jscape.domain.SearchCriteriaTextView($("input[name=clientip]",this.fieldset));this.clientPortCriteria=new jscape.domain.SearchCriteriaPortView($("input[name=clientport]",this.fieldset));this.serverIpCriteria=new jscape.domain.SearchCriteriaTextView($("input[name=serverip]",this.fieldset));this.serverPortCriteria=new jscape.domain.SearchCriteriaPortView($("input[name=serverport]",this.fieldset));this.usernameCriteria=new jscape.domain.SearchCriteriaComboboxView($("select[name=username]",this.fieldset),{loader:$.proxy(this._onLoad$Suggestions,this),queryParams:{field:"username"}});this.clientRequestCriteria=new jscape.domain.SearchCriteriaTextView($("input[name=clientrequest]",this.fieldset));this.clientMessageCriteria=new jscape.domain.SearchCriteriaTextView($("input[name=clientmessage]",this.fieldset));this.serverStatusCriteria=new jscape.domain.SearchCriteriaComboboxView($("select[name=serverstatus]",this.fieldset),{loader:$.proxy(this._onLoad$Suggestions,this),queryParams:{field:"logServerStatus"}});this.serverMessageCriteria=new jscape.domain.SearchCriteriaComboboxView($("select[name=servermessage]",this.fieldset),{loader:$.proxy(this._onLoad$Suggestions,this),queryParams:{field:"logServerMessage"}});this.inboundCriteria=new jscape.domain.SearchCriteriaSizeView($("input[name=inbound]",this.fieldset));this.outboundCriteria=new jscape.domain.SearchCriteriaSizeView($("input[name=outbound]",this.fieldset));this.searchButton=$("a[role=button][name=search]",this.fieldset).linkbutton({onClick:$.proxy(this._onClick$SearchButton,this)});},getName:function(){return this.name.textbox("getValue");},getMaxRecords:function(){return parseInt(this.maxRecords.numberspinner("getValue"));},getDateCriteria:function(){return this.dateCriteria.val();},getAppInstanceIdCriteria:function(){return this.appInstanceIdCriteria.val();},getSessionIdCriteria:function(){return this.sessionIdCriteria.val();},getClientIpCriteria:function(){return this.clientIpCriteria.val();},getClientPortCriteria:function(){return this.clientPortCriteria.val();},getServerIpCriteria:function(){return this.serverIpCriteria.val();},getServerPortCriteria:function(){return this.serverPortCriteria.val();},getUsernameCriteria:function(){return this.usernameCriteria.val();},getClientRequestCriteria:function(){return this.clientRequestCriteria.val();},getClientMessageCriteria:function(){return this.clientMessageCriteria.val();},getServerStatusCriteria:function(){return this.serverStatusCriteria.val();},getServerMessageCriteria:function(){return this.serverMessageCriteria.val();},getInboundCriteria:function(){return this.inboundCriteria.val();},getOutboundCriteria:function(){return this.outboundCriteria.val();},show:function(listener){this.listener=listener||jscape.domain.LogSearchCriteriaView.LISTENER;},_onClick$SearchButton:function(){if(this.fieldset.form("validate")){this.searchButton.linkbutton("disable");this.listener.onSearch().done($.proxy(function(){this.name.textbox("clear");},this)).always($.proxy(function(){this.searchButton.linkbutton("enable");},this));}},_onLoad$Suggestions:function(params,success,error){return this.listener.onLoadSuggestions(params).done(success).fail(error);}});jscape.domain.LogSearchCriteriaView.LISTENER={onSearch:$.noop,onLoadSuggestions:$.noop};jscape.domain.SearchCriteriaTextView=Class.extend({initialize:function(valueField){var parent=$(valueField).parents(".row");var name=$(valueField).attr("name");this.value=valueField.textbox({required:true,width:"45%"});this.operator=parent.find("select[name={name}operator]".supplant({name:name})).combobox({editable:false,width:120,panelHeight:"auto"});this.enabled=parent.find("input[name=by{name}]:checkbox".supplant({name:name})).change($.proxy(function(){var enabled=this.enabled.is(":checked");this.operator.combobox(enabled?"enable":"disable");this.value.textbox(enabled?"enable":"disable");},this));this.enabled.change();},val:function(value){if(!arguments.length){return this.enabled.is(":checked")?new jscape.SearchCriteria(this.enabled.val(),this.operator.combobox("getValue"),this.value.textbox("getValue")):null;}
if(value!=null&&value.variable==this.enabled.val(value)){this.enabled.prop("checked",true).change();this.operator.combobox("setValue",value.operator);this.value.textbox("setValue",value.value);}
return this;}});jscape.domain.SearchCriteriaComboboxView=Class.extend({initialize:function(valueField,options){var initializing=true;var parent=$(valueField).parents(".row");var name=$(valueField).attr("name");this.value=$(valueField);this.value.combobox($.extend({required:true,editable:true,limitToList:false,onBeforeLoad:function(){return!initializing;},onLoadSuccess:$.proxy(this._onLoad$Success,this),onLoadError:$.proxy(this._onLoad$Error,this),onShowPanel:$.proxy(this._onShow$Panel,this),width:"45%",panelMinHeight:50,panelHeight:"auto",panelMaxHeight:"40%"},options||{})).combobox("clear");this.value.combobox("textbox").click({target:this.value},$.proxy(this._onClick$Input,this));this.operator=parent.find("select[name={name}operator]".supplant({name:name})).combobox({required:true,editable:false,width:120,panelHeight:"auto"});this.enabled=parent.find("input[name=by{name}]:checkbox".supplant({name:name})).change($.proxy(this._onChange$Enabled,this));this.enabled.change();initializing=false;},val:function(criteria){if(!arguments.length){return this.enabled.is(":checked")?new jscape.SearchCriteria(this.enabled.val(),this.operator.combobox("getValue"),this.value.combobox("getValue")):null;}
if(criteria!=null&&criteria.variable==this.enabled.val(criteria)){this.enabled.prop("checked",true).change();this.operator.combobox("setValue",criteria.operator);this.value.combobox("setValue",criteria.value);}
return this;},_onChange$Enabled:function(){var enabled=this.enabled.is(":checked");this.operator.combobox(enabled?"enable":"disable");this.value.combobox(enabled?"enable":"disable");},_onClick$Input:function(e){var t=$(e.data.target);if(t.length&&!t.combobox("panel").is(":visible")){t.combobox("showPanel");}},_onShow$Panel:function(){if(!this.value.combobox("options").variantsLoaded){this.value.combobox("loading").combobox("reload");}},_onLoad$Success:function(data){this.value.combobox("loaded");if(data&&data.length){this.value.combobox("options").variantsLoaded=true;this.value.combobox("clear").combobox("panel").panel("resize",{width:"auto",minWidth:this.value.outerWidth()});}},_onLoad$Error:function(){this.value.combobox("loaded");this.value.combobox("panel").panel("resize",$.fn.combobox.defaults);}});jscape.domain.SearchCriteriaDateView=Class.extend({initialize:function(enableBox,startDate,endDate){this.enabled=enableBox.change($.proxy(function(){var enabled=this.enabled.is(":checked");this.startDate.datebox(enabled?"enable":"disable").datebox(enabled?"enableValidation":"disableValidation");this.endDate.datebox(enabled?"enable":"disable").datebox(enabled?"enableValidation":"disableValidation");},this));this.startDate=startDate.datebox({required:true,width:120,validType:"search_date_criteria",validParams:$.proxy(this.val,this),onChange:$.proxy(function(){this.endDate.datebox("validate");},this)});this.endDate=endDate.datebox({required:true,width:120,validType:"search_date_criteria",validParams:$.proxy(this.val,this),onChange:$.proxy(function(){this.startDate.datebox("validate");},this)});var today=new Date();var tomorrow=new Date(today.getFullYear(),today.getMonth(),today.getDate()+1);this.startDate.datebox("setDate",today);this.endDate.datebox("setDate",tomorrow);this.enabled.change();},val:function(criteria){if(!arguments.length){return this.enabled.is(":checked")?new jscape.SearchDateCriteria(this.enabled.val(),this.startDate.datebox("getDate").getTime(),this.endDate.datebox("getDate").getTime()):null;}
if(criteria!=null&&criteria.variable===this.enabled.val()){this.enabled.prop("checked",true).change();this.startDate.datebox("setValue",criteria.startDate);this.endDate.datebox("setValue",criteria.endDate);}
return this;}});jscape.domain.SearchCriteriaPortView=Class.extend({initialize:function(valueField){var parent=$(valueField).parents(".row");var name=$(valueField).attr("name");this.value=valueField.numberspinner({required:true,disabled:true,min:1,max:65535,value:1,width:100});this.operator=parent.find("select[name={name}operator]".supplant({name:name})).combobox({required:true,editable:false,width:120,panelHeight:"auto"});this.enabled=parent.find("input[name=by{name}]:checkbox".supplant({name:name})).change($.proxy(function(){var enabled=this.enabled.is(":checked");this.operator.combobox(enabled?"enable":"disable");this.value.numberspinner(enabled?"enable":"disable");},this));this.enabled.change();},val:function(criteria){if(!arguments.length){return this.enabled.is(":checked")?new jscape.SearchCriteria(this.enabled.val(),this.operator.combobox("getValue"),parseInt(this.value.numberspinner("getValue"))):null;}
if(criteria!=null&&criteria.variable===this.enabled.val()){this.enabled.prop("checked",true).change();this.operator.combobox("setValue",criteria.variable);this.value.numberspinner("setValue",parseInt(criteria.value));}
return this;}});jscape.domain.SearchCriteriaSizeView=Class.extend({initialize:function(sizeField,options){var parent=$(sizeField).parents(".row");var name=$(sizeField).attr("name");this.size=sizeField.numberspinner($.extend({required:true,disabled:true,min:1,max:1000000,value:1,increment:10,width:150},options||{}));this.operator=parent.find("select[name={name}operator]".supplant({name:name})).combobox({required:true,editable:false,width:120,panelHeight:"auto"});this.factor=parent.find("select[name={name}factor]".supplant({name:name})).combobox({required:true,editable:false,width:120,panelHeight:"auto"});this.enabled=parent.find("input[name=by{name}]:checkbox".supplant({name:name})).change($.proxy(function(){var enabled=this.enabled.is(":checked");this.operator.combobox(enabled?"enable":"disable");this.size.numberspinner(enabled?"enable":"disable");this.factor.combobox(enabled?"enable":"disable");},this));this.enabled.change();},val:function(criteria){if(!arguments.length){return this.enabled.is(":checked")?new jscape.SearchCriteria(this.enabled.val(),this.operator.combobox("getValue"),parseInt(this.size.numberspinner("getValue"))*parseInt(this.factor.combobox("getValue"))):null;}
if(criteria!=null&&criteria.variable===this.enabled.val()){this.enabled.prop("checked",true).change();this.operator.combobox("setValue",criteria.operator);var factors=this.factor.combobox("getData");var minValue=parseInt(this.size.numberspinner("options").min);var maxValue=parseInt(this.size.numberspinner("options").max);while(factors){var factor=parseInt(factors.shift());var value=parseInt(criteria.value)/factor;if(minValue>=value&&value<=maxValue){this.size.numberspinner("setValue",value);this.factor.combobox("select",factor);break;}}}
return this;}});jscape.domain.LogSearchResultsView=jscape.ui.DatagridView.extend({selection:null,initialize:function(){var initializing=true;this.fieldset=$("#domain-search-results-fields").layout({fit:true,doSize:false,border:false});this.data=$("table[role=grid][aria-label=searchresults]",this.fieldset);this.data.datagrid({fit:true,fitColumns:true,ctrlSelect:true,remoteSort:false,idField:"name",sortName:"name",columns:[[{field:"name",title:$("thead th:nth-child(1)",this.data).text(),sortable:true,width:150},{field:"date",title:$("thead th:nth-child(2)",this.data).text(),sortable:true,width:150,align:"right",formatter:function(value){return new Date(value).toLocaleString();}},{field:"criteria",title:$("thead th:nth-child(3)",this.data).text(),sortable:false,width:350},{field:"status",title:$("thead th:nth-child(4)",this.data).text(),sortable:false,width:100,formatter:function(_,row){return String(row.error?row.error:row.progress+"%").escapeXml();},styler:function(_,row){return row.error?"color:red":"color:green";}}]],onSelect:$.proxy(this._adjustState,this),onUnselect:$.proxy(this._adjustState,this),onUnselectAll:$.proxy(this._adjustState,this),onDblClickRow:$.proxy(this._onClick$ViewButton,this),onRowContextMenu:$.proxy(this._onRow$ContextMenu,this),loader:$.proxy(this._onLoad$Data,this),onBeforeLoad:function(){return!initializing;},onLoadSuccess:$.proxy(this._adjustState,this)});this.refreshButton=$("a[role=button][name=reload]",this.fieldset).linkbutton({onClick:$.proxy(this._onClick$RefreshButton,this)});this.exportButton=$("a[role=button][name=export]",this.fieldset).linkbutton({disabled:true,onClick:$.proxy(this._onClick$ExportButton,this)});this.viewButton=$("a[role=button][name=view]",this.fieldset).linkbutton({disabled:true,onClick:$.proxy(this._onClick$ViewButton,this)});this.startButton=$("a[role=button][name=start]",this.fieldset).linkbutton({disabled:true,onClick:$.proxy(this._onClick$StartButton,this)});this.deleteButton=$("a[role=button][name=delete]",this.fieldset).linkbutton({disabled:true,onClick:$.proxy(this._onClick$DeleteButton,this)});initializing=false;},show:function(listener){this.listener=listener||jscape.domain.LogSearchResultsView.LISTENER;this._adjustState();},getSearches:function(){return this.getRecords();},selectSearch:function(value){this.selectRecord(value);},updateSearch:function(value){var opts=this.data.datagrid("options");var index=this.data.datagrid("getRowIndex",value[opts.idField]);if(index!=-1){this.data.datagrid("updateRow",{index:index,row:value});}},_onLoad$Data:function(params,success,error){this.listener.onRefresh(params).done(success).fail(error);},_onClick$RefreshButton:function(){this.refresh();},_onClick$ExportButton:function(){this.exportButton.linkbutton("disable");this.listener.onExport(this.selection[0]).always($.proxy(function(){this.exportButton.linkbutton("enable");},this));},_onClick$ViewButton:function(){this.viewButton.linkbutton("disable");this.listener.onView(this.selection[0]).always($.proxy(function(){this.viewButton.linkbutton("enable");},this));},_onClick$StartButton:function(){this.listener.onRerun(this.selection[0]);},_onClick$DeleteButton:function(){this.listener.onDelete(this.selection);},_showContextMenu:function(e){this._super(e,[this.viewButton,this.deleteButton,"-",this.startButton,"-",this.exportButton]);},_adjustState:function(){this.selection=this.data.datagrid("getSelections");var allSearchComplete=this._allSearchComplete(this.selection);this.exportButton.linkbutton(this.selection.length==1&&allSearchComplete?"enable":"disable");this.viewButton.linkbutton(this.selection.length==1&&allSearchComplete?"enable":"disable");this.startButton.linkbutton(this.selection.length==1?"enable":"disable");this.deleteButton.linkbutton(this.selection.length!=0?"enable":"disable");},_allSearchComplete:function(searches){return $.grep(searches,function(search){return search.completed();}).length==searches.length;}});jscape.domain.LogSearchResultsView.LISTENER={onRefresh:$.noop,onExport:$.noop,onView:$.noop,onRerun:$.noop,onDelete:$.noop};jscape.domain.LogSearchResultController=Class.extend({MAX_RECORDS:50,deferred:null,initialize:function(){this.exportController=new jscape.domain.ExportLogSearchController();},start:function(domainName,search){this.domainName=domainName;this.searchName=search.name;this.deferred=$.Deferred();var maxRecords=search.maxRecords;var truncated=false;if(search.maxRecords>this.MAX_RECORDS){maxRecords=this.MAX_RECORDS;truncated=true;}
jscape.API.getLogSearchResult(this.domainName,search.name,maxRecords).done($.proxy(function(data){this._setupDialog(data,truncated,maxRecords).show(this);},this)).fail($.proxy(function(){this.deferred.reject();this.deferred=null;},this));return this.deferred.promise();},onExport:function(){this.exportController.start(this.domainName,this.searchName);},onCancel:function(dialog){dialog.destroy();this.deferred.resolve();this.deferred=null;},_setupDialog:function(data,truncated,recordsCount){var dialog=new jscape.domain.LogSearchResultDialog();dialog.setData(data,truncated);dialog.setRecordsCount(recordsCount);return dialog;}});jscape.domain.LogSearchResultDialog=jscape.ui.DefaultDialog.extend({initialize:function(){this._super($("#d-logging-view"),{width:"80%",buttons:[{text:window.R.string.DIALOG_BUTTON_CLOSE||"Close",handler:$.proxy(this._onCancel,this)}]});this.fieldset=$("fieldset[name=logviewfields]",this.dialog);this.text=$("textarea[name=result]",this.fieldset).prop("readonly",true).css({width:"99%",height:"28em"});this.truncatedInfo=$("div[aria-label=search-results-truncated]",this.fieldset);this.exportButton=$("a[role=button][name=export]",this.fieldset).linkbutton({disabled:true,onClick:$.proxy(this._onClick$ExportButton,this)});},setData:function(value,truncated){this.text.val(value);this.exportButton.linkbutton(value&&value.trim().length!=0?"enable":"disable");if(truncated){this.truncatedInfo.show();}else{this.truncatedInfo.hide();}},setRecordsCount:function(value){this.truncatedInfo.text(this.truncatedInfo.text().supplant({0:value||""}));},show:function(listener){this._super(listener||jscape.domain.LogSearchResultDialog.LISTENER);},_onClick$ExportButton:function(){this.listener.onExport(this);}});jscape.domain.LogSearchResultDialog.LISTENER={onExport:$.noop,onClose:$.noop};jscape.domain.ExportLogSearchController=Class.extend({deferred:null,start:function(domainName,searchName){this.domainName=domainName;this.searchName=searchName;this.deferred=$.Deferred();this._setupDialog(searchName+".txt").show(this);return this.deferred.promise();},onSubmit:function(dialog){var filename=dialog.getFilename();return jscape.API.exportLogSearchResult(this.domainName,this.searchName,filename).done($.proxy(function(){this.deferred.resolve(filename);this.deferred=null;},this));},onCancel:function(dialog){dialog.destroy();this.deferred.reject();this.deferred=null;},_setupDialog:function(filename){var dialog=new jscape.ui.ExportDialog($("#d-logging-export"));dialog.setFilename(filename);return dialog;}});jscape.domain.DeleteLogSearchController=Class.extend({deferred:null,start:function(domainName,searches){this.domainName=domainName;this.deferred=$.Deferred();this._confirmDelete(searches).done($.proxy(this._deleteConfirmed,this,searches)).fail($.proxy(function(){this.deferred.reject();this.deferred=null;},this));return this.deferred.promise();},_deleteConfirmed:function(searches){$.when.apply(jQuery,$.map(searches,$.proxy(function(search){return jscape.API.deleteLogSearch(this.domainName,search.name);},this))).done($.proxy(function(){this.deferred.resolve(searches);this.deferred=null;},this)).fail($.proxy(function(){this.deferred.reject();this.deferred=null;},this));},_confirmDelete:function(searches){var text=$.map(searches,function(search){return search.name;}).join(", ");return jscape.ConfirmDialog.confirm(window.R.string.LOGGING_CONFIRM_DELETE_TITLE,window.R.string.LOGGING_CONFIRM_DELETE_MESSAGE.supplant({0:text}));}});