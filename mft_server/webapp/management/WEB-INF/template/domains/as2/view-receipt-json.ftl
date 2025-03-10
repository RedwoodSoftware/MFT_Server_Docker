<#ftl strip_whitespace=true>
<#import "/WEB-INF/tags/json.ftl" as json>
<#import "/WEB-INF/tags/message.ftl" as i18n>
<#-- @ftlvariable name="record" type="com.jscape.inet.mft.subsystems.as2.AS2ReceiptRecord" -->
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
    '${i18n.text("AS2Messages.template.reportingUA")}': record.reportingUA!"",
    '${i18n.text("AS2Messages.template.mdnGateway")}': record.mdnGateway!"",
    '${i18n.text("AS2Messages.template.originalRecipient")}': record.originalRecipient!"",
    '${i18n.text("AS2Messages.template.finalRecipient")}': record.finalRecipient!"",
    '${i18n.text("AS2Messages.template.originalMessageId")}': record.originalMessageId!"",
    '${i18n.text("AS2Messages.template.dispositionActionMode")}': record.dispositionActionMode!"",
    '${i18n.text("AS2Messages.template.dispositionSendingMode")}': record.dispositionSendingMode!"",
    '${i18n.text("AS2Messages.template.dispositionType")}': record.dispositionType!"",
    '${i18n.text("AS2Messages.template.dispositionModifier")}': record.dispositionModifier!"",
    '${i18n.text("AS2Messages.template.failures")}': record.failures,
    '${i18n.text("AS2Messages.template.errors")}': record.errors,
    '${i18n.text("AS2Messages.template.warnings")}': record.warnings,
    '${i18n.text("AS2Messages.template.messageDigest")}': record.messageDigest!"",
    '${i18n.text("AS2Messages.template.digestAlgorithm")}': record.digestAlgorithm!"",
    '${i18n.text("AS2Messages.template.signatureStatus")}': i18n.text("AS2Messages.signatureStatus.${record.signatureStatus?upper_case}"),
    '${i18n.text("AS2Messages.template.status")}': i18n.text("AS2Messages.status.${record.status?upper_case}"),
    '${i18n.text("AS2Messages.template.username")}': record.username!"",
    '${i18n.text("AS2Messages.template.tradingPartner")}': record.tradingPartner!"",
    '${i18n.text("AS2Messages.template.rawMessageFile")}': record.rawFile!""?html,
    '${i18n.text("AS2Messages.template.errorDescription")}': record.errorDescription!""
} />