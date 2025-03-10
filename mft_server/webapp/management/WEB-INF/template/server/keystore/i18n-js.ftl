<@compress single_line=true>
{
APPLICATION_TITLE: '${i18n.text("Application.title.text")?js_string}',
APPLICATION_HOST_ALL_IPV4: '${i18n.text("Application.host.anyIPv4")?js_string}',
APPLICATION_HOST_ALL_IPV6: '${i18n.text("Application.host.anyIPv6")?js_string}',
APPLICATION_SUCCESS_APPLY: '${i18n.text("Application.Success.apply")?js_string}',
DOMAIN_SUCCESS_ADD_MESSAGE: '${i18n.text("AddDomainDialog.Success.domainAdded")?js_string}',

<#-- Keystore -->
KEY_MANAGER_REVOKE_CERTIFICATE_TITLE: '${i18n.text("RevokeCertificateDialog.title")?js_string}',
KEY_MANAGER_REVOKE_CERTIFICATE_MESSAGE: '${i18n.text("RevokeCertificateDialog.message")?js_string}',
KEY_MANAGER_ERROR_BAD_FILE: '${i18n.text("KeyManager.Error.badCrlFile")?js_string}',
KEY_MANAGER_ERROR_BAD_JSON_FILE: '${i18n.text("KeyManager.Error.badJsonFile")?js_string}',
KEY_MANAGER_ERROR_BAD_URL: '${i18n.text("KeyManager.Error.badUrl")?js_string}',
KEY_MANAGER_ERROR_BAD_COMMON_NAME: '${i18n.text("ServerKeys.Error.badCommonName")?js_string}',

<#--Server Keys-->
KEY_MANAGER_SERVER_KEYS_DELETE_TITLE: '${i18n.text("ServerKeys.DeleteDialog.title")?js_string}',
KEY_MANAGER_SERVER_KEYS_DELETE_MESSAGE: '${i18n.text("ServerKeys.DeleteDialog.message")?js_string}',
KEY_MANAGER_SERVER_KEYS_ERROR_BAD_ALIAS: '${i18n.text("ServerKeys.Error.badAlias")?js_string}',
KEY_MANAGER_SERVER_KEYS_ERROR_BAD_FILE: '${i18n.text("ServerKeys.Error.badFile")?js_string}',
KEY_MANAGER_SERVER_KEYS_ERROR_BAD_FILENAME: '${i18n.text("ServerKeys.Error.badFilename")?js_string}',
KEY_MANAGER_SERVER_KEYS_ERROR_ALIAS_EXISTS: '${i18n.text("ServerKeys.Error.aliasExists")?js_string}',
KEY_MANAGER_SERVER_KEYS_ERROR_KEY_USED: '${i18n.text("ServerKeys.Error.keyUsed")?js_string}',
KEY_MANAGER_SERVER_KEYS_SUCCESS_IMPORT: '${i18n.text("ServerKeys.Success.Import.message")?js_string}',
KEY_MANAGER_SERVER_KEYS_BAD_ALTERNATIVE_NAME: '${i18n.text("ServerKeys.Error.badAlternativeName")?js_string}',

<#--Host Keys-->
KEY_MANAGER_HOST_KEYS_DELETE_PUBLIC_KEY_TITLE: '${i18n.text("HostKeys.DeletePublicKeyDialog.title")?js_string}',
KEY_MANAGER_HOST_KEYS_DELETE_PUBLIC_KEY_MESSAGE: '${i18n.text("HostKeys.DeletePublicKeyDialog.message")?js_string}',
KEY_MANAGER_HOST_KEYS_DELETE_CERTIFICATE_TITLE: '${i18n.text("HostKeys.DeleteCertificateDialog.title")?js_string}',
KEY_MANAGER_HOST_KEYS_DELETE_CERTIFICATE_MESSAGE: '${i18n.text("HostKeys.DeleteCertificateDialog.message")?js_string}',
KEY_MANAGER_HOST_KEYS_ERROR_BAD_ALIAS: '${i18n.text("HostKeys.Error.badAlias")?js_string}',
KEY_MANAGER_HOST_KEYS_ERROR_BAD_FILE: '${i18n.text("HostKeys.Error.badFile")?js_string}',
KEY_MANAGER_HOST_KEYS_ERROR_ALIAS_EXISTS: '${i18n.text("HostKeys.Error.aliasExists")?js_string}',
KEY_MANAGER_HOST_KEYS_SUCCESS_IMPORT: '${i18n.text("HostKeys.Success.Import.message")?js_string}',

<#--Client Keys-->
KEY_MANAGER_CLIENT_KEYS_DELETE_PUBLIC_KEY_TITLE: '${i18n.text("ClientKeys.DeletePublicKeyDialog.title")?js_string}',
KEY_MANAGER_CLIENT_KEYS_DELETE_PUBLIC_KEY_MESSAGE: '${i18n.text("ClientKeys.DeletePublicKeyDialog.message")?js_string}',
KEY_MANAGER_CLIENT_KEYS_DELETE_CERTIFICATE_TITLE: '${i18n.text("ClientKeys.DeleteCertificateDialog.title")?js_string}',
KEY_MANAGER_CLIENT_KEYS_DELETE_CERTIFICATE_MESSAGE: '${i18n.text("ClientKeys.DeleteCertificateDialog.message")?js_string}',
KEY_MANAGER_CLIENT_KEYS_ERROR_BAD_ALIAS: '${i18n.text("ClientKeys.Error.badAlias")?js_string}',
KEY_MANAGER_CLIENT_KEYS_ERROR_BAD_FILE: '${i18n.text("ClientKeys.Error.badFile")?js_string}',
KEY_MANAGER_CLIENT_KEYS_ERROR_ALIAS_EXISTS: '${i18n.text("ClientKeys.Error.aliasExists")?js_string}',
KEY_MANAGER_CLIENT_KEYS_ERROR_BAD_ALTERNATIVE_NAME: '${i18n.text("ClientKeys.Error.badAlternativeName")?js_string}',
KEY_MANAGER_CLIENT_KEYS_SUCCESS_IMPORT: '${i18n.text("ClientKeys.Success.Import.message")?js_string}',

<#--PGP Keys-->
KEY_MANAGER_PGP_KEYS_CONFIRM_DELETE_TITLE: '${i18n.text("PgpKeys.DeleteDialog.title")?js_string}',
KEY_MANAGER_PGP_KEYS_CONFIRM_DELETE_MESSAGE: '${i18n.text("PgpKeys.DeleteDialog.message")?js_string}',
KEY_MANAGER_PGP_KEYS_ERROR_BAD_NAME: '${i18n.text("PgpKeys.Error.badName")?js_string}',
KEY_MANAGER_PGP_KEYS_ERROR_BAD_FILE: '${i18n.text("PgpKeys.Error.badFile")?js_string}',
KEY_MANAGER_PGP_KEYS_ERROR_BAD_FILE_PASSWORD: '${i18n.text("PgpKeys.Error.badFilePassword")?js_string}',
KEY_MANAGER_PGP_KEYS_SUCCESS_IMPORT: '${i18n.text("PgpKeys.Success.Import.message")?js_string}',
KEY_MANAGER_PGP_KEYS_SIGNATURE_TYPE_BINARY_DOCUMENT: '${i18n.text("PgpKeys.SignaturesDialog.type.BINARY_DOCUMENT")?js_string}',
KEY_MANAGER_PGP_KEYS_SIGNATURE_TYPE_CANONICAL_TEXT_DOCUMENT: '${i18n.text("PgpKeys.SignaturesDialog.type.CANONICAL_TEXT_DOCUMENT")?js_string}',
KEY_MANAGER_PGP_KEYS_SIGNATURE_TYPE_STAND_ALONE: '${i18n.text("PgpKeys.SignaturesDialog.type.STAND_ALONE")?js_string}',
KEY_MANAGER_PGP_KEYS_SIGNATURE_TYPE_DEFAULT_CERTIFICATION: '${i18n.text("PgpKeys.SignaturesDialog.type.DEFAULT_CERTIFICATION")?js_string}',
KEY_MANAGER_PGP_KEYS_SIGNATURE_TYPE_NO_CERTIFICATION: '${i18n.text("PgpKeys.SignaturesDialog.type.NO_CERTIFICATION")?js_string}',
KEY_MANAGER_PGP_KEYS_SIGNATURE_TYPE_CASUAL_CERTIFICATION: '${i18n.text("PgpKeys.SignaturesDialog.type.CASUAL_CERTIFICATION")?js_string}',
KEY_MANAGER_PGP_KEYS_SIGNATURE_TYPE_POSITIVE_CERTIFICATION: '${i18n.text("PgpKeys.SignaturesDialog.type.POSITIVE_CERTIFICATION")?js_string}',
KEY_MANAGER_PGP_KEYS_SIGNATURE_TYPE_SUBKEY_BINDING: '${i18n.text("PgpKeys.SignaturesDialog.type.SUBKEY_BINDING")?js_string}',
KEY_MANAGER_PGP_KEYS_SIGNATURE_TYPE_PRIMARYKEY_BINDING: '${i18n.text("PgpKeys.SignaturesDialog.type.PRIMARYKEY_BINDING")?js_string}',
KEY_MANAGER_PGP_KEYS_SIGNATURE_TYPE_DIRECT_KEY: '${i18n.text("PgpKeys.SignaturesDialog.type.DIRECT_KEY")?js_string}',
KEY_MANAGER_PGP_KEYS_SIGNATURE_TYPE_KEY_REVOCATION: '${i18n.text("PgpKeys.SignaturesDialog.type.KEY_REVOCATION")?js_string}',
KEY_MANAGER_PGP_KEYS_SIGNATURE_TYPE_SUBKEY_REVOCATION: '${i18n.text("PgpKeys.SignaturesDialog.type.SUBKEY_REVOCATION")?js_string}',
KEY_MANAGER_PGP_KEYS_SIGNATURE_TYPE_CERTIFICATION_REVOCATION: '${i18n.text("PgpKeys.SignaturesDialog.type.CERTIFICATION_REVOCATION")?js_string}',
KEY_MANAGER_PGP_KEYS_SIGNATURE_TYPE_TIMESTAMP: '${i18n.text("PgpKeys.SignaturesDialog.type.TIMESTAMP")?js_string}',
KEY_MANAGER_PGP_KEYS_SIGNATURE_TYPE_UNKNOWN: '${i18n.text("PgpKeys.SignaturesDialog.type.UNKNOWN")?js_string}',
KEY_MANAGER_PGP_KEYS_DATE_NON_EXPIRING: '${i18n.text("PgpKeys.expirationDate.NON_EXPIRING")?js_string}',

<#--Key Expiry Report-->
KEY_MANAGER_REPORT_DATE_NON_EXPIRING: '${i18n.text("KeyExpiryReport.expirationDate.NON_EXPIRING")?js_string}',
KEY_MANAGER_REPORT_GROUP_SERVER_KEYS: '${i18n.text("ServerKeys.title")?js_string}',
KEY_MANAGER_REPORT_GROUP_CLIENT_KEYS: '${i18n.text("ClientKeys.title")?js_string}',
KEY_MANAGER_REPORT_GROUP_PGP_KEYS: '${i18n.text("PgpKeys.title")?js_string}',

<#--Export Keys-->
KEY_MANAGER_EXPORT_KEYS_ERROR_BAD_FILENAME: '${i18n.text("ExportKeys.Error.badFilename")?js_string}',
KEY_MANAGER_EXPORT_KEYS_ERROR_BAD_FILE_PASSWORD: '${i18n.text("ExportKeys.Error.badFilePassword")?js_string}',
KEY_MANAGER_EXPORT_KEYS_ERROR_CONFIRM_PASSWORD: '${i18n.text("ExportKeys.Error.confirmPassword")?js_string}'
}
</@compress>