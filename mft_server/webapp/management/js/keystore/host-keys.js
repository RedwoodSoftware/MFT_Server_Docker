/* Copyright © 2009-2024. Redwood Software Inc. All rights reserved. */
jscape.keystore=jscape.keystore||{};jscape.keystore.HostKeysModule=jscape.keystore.KeystoreModule.extend({onCreate:function(){this._super.apply(this,arguments);this.controller=new jscape.keystore.HostKeysController();},onStart:function(){this._super.apply(this,arguments);this.controller.start();},onResume:function(){this._super.apply(this,arguments);this.controller.resume();}});jscape.keystore.HostKeysController=jscape.ui.DatagridController.extend({initialize:function(){this.importController=new jscape.keystore.ImportHostKeyController();this.importJsonController=new jscape.keystore.ImportHostKeysBatchController();this.importTslController=new jscape.keystore.ImportHostKeyTslController();this.exportPublicKeyController=new jscape.keystore.ExportHostPublicKeyController();this.exportCertificateController=new jscape.keystore.ExportHostCertificateController();this.crlController=new jscape.keystore.VerifyHostCertificateRevocationСontroller();this.viewKeyController=new jscape.keystore.ViewHostKeyController();this.viewCertificateController=new jscape.keystore.ViewHostCertificateController();this.revokeController=new jscape.keystore.RevokeHostCertificateController();this.deleteController=new jscape.keystore.DeleteHostKeyController();this._initValidators();},start:function(){if(this.view==null){this.view=new jscape.keystore.HostKeysView();}
this.view.show(this);},resume:function(){this.view.refresh();},onLoadData:function(params){params=jscape.Page.requestParameters(params);return $.when(jscape.API.listHostPublicKeys(params.startIndex,params.count,params.query),jscape.API.listHostCertificates(params.startIndex,params.count,params.query)).then(function(publicKeys,ceftificates){return{total:publicKeys.totalRecords+ceftificates.totalRecords,rows:[].concat(publicKeys.records,ceftificates.records),publicKeys:publicKeys.records,certificates:ceftificates.records};});},onImportFile:function(){return this.importController.start().done($.proxy(function(entry){if(entry instanceof jscape.CertificateSummary){this._certificateImported(entry);}else if(entry instanceof jscape.PublicKeySummary){this._publicKeyImported(entry);}},this));},onImportTsl:function(){return this.importTslController.start().done($.proxy(function(){this.view.refresh();},this));},onImportJson:function(){return this.importJsonController.start().done($.proxy(function(){this.view.refresh();},this));},onExportCertificate:function(certificate){return this.exportCertificateController.start(certificate.name);},onExportCertificatePublicKey:function(certificate){return this.exportPublicKeyController.start(certificate.name,true);},onExportPublicKey:function(key){return this.exportPublicKeyController.start(key.name,false);},onVerifyRevocation:function(){return this.crlController.start().done($.proxy(function(){this.view.refresh();},this));},onViewPublicKey:function(key){return this.viewKeyController.start(key.name);},onViewCertificate:function(certificate){return this.viewCertificateController.start(certificate.name);},onRevokeCertificate:function(certificate){return this.revokeController.start(certificate).done($.proxy(this._certificateRevoked,this));},onDeletePublicKey:function(key){return this.deleteController.start(key.name,false).done($.proxy(this._publicKeyDeleted,this,key));},onDeleteCertificate:function(certificate){return this.deleteController.start(certificate.name,true).done($.proxy(this._certificateDeleted,this,certificate));},_publicKeyImported:function(key){this.view.getPublicKeys().push(key);this._recordAdded(key);},_certificateImported:function(certificate){this.view.getCertificates().push(certificate);this._recordAdded(certificate);},_publicKeyDeleted:function(key){var items=this.view.getPublicKeys();var index=$.inArray(key,items);if(index!=-1){items.splice(index,1);this._recordDeleted(key);}},_certificateDeleted:function(certificate){var items=this.view.getCertificates();var index=$.inArray(certificate,items);if(index!=-1){items.splice(index,1);this._recordDeleted(certificate);}},_certificateRevoked:function(){this.view.refresh();},_initValidators:function(){var v=new jscape.Validator();v.nonEmptyRule("hostkey_nonempty",window.R.string.KEY_MANAGER_HOST_KEYS_ERROR_BAD_ALIAS);v.rule("hostkey_notexists",$.proxy(this._keyAliasNotExists,this),window.R.string.KEY_MANAGER_HOST_KEYS_ERROR_ALIAS_EXISTS);},_keyAliasNotExists:function(value,excludes){var keys=[].concat(this.view.getPublicKeys(),this.view.getCertificates());var aliases=$.map(keys,function(entry){return excludes&&$.inArray(value,excludes)!=-1?null:entry.name;});return $.inArray(value,aliases)==-1;}});jscape.keystore.HostKeysView=jscape.ui.DatagridView.extend({DATE_FORMAT:new jscape.DateFormat("{MM}-{dd}-{yy}"),selection:null,initialize:function(){var initializing=true;this.fieldset=$("#host-keys-fields").layout({fit:true,doSize:false,border:false});this.data=$("table[role=grid][aria-label=hostkeys]",this.fieldset);this.data.datagrid({fit:true,minHeight:300,singleSelect:true,pagination:true,search:true,remoteSearch:true,remoteSort:true,idField:"name",sortName:"name",columns:[[{field:"name",title:$("thead th:nth-child(1)",this.data).text(),sortable:true,width:"14%"},{field:"keyAlgorithm",title:$("thead th:nth-child(2)",this.data).text(),sortable:true,width:"7%",finder:{type:"combobox",options:{panelHeight:"auto",data:$.map(jscape.KeyPairAlgorithm.values(),$.proxy(function(entry){return entry.name;},this))}}},{field:"keySize",title:$("thead th:nth-child(3)",this.data).text(),sortable:true,finder:{type:"numberspinner",options:{editable:true,min:0}},width:"7%"},{field:"certificateSerialNumber",title:$("thead th:nth-child(4)",this.data).text(),sortable:true,width:"13%"},{field:"certificateIssuer",title:$("thead th:nth-child(5)",this.data).text(),sortable:false,width:"13%"},{field:"certificateSubject",title:$("thead th:nth-child(6)",this.data).text(),sortable:false,width:"13%"},{field:"certificateBeginDate",title:$("thead th:nth-child(7)",this.data).text(),sortable:true,formatter:$.proxy(this._formatDate,this),styler:$.proxy(this._styleDate,this,true),finder:"datebox",width:"13%"},{field:"certificateEndDate",title:$("thead th:nth-child(8)",this.data).text(),sortable:true,formatter:$.proxy(this._formatDate,this),styler:$.proxy(this._styleDate,this,false),finder:"datebox",width:"13%"},{field:"revoked",title:$("thead th:nth-child(9)",this.data).text(),sortable:true,width:"",align:"center",formatter:$.proxy(this._formatRevoked,this),finder:{type:"combobox",options:{data:[{text:"yes",value:true},{text:"no",value:false}],panelHeight:"auto"}}}]],onSelect:$.proxy(this._adjustButtonState,this),onUnselect:$.proxy(this._adjustButtonState,this),onUnselectAll:$.proxy(this._adjustButtonState,this),onDblClickRow:$.proxy(this._onClick$ViewButton,this),onRowContextMenu:$.proxy(this._onRow$ContextMenu,this),loader:$.proxy(this._onLoad$Data,this),onBeforeLoad:function(){return!initializing;},onLoadSuccess:$.proxy(this._adjustButtonState,this)});this.importButton=$("a[role=button][name=import]",this.fieldset).linkbutton({onClick:$.proxy(this._onClick$ImportButton,this)});this.importMenu=$("div[role=menu][aria-label=import-menu]",this.fieldset).menu({onClick:$.proxy(this._onClick$ImportMenu,this)});this.exportButton=$("a[role=button][name=export]",this.fieldset).linkbutton({disabled:true,onClick:$.proxy(this._onClick$ExportButton,this)});this.exportMenu=$("div[role=menu][aria-label=export-menu]",this.fieldset).menu({onClick:$.proxy(this._onClick$ExportMenu,this)});this.crlButton=$("a[role=button][name=verifycrl]",this.fieldset).linkbutton({onClick:$.proxy(this._onClick$CrlButton,this)});this.viewButton=$("a[role=button][name=view]",this.fieldset).linkbutton({disabled:true,onClick:$.proxy(this._onClick$ViewButton,this)});this.revokeButton=$("a[role=button][name=revoke]",this.fieldset).linkbutton({disabled:true,onClick:$.proxy(this._onClick$RevokeButton,this)});this.deleteButton=$("a[role=button][name=delete]",this.fieldset).linkbutton({disabled:true,onClick:$.proxy(this._onClick$DeleteButton,this)});this.fieldset.layout("panel","south").panel("resize",{height:"auto"});this.fieldset.layout("resize");initializing=false;},show:function(listener){this.listener=listener||jscape.keystore.HostKeysView.LISTENER;this._adjustButtonState();},getPublicKeys:function(){return this.data.datagrid("getData").publicKeys;},getCertificates:function(){return this.data.datagrid("getData").certificates;},_formatDate:function(value){return $.isNumeric(value)?this.DATE_FORMAT.format(new Date(value)):null;},_styleDate:function(before,value){if($.isNumeric(value)){var now=new Date().getTime();return before&&value>now||!before&&value<now?"color:red":"color:green";}
return null;},_formatRevoked:function(value){return"<input type=\"checkbox\" onclick=\"return false\""+(value?" checked=\"checked\" />":"/>");},_onLoad$Data:function(params,success,error){this.data.datagrid("unselectAll");this.listener.onLoadData(params).then(success,error);},_onClick$ImportButton:function(){this.importMenu.menu("show",{alignTo:this.importButton});this.importButton.blur();},_onClick$ImportMenu:function(item){if("menu-file"==item.id){this.listener.onImportFile();}else if("menu-tsl"==item.id){this.listener.onImportTsl();}else if("menu-json"==item.id){this.listener.onImportJson();}},_onClick$ExportButton:function(){var value=this.selection;if(this._isPublicKey(value)){this.listener.onExportPublicKey(value);}else if(this._isCertificate(value)){this.exportMenu.menu("show",{alignTo:this.exportButton});this.exportButton.blur();}},_onClick$ExportMenu:function(item){if("menu-crt"==item.id){this.listener.onExportCertificate(this.selection);}else if("menu-pubkey"==item.id){this.listener.onExportCertificatePublicKey(this.selection);}},_onClick$CrlButton:function(){this.listener.onVerifyRevocation();},_onClick$ViewButton:function(){if(this._isCertificate(this.selection)){this.listener.onViewCertificate(this.selection);}if(this._isPublicKey(this.selection)){this.listener.onViewPublicKey(this.selection);}},_onClick$RevokeButton:function(){if(this._isCertificate(this.selection)){this.listener.onRevokeCertificate(this.selection);}},_onClick$DeleteButton:function(){var value=this.selection;if(this._isPublicKey(value)){this.listener.onDeletePublicKey(value);}else if(this._isCertificate(value)){this.listener.onDeleteCertificate(value);}},_showContextMenu:function(e){this._super(e,[this.viewButton,this.revokeButton,this.deleteButton,"-",this.crlButton,"-",{button:this.importButton,submenu:this.importMenu},{button:this.exportButton,submenu:this.exportMenu}]);},_adjustButtonState:function(){this.selection=this.data.datagrid("getSelected");var enabled=this.selection!=null;this.exportButton.linkbutton(enabled?"enable":"disable");this.deleteButton.linkbutton(enabled?"enable":"disable");this.viewButton.linkbutton(enabled?"enable":"disable");this.revokeButton.linkbutton(enabled&&this._isCertificate(this.selection)?"enable":"disable");},_isPublicKey:function(value){return $.inArray(value,this.getPublicKeys())!=-1;},_isCertificate:function(value){return $.inArray(value,this.getCertificates())!=-1;}});jscape.keystore.HostKeysView.LISTENER={onLoadData:$.noop,onImportFile:$.noop,onImportTsl:$.noop,onImportJson:$.noop,onExportPublicKey:$.noop,onExportCertificate:$.noop,onExportCertificatePublicKey:$.noop,onViewPublicKey:$.noop,onViewCertificate:$.noop,onVerifyRevocation:$.noop,onRevokeCertificate:$.noop,onDeletePublicKey:$.noop,onDeleteCertificate:$.noop};jscape.keystore.ImportHostKeyController=Class.extend({deferred:null,start:function(){this.deferred=$.Deferred();this._setupDialog().show(this);return this.deferred.promise();},onSubmit:function(dialog){return jscape.API.importHostKey(dialog.getAlias(),dialog.getFile()).done($.proxy(function(key){this.deferred.resolve(key);this.deferred=null;},this));},onCancel:function(dialog){dialog.destroy();this.deferred.reject();this.deferred=null;},_setupDialog:function(){return new jscape.keystore.ImportHostKeyDialog();}});jscape.keystore.ImportHostKeyDialog=jscape.keystore.ImportPublicKeyDialog.extend({initialize:function(){this._super();this.alias.textbox({required:true,validType:["hostkey_nonempty","hostkey_notexists"],missingMessage:window.R.string.KEY_MANAGER_HOST_KEYS_ERROR_BAD_ALIAS,width:"60%"});this.file=$("input[name=file]",this.fieldset).filebox({required:true,missingMessage:window.R.string.KEY_MANAGER_HOST_KEYS_ERROR_BAD_FILE,width:"60%"});},getFile:function(){var files=this.file.filebox("files");return files&&files.length?files[0]:null;}});jscape.keystore.ImportHostKeysBatchController=Class.extend({deferred:null,start:function(){this.deferred=$.Deferred();this._setupDialog().show(this);return this.deferred.promise();},onSubmit:function(dialog){return jscape.API.importHostKeysBatch(dialog.getFile(),dialog.isOverwrite()).done($.proxy(function(){this.deferred.resolve();this.deferred=null;},this));},onCancel:function(dialog){dialog.destroy();this.deferred.reject();this.deferred=null;},_setupDialog:function(){return new jscape.keystore.ImportPublicKeysBatchDialog();}});jscape.keystore.ImportHostKeyTslController=Class.extend({deferred:null,start:function(){this.deferred=$.Deferred();this._setupDialog().show(this);return this.deferred.promise();},onSubmit:function(dialog){return jscape.API.importHostKeyTsl(dialog.getUrl()).done($.proxy(function(){this.deferred.resolve();this.deferred=null;},this));},onCancel:function(dialog){dialog.destroy();this.deferred.reject();this.deferred=null;},_setupDialog:function(){return new jscape.keystore.ImportPublicKeyTslDialog();}});jscape.keystore.ExportHostPublicKeyController=Class.extend({deferred:null,start:function(alias,isCertificate){this.alias=alias;this.isCertificate=!!isCertificate;this.deferred=$.Deferred();this._setupDialog().show(this);return this.deferred.promise();},onSubmit:function(dialog){var format=dialog.getFormat();var filename=dialog.getFilename();return(this.isCertificate?jscape.API.exportHostCertificatePublicKey(this.alias,format,filename):jscape.API.exportHostPublicKey(this.alias,format,filename)).done($.proxy(function(){this.deferred.resolve();this.deferred=null;},this));},onCancel:function(dialog){dialog.destroy();this.deferred.reject();this.deferred=null;},_setupDialog:function(){var dialog=new jscape.keystore.ExportPublicKeyDialog();dialog.setFilename(this.alias+".pub");return dialog;}});jscape.keystore.ExportHostCertificateController=Class.extend({deferred:null,start:function(alias){this.alias=alias;this.deferred=$.Deferred();this._setupDialog().show(this);this.deferred.promise();},onSubmit:function(dialog){return jscape.API.exportHostCertificate(this.alias,dialog.getFormat(),dialog.getFilename()).done($.proxy(function(){this.deferred.resolve();this.deferred=null;},this));},onCancel:function(dialog){dialog.destroy();this.deferred.reject();this.deferred=null;},_setupDialog:function(){var dialog=new jscape.keystore.ExportCertificateDialog();dialog.setFilename(this.alias+".crt");return dialog;}});jscape.keystore.VerifyHostCertificateRevocationСontroller=Class.extend({deferred:null,start:function(){this.deferred=$.Deferred();this._setupDialog().show(this);return this.deferred.promise();},onSubmit:function(dialog){return jscape.API.verifyCertificateRevocation(dialog.getFile(),"host").done($.proxy(function(){this.deferred.resolve();this.deferred=null;},this));},onCancel:function(dialog){dialog.destroy();this.deferred.reject();this.deferred=null;},_setupDialog:function(){return new jscape.keystore.VerifyHostCertificateRevocationDialog();}});jscape.keystore.VerifyHostCertificateRevocationDialog=jscape.ui.DefaultDialog.extend({initialize:function(){this._super($("#d-hostkey-verifycrl"),{width:530});this.fieldset=$("fieldset[name=verifyhostkeycrlfields]",this.dialog);this.file=$("input[type=file][name=file]",this.fieldset).validatebox({required:true,validType:"non_empty",missingMessage:window.R.string.KEY_MANAGER_ERROR_BAD_FILE}).change(function(){$(this).validatebox("validate");});},getFile:function(){var files=this.file[0].files;return files&&files.length?files[0]:null;},show:function(listener){this._super(listener);this.file.focus();}});jscape.keystore.RevokeHostCertificateController=Class.extend({start:function(certificate){if(certificate.revoked){return jscape.API.setHostCertificateRevocationStatus(certificate.name,false);}else{return this._confirmRevoke(certificate.name).done(function(){return jscape.API.setHostCertificateRevocationStatus(certificate.name,true);})}},_confirmRevoke:function(alias){return jscape.ConfirmDialog.confirm(window.R.string.KEY_MANAGER_REVOKE_CERTIFICATE_TITLE,window.R.string.KEY_MANAGER_REVOKE_CERTIFICATE_MESSAGE.supplant({0:alias}));}});jscape.keystore.DeleteHostKeyController=Class.extend({deferred:null,start:function(alias,isCertificate){this.deferred=$.Deferred();this._confirmDelete(alias,isCertificate).done($.proxy(this._deleteConfirmed,this,alias,isCertificate)).fail($.proxy(function(){this.deferred.reject();this.deferred=null;},this));return this.deferred.promise();},_confirmDelete:function(alias,isCertificate){if(!!isCertificate){return jscape.ConfirmDialog.confirm(window.R.string.KEY_MANAGER_HOST_KEYS_DELETE_CERTIFICATE_TITLE,window.R.string.KEY_MANAGER_HOST_KEYS_DELETE_CERTIFICATE_MESSAGE.supplant({0:alias}));}else{return jscape.ConfirmDialog.confirm(window.R.string.KEY_MANAGER_HOST_KEYS_DELETE_PUBLIC_KEY_TITLE,window.R.string.KEY_MANAGER_HOST_KEYS_DELETE_PUBLIC_KEY_MESSAGE.supplant({0:alias}));}},_deleteConfirmed:function(alias,isCertificate){var promise=!!isCertificate?jscape.API.deleteHostCertificate(alias):jscape.API.deleteHostPublicKey(alias);promise.done($.proxy(function(){this.deferred.resolve();this.deferred=null;},this)).fail($.proxy(function(){this.deferred.reject();this.deferred=null;},this));}});jscape.keystore.ViewHostKeyController=jscape.keystore.ViewKeySummaryController.extend({onLoadData:function(){return jscape.API.getHostKeyView(this.alias);}});jscape.keystore.ViewHostCertificateController=jscape.keystore.ViewKeySummaryController.extend({onLoadData:function(){return jscape.API.getHostCertificateView(this.alias);}});