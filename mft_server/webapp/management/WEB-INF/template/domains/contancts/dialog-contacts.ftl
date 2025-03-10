<#if permissions.contactsControllAllowed>
<@form.dialog id="d-contact-add" title=i18n.text("Contacts.AddDialog.title")>
    <@form.fields name="contactfields" title=i18n.text("Contacts.AddDialog.info.short") description=i18n.text("Contacts.AddDialog.info.long")>
        <div><@form.dn name="name" required=true maxlength="50" size="40"><@i18n.message "Contacts.label.name" /></@></div>
        <div><@form.email name="email" required=true size="40"><@i18n.message "Contacts.label.email" /></@></div>
        <div><@form.text name="company" maxlength="255" size="40"><@i18n.message "Contacts.label.company" /></@></div>
        <div><@form.checkbox name="ownedby"><@i18n.message "Contacts.label.owner" /></@><select name="owner"></select></div>
        <div><@form.select name="tags" items=[]><@i18n.message key="Contacts.label.tags" /></@></div>
    </@form.fields>
</@form.dialog>
</#if>

<#if permissions.contactsControllAllowed>
<@form.dialog id="d-contact-edit" title=i18n.text("Contacts.EditDialog.title")>
    <@form.fields name="contactfields" title=i18n.text("Contacts.EditDialog.info.short") description=i18n.text("Contacts.EditDialog.info.long")>
        <div><@form.dn name="name" required=true maxlength="50" size="40"><@i18n.message "Contacts.label.name" /></@></div>
        <div><@form.email name="email" required=true size="40"><@i18n.message "Contacts.label.email" /></@></div>
        <div><@form.text name="company" maxlength="255" size="40"><@i18n.message "Contacts.label.company" /></@></div>
        <div><@form.checkbox name="ownedby"><@i18n.message key="Contacts.label.owner" /></@><select name="owner"></select></div>
        <div><@form.select name="tags" items=[]><@i18n.message key="Contacts.label.tags" /></@></div>
    </@form.fields>
</@form.dialog>
</#if>

<#if permissions.contactsControllAllowed>
<@form.dialog id="d-contacts-import" title=i18n.text("Contacts.ImportDialog.title")>
    <@form.fields name="contactsimportfields" title=i18n.text("Contacts.ImportDialog.info.short") description=i18n.text("Contacts.ImportDialog.info.long")>
        <div><@form.input type="text" name="file" required=true><@i18n.message key="Contacts.ImportDialog.label.file" /></@></div>
    </@form.fields>
</@form.dialog>
</#if>