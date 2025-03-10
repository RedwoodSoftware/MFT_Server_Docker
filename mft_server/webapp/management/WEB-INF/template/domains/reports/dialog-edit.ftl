<@form.dialog id="d-reports-edit" title=i18n.text("Reports.EditDialog.title")>
    <@form.fields name="reportfields" title=i18n.text("Reports.EditDialog.info.short") description=i18n.text("Reports.EditDialog.info.long")>
        <div><@form.memo name="description"><@i18n.message key="Reports.label.description" /></@></div>
        <div><#include "metricses.ftl" /></div>
        <div class="checkbox"><@form.checkbox name="usesearch"><@i18n.message key="Reports.label.useSearch" /></@>&nbsp;<select name="searchname"></select></div>
        <div class="checkbox"><@form.checkbox name="rerunsearch"><@i18n.message key="Reports.label.reRunSearch" /></@></div>
    </@form.fields>
</@form.dialog>