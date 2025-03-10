<fieldset>
    <legend><@i18n.message key="ReverseProxies.legend.connection" /></legend>
    <div><@form.dn name="endpoint" required=true description=i18n.text("ReverseProxies.IbmCloud.label.endPoint.description") example=i18n.text("ReverseProxies.IbmCloud.label.endPoint.example")><@i18n.message key="ReverseProxies.IbmCloud.label.endPoint" /></@></div>
</fieldset>

<fieldset>
    <legend><@i18n.message key="ReverseProxies.legend.authentication" /></legend>
    <div><@form.username name="username" required=true description=i18n.text("ReverseProxies.label.username.description") example=i18n.text("ReverseProxies.label.username.example")><@i18n.message key="ReverseProxies.label.username" /></@></div>
    <div><@form.dn name="userpwd" required=false description=i18n.text("ReverseProxies.label.password.description") example=i18n.text("ReverseProxies.label.password.example")><@i18n.message key="ReverseProxies.label.password" /></@></div>
</fieldset>

<fieldset class="large">
    <@form.fields_title title=i18n.text("ReverseProxies.legend.advanced")/>
    <@reverse_proxy.remote_directory />
    <@reverse_proxy.debug_directory />
</fieldset>