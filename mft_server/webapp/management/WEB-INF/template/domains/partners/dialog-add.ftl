<#import "macro.ftl" as trading_partner />


<@trading_partner.add_dialog id="d-partner-add-aftp" protocol=i18n.text("Application.protocol.AFTP")><#include "fields-aftp.ftl" /></@>
<@trading_partner.add_dialog id="d-partner-add-agent" protocol=i18n.text("Application.protocol.AGENT") test_allowed=false><#include "fields-agent.ftl" /></@>
<@trading_partner.add_dialog id="d-partner-add-amazons3" protocol=i18n.text("Application.protocol.AMAZON_S3")><#include "fields-amazon-s3.ftl" /></@>
<@trading_partner.add_dialog id="d-partner-add-amazons3-compatible" protocol=i18n.text("Application.protocol.AMAZON_S3_COMPATIBLE")><#include "fields-amazon-s3-compatible.ftl" /></@>
<@trading_partner.add_dialog id="d-partner-add-amazonaws" protocol=i18n.text("Application.protocol.AMAZON_AWS")><#include "fields-amazon-aws.ftl" /></@>
<@trading_partner.add_dialog id="d-partner-add-as2" protocol=i18n.text("Application.protocol.AS2")><#include "fields-as2.ftl" /></@>
<@trading_partner.add_dialog id="d-partner-add-box" protocol=i18n.text("Application.protocol.BOX")><#include "fields-box.ftl" /></@>
<@trading_partner.add_dialog id="d-partner-add-dropbox" protocol=i18n.text("Application.protocol.DROPBOX")><#include "fields-dropbox.ftl" /></@>
<@trading_partner.add_dialog id="d-partner-add-ftp" protocol=i18n.text("Application.protocol.FTP")><#include "fields-ftp.ftl" /></@>
<@trading_partner.add_dialog id="d-partner-add-ftps" protocol=i18n.text("Application.protocol.FTP_COMMON")><#include "fields-ftps.ftl" /></@>
<@trading_partner.add_dialog id="d-partner-add-imap" protocol=i18n.text("Application.protocol.IMAP")><#include "fields-imap.ftl" /></@>
<@trading_partner.add_dialog id="d-partner-add-ibmcloud" protocol=i18n.text("Application.protocol.IBM_CLOUD")><#include "fields-ibm-cloud.ftl" /></@>
<@trading_partner.add_dialog id="d-partner-add-oftp" protocol=i18n.text("Application.protocol.OFTP") test_allowed=false><#include "fields-oftp.ftl" /></@>
<@trading_partner.add_dialog id="d-partner-add-pop3" protocol=i18n.text("Application.protocol.POP3")><#include "fields-pop3.ftl" /></@>
<@trading_partner.add_dialog id="d-partner-add-rest" protocol=i18n.text("Application.protocol.REST_PARTNER")><#include "fields-rest.ftl" /></@>
<@trading_partner.add_dialog id="d-partner-add-sftp" protocol=i18n.text("Application.protocol.SFTP")><#include "fields-sftp.ftl" /></@>
<@trading_partner.add_dialog id="d-partner-add-smtp" protocol=i18n.text("Application.protocol.SMTP")><#include "fields-smtp.ftl" /></@>
<@trading_partner.add_dialog id="d-partner-add-smb" protocol=i18n.text("Application.protocol.SMB")><#include "fields-smb.ftl" /></@>
<@trading_partner.add_dialog id="d-partner-add-webdav" protocol=i18n.text("Application.protocol.WEBDAV")><#include "fields-webdav.ftl" /></@>
<@trading_partner.add_dialog id="d-partner-add-tftp" protocol=i18n.text("Application.protocol.TFTP")><#include "fields-tftp.ftl" /></@>
<@trading_partner.add_dialog id="d-partner-add-googlecloud" protocol=i18n.text("Application.protocol.GOOGLE_CLOUD")><#include "fields-google-cloud.ftl" /></@>
<@trading_partner.add_dialog id="d-partner-add-googlestorage" protocol=i18n.text("Application.protocol.GOOGLE_CLOUD_STORAGE")><#include "fields-google-storage.ftl" /></@>
<@trading_partner.add_dialog id="d-partner-add-googledrive" protocol=i18n.text("Application.protocol.GOOGLE_DRIVE")><#include "fields-google-drive.ftl" /></@>
<@trading_partner.add_dialog id="d-partner-add-microsoftazure-filestorage" protocol=i18n.text("Application.protocol.MICROSOFT_AZURE_FILE_STORAGE")><#include "fields-microsoft-azure-file-storage.ftl" /></@>
<@trading_partner.add_dialog id="d-partner-add-microsoftazure-blobstorage" protocol=i18n.text("Application.protocol.MICROSOFT_AZURE_BLOB_STORAGE")><#include "fields-microsoft-azure-blob-storage.ftl" /></@>
<@trading_partner.add_dialog id="d-partner-add-microsoftazure-datalake" protocol=i18n.text("Application.protocol.MICROSOFT_AZURE_DATA_LAKE")><#include "fields-microsoft-azure-data-lake.ftl" /></@>
<@trading_partner.add_dialog id="d-partner-add-microsoftazure-datalake-2" protocol=i18n.text("Application.protocol.MICROSOFT_AZURE_DATA_LAKE_2")><#include "fields-microsoft-azure-data-lake-2.ftl" /></@>
<@trading_partner.add_dialog id="d-partner-add-microsort-onedrive" protocol=i18n.text("Application.protocol.MICROSOFT_ONE_DRIVE")><#include "fields-microsoft-one-drive.ftl" /></@>
<@trading_partner.add_dialog id="d-partner-add-localdir" protocol=i18n.text("Application.protocol.LOCAL_DIRECTORY") test_allowed=false />
<@trading_partner.add_dialog id="d-partner-add-redwood" protocol=i18n.text("Application.protocol.REDWOOD")><#include "fields-redwood.ftl" /></@>
<@trading_partner.add_dialog id="d-partner-add-splunkhttp" protocol=i18n.text("Application.protocol.SPLUNK_HTTP")><#include "fields-splunk-http.ftl" /></@>
<@trading_partner.add_dialog id="d-partner-add-jdbc" protocol=i18n.text("Application.protocol.JDBC")><#include "fields-jdbc.ftl" /></@>
<@trading_partner.add_dialog id="d-partner-add-activebatch" protocol=i18n.text("Application.protocol.ACTIVEBATCH")><#include "fields-activebatch.ftl" /></@>
<@trading_partner.add_dialog id="d-partner-add-tidal" protocol=i18n.text("Application.protocol.TIDAL")><#include "fields-tidal.ftl" /></@>
<@trading_partner.add_dialog id="d-partner-add-cyberark" protocol=i18n.text("Application.protocol.CYBER_ARK")><#include "fields-cyberark.ftl" /></@>
