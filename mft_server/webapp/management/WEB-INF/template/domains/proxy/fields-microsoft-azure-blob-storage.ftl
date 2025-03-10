<fieldset>
    <legend><@i18n.message key="ReverseProxies.legend.connection" /></legend>
    <div><@form.dn name="endpointsuffix" required=false description=i18n.text("ReverseProxies.AzureBlob.label.endPointSuffix.description") example=i18n.text("ReverseProxies.AzureBlob.label.endPointSuffix.example")><@i18n.message key="ReverseProxies.AzureBlob.label.endPointSuffix" /></@></div>
    <div class="checkbox"><@form.checkbox name="ssl" description=i18n.text("ReverseProxies.label.useSsl.description") example=i18n.text("ReverseProxies.label.useSsl.example")><@i18n.message key="ReverseProxies.label.useSsl" /></@></div>
</fieldset>

<fieldset class="large">
    <legend><@i18n.message key="ReverseProxies.legend.authentication" /></legend>

    <div class="row radio"><@form.radio name="authtype" value="USER_CREDENTIALS" description=i18n.text("ReverseProxies.AzureBlob.label.replayCredentials.description") example=i18n.text("ReverseProxies.AzureBlob.label.replayCredentials.example")><@i18n.message key="ReverseProxies.AzureBlob.label.replayCredentials" /></@></div>
    <div class="row radio"><@form.radio name="authtype" value="AMI_ROLE" description=i18n.text("ReverseProxies.AzureBlob.label.useRole.description") example=i18n.text("ReverseProxies.AzureBlob.label.useRole.example")><@i18n.message key="ReverseProxies.AzureBlob.label.useRole" /></@></div>
    <div class="row">
        <div class="radio"><@form.radio name="authtype" value="CREDENTIALS" description=i18n.text("ReverseProxies.AzureBlob.label.useCredentials.description") example=i18n.text("ReverseProxies.AzureBlob.label.useCredentials.example")><@i18n.message key="ReverseProxies.AzureBlob.label.useCredentials" /></@></div>
        <div class="row-group">
            <div><@form.username name="username" required=false description=i18n.text("ReverseProxies.AzureBlob.label.username.description") example=i18n.text("ReverseProxies.AzureBlob.label.username.example")><@i18n.message key="ReverseProxies.AzureBlob.label.username" /></@></div>
            <div><@form.dn name="userpwd" required=false description=i18n.text("ReverseProxies.AzureBlob.label.password.description") example=i18n.text("ReverseProxies.AzureBlob.label.password.example")><@i18n.message key="ReverseProxies.AzureBlob.label.password" /></@></div>
        </div>
    </div>
</fieldset>

<fieldset class="large">
    <@form.fields_title title=i18n.text("ReverseProxies.legend.advanced")/>
    <@reverse_proxy.remote_directory />
    <@reverse_proxy.debug_directory />
</fieldset>