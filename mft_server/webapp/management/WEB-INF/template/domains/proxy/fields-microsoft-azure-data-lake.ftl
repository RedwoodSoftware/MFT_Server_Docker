<fieldset class="x-large">
    <legend><@i18n.message key="ReverseProxies.legend.authentication" /></legend>

    <div class="row radio"><@form.radio name="authtype" value="USER_CREDENTIALS" description=i18n.text("ReverseProxies.label.replayCredentials.description") example=i18n.text("ReverseProxies.label.replayCredentials.example")><@i18n.message key="ReverseProxies.label.replayCredentials" /></@></div>
    <div class="row">
        <div class="radio"><@form.radio name="authtype" value="CREDENTIALS" description=i18n.text("ReverseProxies.label.enterCredentials.description") example=i18n.text("ReverseProxies.label.enterCredentials.example")><@i18n.message key="ReverseProxies.label.enterCredentials" /></@></div>
        <div class="row-group">
            <div><@form.username name="username" required=true description=i18n.text("ReverseProxies.AzureDataLake.label.username.description") example=i18n.text("ReverseProxies.AzureDataLake.label.username.example")><@i18n.message key="ReverseProxies.AzureDataLake.label.username" /></@></div>
            <div><@form.dn name="userpwd" required=false description=i18n.text("ReverseProxies.AzureDataLake.label.password.description") example=i18n.text("ReverseProxies.AzureDataLake.label.password.example")><@i18n.message key="ReverseProxies.AzureDataLake.label.password" /></@></div>
            <div><@form.dn name="tenantId" required=true description=i18n.text("ReverseProxies.AzureDataLake.label.tenantid.description") example=i18n.text("ReverseProxies.AzureDataLake.label.tenantid.example")><@i18n.message key="ReverseProxies.AzureDataLake.label.tenantid" /></@></div>
            <div><@form.dn name="azureaccount" required=true description=i18n.text("ReverseProxies.AzureDataLake.label.account.description") example=i18n.text("ReverseProxies.AzureDataLake.label.account.example")><@i18n.message key="ReverseProxies.AzureDataLake.label.account" /></@></div>
        </div>
    </div>
</fieldset>

<fieldset class="large">
    <@form.fields_title title=i18n.text("ReverseProxies.legend.advanced")/>
    <@reverse_proxy.remote_directory />
    <@reverse_proxy.debug_directory />
</fieldset>