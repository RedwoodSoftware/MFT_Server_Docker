<#ftl strip_whitespace=true>
<#import "/WEB-INF/tags/json.ftl" as json>
<#import "/WEB-INF/tags/message.ftl" as i18n>
<#import "/WEB-INF/tags/file.ftl" as fs>
<#-- @ftlvariable name="model" type="com.jscape.inet.mft.subsystems.management.web.rest.domain.AS2MessageResource.AS2RequestRecordModel" -->
<#assign record=model.record />
<#assign filesize><@fs.size value=record.fileSize /></#assign>
<@json.stringify {
    '${i18n.text("AS2Messages.template.messageId")}': record.messageId!"",
    '${i18n.text("AS2Messages.template.date")}': record.date,
    '${i18n.text("AS2Messages.template.senderHost")}': record.senderHost!"",
    '${i18n.text("AS2Messages.template.recipientUrl")}': record.recipientUrl!"",
    '${i18n.text("AS2Messages.template.sender")}': record.sender!"",
    '${i18n.text("AS2Messages.template.recipient")}': record.recipient!"",
    '${i18n.text("AS2Messages.template.subject")}': record.subject!"",
    '${i18n.text("AS2Messages.template.from")}': record.from!"",
    '${i18n.text("AS2Messages.template.receiptType")}': i18n.text("AS2Messages.receiptType.${record.receiptType?upper_case}"),
    '${i18n.text("AS2Messages.template.receiptEmailAddress")}': record.receiptEmailAddress!"",
    '${i18n.text("AS2Messages.template.asyncReceiptDeliveryUrl")}': record.asyncReceiptDeliveryUrl!"",
    '${i18n.text("AS2Messages.template.signedReceiptProtocolImportance")}': record.signedReceiptProtocolImportance!"",
    '${i18n.text("AS2Messages.template.signedReceiptProtocolSymbol")}': record.signedReceiptProtocolSymbol!"",
    '${i18n.text("AS2Messages.template.signedReceiptMicAlgorithmImportance")}': record.signedReceiptMicAlgorithmImportance!"",
    '${i18n.text("AS2Messages.template.signedReceiptMicAlgorithms")}': record.signedReceiptMicAlgorithms,
    '${i18n.text("AS2Messages.template.filename")}': record.filename!"",
    '${i18n.text("AS2Messages.template.filePath")}': record.filePath!"",
    '${i18n.text("AS2Messages.template.fileMimeType")}': record.fileMimeType!"",
    '${i18n.text("AS2Messages.template.fileSize")}': filesize,
    '${i18n.text("AS2Messages.template.encryptionStatus")}': i18n.text("AS2Messages.encryptionStatus.${record.encryptionStatus?upper_case}"),
    '${i18n.text("AS2Messages.template.encryptionAlgorithm")}': i18n.text("AS2Messages.encryption.${model.encryption!''?upper_case}"),
    '${i18n.text("AS2Messages.template.signatureAlgorithm")}': model.signature!"",
    '${i18n.text("AS2Messages.template.messageDigest")}': record.messageDigest!"",
    '${i18n.text("AS2Messages.template.digestAlgorithm")}': record.digestAlgorithm!"",
    '${i18n.text("AS2Messages.template.signatureStatus")}': i18n.text("AS2Messages.signatureStatus.${record.signatureStatus?upper_case}"),
    '${i18n.text("AS2Messages.template.status")}': i18n.text("AS2Messages.status.${record.status?upper_case}"),
    '${i18n.text("AS2Messages.template.username")}': record.username!"",
    '${i18n.text("AS2Messages.template.tradingPartner")}': record.tradingPartner!"",
    '${i18n.text("AS2Messages.template.rawMessageFile")}': (record.rawFile!"")?html,
    '${i18n.text("AS2Messages.template.errorDescription")}': record.errorDescription!""
} />