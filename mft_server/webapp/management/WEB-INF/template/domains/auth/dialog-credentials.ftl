<@form.dialog id="d-auth-credentials" title=i18n.text("Authentication.CredentialsDialog.title")>
    <@form.fields name="testauthcredentialsfields" title=i18n.text("Authentication.CredentialsDialog.info.short") description=i18n.text("Authentication.CredentialsDialog.info.long")>
        <div><@form.username name="username"><@i18n.message key="Authentication.CredentialsDialog.label.login" /></@></div>
        <div><@form.password name="password"><@i18n.message key="Authentication.CredentialsDialog.label.password" /></@></div>
        <div><@form.host name="clientip"><@i18n.message key="Authentication.CredentialsDialog.label.ip" /></@></div>
    </@form.fields>
</@form.dialog>