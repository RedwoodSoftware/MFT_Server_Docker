/* Copyright © 2009-2024. Redwood Software Inc. All rights reserved. */
jscape.account=jscape.account||{};jscape.account.OpenPgpKeyEncryptionModule=jscape.ApplicationModule.extend({onCreate:function(){this.controller=new jscape.account.OpenPgpKeyEncryptionController();},onStart:function(){this.controller.start();},onResume:function(){this.controller.onResume();}});jscape.account.OpenPgpKeyEncryptionController=Class.extend({initialize:function(){this.view=new jscape.account.OpenPgpKeyEncryptionView();this.generateController=new jscape.account.GeneratePgpKeyController();this.importController=new jscape.account.ImportPgpKeyController();this.deleteController=new jscape.account.DeletePgpKeyController();},start:function(){this.view.show(this);},onResume:function(){},onGenerateKey:function(){this.generateController.start().done($.proxy(this._fireApplySuccess,this,window.R.string.PGP_ENCRYPTION_SUCCESS_CREATED));},onImportKey:function(){this.importController.start().done($.proxy(this._fireApplySuccess,this,window.R.string.PGP_ENCRYPTION_SUCCESS_IMPORTED));},onDeleteKey:function(){this.deleteController.start().done($.proxy(this._fireApplySuccess,this,window.R.string.PGP_ENCRYPTION_SUCCESS_DELETED));},_initValidators:function(){var v=new jscape.Validator();v.rule("file_password_confirm",$.proxy(this._passwordConfirmed,this),window.R.string.PGP_ENCRYPTION_BAD_REAL_NAME);},_passwordConfirmed:function(value,params){return params&&params.length&&$(params[0]).val()==value;},_fireApplySuccess:function(message){$(document).triggerHandler("broadcast",[message]);}});jscape.account.OpenPgpKeyEncryptionView=Class.extend({initialize:function(){this.layout=$("#account-pgp-encryption-fields").layout({fit:true,doSize:false,border:false});this.generateButton=$("a[role=button][name=generate]",this.layout).linkbutton({onClick:$.proxy(this._onClick$GenerateButton,this)});this.importButton=$("a[role=button][name=import]",this.layout).linkbutton({onClick:$.proxy(this._onClick$ImportButton,this)});this.deleteButton=$("a[role=button][name=delete]",this.layout).linkbutton({onClick:$.proxy(this._onClick$DeleteButton,this)});},show:function(listener){this.listener=listener||jscape.account.OpenPgpKeyEncryptionView.LISTENER;this.layout.layout("resize");this._adjustState();},_onClick$GenerateButton:function(){this.listener.onGenerateKey();},_onClick$ImportButton:function(){this.listener.onImportKey();},_onClick$DeleteButton:function(){this.listener.onDeleteKey();},_adjustState:function(){}});jscape.account.OpenPgpKeyEncryptionView.LISTENER={onGenerateKey:$.noop,onImportKey:$.noop,onDeleteKey:$.noop};jscape.account.GeneratePgpKeyController=Class.extend({UNSUPPORTED_CURVES:["448"],deferred:null,start:function(){this.deferred=$.Deferred();this._setupDialog().show(this);return this.deferred.promise();},onSubmit:function(dialog){jscape.API.generatePgpKey(dialog.getKeyType(),dialog.getKeyLength(),dialog.getKeyCurve(),dialog.getPeriod(),dialog.getRealName(),dialog.getEmail(),dialog.getFilePassword()).done($.proxy(function(){this.deferred.resolve();this.deferred=null;},this)).fail($.proxy(function(){this.deferred.reject();this.deferred=null;},this)).always(function(){dialog.destroy();});},onCancel:function(dialog){dialog.destroy();this.deferred.reject();this.deferred=null;},onLoadKeyCurves:function(params){var values=jscape.KeyPairAlgorithm.curvesOf(params.keyType);if(jscape.KeyPairAlgorithm.ED.name==params.keyType){values=$.grep(values,$.proxy(function(val){return $.inArray(val,this.UNSUPPORTED_CURVES)==-1;},this));}
return $.Deferred().resolve(values).promise();},onLoadKeyLengths:function(params){var values=jscape.KeyPairAlgorithm.lengthsOf(params.keyType);return $.Deferred().resolve(values).promise();},_setupDialog:function(){var dialog=new jscape.account.GeneratePgpKeyDialog();dialog.setKeyType("RSA");dialog.setKeyLength(2048);dialog.setPeriod(365);return dialog;}});jscape.account.GeneratePgpKeyDialog=jscape.ui.DefaultDialog.extend({initialize:function(){this._super($("#d-pgpencrypt-generate"),{width:"50%",resizable:false});var initializing=true;this.fieldset=$("fieldset[name=pgpencryptfields]",this.dialog);this.realName=$("input[name=realname]",this.fieldset).textbox({required:true,validType:"non_empty",missingMessage:window.R.string.PGP_ENCRYPTION_BAD_REAL_NAME,invalidMessage:window.R.string.PGP_ENCRYPTION_BAD_REAL_NAME,width:"50%"});this.realName.textbox("textbox").on("input",$.proxy(function(){this.email.textbox("validate");},this));this.email=$("input[name=email]",this.fieldset).textbox({validType:"email",invalidMessage:window.R.string.PGP_ENCRYPTION_BAD_EMAIL,width:"50%"});this.email.textbox("textbox").on("input",$.proxy(function(){this.realName.textbox("validate");},this));this.keyType=$("select[name=keytype]",this.fieldset).combobox({required:true,editable:false,onChange:$.proxy(this._onChange$KeyType,this),width:"25%",panelHeight:"auto",panelMaxHeight:"40%"});this.keyLength=$("select[name=keylength]",this.fieldset).combobox({required:true,editable:false,disabled:true,onBeforeLoad:function(){return!initializing;},loader:$.proxy(this._onLoad$KeyLengths,this),loadFilter:function(data){return $.map(data,function(entry){return $.isPlainObject(entry)?$.extend(entry,{value:parseInt(entry.value)}):{text:String(entry),value:parseInt(entry)};});},width:"25%",panelHeight:"auto",panelMaxHeight:"40%"});this.keyCurve=$("select[name=keycurve]",this.fieldset).combobox({required:true,editable:true,disabled:true,limitToList:true,onBeforeLoad:function(){return!initializing;},loader:$.proxy(this._onLoad$KeyCurves,this),width:"25%",panelHeight:"auto",panelMaxHeight:"40%"});this.period=$("input[name=period]",this.fieldset).numberspinner({min:1,max:10000,value:365,increment:10,width:"25%"});var id=$.now().toString(36);this.password=$("input[name=password]",this.fieldset).attr("id",id).passwordbox({lastDelay:0,validateOnBlur:true,width:"50%"});this.password.passwordbox("textbox").on("input",$.proxy(function(){var val=this.password.passwordbox("textbox").val();this.confirmPassword.passwordbox("textbox").validatebox("options").required=val.length!=0;},this));this.confirmPassword=$("input[name=confirmpwd]",this.fieldset).passwordbox({lastDelay:0,validateOnBlur:true,validType:"file_password_confirm['#"+this.password.attr("id")+"']",missingMessage:window.R.string.PGP_ENCRYPTION_BAD_CONFIRM_PWD,width:"50%"});initializing=false;},getRealName:function(){return this.realName.textbox("getValue");},getEmail:function(){return this.email.textbox("getValue");},getKeyType:function(){return this.keyType.combobox("getValue");},setKeyType:function(value){this.keyType.combobox("select",value);},getKeyLength:function(){var value=this.keyLength.combobox("getValue");return parseInt(value)||value;},setKeyLength:function(value){this.keyLength.combobox("select",value);},getKeyCurve:function(){return this.keyCurve.combobox("getValue");},getPeriod:function(){return parseInt(this.period.numberspinner("getValue"))||null;},setPeriod:function(value){value=parseInt(value);if(!isNaN(value)){this.period.numberspinner("setValue",value);}},getFilePassword:function(){return this.password.passwordbox("getValue");},show:function(listener){this._super(listener);this.realName.textbox("textbox").focus();this._onChange$KeyType();},_onLoad$KeyLengths:function(params,success,error){var keyLength=this.getKeyLength();this.listener.onLoadKeyLengths(params).then($.proxy(function(data){if(data&&data.length){this.keyLength.combobox("enable").combobox("reset").closest("div").show();this.keyCurve.combobox("disable").closest("div").hide();}else{this.keyLength.combobox("disable").closest("div").hide();}
this.dialog.dialog("resize",{height:"auto"});return data;},this)).then(success,error).then($.proxy(function(){this.keyLength.combobox("select",keyLength);},this));},_onLoad$KeyCurves:function(params,success,error){this.listener.onLoadKeyCurves(params).then($.proxy(function(data){if(data&&data.length){this.keyCurve.combobox("enable").combobox("reset").closest("div").show();this.keyLength.combobox("disable").closest("div").hide();}else{this.keyCurve.combobox("disable").closest("div").hide();}
this.dialog.dialog("resize",{height:"auto"});return data;},this)).then(success,error);},_onChange$KeyType:function(){var keyType=this.getKeyType();this.keyCurve.combobox("reload",{keyType:keyType});this.keyLength.combobox("reload",{keyType:keyType});}});jscape.account.ImportPgpKeyController=Class.extend({deferred:null,start:function(){this.deferred=$.Deferred();this._setupDialog().show(this);return this.deferred.promise();},onSubmit:function(dialog){jscape.API.importPgpKey(dialog.getFile()).done($.proxy(function(){this.deferred.resolve();},this)).fail($.proxy(function(){this.deferred.reject();},this)).always($.proxy(function(){dialog.destroy();this.deferred=null;},this));},onCancel:function(dialog){dialog.destroy();this.deferred.reject();this.deferred=null;},_setupDialog:function(){return new jscape.account.ImportPgpKeyDialog();}});jscape.account.ImportPgpKeyDialog=jscape.ui.DefaultDialog.extend({initialize:function(){this._super($("#d-pgpencrypt-import"),{width:"50%",minWidth:500,maxWidth:750});this.fieldset=$("fieldset[name=pgpencryptfields]",this.dialog);this.file=$("input[name=file]",this.fieldset).filebox({required:true,missingMessage:window.R.string.PGP_ENCRYPTION_BAD_KEY_FILE,width:"60%"});},getFile:function(){var files=this.file.filebox("files");return files&&files.length?files[0]:null;},show:function(listener){this._super(listener);this.file.filebox("textbox").focus();}});jscape.account.DeletePgpKeyController=Class.extend({deferred:null,start:function(){return this._confirmDelete().then($.proxy(this._deleteConfirmed,this));},_confirmDelete:function(){return jscape.ConfirmDialog.confirm(window.R.string.PGP_ENCRYPTION_CONFIRM_DELETE_TITLE,window.R.string.PGP_ENCRYPTION_CONFIRM_DELETE_MESSAGE);},_deleteConfirmed:function(){return jscape.API.deletePgpKey();}});