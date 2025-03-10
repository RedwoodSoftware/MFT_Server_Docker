<fieldset class="large">
    <@form.fields_title title=i18n.text("ReverseProxies.legend.connection")/>
    <div><@form.host name="host" description=i18n.text("ReverseProxies.label.host.description") example=i18n.text("ReverseProxies.label.host.example")><@i18n.message key="ReverseProxies.label.host" /></@></div>
    <div><@form.port name="port" description=i18n.text("ReverseProxies.label.port.description") example=i18n.text("ReverseProxies.SFTP.label.port.example")><@i18n.message key="ReverseProxies.label.port" /></@></div>
    <div><@form.number name="timeout" maxlength="2" description=i18n.text("ReverseProxies.label.timeout.description") example=i18n.text("ReverseProxies.label.timeout.example")><@i18n.message key="ReverseProxies.label.timeout" /></@>&nbsp;<span><@i18n.message key="ReverseProxies.label.timeout.unit" /></span></div>
    <div class="checkbox"><@form.checkbox name="tcpnodelay" description=i18n.text("ReverseProxies.label.tcpNoDelay.description") example=i18n.text("ReverseProxies.label.tcpNoDelay.example")><@i18n.message key="ReverseProxies.label.tcpNoDelay" /></@></div>
</fieldset>

<fieldset class="large">
    <@form.fields_title title=i18n.text("ReverseProxies.legend.authentication")/>
    <div class="radio">
        <@form.radio name="credentials" value="enter" description=i18n.text("ReverseProxies.label.enterCredentials.description") example=i18n.text("ReverseProxies.label.enterCredentials.example")><@i18n.message key="ReverseProxies.label.enterCredentials" /></@>&nbsp;&nbsp;
        <@form.radio name="credentials" value="replay" description=i18n.text("ReverseProxies.label.replayCredentials.description") example=i18n.text("ReverseProxies.label.replayCredentials.example")><@i18n.message key="ReverseProxies.label.replayCredentials" /></@>
    </div>
    <div><@form.username name="username" description=i18n.text("ReverseProxies.label.username.description") example=i18n.text("ReverseProxies.label.username.example")><@i18n.message key="ReverseProxies.label.username" /></@></div>
    <div><@form.password name="userpwd" description=i18n.text("ReverseProxies.label.password.description") example=i18n.text("ReverseProxies.label.password.example")><@i18n.message key="ReverseProxies.label.password" /></@></div>
    <div><@form.select name="publickeyalgorithm" items=sftpPublicKeyAlgorithms description=i18n.text("ReverseProxies.label.publicKeyAlgorithm.description") example=i18n.text("ReverseProxies.label.publicKeyAlgorithm.example")><@i18n.message key="ReverseProxies.label.publicKeyAlgorithm" /></@></div>
    <@reverse_proxy.use_client_key />
</fieldset>

<fieldset class="large">
    <legend><@i18n.message key="ReverseProxies.legend.proxy" /></legend>
    <@reverse_proxy.proxy auth=true />
</fieldset>

<fieldset>
    <legend><@i18n.message key="ReverseProxies.legend.ssh" /></legend>
    <@reverse_proxy.use_host_key />
    <div class="checkbox"><@form.checkbox name="startsubsystemreply" description=i18n.text("ReverseProxies.label.startSubsystemReplyRequired.description") example=i18n.text("ReverseProxies.label.startSubsystemReplyRequired.example")><@i18n.message key="ReverseProxies.label.startSubsystemReplyRequired" /></@></div>
</fieldset>

<fieldset class="x-large">
    <@form.fields_title title=i18n.text("ReverseProxies.legend.advanced")/>
    <@reverse_proxy.remote_directory />
    <@reverse_proxy.debug_directory />
    <@reverse_proxy.max_age />
    <div><@form.checkbox name="adaptivemode" description=i18n.text("ReverseProxies.label.useAdaptiveMode.description") example=i18n.text("ReverseProxies.label.useAdaptiveMode.example")><@i18n.message key="ReverseProxies.label.useAdaptiveMode" /></@></div>
</fieldset>