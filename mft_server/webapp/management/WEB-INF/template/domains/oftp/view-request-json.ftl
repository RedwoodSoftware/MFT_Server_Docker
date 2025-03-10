<#ftl strip_whitespace=true>
<#import "/WEB-INF/tags/json.ftl" as json>
<#import "/WEB-INF/tags/message.ftl" as i18n>
<#-- @ftlvariable name="model" type="com.jscape.inet.mft.subsystems.management.web.rest.domain.OftpMessageResource.RequestRecordModel" -->
<@json.stringify {
    '${i18n.text("OftpMessages.template.id")}': model.record.id!"",
    '${i18n.text("OftpMessages.template.date")}': model.record.date,
    '${i18n.text("OftpMessages.template.direction")}': i18n.text("OftpMessages.direction.${model.record.direction?upper_case}"),
    '${i18n.text("OftpMessages.template.originator")}': model.record.originator!"",
    '${i18n.text("OftpMessages.template.destination")}': model.record.destination!"",
    '${i18n.text("OftpMessages.template.filename")}': model.record.filename!"",
    '${i18n.text("OftpMessages.template.fileDateString")}': model.record.fileDateString!"",
    '${i18n.text("OftpMessages.template.fileDate")}': model.record.fileDate,
    '${i18n.text("OftpMessages.template.filePath")}': model.record.filePath!"",
    '${i18n.text("OftpMessages.template.fileDescription")}': model.record.fileDescription!"",
    '${i18n.text("OftpMessages.template.securityLevel")}': i18n.text("OftpMessages.security.${model.record.securityLevel?upper_case}"),
    '${i18n.text("OftpMessages.template.cipherSuiteSelection")}': i18n.text("OftpMessages.cipherSuiteSelection.${model.record.cipherSuiteSelection?upper_case}"),
    '${i18n.text("OftpMessages.template.fileCompressionAlgorithm")}': i18n.text("OftpMessages.fileCompression.${model.record.fileCompressionAlgorithm?upper_case}"),
    '${i18n.text("OftpMessages.template.fileEnvelopingFormat")}': i18n.text("OftpMessages.fileEnvelope.${model.record.fileEnvelopingFormat?upper_case}"),
    '${i18n.text("OftpMessages.template.userData")}': model.record.userData!"",
    '${i18n.text("OftpMessages.template.fileHash")}': model.record.fileHash!"",
    '${i18n.text("OftpMessages.template.username")}': model.record.username!"",
    '${i18n.text("OftpMessages.template.tradingPartner")}': model.record.tradingPartner!"",
    '${i18n.text("OftpMessages.template.status")}': i18n.text("OftpMessages.status.${model.record.status?upper_case}") ,
    '${i18n.text("OftpMessages.template.errorDescription")}': model.record.errorDescription!""
} />