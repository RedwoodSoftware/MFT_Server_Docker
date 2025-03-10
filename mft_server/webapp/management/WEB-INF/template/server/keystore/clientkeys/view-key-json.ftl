<#ftl strip_whitespace=true>
<#import "/WEB-INF/tags/json.ftl" as json>
<#import "/WEB-INF/tags/message.ftl" as i18n>
<#-- @ftlvariable name="summary" type="com.jscape.inet.mftserver.operation.keys.PublicKeySummary" -->
<@json.stringify {
    '${i18n.text("KeyManager.ViewDialog.label.alias")}': summary.name!"",
    '${i18n.text("KeyManager.ViewDialog.label.keyAlgorithm")}': summary.keyAlgorithm!"",
    '${i18n.text("KeyManager.ViewDialog.label.keySize")}': summary.keySize?c + " " + i18n.text("KeyManager.ViewDialog.label.keySizeUnit"),
    '${i18n.text("KeyManager.ViewDialog.label.fingerprint")}': summary.fingerprint!"",
    '${i18n.text("KeyManager.ViewDialog.label.sshFingerprint")}': summary.sshFingerprint!""
} />