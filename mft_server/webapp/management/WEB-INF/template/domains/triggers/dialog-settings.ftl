<@form.dialog id="d-triggers-addglobalvar" dataOptions="disabled:${(!permissions.triggersControlAllowed)?string}" title=i18n.text("Triggers.AddVariableDialog.title") header=i18n.text("Triggers.AddVariableDialog.info.short") description=i18n.text("Triggers.AddVariableDialog.info.long")>
    <fieldset class="noborder pane">
        <div><@form.dn name="name" required=true><@i18n.message key="Triggers.AddVariableDialog.label.name" /></@></div>
        <div><@form.text name="value" maxlength="255"><@i18n.message key="Triggers.AddVariableDialog.label.value" /></@></div>
    </fieldset>
</@form.dialog>