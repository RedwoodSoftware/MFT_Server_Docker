<@form.dialog id="d-partner-email" title=i18n.text("TradingPartners.EmailDialog.title")>
    <fieldset class="content" style="padding:1.7em 2em">
        <div><@form.text name="subject" required=true><@i18n.message "TradingPartners.EmailDialog.label.subject" /></@></div>
        <div><@form.memo name="message" required=true><@i18n.message "TradingPartners.EmailDialog.label.message" /></@></div>
    </fieldset>
</@form.dialog>

<@form.dialog id="d-partner-email-spec" title=i18n.text("TradingPartners.EmailSpecDialog.title")>
    <fieldset class="content" style="padding:1.7em 2em">
        <div><@form.text name="recipient" required=true><@i18n.message "TradingPartners.EmailDialog.label.recipient" /></@></div>
        <div><@form.text name="sender" required=true><@i18n.message "TradingPartners.EmailDialog.label.sender" /></@></div>
        <div><@form.text name="subject" required=true><@i18n.message "TradingPartners.EmailDialog.label.subject" /></@></div>
        <div><@form.memo name="message" required=true><@i18n.message "TradingPartners.EmailDialog.label.message" /></@></div>
        <div><@form.select name="files" items={
            "SSL_SERVER_CERTIFICATE": i18n.text("TradingPartners.EmailSpecDialog.attachment.SSL_SERVER_CERTIFICATE"),
            "SSL_CLIENT_CERTIFICATE": i18n.text("TradingPartners.EmailSpecDialog.attachment.SSL_CLIENT_CERTIFICATE"),
            "REQUEST_ENCRYPTION_CERTIFICATE": i18n.text("TradingPartners.EmailSpecDialog.attachment.REQUEST_ENCRYPTION_CERTIFICATE"),
            "REQUEST_SIGNATURE_VERIFICATION_CERTIFICATE": i18n.text("TradingPartners.EmailSpecDialog.attachment.REQUEST_SIGNATURE_VERIFICATION_CERTIFICATE"),
            "RECEIPT_SIGNATURE_VERIFICATION_CERTIFICATE": i18n.text("TradingPartners.EmailSpecDialog.attachment.RECEIPT_SIGNATURE_VERIFICATION_CERTIFICATE")
        }><@i18n.message "TradingPartners.EmailDialog.label.files" /></@></div>
    </fieldset>
</@form.dialog>