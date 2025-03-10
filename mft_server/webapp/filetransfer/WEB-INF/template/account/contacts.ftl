<#ftl strip_whitespace=true>

<div id="account-contacts-fields">

    <div data-options="region:'center',border:false">
        <@form.datagrid name="contacts" height="" columns=["name", "company", "email", "owner"]; col><@i18n.message key="Contacts.column.${col}" /></@>
    </div>

    <#if model.permission.contactsControlAllowed>
        <div data-options="region:'south',border:false" class="layout-pane-bottom">
            <div class="viewpane-toolbar">
                <div class="toolbar-management">
                    <@form.button name="add" ariaHaspopup="true"><@i18n.message key="Application.button.add" /></@>
                    <@form.button name="edit" ariaHaspopup="true"><@i18n.message key="Application.button.edit" /></@>
                    <@form.button name="delete" ariaHaspopup="true"><@i18n.message key="Application.button.delete" /></@>
                </div>
            </div>
        </div>
    </#if>

</div>





