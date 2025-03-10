<div id="domain-services-fields">
    <div data-options="region:'center',border:false">
        <@form.datagrid name="services" height="" columns=["protocol", "host", "port", "key", "details", "status"]; col><@i18n.message key="Services.column.${col}" /></@>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar toolbar-management inline">
            <@form.button name="add"><@i18n.message "Services.button.add" /></@>
            <@form.button name="edit"><@i18n.message "Services.button.edit" /></@>
            <@form.button name="delete"><@i18n.message "Services.button.delete" /></@>
        </div>
    </div>
</div>