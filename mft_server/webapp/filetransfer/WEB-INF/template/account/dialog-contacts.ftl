<@form.dialog id="d-contacts-add" title=i18n.text('Contacts.AddDialog.title')?html escapeAttrs=false>
    <@form.fields name="contactfields" title=i18n.text('Contacts.AddDialog.info.short') description=i18n.text('Contacts.AddDialog.info.long')>
        <div><@form.text name="name" required="true"><@i18n.message key="Contacts.label.name" /></@></div>
        <div><@form.email name="email" required="true" autocomplete="off"><@i18n.message key="Contacts.label.email" /></@></div>
        <div><@form.text name="company"><@i18n.message key="Contacts.label.company" /></@></div>
        <#if model.permission.publicContactCreationAllowed>
            <div class="row"><@form.checkbox name="public"><@i18n.message key="Contacts.label.public" /></@></div>
        </#if>
    </@form.fields>
</@form.dialog>

<@form.dialog id="d-contacts-edit" title=i18n.text('Contacts.EditDialog.title')?html escapeAttrs=false>
    <@form.fields name="contactfields" title=i18n.text('Contacts.EditDialog.info.short') description=i18n.text('Contacts.EditDialog.info.long')>
        <div><@form.text name="name" required="true"><@i18n.message key="Contacts.label.name" /></@></div>
        <div><@form.email name="email" required="true" autocomplete="off"><@i18n.message key="Contacts.label.email" /></@></div>
        <div><@form.text name="company"><@i18n.message key="Contacts.label.company" /></@></div>
        <#if model.permission.publicContactCreationAllowed>
            <div class="row"><@form.checkbox name="public"><@i18n.message key="Contacts.label.public" /></@></div>
        </#if>
    </@form.fields>
</@form.dialog>