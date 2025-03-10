<div id="global-services-fields">
    <div data-options="region:'center',border:false">
        <@form.datagrid name="services" height="" columns=["protocol", "host", "port", "key", "details", "status"]; col><@i18n.message key="GlobalServices.column.${col}" /></@>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar inline">
            <div class="toolbar-selection">
                <@form.button name="refresh"><@i18n.message "GlobalServices.button.refresh" /></@>
                <@form.button name="start"><@i18n.message "GlobalServices.button.start" /></@>
                <@form.button name="stop"><@i18n.message "GlobalServices.button.stop" /></@>
            </div>
            <div class="toolbar-management">
                <@form.button name="add"><@i18n.message "GlobalServices.button.add" /></@>
                <@form.button name="edit"><@i18n.message "GlobalServices.button.edit" /></@>
                <@form.button name="delete"><@i18n.message "GlobalServices.button.delete" /></@>
            </div>
        </div>
    </div>
</div>