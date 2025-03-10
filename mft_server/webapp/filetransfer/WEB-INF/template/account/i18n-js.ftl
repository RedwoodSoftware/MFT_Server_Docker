<@compress single_line=true>
{
APPLICATION_TITLE: '${i18n.text("Application.TITLE")?js_string?html}',
APPLICATION_SUCCESS_APPLY: '${i18n.text("Application.Success.apply")?js_string?html}',
APPLICATION_CONFIRM_ACTIVE: '${i18n.text("Application.Message.confirmSessionActivity")?js_string?html}',
APPLICATION_MESSAGE_COPIED: '${i18n.text("Application.Message.copied")?js_string}',
DIALOG_BUTTON_OK: '${i18n.text("Application.button.ok")?js_string?html}',
DIALOG_BUTTON_CANCEL: '${i18n.text("Application.button.cancel")?js_string?html}',
DIALOG_BUTTON_CLOSE: '${i18n.text("Application.button.close")?js_string?html}',

<#--Public Key Authentication-->
PUBLIC_KEY_CONFIRM_DELETE_TITLE: '${i18n.text("PublicKeyAuth.DeleteDialog.title")?js_string?html}',
PUBLIC_KEY_CONFIRM_DELETE_MESSAGE: '${i18n.text("PublicKeyAuth.DeleteDialog.message")?js_string?html}',
PUBLIC_KEY_BAD_CONFIRM_PWD: '${i18n.text("PublicKeyAuth.Error.confirmPassword")?js_string?html}',
PUBLIC_KEY_SUCCESS_CREATED: '${i18n.text("PublicKeyAuth.Success.keyPairCreated")?js_string}',
PUBLIC_KEY_SUCCESS_IMPORTED: '${i18n.text("PublicKeyAuth.Success.publicKeyImported")?js_string}',
PUBLIC_KEY_SUCCESS_DELETED: '${i18n.text("PublicKeyAuth.Success.publicKeyDeleted")?js_string}',

<#--PGP Encryption-->
PGP_ENCRYPTION_CONFIRM_DELETE_TITLE: '${i18n.text("PgpEncryption.DeleteDialog.title")?js_string?html}',
PGP_ENCRYPTION_CONFIRM_DELETE_MESSAGE: '${i18n.text("PgpEncryption.DeleteDialog.message")?js_string?html}',
PGP_ENCRYPTION_BAD_REAL_NAME: '${i18n.text("PgpEncryption.Error.invalidRealName")?js_string?html}',
PGP_ENCRYPTION_BAD_EMAIL: '${i18n.text("PgpEncryption.Error.invalidEmail")?js_string?html}',
PGP_ENCRYPTION_BAD_CONFIRM_PWD: '${i18n.text("PgpEncryption.Error.confirmPassword")?js_string?html}',
PGP_ENCRYPTION_BAD_KEY_FILE: '${i18n.text("PgpEncryption.Error.invalidPgpKeyFile")?js_string?html}',
PGP_ENCRYPTION_SUCCESS_CREATED: '${i18n.text("PgpEncryption.Success.pgpKeyCreated")?js_string}',
PGP_ENCRYPTION_SUCCESS_IMPORTED: '${i18n.text("PgpEncryption.Success.pgpKeyImported")?js_string}',
PGP_ENCRYPTION_SUCCESS_DELETED: '${i18n.text("PgpEncryption.Success.pgpKeyDeleted")?js_string}',

<#--Quotas-->
QUOTAS_TEMPLATE_USAGE: '${i18n.text("Quotas.pattern.usage")?js_string?html}',

<#--Contacts-->
CONTACTS_CONFIRM_DELETE_TITLE: '${i18n.text("Contacts.DeleteDialog.title")?js_string?html}',
CONTACTS_CONFIRM_DELETE_MESSAGE: '${i18n.text("Contacts.DeleteDialog.message")?js_string?html}',
CONTACTS_ERROR_BAD_NAME: '${i18n.text("Contacts.Error.invalidContactName")?js_string?html}',
CONTACTS_ERROR_BAD_EMAIL: '${i18n.text("Contacts.Error.invalidEmail")?js_string?html}',

<#--Ad-Hoc Activity-->
ADHOC_TRANSFER_REVOKE_TITLE: '${i18n.text("AdHocTransfers.RevokeDialog.title")?js_string?html}',
ADHOC_TRANSFER_REVOKE_MESSAGE: '${i18n.text("AdHocTransfers.RevokeDialog.message")?js_string?html}',
ADHOC_TRANSFER_TYPE_EMAIL: '${i18n.text("AdHocTransfers.type.EMAIL")?js_string?html}',
ADHOC_TRANSFER_TYPE_LINK: '${i18n.text("AdHocTransfers.type.LINK")?js_string?html}',
ADHOC_TRANSFER_TYPE_INTERNAL: '${i18n.text("AdHocTransfers.type.INTERNAL")?js_string?html}',
ADHOC_TRANSFER_STATUS_ACTIVE: '${i18n.text("AdHocTransfers.status.Active")?js_string?html}',
ADHOC_TRANSFER_STATUS_EXPIRED: '${i18n.text("AdHocTransfers.status.Expired")?js_string?html}',
ADHOC_TRANSFER_STATUS_NONE_XPIRING: '${i18n.text("AdHocTransfers.status.NonExpiring")?js_string?html}',
ADHOC_TRANSFER_STATUS_REVOKED: '${i18n.text("AdHocTransfers.status.Revoked")?js_string?html}',
ADHOC_TRANSFER_MESSAGE_LINK_COPIED: '${i18n.text("AdHocTransfers.Message.linkCopied")?js_string?html}',

<#--Users-->
USER_CONFIRM_DELETE_TITLE: '${i18n.text("Users.DeleteDialog.title")?js_string?html}',
USER_CONFIRM_DELETE_MESSAGE: '${i18n.text("Users.DeleteDialog.message")?js_string?html}',
USER_CHANGE_PASSWORD_TITLE: '${i18n.text("Users.PasswordDialog.title")?js_string?html}',
USER_CHANGE_PASSWORD_MESSAGE: '${i18n.text("Users.Success.passwordChanged")?js_string}',
USER_SUCCESS_UPDATED: '${i18n.text("Users.Success.updated")?js_string}',
USER_SUCCESS_TOTP_KEY_RESET: '${i18n.text("Users.Success.toptKeyReset")?js_string}',
USER_ERROR_PASSWORD_CHANGE_DENIED: '${i18n.text("Users.Error.passwordChangeNotAllowed")?js_string?html}',
USER_ERROR_BAD_NAME: '${i18n.text("Users.Error.invalidLogin")?js_string?html}',
USER_ERROR_ALREADY_EXIST: '${i18n.text("Users.Error.alreadyExists")?js_string?html}',
USER_ERROR_CONFIRM_PWD: '${i18n.text("Users.Error.confirmPassword")?js_string?html}',
USER_ERROR_BAD_EMAIL: '${i18n.text("Users.Error.invalidEmailAddress")?js_string?html}',
USER_ERROR_BAD_EXPIRES: '${i18n.text("Users.Error.invalidExpirationDate")?js_string?html}',
USER_ERROR_BAD_PHONE: '${i18n.text("Users.Error.invalidPhone")?js_string?html}',
USER_ERROR_BAD_PATH: '${i18n.text("VirtualPath.Error.badPath")?js_string?html}',
USER_ERROR_BAD_RESOURCE: '${i18n.text("Users.Error.invalidResource")?js_string?html}',
USER_ERROR_BAD_QUOTA_VALUE: '${i18n.text("Users.Error.invalidQuotaValue")?js_string?html}',
USER_ERROR_BAD_QUOTA_RESET_PERIOD: '${i18n.text("Users.Error.invalidQuotaResetPeriod")?js_string?html}',
USER_ERROR_BAD_QUOTA_PER_SESSION: '${i18n.text("Users.Error.invalidQuotaPerSession")?js_string?html}',
<#--Users->Paths-->
VFS_DIALOG_ADD_PATH_TITLE: '${i18n.text("VirtualPath.PathDialog.title.add")?js_string?html}',
VFS_DIALOG_EDIT_PATH_TITLE: '${i18n.text("VirtualPath.PathDialog.title.edit")?js_string?html}',
VFS_DLP_DIALOG_ADD_RULE_TITLE: '${i18n.text("VirtualPath.DlpEntryDialog.title.add")?js_string?html}',
VFS_DLP_DIALOG_EDIT_RULE_TITLE: '${i18n.text("VirtualPath.DlpEntryDialog.title.edit")?js_string?html}',
VFS_DLP_RULES_ACCESS_ALLOW_ALL: '${i18n.text("VirtualPath.DlpSettingsDialog.access.ALLOW_ALL")?js_string?html}',
VFS_DLP_RULES_ACCESS_DENY_ALL: '${i18n.text("VirtualPath.DlpSettingsDialog.access.DENY_ALL")?js_string?html}',
VFS_DLP_RULES_ACCESS_DENY_AD_HOC: '${i18n.text("VirtualPath.DlpSettingsDialog.access.DENY_AD_HOC")?js_string?html}',
VFS_DLP_CONFIRM_DELETE_TITLE: '${i18n.text("VirtualPath.DlpEntryDeleteDialog.title")?js_string?html}',
VFS_DLP_CONFIRM_DELETE_MESSAGE: '${i18n.text("VirtualPath.DlpEntryDeleteDialog.message")?js_string?html}',
VFS_CONFIRM_DELETE_TITLE: '${i18n.text("VirtualPath.DeleteDialog.title")?js_string?html}',
VFS_CONFIRM_DELETE_MESSAGE: '${i18n.text("VirtualPath.DeleteDialog.message")?js_string?html}',
VFS_ERROR_BAD_REAL_PATH: '${i18n.text("VirtualPath.Error.badRealPath")?js_string?html}',
VFS_ERROR_BAD_NETWORK_STORAGE: '${i18n.text("VirtualPath.Error.badNetworkStorage")?js_string?html}',
VFS_ERROR_ROOT_PATH_NOT_FOUND: '${i18n.text("VirtualPath.Error.rootPathNotFound")?js_string?html}',
<#--Users->IP Access-->
USERS_IP_ACCESS_DIALOG_ADD_TITLE: '${i18n.text("Users.IpAccess.RuleDialog.title.add")?js_string?html}',
USERS_IP_ACCESS_DIALOG_EDIT_TITLE: '${i18n.text("Users.IpAccess.RuleDialog.title.edit")?js_string?html}',
USERS_IP_ACCESS_CONFIRM_DELETE_TITLE: '${i18n.text("Users.IpAccess.DeleteDialog.title")?js_string?html}',
USERS_IP_ACCESS_CONFIRM_DELETE_MESSAGE: '${i18n.text("Users.IpAccess.DeleteDialog.message")?js_string?html}',
USERS_IP_ACCESS_ERROR_BAD_MASK: '${i18n.text("Users.Error.badMask")?js_string?html}',
USERS_IP_ACCESS_ERROR_ALREADY_EXIST: '${i18n.text("Users.Error.ruleExists")?js_string?html}',
USERS_IP_ACCESS_RULE_ALLOWED: '${i18n.text("Users.IpAccess.rule.allowed")?js_string?html}',
USERS_IP_ACCESS_RULE_DENIED: '${i18n.text("Users.IpAccess.rule.denied")?js_string?html}',

<#--URL Branding-->
WEB_THEME_CONFIRM_DELETE_TITLE: '${i18n.text("UrlBranding.DeleteDialog.title")?js_string?html}',
WEB_THEME_CONFIRM_DELETE_MESSAGE: '${i18n.text("UrlBranding.DeleteDialog.message")?js_string?html}',
WEB_THEME_ERROR_BAD_NAME: '${i18n.text("UrlBranding.Error.invalidName")?js_string?html}',
WEB_THEME_ERROR_ALREADY_EXIST: '${i18n.text("UrlBranding.Error.alreadyExist")?js_string?html}',
WEB_THEME_ERROR_BAD_LOGO: '${i18n.text("UrlBranding.Error.invalidLogo")?js_string?html}',
WEB_THEME_ERROR_LOAD_LOGO: '${i18n.text("UrlBranding.Error.invalidLogo")?js_string?html}',

<#--Drop Zones-->
DROP_ZONE_CONFIRM_DELETE_TITLE: '${i18n.text("DropZones.DeleteDialog.title")?js_string?html}',
DROP_ZONE_CONFIRM_DELETE_MESSAGE: '${i18n.text("DropZones.DeleteDialog.message")?js_string?html}',
DROP_ZONE_ERROR_BAD_NAME: '${i18n.text("DropZones.Error.invalidName")?js_string?html}',
DROP_ZONE_ERROR_ALREADY_EXIST: '${i18n.text("DropZones.Error.alreadyExist")?js_string?html}',
DROP_ZONE_ERROR_CONFIRM_PWD: '${i18n.text("DropZones.Error.confirmPassword")?js_string?html}',
DROP_ZONE_ERROR_BAD_PATH: '${i18n.text("DropZones.Error.invalidPath")?js_string?html}'
}
</@compress>