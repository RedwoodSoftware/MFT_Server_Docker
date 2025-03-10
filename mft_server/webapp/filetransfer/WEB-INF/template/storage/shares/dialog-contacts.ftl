<@form.dialog id="d-contacts-add" title=i18n.text('Contacts.AddDialog.title')>
    <@form.fields name="contactfields" title=i18n.text('Contacts.AddDialog.info.short')?html description=i18n.text('Contacts.AddDialog.info.long')?html>
        <div><@form.text name="name" required="true"><@i18n.message key="Contacts.label.name" /></@></div>
        <div><@form.email name="email" required="true" autocomplete="off"><@i18n.message key="Contacts.label.email" /></@></div>
        <div><@form.text name="company"><@i18n.message key="Contacts.label.company" /></@></div>
    </@form.fields>
</@form.dialog>
