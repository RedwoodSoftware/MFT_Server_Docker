<div id="url-branding-fields">
    <div data-options="region:'center',border:false">
        <@form.datagrid name="urlbranding" height="" columns=["name", "owner", "url", "tags"]; col><@i18n.message key="UrlBranding.column.${col}" /></@>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar inline">
            <div class="toolbar-selection">
                <@form.button name="copylink" ariaHaspopup="true"><@i18n.message key="UrlBranding.button.copyLink" /></@>
            </div>
            <div class="toolbar-management">
                <@form.button name="add"><@i18n.message key="UrlBranding.button.add" /></@>
                <@form.button name="edit"><@i18n.message key="UrlBranding.button.edit" /></@>
                <@form.button name="logo"><@i18n.message key="UrlBranding.button.logo" /></@>
                <@form.button name="delete"><@i18n.message key="UrlBranding.button.delete" /></@>
            </div>
        </div>
    </div>
</div>


