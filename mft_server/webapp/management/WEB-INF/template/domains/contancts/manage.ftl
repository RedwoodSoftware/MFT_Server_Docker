<div id="contacts-list-fields">
    <div data-options="region:'center',border:false">
        <@form.datagrid name="contacts" height="" columns=["name", "company", "email", "owner", "tags"]; col><@i18n.message key="Contacts.column.${col}" /></@>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar inline">
        <#if permissions.contactsControllAllowed>
            <div class="toolbar-selection">
                <@form.button name="import"><@i18n.message key="Contacts.button.import" /></@>
            </div>
            <div class="toolbar-management">
                <@form.button name="add"><@i18n.message key="Contacts.button.add" /></@>
                <@form.button name="edit"><@i18n.message key="Contacts.button.edit" /></@>
                <@form.button name="delete"><@i18n.message key="Contacts.button.delete" /></@>
            </div>
        </#if>
        </div>
    </div>
</div>