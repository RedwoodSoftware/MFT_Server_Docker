<#ftl strip_whitespace=true>

<div id="account-users-fields">

    <div data-options="region:'center',border:false">
        <@form.datagrid name="users" height="" columns=["name", "login", "email", "owner", "company"]; col><@i18n.message key="Users.column.${col}" /></@>
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