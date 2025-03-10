<#ftl strip_whitespace=true>
<#import "/WEB-INF/tags/json.ftl" as json>
<#import "/WEB-INF/tags/message.ftl" as i18n>
<#-- @ftlvariable name="summary" type="com.jscape.inet.mftserver.operation.keys.CertificateSummary" -->
<#assign certificate_expiration><@compress single_line=true>
    <#if (.now?long > summary.certificateEndDate)>
        ${i18n.text("KeyManager.ViewDialog.label.certificateExpired")}
    <#else>
        ${i18n.text("KeyManager.ViewDialog.label.certificateExpirationTemplate", [((summary.certificateEndDate - .now?long) / (1000 * 3600 * 24))?long])}
    </#if>
</@compress></#assign>
<#assign certificate_key_usages><#list summary.keyUsages as usage><@i18n.message key="KeyManager.keyUsage.${usage?upper_case}" /><#if usage_has_next>, </#if></#list></#assign>
<#assign certificate_extended_key_usages><#list summary.extendedKeyUsages as usage><@i18n.message key="KeyManager.extendedKeyUsage.${usage?upper_case}" /><#if usage_has_next>, </#if></#list></#assign>
<@json.stringify {
    '${i18n.text("KeyManager.ViewDialog.label.alias")}': summary.name!"",
    '${i18n.text("KeyManager.ViewDialog.label.keyAlgorithm")}': summary.keyAlgorithm!"",
    '${i18n.text("KeyManager.ViewDialog.label.keySize")}': summary.keySize?c + " " + i18n.text("KeyManager.ViewDialog.label.keySizeUnit"),
    '${i18n.text("KeyManager.ViewDialog.label.certificateNumber")}': summary.certificateSerialNumber!"",
    '${i18n.text("KeyManager.ViewDialog.label.certificateIssuer")}': summary.certificateIssuer!"",
    '${i18n.text("KeyManager.ViewDialog.label.certificateSubject")}': summary.certificateSubject!"",
    '${i18n.text("KeyManager.ViewDialog.label.certificateSubjectAlternativeName")}': summary.certificateSubjectAlternativeName!"",
    '${i18n.text("KeyManager.ViewDialog.label.certificateBeginDate")}': summary.certificateBeginDate?number_to_datetime,
    '${i18n.text("KeyManager.ViewDialog.label.certificateEndDate")}': summary.certificateEndDate?number_to_datetime,
    '${i18n.text("KeyManager.ViewDialog.label.certificateExpiration")}': certificate_expiration,
    '${i18n.text("KeyManager.ViewDialog.label.certificateSignature")}': summary.certificateSignature!"",
    '${i18n.text("KeyManager.ViewDialog.label.signatureAlgorithm")}': summary.certificateSignatureAlgorithm!"",
    '${i18n.text("KeyManager.ViewDialog.label.keyUsages")}': certificate_key_usages,
    '${i18n.text("KeyManager.ViewDialog.label.extendedKeyUsages")}': certificate_extended_key_usages,
    '${i18n.text("KeyManager.ViewDialog.label.revoked")}': summary.revoked,
    '${i18n.text("KeyManager.ViewDialog.label.revocationListUrls")}': summary.revocationListUrls!""
} />