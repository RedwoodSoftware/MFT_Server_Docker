<@form.dialog id="d-triggers-import" title=i18n.text("Triggers.ImportDialog.title") header=i18n.text("Triggers.ImportDialog.info.short") description=i18n.text("Triggers.ImportDialog.info.long")>
    <fieldset class="noborder pane">
        <div><@form.input type="text" name="file" required=true><@i18n.message key="Triggers.ImportDialog.label.file" /></@></div>
        <div class="checkbox"><@form.checkbox name="overwrite"><@i18n.message key="Triggers.ImportDialog.label.overwrite" /></@></div>
    </fieldset>
</@form.dialog>

<@form.dialog id="d-triggers-export" disabled=!permissions.triggersControlAllowed title=i18n.text("Triggers.ExportDialog.title") header=i18n.text("Triggers.ExportDialog.info.short") description=i18n.text("Triggers.ExportDialog.info.long")>
    <fieldset class="noborder pane">
        <div><@form.dn name="filename" required=true><@i18n.message key="Triggers.ExportDialog.label.file" /></@></div>
        <div class="checkbox"><@form.checkbox name="excludepwd"><@i18n.message key="Triggers.ExportDialog.label.excludePassword" /></@></div>
    </fieldset>
</@form.dialog>

<@form.dialog id="d-triggers-promote" disabled=!permissions.triggersControlAllowed title=i18n.text("Triggers.PromoteDialog.title") header=i18n.text("Triggers.PromoteDialog.info.short") description=i18n.text("Triggers.PromoteDialog.info.long")>
    <fieldset class="noborder pane">
        <div><@form.host name="host" required=true><@i18n.message key="Triggers.PromoteDialog.label.host" /></@></div>
        <div><@form.port name="port" required=true><@i18n.message key="Triggers.PromoteDialog.label.port" /></@></div>
        <div><@form.username name="login" required=true><@i18n.message key="Triggers.PromoteDialog.label.user" /></@></div>
        <div><@form.text name="pwd" maxength="255"><@i18n.message key="Triggers.PromoteDialog.label.password" /></@></div>
        <div><@form.dn name="domain" required=true><@i18n.message key="Triggers.PromoteDialog.label.domain" /></@></div>
        <div class="checkbox"><@form.checkbox name="overwrite"><@i18n.message key="Triggers.PromoteDialog.label.overwrite" /></@></div>
    </fieldset>
</@form.dialog>