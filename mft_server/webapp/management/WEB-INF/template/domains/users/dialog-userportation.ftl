<#if permissions.accountsControlAllowed>
<@form.dialog id="d-users-import" title=i18n.text("Users.ImportDialog.title") header=i18n.text("Users.ImportDialog.info.short") description=i18n.text("Users.ImportDialog.info.long")>
    <fieldset class="noborder pane">
        <div><@form.input type="text" name="file" required=true><@i18n.message key="Users.ImportDialog.label.file" /></@></div>
        <div class="checkbox"><@form.checkbox name="overwrite"><@i18n.message key="Users.ImportDialog.label.overwrite" /></@></div>
    </fieldset>
</@form.dialog>
</#if>

<@form.dialog id="d-users-export" title=i18n.text("Users.ExportDialog.title") header=i18n.text("Users.ExportDialog.info.short") description=i18n.text("Users.ExportDialog.info.long")>
    <fieldset class="noborder pane">
        <div><@form.dn name="filename" required=true><@i18n.message key="Users.ExportDialog.label.file" /></@></div>
    </fieldset>
</@form.dialog>

<#if permissions.accountsControlAllowed>
<@form.dialog id="d-users-promote" title=i18n.text("Users.PromoteDialog.title") header=i18n.text("Users.PromoteDialog.info.short") description=i18n.text("Users.PromoteDialog.info.long")>
    <fieldset class="noborder pane">
        <div><@form.host name="host" required=true><@i18n.message key="Users.PromoteDialog.label.host" /></@></div>
        <div><@form.port name="port" required=true><@i18n.message key="Users.PromoteDialog.label.port" /></@></div>
        <div><@form.username name="login" required=true><@i18n.message key="Users.PromoteDialog.label.user" /></@></div>
        <div><@form.text name="pwd" maxength="255"><@i18n.message key="Users.PromoteDialog.label.password" /></@></div>
        <div><@form.dn name="domain" required=true><@i18n.message key="Users.PromoteDialog.label.domain" /></@></div>
        <div class="checkbox"><@form.checkbox name="overwrite"><@i18n.message key="Users.PromoteDialog.label.overwrite" /></@></div>
    </fieldset>
</@form.dialog>
</#if>