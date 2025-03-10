<fieldset class="x-large">
    <legend><@i18n.message key="ReverseProxies.legend.authentication" /></legend>

    <div class="row radio"><@form.radio name="authtype" value="USER_CREDENTIALS" description=i18n.text("ReverseProxies.AzureDataLake2.label.replayCredentials.description") example=i18n.text("ReverseProxies.AzureDataLake2.label.replayCredentials.example")><@i18n.message key="ReverseProxies.AzureDataLake2.label.replayCredentials" /></@></div>
    <div class="row radio"><@form.radio name="authtype" value="AMI_ROLE" description=i18n.text("ReverseProxies.AzureDataLake2.label.useRole.description") example=i18n.text("ReverseProxies.AzureDataLake2.label.useRole.example")><@i18n.message key="ReverseProxies.AzureDataLake2.label.useRole" /></@></div>
    <div class="row">
        <div class="radio"><@form.radio name="authtype" value="CREDENTIALS" description=i18n.text("ReverseProxies.AzureDataLake2.label.useCredentials.description") example=i18n.text("ReverseProxies.AzureDataLake2.label.useCredentials.example")><@i18n.message key="ReverseProxies.AzureDataLake2.label.useCredentials" /></@></div>
        <div class="row-group">
            <div><@form.username name="username" required=false description=i18n.text("ReverseProxies.AzureDataLake2.label.username.description") example=i18n.text("ReverseProxies.AzureDataLake2.label.username.example")><@i18n.message key="ReverseProxies.AzureDataLake2.label.username" /></@></div>
            <div><@form.dn name="userpwd" required=false description=i18n.text("ReverseProxies.AzureDataLake2.label.password.description") example=i18n.text("ReverseProxies.AzureDataLake2.label.password.example")><@i18n.message key="ReverseProxies.AzureDataLake2.label.password" /></@></div>
            <div><@form.dn name="endpoint" required=false description=i18n.text("ReverseProxies.AzureDataLake2.label.endpoint.description") example=i18n.text("ReverseProxies.AzureDataLake2.label.endpoint.example")><@i18n.message key="ReverseProxies.AzureDataLake2.label.endpoint" /></@></div>
        </div>
    </div>
</fieldset>

<fieldset class="large">
    <@form.fields_title title=i18n.text("ReverseProxies.legend.advanced")/>
    <@reverse_proxy.remote_directory />
    <@reverse_proxy.debug_directory />
</fieldset>