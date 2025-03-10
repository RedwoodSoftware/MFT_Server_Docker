<#ftl strip_whitespace=true>

<fieldset name="vfsfields" role="presentation">
    <legend><@i18n.message key="Users.legend.paths" /></legend>
    <div><@form.datagrid name="paths" columns=["path", "location", "permissions"]; col><@i18n.message key="Users.column.${col}" /></@></div>

    <div class="viewpane-toolbar">
        <div class="toolbar-selection">
            <@form.button name="moveup"><@i18n.message key="Application.button.up" /></@>
            <@form.button name="movedown"><@i18n.message key="Application.button.down" /></@>
        </div>
        <div class="toolbar-management">
            <@form.button name="add" ariaHaspopup="true"><@i18n.message key="Application.button.add" /></@>
            <@form.button name="edit" ariaHaspopup="true"><@i18n.message key="Application.button.edit" /></@>
            <@form.button name="delete" ariaHaspopup="true"><@i18n.message key="Application.button.delete" /></@>
        </div>
    </div>
</fieldset>
