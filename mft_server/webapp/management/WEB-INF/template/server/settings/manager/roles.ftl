<div id="acl-roles-fields" class="easyui-layout" data-options="fit:true,doSize:false,border:false">
    <div data-options="region:'center',border:false">
        <@form.datagrid name="roles" height="" columns=["name"]; col><@i18n.message key="Roles.column.${col}" /></@>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar toolbar-management inline">
            <@form.button name="add"><@i18n.message key="Roles.button.add" /></@>
            <@form.button name="edit"><@i18n.message key="Roles.button.edit" /></@>
            <@form.button name="copy"><@i18n.message key="Roles.button.copy" /></@>
            <@form.button name="delete"><@i18n.message key="Roles.button.delete" /></@>
        </div>
    </div>
</div>
