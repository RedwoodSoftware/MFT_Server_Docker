<#ftl strip_whitespace=true>
<#import "/WEB-INF/tags/json.ftl" as json>
<#import "/WEB-INF/tags/message.ftl" as i18n>
<#-- @ftlvariable name="model" type="com.jscape.inet.mft.subsystems.management.web.rest.domain.OftpMessageResource.ReceiptRecordModel" -->
<@json.stringify {
    '${i18n.text("OftpMessages.template.id")}': model.record.id!"",
    '${i18n.text("OftpMessages.template.date")}': model.record.date,
    '${i18n.text("OftpMessages.template.direction")}': i18n.text("OftpMessages.direction.${model.record.direction?upper_case}"),
    '${i18n.text("OftpMessages.template.originator")}': model.record.originator!"",
    '${i18n.text("OftpMessages.template.destination")}': model.record.destination!"",
    '${i18n.text("OftpMessages.template.filename")}': model.record.filename!"",
    '${i18n.text("OftpMessages.template.fileDateString")}': model.record.fileDateString!"",
    '${i18n.text("OftpMessages.template.fileDate")}': model.record.fileDate,
    '${i18n.text("OftpMessages.template.userData")}': model.record.userData!"",
    '${i18n.text("OftpMessages.template.fileHash")}': model.fileHash!"",
    '${i18n.text("OftpMessages.template.username")}': model.record.username!"",
    '${i18n.text("OftpMessages.template.tradingPartner")}': model.record.tradingPartner!"",
    '${i18n.text("OftpMessages.template.status")}': i18n.text("OftpMessages.status.${model.record.status?upper_case}"),
    '${i18n.text("OftpMessages.template.errorCreator")}': model.record.errorCreator!"",
    '${i18n.text("OftpMessages.template.errorCode")}': model.record.errorCode,
    '${i18n.text("OftpMessages.template.errorDescription")}': model.record.errorDescription!""
} />