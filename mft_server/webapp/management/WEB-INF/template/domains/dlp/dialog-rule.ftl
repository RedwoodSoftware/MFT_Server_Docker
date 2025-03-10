<@form.dialog id="d-dlp-rule">
    <@form.fields name="dlprulefields" class="large" title=i18n.text("DlpRules.RuleDialog.info.short") description=i18n.text("DlpRules.RuleDialog.info.long") disabled=!permissions.dlpRulesControlAllowed>

        <div><@form.dn name="name" required=true><@i18n.message key="DlpRules.RuleDialog.label.name" /></@></div>
        <div><@form.text name="description" maxlength="255"><@i18n.message key="DlpRules.RuleDialog.label.description" /></@></div>
        <div>
            <label><@i18n.message key="DlpRules.RuleDialog.label.scope" /></label>
            <span class="radio">
                <label><input type="radio" name="scope" value="FILE_NAME"/><@i18n.message key="DlpRules.RuleDialog.label.filenameScope" /></label>
                <label><input type="radio" name="scope" value="FILE_CONTENTS"/><@i18n.message key="DlpRules.RuleDialog.label.fileContentsScope" /></label>
            </span>
        </div>
        <div><@form.memo name="expression" required=true><@i18n.message key="DlpRules.RuleDialog.label.expression" /></@></div>
    </@form.fields>
</@form.dialog>