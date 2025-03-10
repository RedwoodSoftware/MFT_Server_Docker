<div id="domain-users-fields">
    <div data-options="region:'center',border:false">
        <@form.datagrid name="users" height="" columns=["name", "login", "lasLogin", "owner", "company", "admin", "tags"]; col><@i18n.message "Users.column.${col}"/></@>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar inline">
        <#if permissions.accountsControlAllowed>
            <div class="toolbar-selection">
                <@form.button name="report"><@i18n.message key="Users.button.report" /></@>
                <@form.button name="email"><@i18n.message key="Users.button.email" /></@>
                <@form.button name="import"><@i18n.message key="Users.button.import" /></@>
                <@form.button name="export"><@i18n.message key="Users.button.export" /></@>
                <@form.button name="promote"><@i18n.message key="Users.button.promote" /></@>
            </div>
            <div class="toolbar-management">
                <@form.button name="add"><@i18n.message key="Users.button.add" /></@>
                <@form.button name="edit"><@i18n.message key="Users.button.edit" /></@>
                <@form.button name="copy"><@i18n.message key="Users.button.copy" /></@>
                <@form.button name="quotas"><@i18n.message key="Users.button.quotas" /></@>
                <@form.button name="delete"><@i18n.message key="Users.button.delete" /></@>
            </div>
        <#else>
            <div class="toolbar-selection">
                <@form.button name="report"><@i18n.message key="Users.button.report" /></@>
                <@form.button name="email"><@i18n.message key="Users.button.email" /></@>
                <@form.button name="export"><@i18n.message key="Users.button.export" /></@>
            </div>
            <div class="toolbar-management">
                <@form.button name="quotas"><@i18n.message key="Users.button.quotas" /></@>
            </div>
        </#if>
        </div>
    </div>
</div>