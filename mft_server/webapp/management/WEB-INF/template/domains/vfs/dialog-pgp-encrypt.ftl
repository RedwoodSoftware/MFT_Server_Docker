<@form.dialog id="d-vfs-pgpencrypt" title=i18n.text("VirtualFiles.PgpSettingsDialog.title") header=i18n.text("VirtualFiles.PgpSettingsDialog.info.short") description=i18n.text("VirtualFiles.PgpSettingsDialog.info.long")>
    <fieldset class="noborder pane">
        <div class="radio">
            <@form.radio name="type" value="user" checked=""><@i18n.message key="VirtualFiles.PgpSettingsDialog.label.userKey" /></@>
        </div>
        <div class="radio">
            <@form.radio name="type" value="system"><@i18n.message key="VirtualFiles.PgpSettingsDialog.label.systemKey" /></@>
            <select name="systemkeys" tabindex="0"></select>
        </div>
    </fieldset>
</@form.dialog>