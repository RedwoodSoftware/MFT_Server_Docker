<#if permissions.oftpMessagesSendOperationAllowed>
    <@form.dialog id="d-oftp-sendfile" title=i18n.text("OftpMessages.SendFileDialog.title")>
        <fieldset name="oftpsendfilefields" class="content large">
            <@form.fields_title title=i18n.text("OftpMessages.SendFileDialog.info.short") description=i18n.text("OftpMessages.SendFileDialog.info.long")/>
            <div><@form.select name="partner" items={}><@i18n.message key="OftpMessages.label.connectionPartner" /></@></div>
            <div><@form.select name="destinationpartner" items={}><@i18n.message key="OftpMessages.label.destinationPartner" /></@></div>
            <div><@form.path name="file" size="40" required=true><@i18n.message key="OftpMessages.label.file" /></@>&nbsp;<@form.button name="browsefile"><@i18n.message "OftpMessages.button.browse" /></@></div>
            <div><@form.path name="virtualfile" size="40"><@i18n.message key="OftpMessages.label.virtualFile" /></@></div>
            <div><@form.select name="type" items={
                'FIXED': i18n.text("OftpMessages.fileType.FIXED"),
                'VARIABLE': i18n.text("OftpMessages.fileType.VARIABLE"),
                'UNSTRUCTURED': i18n.text("OftpMessages.fileType.UNSTRUCTURED"),
                'TEXT': i18n.text("OftpMessages.fileType.TEXT")
            }><@i18n.message key="OftpMessages.label.fileType" /></@>
            </div>
            <div><@form.number name="recordsize" maxlength="5"><@i18n.message key="OftpMessages.label.maxRecordSize" /></@>&nbsp;<span><@i18n.message "OftpMessages.label.maxRecordSizeUnit" /></span></div>
            <div><@form.path name="description" size="40"><@i18n.message key="OftpMessages.label.fileDescription" /></@></div>
            <div><@form.path name="debugfile" size="40"><@i18n.message key="OftpMessages.label.debugFile" /></@>&nbsp;<@form.button name="browsedebugfile"><@i18n.message "OftpMessages.button.browse" /></@></div>
            <div class="checkbox"><@form.checkbox name="placetooutbox"><@i18n.message key="OftpMessages.label.placeToOutbox" /></@></div>
        </fieldset>
    </@form.dialog>

    <@form.dialog id="d-oftp-sendreceipt" title=i18n.text("OftpMessages.SendReceiptDialog.title")>
        <fieldset name="oftpsendreceiptfields" class="content large">
            <@form.fields_title title=i18n.text("OftpMessages.SendReceiptDialog.info.short") description=i18n.text("OftpMessages.SendReceiptDialog.info.long")/>
            <div><@form.checkbox name="usepartner"><@i18n.message key="OftpMessages.label.connectionPartner" /></@><select name="partner"></select></div>
            <div><@form.select name="type" items={
                'POSITIVE': i18n.text("OftpMessages.receiptType.POSITIVE"),
                'NEGATIVE': i18n.text("OftpMessages.receiptType.NEGATIVE")
            }><@i18n.message key="OftpMessages.label.receiptType" /></@></div>
            <div><@form.select name="reason" items={
                'USER_CODE_NOT_KNOWN':i18n.text("OftpMessages.receiptReason.USER_CODE_NOT_KNOWN"),
                'INVALID_PASSWORD': i18n.text("OftpMessages.receiptReason.INVALID_PASSWORD"),
                'UNSPECIFIED_REASON_BAD_ESID':i18n.text("OftpMessages.receiptReason.UNSPECIFIED_REASON_BAD_ESID"),
                'INVALID_FILE_NAME': i18n.text("OftpMessages.receiptReason.INVALID_FILE_NAME"),
                'INVALID_DESTINATION': i18n.text("OftpMessages.receiptReason.INVALID_DESTINATION"),
                'INVALID_ORIGIN': i18n.text("OftpMessages.receiptReason.INVALID_ORIGIN"),
                'INVALID_STORAGE_RECORD_FORMAT': i18n.text("OftpMessages.receiptReason.INVALID_STORAGE_RECORD_FORMAT"),
                'MAXIMUM_RECORD_LENGTH_NOT_SUPPORTED': i18n.text("OftpMessages.receiptReason.MAXIMUM_RECORD_LENGTH_NOT_SUPPORTED"),
                'FILE_SIZE_TOO_BIG': i18n.text("OftpMessages.receiptReason.FILE_SIZE_TOO_BIG"),
                'INVALID_RECORD_COUNT': i18n.text("OftpMessages.receiptReason.INVALID_RECORD_COUNT"),
                'INVALID_BYTE_COUNT': i18n.text("OftpMessages.receiptReason.INVALID_BYTE_COUNT"),
                'ACCESS_METHOD_FAILURE': i18n.text("OftpMessages.receiptReason.ACCESS_METHOD_FAILURE"),
                'DUPLICATE_FILE': i18n.text("OftpMessages.receiptReason.DUPLICATE_FILE"),
                'FILE_DIRECTION_REFUSED': i18n.text("OftpMessages.receiptReason.FILE_DIRECTION_REFUSED"),
                'CIPHER_SUITE_NOT_SUPPORTED': i18n.text("OftpMessages.receiptReason.CIPHER_SUITE_NOT_SUPPORTED"),
                'ENCRYPTED_FILE_NOT_ALLOWED': i18n.text("OftpMessages.receiptReason.ENCRYPTED_FILE_NOT_ALLOWED"),
                'UNENCRYPTED_FILE_NOT_ALLOWED': i18n.text("OftpMessages.receiptReason.UNENCRYPTED_FILE_NOT_ALLOWED"),
                'COMPRESSION_NOT_ALLOWED': i18n.text("OftpMessages.receiptReason.COMPRESSION_NOT_ALLOWED"),
                'SIGNED_FILE_NOT_ALLOWED': i18n.text("OftpMessages.receiptReason.SIGNED_FILE_NOT_ALLOWED"),
                'UNSIGNED_FILE_NOT_ALLOWED': i18n.text("OftpMessages.receiptReason.UNSIGNED_FILE_NOT_ALLOWED"),
                'FILE_SIGNATURE_NOT_VALID': i18n.text("OftpMessages.receiptReason.FILE_SIGNATURE_NOT_VALID"),
                'FILE_DECOMPRESSION_FAILED': i18n.text("OftpMessages.receiptReason.FILE_DECOMPRESSION_FAILED"),
                'FILE_DECRYPTION_FAILED': i18n.text("OftpMessages.receiptReason.FILE_DECRYPTION_FAILED"),
                'FILE_PROCESSING_FAILED': i18n.text("OftpMessages.receiptReason.FILE_PROCESSING_FAILED"),
                'NOT_DELIVERED_TO_RECIPIENT': i18n.text("OftpMessages.receiptReason.NOT_DELIVERED_TO_RECIPIENT"),
                'NOT_ACKNOWLEDGED_BY_RECIPIENT': i18n.text("OftpMessages.receiptReason.NOT_ACKNOWLEDGED_BY_RECIPIENT"),
                'TRANSMISSION_STOPPED_BY_OPERATOR': i18n.text("OftpMessages.receiptReason.TRANSMISSION_STOPPED_BY_OPERATOR"),
                'FILE_SIZE_INCOMPATIBLE_WITH_RECIPIENT_PROTOCOL_VERSION': i18n.text("OftpMessages.receiptReason.FILE_SIZE_INCOMPATIBLE_WITH_RECIPIENT_PROTOCOL_VERSION"),
                'UNSPECIFIED_REASON': i18n.text("OftpMessages.receiptReason.UNSPECIFIED_REASON")
            }><@i18n.message key="OftpMessages.label.receiptReason" /></@></div>
            <div><@form.path name="description" size="40"><@i18n.message key="OftpMessages.label.description" /></@></div>
            <div><@form.path name="debugfile" size="40"><@i18n.message key="OftpMessages.label.debugFile" /></@>&nbsp;<@form.button name="browsedebugfile"><@i18n.message "OftpMessages.button.browse" /></@></div>
            <div class="checkbox"><@form.checkbox name="placetooutbox"><@i18n.message key="OftpMessages.label.placeToOutbox" /></@></div>
        </fieldset>
    </@form.dialog>

    <@form.dialog id="d-oftp-sendcert" title=i18n.text("OftpMessages.SendCertificateDialog.title")>
        <fieldset name="oftpsendcertificatefields" class="content x-large">
            <@form.fields_title title=i18n.text("OftpMessages.SendCertificateDialog.info.short") description=i18n.text("OftpMessages.SendCertificateDialog.info.long")/>
            <div><@form.select name="partner" items={}><@i18n.message key="OftpMessages.label.connectionPartner" /></@></div>
            <div><@form.select name="destinationpartner" items={}><@i18n.message key="OftpMessages.label.destinationPartner" /></@></div>
            <div><@form.select name="certificate" items={}><@i18n.message key="OftpMessages.label.certificate" /></@></div>
            <div><@form.checkbox name="replacecrt"><@i18n.message key="OftpMessages.label.replacementCertificate" /></@><select name="replacement"></select></div>
            <div><@form.select name="type" items={
                'REQUEST': i18n.text("OftpMessages.label.sendCertType.REQUEST"),
                'DELIVERY': i18n.text("OftpMessages.label.sendCertType.DELIVERY"),
                'REPLACE': i18n.text("OftpMessages.label.sendCertType.REPLACE")
            }><@i18n.message key="OftpMessages.label.sendCertType" /></@></div>
            <div><@form.path name="debugfile" size="40"><@i18n.message key="OftpMessages.label.debugFile" /></@>&nbsp;<@form.button name="browsedebugfile"><@i18n.message "OftpMessages.button.browse" /></@></div>
            <div class="checkbox"><@form.checkbox name="placetooutbox"><@i18n.message key="OftpMessages.label.placeToOutbox" /></@></div>
        </fieldset>
    </@form.dialog>
</#if>

<@form.dialog id="oftp-viewrecord">
    <table role="grid" aria-label="oftpmessagerecord"></table>
</@form.dialog>