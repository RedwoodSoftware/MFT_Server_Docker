<#-- @ftlvariable name="model" type="com.jscape.inet.mft.subsystems.web.ui.view.storage.DocumentViewerResource" -->
<@compress single_line=true>
{
APPLICATION_TITLE: '${i18n.text("Application.TITLE")?js_string?html}',
APPLICATION_SUCCESS_APPLY: '${i18n.text("Application.Success.apply")?js_string}',
APPLICATION_ERROR_CONNECTION_REFUSED: '${i18n.text("Application.Error.CONNECTION_REFUSED")?js_string}',
APPLICATION_CONFIRM_ACTIVE: '${i18n.text("Application.Message.confirmSessionActivity")?js_string?html}',
DIALOG_BUTTON_OK: '${i18n.text("Application.button.ok")?js_string?html}',
DIALOG_BUTTON_CANCEL: '${i18n.text("Application.button.cancel")?js_string?html}',
DIALOG_BUTTON_CLOSE: '${i18n.text("Application.button.close")?js_string?html}',

<#--File Storage-->
STORAGE_BUTTON_CANCEL_UPLOAD: '${i18n.text("Storage.button.cancelUpload")?js_string?html}',
STORAGE_TYPE_DIRECTORY: '${i18n.text("Storage.type.directory")?js_string?html}',
STORAGE_PARENT_DIR_TEMPLATE: '${i18n.text("Storage.template.parentDirectory")?js_string?html}',
STORAGE_LISTING_RESULTS: '${i18n.text("Storage.template.listingResults")?js_string?html}',
STORAGE_CONFIRM_OVERWRITE_MESSAGE: '${i18n.text("Storage.Message.confirmOverwrite")?js_string?html}',
STORAGE_CONFIRM_DELETE_TITLE: '${i18n.text("Storage.DeleteDialog.title")?js_string?html}',
STORAGE_CONFIRM_DELETE_MESSAGE: '${i18n.text("Storage.DeleteDialog.message")?js_string?html}',
STORAGE_MESSAGE_DROPZONE: '${i18n.text("Storage.Message.dropzone")?js_string?html}',
STORAGE_MESSAGE_MOVE_PLURAL: '${i18n.text("Storage.Message.move.plural")?js_string?html}',
STORAGE_MESSAGE_MOVE_SINGULAR: '${i18n.text("Storage.Message.move.singular")?js_string?html}',
STORAGE_SUCCESS_UPLOAD: '${i18n.text("Storage.Success.upload.filesUploaded")?js_string}',
STORAGE_SUCCESS_DELETE_DIR: '${i18n.text("Storage.Success.delete.directoryDeleted")?js_string}',
STORAGE_SUCCESS_DELETE_FILE: '${i18n.text("Storage.Success.delete.fileDeleted")?js_string}',
STORAGE_SUCCESS_DELETE_BATCH: '${i18n.text("Storage.Success.delete.batchDeleted")?js_string}',
STORAGE_SUCCESS_RENAME_FILE: '${i18n.text("Storage.Success.rename.fileRenamed")?js_string}',
STORAGE_SUCCESS_RENAME_DIR: '${i18n.text("Storage.Success.rename.dirRenamed")?js_string}',
STORAGE_SUCCESS_MOVE: '${i18n.text("Storage.Success.move.fileMoved")?js_string}',
STORAGE_SUCCESS_MOVE_BATCH: '${i18n.text("Storage.Success.move.batchMoved")?js_string}',
STORAGE_SUCCESS_MAKE_DIR: '${i18n.text("Storage.Success.mkdir.dirCreated")?js_string}',
STORAGE_SUCCESS_EMAIL_FILE: '${i18n.text("Storage.Success.adhoc.emailSent")?js_string}',
STORAGE_SUCCESS_TAG_FILE: '${i18n.text("Storage.Success.tag.applied")?js_string}',
STORAGE_TAG_CLOUD_ENTRY_TITLE: '${i18n.text("Storage.TagCloud.tooltip.documentCount")?js_string?html}',
STORAGE_ERROR_UPLOAD_FOLDER: '${i18n.text("Storage.Error.upload.folder")?js_string?html}',
STORAGE_ERROR_UPLOAD: '${i18n.text("Storage.Error.upload.transfer")?js_string?html}',
STORAGE_ERROR_BAD_CONTACT_NAME: '${i18n.text("Contacts.Error.invalidContactName")?js_string?html}',
STORAGE_ERROR_BAD_CONTACT_EMAIL: '${i18n.text("Contacts.Error.invalidEmail")?js_string?html}',
STORAGE_ERROR_BAD_RECIPIENT: '${i18n.text("Storage.Error.adhoctransfer.invalidRecipient")?js_string?html}',
STORAGE_ERROR_BAD_SENDER: '${i18n.text("Storage.Error.adhoctransfer.invalidSender")?js_string?html}',
STORAGE_ERROR_BAD_SUBJECT: '${i18n.text("Storage.Error.adhoctransfer.invalidSubject")?js_string?html}',
STORAGE_ERROR_LOAD_VIEWER: '${i18n.text("Storage.Error.documentViewer.error")?js_string?html}',
STORAGE_SHARE_FILE_EMAIL_TITLE: '${i18n.text("Storage.ShareFileDialog.title.email")?js_string?html}',
STORAGE_SHARE_FILE_INTERNAL_TITLE: '${i18n.text("Storage.ShareFileDialog.title.internal")?js_string?html}',
STORAGE_SHARE_FILE_LINK_TITLE: '${i18n.text("Storage.ShareFileDialog.title.copyLink")?js_string?html}'

<#if model.passwordAboutToExpire>,
USER_CHANGE_PASSWORD_MESSAGE: '${i18n.text("Users.Success.passwordChanged")?js_string?html}',
USER_ERROR_CONFIRM_PWD: '${i18n.text("Users.Error.confirmPassword")?js_string?html}'
</#if>
}
</@compress>