<#ftl strip_whitespace=true>
<#import "/WEB-INF/tags/json.ftl" as json>
<#import "/WEB-INF/tags/message.ftl" as i18n>
<#-- @ftlvariable name="summary" type="com.jscape.inet.mftserver.operation.actioncenter.KeySuccessFactorData" -->
<@json.stringify {
    '${i18n.text("ActionCenter.ViewDialog.label.category")}': summary.category!"",
    '${i18n.text("ActionCenter.ViewDialog.label.section")}': summary.section!"",
    '${i18n.text("ActionCenter.ViewDialog.label.reportId")}': summary.reportId!"",
    '${i18n.text("ActionCenter.ViewDialog.label.date")}': summary.creationDate?number_to_datetime,
    '${i18n.text("ActionCenter.ViewDialog.label.date")}_timestamp': summary.creationDate,
    '${i18n.text("ActionCenter.ViewDialog.label.maturity")}': i18n.text("ActionCenter.maturity." + summary.maturityLevel?upper_case)!"",
    '${i18n.text("ActionCenter.ViewDialog.label.overview")}': summary.overview!"",
    '${i18n.text("ActionCenter.ViewDialog.label.contributingFactor")}': summary.contributingFactor!"",
    '${i18n.text("ActionCenter.ViewDialog.label.recommendation")}': summary.recommendation!""
} />