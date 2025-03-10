/* Copyright © 2009-2024. Redwood Software Inc. All rights reserved. */
var uniqueSelectPathDialogId=(function(){var id=0;return function(){return"selectPathDialog"+id++;};})();window.SelectPathDialog=Class.extend({DEFAULT_WIDTH:780,DEFAULT_HEIGHT:500,TEMPLATE:"<div id='{dialogId}' style='display: none'>"
+"<form action='#' autocomplete='off' accept-charset='utf-8'>"
+"<div class='easyui-layout' style='height: 370px;'>"
+"<div style='height: 80px;'><fieldset><div>"
+"<label style='width:auto;min-width:fit-content;margin-right:1em'>{lookInLabel}</label><span>"
+"<select id='{treeBoxId}' style='width:200px;'></select>&nbsp;"
+"<a id='{backButtonId}' href='#' title='{backButtonTooltip}' class='easyui-tooltip'></a>&nbsp;"
+"<a id='{reloadButtonId}' href='#' title='{reloadButtonTooltip}' class='easyui-tooltip'></a>&nbsp;"
+"<a id='{createButtonId}' href='#' title='{createButtonFileOrDirectoryTooltip}' class='easyui-tooltip'>{createButton}</a>&nbsp;"
+"<div id='{createButtonMenuId}' role='menu' style='display: none'><div role='menuitem' data-options='name:\"{createDirMenuItemId}\"'>{createDirMenuItem}</div><div role='menuitem' data-options='name:\"{createFileMenuItemId}\"'>{createFileMenuItem}</div></div>"
+"<a id='{detailsButtonId}' href='#' title='{detailsButtonTooltip}' class='easyui-tooltip'>{detailsButton}</a>&nbsp;"
+"<a id='{listButtonId}' href='#' title='{listButtonTooltip}' class='easyui-tooltip'>{listButton}</a>"
+"</span></div></fieldset></div>"
+"<div>"
+"<div id='{fileTablePanelId}' style='margin: 0 2em 0 2em'>"
+"<table id='{fileTableId}' style='height: 170px;'></table>"
+"</div>"
+"<div id='{fileListPanelId}' style='margin: 0 2em 0 2em; border: 1px solid #BCBCBC; height: 170px; display: none; overflow: auto'>"
+"<div style='width: 100%; display: table'>"
+"<div id='{fileListRowId}' style='height: 100%; display: table-row'></div>"
+"</div></div></div>"
+"<div style='height: 110px;'><fieldset><div>"
+"<label>{fileNameLabel}</label>"
+"<span><input id='{resultFieldId}' type='text' maxlength='1000' style='width: 523px;'/></span>"
+"</div>"
+"<div>"
+"<label>{fileTypeLabel}</label>"
+"<span><select id='{filterBoxId}' style='width:525px;'></select></span>"
+"</div></fieldset></div></div>"
+"</form>"
+"</div>"
+"<div id='{newFileEntryDialogId}' style='display: none'>"
+"<form action='#' accept-charset='utf-8'><div style='margin:1.7em 3em;'><label></label>&nbsp;<input name='filename' type='text' maxlength='1024'/></div></form>"
+"</div>",DEFAULT_RESOURCES:{dialogTitle:"Select Path",lookInLabel:"Look in",createButton:"Create",createDirMenuItem:"Folder",createFileMenuItem:"File",detailsButton:"Details",listButton:"List",backButtonTooltip:"Back",reloadButtonTooltip:"Reload",createButtonDirectoryTooltip:"Create directory",createButtonFileOrDirectoryTooltip:"Create file or directory",detailsButtonTooltip:"View details",listButtonTooltip:"View list",submitButton:"Select",cancelButton:"Cancel",nameColumn:"Name",extensionColumn:"Ext",sizeColumn:"Size",dateColumn:"Date Modified",fileNameLabel:"Path",fileTypeLabel:"File of type",newFileNameDialogTitle:"New File",newFileNameLabel:"File name",newFileNameValue:"New Document.txt",newDirectoryNameDialogTitle:"New Directory",newDirectoryNameLabel:"Directory name",newDirectoryNameValue:"New Folder",newDirectoryAlreadyExists:"File or directory already exists"},ID:null,initialize:function(resources){this.ID={dialogId:uniqueSelectPathDialogId(),treeBoxId:uniqueSelectPathDialogId(),backButtonId:uniqueSelectPathDialogId(),reloadButtonId:uniqueSelectPathDialogId(),createButtonId:uniqueSelectPathDialogId(),createButtonMenuId:uniqueSelectPathDialogId(),createFileMenuItemId:uniqueSelectPathDialogId(),createDirMenuItemId:uniqueSelectPathDialogId(),detailsButtonId:uniqueSelectPathDialogId(),listButtonId:uniqueSelectPathDialogId(),fileTablePanelId:uniqueSelectPathDialogId(),fileTableId:uniqueSelectPathDialogId(),fileListPanelId:uniqueSelectPathDialogId(),fileListRowId:uniqueSelectPathDialogId(),resultFieldId:uniqueSelectPathDialogId(),filterBoxId:uniqueSelectPathDialogId(),newFileEntryDialogId:uniqueSelectPathDialogId()};this.resources=resources||this.DEFAULT_RESOURCES;$("body").append(this.TEMPLATE.supplant($.extend({},this.ID,this.resources)));this.dialog=$("#"+this.ID.dialogId);this.dialog.show();this.dialog.dialog({title:this.resources.dialogTitle,width:this.DEFAULT_WIDTH,height:this.DEFAULT_HEIGHT,modal:true,resizable:true,closable:true,buttons:[{text:this.resources.submitButton,handler:$.proxy(this._onSubmit,this)},{text:this.resources.cancelButton,handler:$.proxy(this._onCancel,this)}],onClose:$.proxy(function(){if(!this.closing){this._onCancel();}},this),closed:true});this.fileTablePanel=$("#"+this.ID.fileTablePanelId);this.fileListPanel=$("#"+this.ID.fileListPanelId);this.treeBox=$("#"+this.ID.treeBoxId);this.treeBox.combotree({editable:false,onSelect:$.proxy(this._treeSelected,this),formatter:function(node){return String(node.text).escapeXml();}});this.backButton=$("#"+this.ID.backButtonId).linkbutton({iconCls:"icon-undo",onClick:$.proxy(function(){this.listener.onSelectParent();},this)});this.reloadButton=$("#"+this.ID.reloadButtonId).linkbutton({iconCls:"icon-reload",onClick:$.proxy(function(){this.listener.onReload();},this)});this.createButton=$("#"+this.ID.createButtonId).menubutton({plain:false,menu:"#"+this.ID.createButtonMenuId,showEvent:"click mouseenter"});$(this.createButton.menubutton("options").menu).menu({onClick:$.proxy(this._createPathRequested,this)});this.detailsButton=$("#"+this.ID.detailsButtonId).linkbutton({group:"viewType",toggle:true,selected:true,onClick:$.proxy(this._detailedViewSelected,this)});this.listButton=$("#"+this.ID.listButtonId).linkbutton({group:"viewType",toggle:true,selected:false,onClick:$.proxy(this._listViewSelected,this)});this.fileTable=$("#"+this.ID.fileTableId);this.fileTable.datagrid({singleSelect:true,fitColumns:true,remoteSort:false,columns:[[{field:"shortName",title:this.resources.nameColumn,sortable:true,width:100,formatter:$.proxy(this._shortNameOf,this)},{field:"extension",title:this.resources.extensionColumn,sortable:true,width:20,formatter:$.proxy(this._extOf,this)},{field:"size",title:this.resources.sizeColumn,sortable:true,width:50,formatter:$.proxy(this._sizeOf,this)},{field:"lastModificationDate",title:this.resources.dateColumn,width:50,formatter:$.proxy(this._dateOf,this)}]],striped:true,onDblClickRow:$.proxy(this._rowDoubleClicked,this),onSelect:$.proxy(this._rowSelected,this)});this.fileListRow=$("#"+this.ID.fileListRowId);this.resultField=$("#"+this.ID.resultFieldId).textbox({});this.filterBox=$("#"+this.ID.filterBoxId).combobox({valueField:"filter",textField:"description",editable:false,panelHeight:"auto",onSelect:$.proxy(this._filterSelected,this)});this.tableVisible=true;},show:function(listener){this.listener=listener;this.dialog.dialog("center").dialog("open");if(this.tableVisible){this.detailsButton.linkbutton("select");}},showNewDirectoryDialog:function(){return this._showNewFileSystemEntryDialog(this.resources.newDirectoryNameDialogTitle,this.resources.newDirectoryNameLabel,this._uniqueName(this.resources.newDirectoryNameValue));},showNewFileDialog:function(){return this._showNewFileSystemEntryDialog(this.resources.newFileNameDialogTitle,this.resources.newFileNameLabel,this._uniqueName(this.resources.newFileNameValue));},hide:function(){if(!this._closed()){this.closing=true;this.dialog.dialog("close");this.closing=false;}},setFilters:function(filters){this.filterBox.combobox("loadData",filters);this.filterBox.combobox("setValue",filters[0].filter).combobox("select",filters[0].filter);},setData:function(root,entry){this.entry=entry;this._initTreeBox(root);if(this.tableVisible){this.fileTable.datagrid("loadData",this.entry.entries);this.tableDataLoaded=true;}else{this.tableDataLoaded=false;}
this._loadList();this.resultField.textbox("setValue","");this.createButton.menubutton(!!entry.directoryCreationAllowed?"enable":"disable");},setFileCreationAllowed:function(allowed){if(!allowed){$(this.createButton.menubutton("options").menu).menu("destroy");this.createButton.attr("title",this.resources.createButtonDirectoryTooltip);this.createButton.menubutton({menu:null,showEvent:"click",hasDownArrow:false,onClick:$.proxy(this._createDirRequested,this)});}},getResult:function(){return this.resultField.textbox("getValue");},setResult:function(entry){if(entry){var selection=this.fileTable.datagrid("getSelections");if(selection.length==0||$.inArray(entry,selection)==-1){var index=this.fileTable.datagrid("getRowIndex",entry);this.fileTable.datagrid("selectRow",index);}
this.resultField.textbox("setValue",entry.name);}else{this.resultField.textbox("clear");}},_closed:function(){return!this.dialog||!!this.dialog.dialog("options").closed;},_onSubmit:function(){this.listener.onSubmit();},_onCancel:function(){this.listener.onCancel();},_showNewFileSystemEntryDialog:function(title,label,filename){var deferred=$.Deferred();var promise=deferred.promise();var nameFieldId=uniqueSelectPathDialogId();var okButtonId=uniqueSelectPathDialogId();var dialog=$("#"+this.ID.newFileEntryDialogId).clone().attr("id","");dialog.dialog({title:title,width:450,height:"auto",resizable:false,modal:true,buttons:[{id:okButtonId,text:this.resources.createButton,handler:function(){var input=$("#"+nameFieldId);if(input.length&&input.textbox("isValid")){var val=input.textbox("getValue");if(val&&val.trim().length){deferred.resolve(val);dialog.dialog("close");}}}},{text:this.resources.cancelButton,handler:function(){dialog.dialog("close");}}],closed:true,closable:false,onClose:function(){$(this).dialog("destroy");"resolved"!==deferred.state()&&deferred.reject();deferred=dialog=null;}}).keydown(function(e){if(e.keyCode==13){e.stopPropagation();$("#"+okButtonId).click();}else if(e.keyCode==27){e.stopPropagation();dialog.dialog("close");}}).show();var input=dialog.find("input[name=filename]").textbox({validType:"vfs_path_unique",invalidMessage:this.resources.newDirectoryAlreadyExists,value:filename||"",width:250});input.textbox("textbox").on("input",function(){$("#"+okButtonId).linkbutton($(this).val().trim().length?"enable":"disable");}).triggerHandler("input");input.attr("id",nameFieldId).parent().find("label").attr("for",nameFieldId).text(label);dialog.dialog("center").dialog("open");input.textbox("textbox").focus().select();return promise;},_treeSelected:function(node){if(!this.loadingTree&&this.listener&&this.entry.path!==node.attributes.path){this.listener.onSelect(node.attributes.path);}},_createPathRequested:function(item){var id=item?item.name:"";if(id===this.ID.createFileMenuItemId){this._createFileRequested();}else{this._createDirRequested();}},_createFileRequested:function(){this.listener.onCreateFile(this).done($.proxy(function(entry){var index=this.fileTable.datagrid("getRowIndex",entry);this.fileTable.datagrid("selectRow",index);},this));},_createDirRequested:function(){this.listener.onCreateDirectory(this).done($.proxy(function(entry){var index=this.fileTable.datagrid("getRowIndex",entry);this.fileTable.datagrid("selectRow",index);},this));},_detailedViewSelected:function(){this.fileListPanel.hide();this.fileTablePanel.show();this.tableVisible=true;if(!this.tableDataLoaded){this.fileTable.datagrid("loadData",this.entry.entries);this.tableDataLoaded=true;}},_listViewSelected:function(){this.fileTablePanel.hide();this.fileListPanel.show();this.tableVisible=false;},_rowDoubleClicked:function(index,entry){if(entry.directory){this.listener.onSelect(entry.path);}},_rowSelected:function(index,entry){this.listener.onFileSelected(entry);},_filterSelected:function(record){if(this.listener){this.listener.onSelectFilter(record.filter);}},_initTreeBox:function(root){var treeNodes=this._treeNodesFor(root);this.loadingTree=true;this.treeBox.combotree("loadData",treeNodes);this.loadingTree=false;this.treeBox.combotree("setValue",this.entry.name.length?this.entry.id:"");},_treeNodesFor:function(root){this.idSequence=0;var nodes=[];var i;var entry;var node;for(i=0;i<root.entries.length;++i){entry=root.entries[i];node={id:++this.idSequence,text:entry.name,state:"closed",attributes:{path:entry.path}};if(entry.path===this.entry.path){this.entry.id=this.idSequence;}else if(this.entry.parents.length&&entry.name===this.entry.parents[0].name){this._appendChild(node);}
nodes.push(node);}
return nodes;},_appendChild:function(node){node.state="open";var i;var parent;var child;for(i=1;i<this.entry.parents.length;++i){parent=this.entry.parents[i];child={id:++this.idSequence,text:parent.name,state:"open",attributes:{path:parent.path}};node.children=[child];node=child;}
child={id:++this.idSequence,text:this.entry.name,state:"open",attributes:{path:this.entry.path}};this.entry.id=this.idSequence;node.children=[child];},_loadList:function(){this.fileListRow.empty();this.entryDivList=[];var cellTemplate='<div style="display: table-cell; padding: 0.5em 1em;"></div>';this.fileListRow.append(cellTemplate);var cell=this.fileListRow.find("div:last");for(var i=0;i<this.entry.entries.length;++i){var entry=this.entry.entries[i];cell.append("<div style='margin: 0 0 0.4em 0; white-space: nowrap'>"+this._shortNameOf(0,entry)+"</div>");this._initEntryDiv(cell.find("div:last"),entry);if((i+1)%6===0){this.fileListRow.append(cellTemplate);cell=this.fileListRow.find("div:last");}}},_initEntryDiv:function(div,entry){div.click($.proxy(function(){this._clearEntryDivListSelection();div.addClass("datagrid-row-selected");this._rowSelected(0,entry);},this));div.dblclick($.proxy(function(){this._rowDoubleClicked(0,entry);},this));this.entryDivList.push(div);},_clearEntryDivListSelection:function(){for(var i=0;i<this.entryDivList.length;++i){this.entryDivList[i].removeClass("datagrid-row-selected");}},_uniqueName:function(filename){var names=$.map(this.entry.entries,function(entry){return entry.name;});var suffix=filename.indexOf(".")==-1?"":"."+filename.split(".").pop();var result=filename;var i=1;do{if($.inArray(result,names)===-1){break;}
result=this._nameOf(filename)+"("+(++i)+")"+suffix;}while(true);return result;},_shortNameOf:function(_,entry){return entry.directory?"<span class='tree-icon tree-folder'></span>&nbsp;<span>"+String(entry.name||"").escapeXml()+"</span>":"<span class='tree-icon tree-file'></span>&nbsp;<span>"+String(entry.shortName||"").escapeXml()+"</span>";},_nameOf:function(value){return value.split(".").slice(0,-1).join(".")||value;},_extOf:function(value,entry){return entry.directory?"&lt;DIR&gt;":String(entry.extension||"").escapeXml();},_sizeOf:function(value,entry){return!entry.directory?jscape.SizeFormat.format(entry.size):"";},_dateOf:function(value,entry){return jscape.DateFormat.format(entry.lastModificationDate);}});window.SelectPathController=Class.extend({FILES_SELECTION:{selectionAllowed:function(entry){return entry&&!entry.directory;},filterRequired:function(){return false;},allows:function(entry){return true;}},DIRECTORY_SELECTION:{selectionAllowed:function(entry){return entry&&entry.directory;},filterRequired:function(){return true;},allows:function(entry){return entry&&entry.directory;}},PATH_SELECTION:{selectionAllowed:function(entry){return true;},filterRequired:function(){return false;},allows:function(entry){return true;}},DEFAULT_FILTERS:[{filter:"",description:"All Files"}],initialize:function(pathLoader,pathCreator,filters,resources){this.dialog=new window.SelectPathDialog(resources);this.loader=pathLoader;this.creator=pathCreator;this.dialog.setFilters(filters&&filters.length?filters:this.DEFAULT_FILTERS);this.currentFilter=filters&&filters.length?filters[0].filter:this.DEFAULT_FILTERS[0].filter;this.cache={};$.extend($.fn.validatebox.defaults.rules,{"vfs_path_unique":{validator:$.proxy(this._pathNotExists,this),message:""}});},selectFile:function(){this.selectionMode=this.FILES_SELECTION;return this._select();},selectDirectory:function(){this.selectionMode=this.DIRECTORY_SELECTION;return this._select();},selectPath:function(){this.selectionMode=this.PATH_SELECTION;return this._select();},onSelectParent:function(){if(this.currentEntry.parents.length){this.onSelect(this.currentEntry.parents[this.currentEntry.parents.length-1].path);}else{this._rootLoaded(this.root);}},onSelectRoot:function(){this.currentEntry=this.root;this._initDialog();},onReload:function(){this.loader(this.currentEntry.path).done($.proxy(this._pathLoaded,this));},onSelect:function(path){var entry=this.cache[path];if(entry){this._pathLoaded(entry);}else{this.loader(path).done($.proxy(this._pathLoaded,this));}},onFileSelected:function(entry){this.selectedEntry=this.selectionMode.selectionAllowed(entry)?entry:null;this.dialog.setResult(this.selectedEntry);},onSelectFilter:function(filter){this.currentFilter=filter;this._initDialog();},onCreateDirectory:function(dialog){var newEntryName;return dialog.showNewDirectoryDialog().then($.proxy(function(name){newEntryName=name;return this.creator(this.currentEntry.path,name)},this)).then($.proxy(function(entry){this._pathLoaded(entry);return this._findPathEntry(newEntryName);},this));},onCreateFile:function(dialog){if(!this._fileCreationAllowed()){return $.Deferred().reject().promise();}
var newEntryName;return dialog.showNewFileDialog().then($.proxy(function(name){newEntryName=name;return this.creator(this.currentEntry.path,name,{type:"file"})},this)).then($.proxy(function(entry){this._pathLoaded(entry);return this._findPathEntry(newEntryName);},this));},onSubmit:function(){this.dialog.hide();if(this.selectedEntry){this.deferred.resolve(this.selectedEntry);}else{this.deferred.reject();}
this.deferred=null;},onCancel:function(){this.dialog.hide();this.deferred.reject();this.deferred=null;},_select:function(){this.deferred=$.Deferred();this.selectedEntry=null;this.dialog.setFileCreationAllowed(this._fileCreationAllowed());if(!this.root){this.loader().done($.proxy(this._rootLoaded,this));}else{this._initDialog();this.dialog.show(this);}
return this.deferred.promise();},_initDialog:function(){this.dialog.setData(this.root,this._applyFilter());},_rootLoaded:function(entry){this.root=entry;this.currentEntry=entry;this._initDialog();this.dialog.show(this);},_pathLoaded:function(entry){this.currentEntry=entry;this.cache[entry.path]=entry;this._initDialog();},_applyFilter:function(){if(!this.currentFilter&&!this.selectionMode.filterRequired()){return this.currentEntry;}
var entry=$.extend({},this.currentEntry);entry.entries=[];var i;var candidate;for(i=0;i<this.currentEntry.entries.length;++i){candidate=this.currentEntry.entries[i];if(candidate.directory||(this.selectionMode.allows(candidate)&&this.currentFilter===candidate.extension)){entry.entries.push(candidate);}}
return entry;},_fileCreationAllowed:function(){return this.selectionMode.selectionAllowed({directory:false});},_findPathEntry:function(name){var entries=this.currentEntry.entries;for(var i=0,len=entries.length;i<len;++i){var entry=entries[i];if(entry.name==name){return entry;}}
return null;},_pathNotExists:function(name){return this._findPathEntry(name)==null;}});