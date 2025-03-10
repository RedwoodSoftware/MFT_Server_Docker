<@form.dialog id="d-triggers-copy" title=i18n.text("Triggers.CopyDialog.title") header=i18n.text("Triggers.CopyDialog.info.short") description=i18n.text("Triggers.CopyDialog.info.long")>
    <fieldset class="noborder pane">
        <div><@form.dn name="name" required=true><@i18n.message key="Triggers.CopyDialog.label.name" /></@></div>
        <div class="checkbox"><@form.checkbox name="editafterdone"><@i18n.message key="Triggers.CopyDialog.label.editAfterCopying" /></@></div>
    </fieldset>
</@form.dialog>

<@form.dialog id="d-triggers-run" title=i18n.text("Triggers.RunDialog.title") header=i18n.text("Triggers.RunDialog.info.short") description=i18n.text("Triggers.RunDialog.info.long")>
    <fieldset class="noborder pane">
        <div><@form.datagrid name="runparameteres" columns=["variable", "value"]; col><@i18n.message key="Triggers.column.${col}" /></@></div>
    </fieldset>
</@form.dialog>

<@form.dialog id="d-triggers-rerun" title=i18n.text("Triggers.RerunDialog.title") header=i18n.text("Triggers.RerunDialog.info.short") description=i18n.text("Triggers.RerunDialog.info.long")>
    <fieldset class="noborder pane">
        <div class="radio"><@form.radio name="restartmode" value="all"><@i18n.message key="Triggers.RerunDialog.label.rerunAll" /></@></div>
        <div class="radio"><@form.radio name="restartmode" value="fromfailure"><@i18n.message key="Triggers.RerunDialog.label.rerunFromFailure" /></@></div>
        <div class="checkbox"><@form.checkbox name="maintainvars"><@i18n.message key="Triggers.RerunDialog.label.maintainVariables" /></@></div>
        <div class="checkbox"><@form.checkbox name="maintainglobalvars"><@i18n.message key="Triggers.RerunDialog.label.maintainGlobalVariables" /></@></div>
    </fieldset>
</@form.dialog>