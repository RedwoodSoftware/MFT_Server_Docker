<@form.dialog id="d-test-auth-service" title=i18n.text("AuthenticationService.CredentialsDialog.title")>
    <@form.fields name="testauthcredentialsfields" title=i18n.text("AuthenticationService.CredentialsDialog.info.short") description=i18n.text("AuthenticationService.CredentialsDialog.info.long")>
    <dl class="group">
        <dt><@form.radio name="type" value="password"><@i18n.message key="AuthenticationService.CredentialsDialog.label.login" /></@></dt><dd><@form.username name="username"/></dd>
        <dt><@form.label><span style="padding-left:1.7em"><@i18n.message key="AuthenticationService.CredentialsDialog.label.password" /></span></@></dt><dd><@form.password name="password"/></dd>
        <dt><@form.label><span style="padding-left:1.7em"><@i18n.message key="AuthenticationService.CredentialsDialog.label.ip" /></span></@></dt><dd><@form.host name="clientip"/></dd>
        <dt><@form.radio name="type" value="token" required=true><@i18n.message key="AuthenticationService.CredentialsDialog.label.token" /></@></dt><dd><@form.dn name="token" maxlength=2048/></dd>
    </dl>
    </@form.fields>
</@form.dialog>