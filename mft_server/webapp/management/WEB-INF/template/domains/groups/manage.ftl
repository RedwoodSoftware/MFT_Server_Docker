<div id="groups-fields">
    <div data-options="region:'center',border:false">
    <@form.datagrid name="groups" height="" columns=["name", "tags"]; col><@i18n.message key="Groups.column.${col}" /></@>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar inline">
            <div class="toolbar-selection">
                <@form.button name="email"><@i18n.message key="Groups.button.email" /></@>
            </div>
            <div class="toolbar-management">
                <@form.button name="add"><@i18n.message key="Groups.button.add" /></@>
                <@form.button name="edit"><@i18n.message key="Groups.button.edit" /></@>
                <@form.button name="users"><@i18n.message key="Groups.button.users" /></@>
                <@form.button name="copy"><@i18n.message key="Groups.button.copy" /></@>
                <@form.button name="delete"><@i18n.message key="Groups.button.delete" /></@>
            </div>
        </div>
    </div>
</div>

