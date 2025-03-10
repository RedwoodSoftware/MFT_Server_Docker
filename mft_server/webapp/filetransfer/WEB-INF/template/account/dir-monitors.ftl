<#ftl strip_whitespace=true>

<div id="account-dir-monitors-fields">

    <div data-options="region:'center',border:false">
        <@form.datagrid name="dirmonitors" height="" columns=["path", "quota"]; col><@i18n.message key="Quotas.column.${col}" /></@>
    </div>

</div>
