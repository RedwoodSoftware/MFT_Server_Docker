<@form.dialog id="d-proxies-test" title=i18n.text("ReverseProxies.TestDialog.title")>
    <@form.fields name="testnetworkstoragefields" title=i18n.text("ReverseProxies.TestDialog.info.short") description=i18n.text("ReverseProxies.TestDialog.info.long")>

        <div><@form.username name="username"><@i18n.message key="ReverseProxies.TestDialog.label.login" /></@></div>
        <div><@form.text name="password" maxength="255"><@i18n.message key="ReverseProxies.TestDialog.label.password" /></@></div>
    </@form.fields>
</@form.dialog>