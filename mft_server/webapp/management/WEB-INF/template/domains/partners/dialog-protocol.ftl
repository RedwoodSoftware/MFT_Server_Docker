<@form.dialog id="d-partner-add-protocol" title=i18n.text("TradingPartners.ProtocolDialog.title") header=i18n.text("TradingPartners.ProtocolDialog.info.short") description=i18n.text("TradingPartners.ProtocolDialog.info.long")>
    <fieldset class="noborder pane">
        <div><@form.select name="protocol" items={
                "AFTP": i18n.text("Application.protocol.AFTP"),
                "AGENT": i18n.text("Application.protocol.AGENT"),
                "AS2": i18n.text("Application.protocol.AS2"),
                "AMAZON_S3": i18n.text("Application.protocol.AMAZON_S3"),
                "S3_COMPATIBLE": i18n.text("Application.protocol.AMAZON_S3_COMPATIBLE"),
                "AMAZON_AWS": i18n.text("Application.protocol.AMAZON_AWS"),
                "BOX": i18n.text("Application.protocol.BOX"),
                "DROPBOX": i18n.text("Application.protocol.DROPBOX"),
                "GOOGLE_CLOUD": i18n.text("Application.protocol.GOOGLE_CLOUD"),
                "GOOGLE_CLOUD_STORAGE": i18n.text("Application.protocol.GOOGLE_CLOUD_STORAGE"),
                "GOOGLE_DRIVE": i18n.text("Application.protocol.GOOGLE_DRIVE"),
                "IBM_CLOUD": i18n.text("Application.protocol.IBM_CLOUD"),
                "LOCAL_DIRECTORY": i18n.text("Application.protocol.LOCAL_DIRECTORY"),
                "MICROSOFT_AZURE_FILE_STORAGE": i18n.text("Application.protocol.MICROSOFT_AZURE_FILE_STORAGE"),
                "MICROSOFT_AZURE_BLOB_STORAGE": i18n.text("Application.protocol.MICROSOFT_AZURE_BLOB_STORAGE"),
                "MICROSOFT_AZURE_DATA_LAKE": i18n.text("Application.protocol.MICROSOFT_AZURE_DATA_LAKE"),
                "MICROSOFT_AZURE_DATA_LAKE_2": i18n.text("Application.protocol.MICROSOFT_AZURE_DATA_LAKE_2"),
                "MICROSOFT_ONEDRIVE": i18n.text("Application.protocol.MICROSOFT_ONE_DRIVE"),
                "REDWOOD": i18n.text("Application.protocol.REDWOOD"),
                "ACTIVE_BATCH": i18n.text("Application.protocol.ACTIVEBATCH"),
                "TIDAL": i18n.text("Application.protocol.TIDAL"),
                "CYBER_ARK": i18n.text("Application.protocol.CYBER_ARK"),
                "FTP": i18n.text("Application.protocol.FTP"),
                "FTPS_IMPLICIT": i18n.text("Application.protocol.FTPS_IMPLICIT"),
                "FTPS_EXPLICIT": i18n.text("Application.protocol.FTPS_EXPLICIT"),
                "IMAP": i18n.text("Application.protocol.IMAP"),
                "OFTP": i18n.text("Application.protocol.OFTP"),
                "POP3": i18n.text("Application.protocol.POP3"),
                "REST": i18n.text("Application.protocol.REST_PARTNER"),
                "SFTP": i18n.text("Application.protocol.SFTP"),
                "SMB": i18n.text("Application.protocol.SMB"),
                "SMTP": i18n.text("Application.protocol.SMTP"),
                "SPLUNK_HTTP": i18n.text("Application.protocol.SPLUNK_HTTP"),
                "WEBDAV": i18n.text("Application.protocol.WEBDAV"),
                "TFTP": i18n.text("Application.protocol.TFTP"),
                "JDBC": i18n.text("Application.protocol.JDBC")
            }><@i18n.message key="TradingPartners.label.protocol" /></@>
        </div>
    </fieldset>
</@form.dialog>