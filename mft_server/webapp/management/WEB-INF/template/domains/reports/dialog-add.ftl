<@form.dialog id="d-reports-add" title=i18n.text("Reports.AddDialog.title")>
    <@form.fields name="reportfields" title=i18n.text("Reports.AddDialog.info.short") description=i18n.text("Reports.AddDialog.info.long")>
        <div><@form.dn name="name" size="40" required=true><@i18n.message key="Reports.label.name" /></@></div>
        <div><@form.memo name="description"><@i18n.message key="Reports.label.description" /></@></div>
        <div><#include "metricses.ftl" /></div>
        <div class="checkbox"><@form.checkbox name="usesearch"><@i18n.message key="Reports.label.useSearch" /></@>&nbsp;<select name="searchname"></select></div>
        <div class="checkbox"><@form.checkbox name="rerunsearch"><@i18n.message key="Reports.label.reRunSearch" /></@></div>
    </@form.fields>
</@form.dialog>