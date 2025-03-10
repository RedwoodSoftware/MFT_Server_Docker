<div id="user-templates-fields">
    <div data-options="region:'center',border:false">
        <@form.datagrid name="usertemplates" height="" columns=["name", "tags"]; col><@i18n.message "UserTemplates.column.${col}"/></@>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar toolbar-management inline">
            <@form.button name="add"><@i18n.message key="UserTemplates.button.add" /></@>
            <@form.button name="edit"><@i18n.message key="UserTemplates.button.edit" /></@>
            <@form.button name="delete"><@i18n.message key="UserTemplates.button.delete" /></@>
        </div>
    </div>
</div>