<fieldset>
    <@form.fields_title title=i18n.text("ReverseProxies.legend.connection")/>
    <div><@form.host name="host" description=i18n.text("ReverseProxies.label.host.description") example=i18n.text("ReverseProxies.label.host.example")><@i18n.message key="ReverseProxies.label.host" /></@></div>
    <div><@form.port name="port" description=i18n.text("ReverseProxies.label.port.description") example=i18n.text("ReverseProxies.SMB.label.port.example")><@i18n.message key="ReverseProxies.label.port" /></@></div>
    <div><@form.number name="timeout" maxlength="2" description=i18n.text("ReverseProxies.label.timeout.description") example=i18n.text("ReverseProxies.label.timeout.example")><@i18n.message key="ReverseProxies.label.timeout" /></@>&nbsp;<span><@i18n.message key="ReverseProxies.label.timeout.unit" /></span></div>
</fieldset>

<fieldset>
    <@form.fields_title title=i18n.text("ReverseProxies.legend.authentication")/>
    <div class="radio">
        <@form.radio name="credentials" value="enter" description=i18n.text("ReverseProxies.label.enterCredentials.description") example=i18n.text("ReverseProxies.label.enterCredentials.example")><@i18n.message key="ReverseProxies.label.enterCredentials" /></@>&nbsp;&nbsp;
        <@form.radio name="credentials" value="replay" description=i18n.text("ReverseProxies.label.replayCredentials.description") example=i18n.text("ReverseProxies.label.replayCredentials.example")><@i18n.message key="ReverseProxies.label.replayCredentials" /></@>
    </div>
    <div><@form.username name="username" description=i18n.text("ReverseProxies.label.username.description") example=i18n.text("ReverseProxies.label.username.example")><@i18n.message key="ReverseProxies.label.username" /></@></div>
    <div><@form.password name="userpwd" description=i18n.text("ReverseProxies.label.password.description") example=i18n.text("ReverseProxies.label.password.example")><@i18n.message key="ReverseProxies.label.password" /></@></div>
    <div><@form.dn name="domain" required=false description=i18n.text("ReverseProxies.label.domain.description") example=i18n.text("ReverseProxies.label.domain.example")><@i18n.message key="ReverseProxies.label.domain" /></@></div>
</fieldset>

<fieldset class="large">
    <@form.fields_title title=i18n.text("ReverseProxies.legend.advanced")/>
    <@reverse_proxy.remote_directory />
    <@reverse_proxy.debug_directory />
</fieldset>
