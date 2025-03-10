<@form.dialog id="d-triggertemplate-copy" title=i18n.text("Triggers.CopyTemplateDialog.title") header=i18n.text("Triggers.CopyTemplateDialog.info.short") description=i18n.text("Triggers.CopyTemplateDialog.info.long")>
    <fieldset class="noborder pane">
        <div><@form.dn name="name" required=true><@i18n.message key="Triggers.CopyTemplateDialog.label.name" /></@></div>
        <div class="checkbox"><@form.checkbox name="editafterdone"><@i18n.message key="Triggers.CopyTemplateDialog.label.editAfterCopying" /></@></div>
    </fieldset>
</@form.dialog>

<@form.dialog id="d-triggertemplate-import" title=i18n.text("Triggers.ImportTemplatesDialog.title") header=i18n.text("Triggers.ImportTemplatesDialog.info.short") description=i18n.text("Triggers.ImportTemplatesDialog.info.long")>
    <fieldset class="noborder pane">
        <div><@form.input type="text" name="file" required=true><@i18n.message key="Triggers.ImportTemplatesDialog.label.file" /></@></div>
        <div class="checkbox"><@form.checkbox name="overwrite"><@i18n.message key="Triggers.ImportTemplatesDialog.label.overwrite" /></@></div>
    </fieldset>
</@form.dialog>

<@form.dialog id="d-triggertemplate-export" disabled=!permissions.triggersControlAllowed title=i18n.text("Triggers.ExportTemplatesDialog.title") header=i18n.text("Triggers.ExportTemplatesDialog.info.short") description=i18n.text("Triggers.ExportTemplatesDialog.info.long")>
    <fieldset class="noborder pane">
        <div><@form.dn name="filename" required=true><@i18n.message key="Triggers.ExportTemplatesDialog.label.file" /></@></div>
    </fieldset>
</@form.dialog>

<@form.dialog id="d-triggertemplate-promote" disabled=!permissions.triggersControlAllowed title=i18n.text("Triggers.PromoteTemplatesDialog.title") header=i18n.text("Triggers.PromoteTemplatesDialog.info.short") description=i18n.text("Triggers.PromoteTemplatesDialog.info.long")>
    <fieldset class="noborder pane">
        <div><@form.host name="host" required=true><@i18n.message key="Triggers.PromoteTemplatesDialog.label.host" /></@></div>
        <div><@form.port name="port" required=true><@i18n.message key="Triggers.PromoteTemplatesDialog.label.port" /></@></div>
        <div><@form.username name="login" required=true><@i18n.message key="Triggers.PromoteTemplatesDialog.label.user" /></@></div>
        <div><@form.text name="pwd" maxength="255"><@i18n.message key="Triggers.PromoteTemplatesDialog.label.password" /></@></div>
        <div><@form.dn name="domain" required=true><@i18n.message key="Triggers.PromoteTemplatesDialog.label.domain" /></@></div>
        <div class="checkbox"><@form.checkbox name="overwrite"><@i18n.message key="Triggers.PromoteTemplatesDialog.label.overwrite" /></@></div>
    </fieldset>
</@form.dialog>