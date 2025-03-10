<@form.dialog id="d-bannedfiles-rule">
    <@form.fields name="bannedfilesrulefields" title=i18n.text("BannedFiles.RuleDialog.info.short") description=i18n.text("BannedFiles.RuleDialog.info.long") disabled=!permissions.bannedFilesControlAllowed>

        <div><@form.path name="path" required="true"><@i18n.message key="BannedFiles.RuleDialog.label.path" /></@></div>
        <div class="checkbox"><@form.checkbox name="recursive"><@i18n.message key="BannedFiles.RuleDialog.label.recursive" /></@></div>
        <div><@form.text name="pattern" required="true"><@i18n.message key="BannedFiles.RuleDialog.label.pattern" /></@></div>
        <div>
            <label for="d-bf-sc"><@i18n.message key="BannedFiles.RuleDialog.label.scope" /></label>
            <select name="scope" id="d-bf-sc"></select>
        </div>
    </@form.fields>
</@form.dialog>