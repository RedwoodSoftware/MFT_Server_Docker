<fieldset>
    <legend><@i18n.message key="ReverseProxies.legend.connection" /></legend>
    <div><@form.dn name="endpointsuffix" required=false description=i18n.text("ReverseProxies.AzureStorage.label.endPointSuffix.description") example=i18n.text("ReverseProxies.AzureStorage.label.endPointSuffix.example")><@i18n.message key="ReverseProxies.AzureStorage.label.endPointSuffix" /></@></div>
    <div class="checkbox"><@form.checkbox name="ssl" description=i18n.text("ReverseProxies.label.useSsl.description") example=i18n.text("ReverseProxies.label.useSsl.example")><@i18n.message key="ReverseProxies.label.useSsl" /></@></div>
</fieldset>

<fieldset class="large">
    <legend><@i18n.message key="ReverseProxies.legend.authentication" /></legend>

    <div class="row radio"><@form.radio name="authtype" value="USER_CREDENTIALS" description=i18n.text("ReverseProxies.label.replayCredentials.description") example=i18n.text("ReverseProxies.label.replayCredentials.example")><@i18n.message key="ReverseProxies.label.replayCredentials" /></@></div>
    <div class="row radio"><@form.radio name="authtype" value="AMI_ROLE" description=i18n.text("ReverseProxies.AzureStorage.label.useRole.description") example=i18n.text("ReverseProxies.AzureStorage.label.useRole.example")><@i18n.message key="ReverseProxies.AzureStorage.label.useRole" /></@></div>
    <div class="row">
        <div class="radio"><@form.radio name="authtype" value="CREDENTIALS" description=i18n.text("ReverseProxies.label.enterCredentials.description") example=i18n.text("ReverseProxies.label.enterCredentials.example")><@i18n.message key="ReverseProxies.label.enterCredentials" /></@></div>
        <div class="row-group">
            <div><@form.username name="username" required=false description=i18n.text("ReverseProxies.AzureStorage.label.username.description") example=i18n.text("ReverseProxies.AzureStorage.label.username.example")><@i18n.message key="ReverseProxies.AzureStorage.label.username" /></@></div>
            <div><@form.dn name="userpwd" required=false description=i18n.text("ReverseProxies.AzureStorage.label.password.description") example=i18n.text("ReverseProxies.AzureStorage.label.password.example")><@i18n.message key="ReverseProxies.AzureStorage.label.password" /></@></div>
        </div>
    </div>
</fieldset>

<fieldset class="large">
    <@form.fields_title title=i18n.text("ReverseProxies.legend.advanced")/>
    <@reverse_proxy.remote_directory />
    <@reverse_proxy.debug_directory />
</fieldset>