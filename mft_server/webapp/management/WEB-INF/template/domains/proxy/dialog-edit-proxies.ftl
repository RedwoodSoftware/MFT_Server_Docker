<#import "macro.ftl" as reverse_proxy />

<@reverse_proxy.edit_dialog id="d-proxy-edit-aftp" protocol=i18n.text("Application.protocol.AFTP")><#include "fields-aftp.ftl" /></@>
<@reverse_proxy.edit_dialog id="d-proxy-edit-agent" protocol=i18n.text("Application.protocol.AGENT") test_allowed=false><#include "fields-agent.ftl" /></@>
<@reverse_proxy.edit_dialog id="d-proxy-edit-amazons3" protocol=i18n.text("Application.protocol.AMAZON_S3")><#include "fields-amazon-s3.ftl" /></@>
<@reverse_proxy.edit_dialog id="d-proxy-edit-amazons3-compatible" protocol=i18n.text("Application.protocol.AMAZON_S3_COMPATIBLE")><#include "fields-amazon-s3-compatible.ftl" /></@>
<@reverse_proxy.edit_dialog id="d-proxy-edit-box" protocol=i18n.text("Application.protocol.BOX")><#include "fields-box.ftl" /></@>
<@reverse_proxy.edit_dialog id="d-proxy-edit-dropbox" protocol=i18n.text("Application.protocol.DROPBOX")><#include "fields-dropbox.ftl" /></@>
<@reverse_proxy.edit_dialog id="d-proxy-edit-ibmcloud" protocol=i18n.text("Application.protocol.IBM_CLOUD")><#include "fields-ibm-cloud.ftl" /></@>
<@reverse_proxy.edit_dialog id="d-proxy-edit-microsoftazure-filestorage" protocol=i18n.text("Application.protocol.MICROSOFT_AZURE_FILE_STORAGE")><#include "fields-microsoft-azure-file-storage.ftl" /></@>
<@reverse_proxy.edit_dialog id="d-proxy-edit-microsoftazure-blobstorage" protocol=i18n.text("Application.protocol.MICROSOFT_AZURE_BLOB_STORAGE")><#include "fields-microsoft-azure-blob-storage.ftl" /></@>
<@reverse_proxy.edit_dialog id="d-proxy-edit-microsoftazure-datalake" protocol=i18n.text("Application.protocol.MICROSOFT_AZURE_DATA_LAKE")><#include "fields-microsoft-azure-data-lake.ftl" /></@>
<@reverse_proxy.edit_dialog id="d-proxy-edit-microsoftazure-datalake-2" protocol=i18n.text("Application.protocol.MICROSOFT_AZURE_DATA_LAKE_2")><#include "fields-microsoft-azure-data-lake-2.ftl" /></@>
<@reverse_proxy.edit_dialog id="d-proxy-edit-microsoft-onedrive" protocol=i18n.text("Application.protocol.MICROSOFT_ONE_DRIVE")><#include "fields-microsoft-one-drive.ftl" /></@>
<@reverse_proxy.edit_dialog id="d-proxy-edit-googlestorage" protocol=i18n.text("Application.protocol.GOOGLE_CLOUD_STORAGE")><#include "fields-google-storage.ftl" /></@>
<@reverse_proxy.edit_dialog id="d-proxy-edit-googledrive" protocol=i18n.text("Application.protocol.GOOGLE_DRIVE")><#include "fields-google-drive.ftl" /></@>
<@reverse_proxy.edit_dialog id="d-proxy-edit-ftp" protocol=i18n.text("Application.protocol.FTP")><#include "fields-ftp.ftl" /></@>
<@reverse_proxy.edit_dialog id="d-proxy-edit-rest" protocol=i18n.text("Application.protocol.REST_PARTNER")><#include "fields-rest.ftl" /></@>
<@reverse_proxy.edit_dialog id="d-proxy-edit-sftp" protocol=i18n.text("Application.protocol.SFTP")><#include "fields-sftp.ftl" /></@>
<@reverse_proxy.edit_dialog id="d-proxy-edit-smb" protocol=i18n.text("Application.protocol.SMB")><#include "fields-smb.ftl" /></@>
<@reverse_proxy.edit_dialog id="d-proxy-edit-tftp" protocol=i18n.text("Application.protocol.TFTP")><#include "fields-tftp.ftl" /></@>
<@reverse_proxy.edit_dialog id="d-proxy-edit-webdav" protocol=i18n.text("Application.protocol.WEBDAV")><#include "fields-webdav.ftl" /></@>
