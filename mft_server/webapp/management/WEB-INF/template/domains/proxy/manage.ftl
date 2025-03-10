<div id="network-storage-fields">
    <div data-options="region:'center',border:false">
        <@form.datagrid name="networkstorage" height="" columns=["name", "protocol", "host", "port", "username", "remoteDirectory", "details", "tags"]; col><@i18n.message key="ReverseProxies.column.${col}" /></@>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar toolbar-management inline">
            <@form.button name="add"><@i18n.message "ReverseProxies.button.add" /></@>
            <@form.button name="edit"><@i18n.message "ReverseProxies.button.edit" /></@>
            <@form.button name="test"><@i18n.message "ReverseProxies.button.test" /></@>
            <@form.button name="delete"><@i18n.message "ReverseProxies.button.delete" /></@>
        </div>
    </div>
</div>

