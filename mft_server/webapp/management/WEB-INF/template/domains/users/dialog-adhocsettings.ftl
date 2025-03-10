<@form.dialog id="d-adhoc-settings" title=i18n.text("UserInfo.AdHocSettingsDialog.title") header=i18n.text("UserInfo.AdHocSettingsDialog.title")>
    <fieldset class="noborder pane">
        <legend class="hidden-label"><@i18n.message key="UserInfo.AdHocSettingsDialog.title" /></legend>
        <div class="checkbox"><@form.checkbox name="permissions" value="EXTERNAL"><@i18n.message key="UserInfo.AdHocSettingsDialog.label.external" /></@></div>
        <div class="checkbox"><@form.checkbox name="permissions" value="INTERNAL"><@i18n.message key="UserInfo.AdHocSettingsDialog.label.internal" /></@></div>
        <div class="checkbox"><@form.checkbox name="permissions" value="ANONYMOUS"><@i18n.message key="UserInfo.AdHocSettingsDialog.label.anonymous" /></@></div>
    </fieldset>
</@form.dialog>