<#ftl strip_whitespace=true>

<div id="account-url-branding-fields">

    <div data-options="region:'center',border:false">
        <@form.datagrid name="urlbranding" height="" columns=["name", "url", "owner"]; col><@i18n.message key="UrlBranding.column.${col}" /></@>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar">
            <div class="toolbar-management">
                <@form.button name="add"><@i18n.message key="Application.button.add" /></@>
                <@form.button name="edit"><@i18n.message key="Application.button.edit" /></@>
                <@form.button name="delete"><@i18n.message key="Application.button.delete" /></@>
            </div>
        </div>
    </div>

</div>