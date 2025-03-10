<fieldset>
    <legend><@i18n.message key="TradingPartners.legend.connection" /></legend>

    <div><@form.dn name="endpointsuffix" required=false description=i18n.text("TradingPartners.AzureStorage.label.endPointSuffix.description") example=i18n.text("TradingPartners.AzureStorage.label.endPointSuffix.example")><@i18n.message key="TradingPartners.AzureStorage.label.endPointSuffix" /></@></div>
    <div><@form.number name="timeout" maxlength=2 description=i18n.text("TradingPartners.label.timeout.description") example=i18n.text("TradingPartners.label.timeout.example")><@i18n.message key="TradingPartners.label.timeout" /></@>&nbsp;<@i18n.message key="TradingPartners.label.timeout.unit" /></div>
    <div class="checkbox"><@form.checkbox name="ssl" description=i18n.text("TradingPartners.label.useSsl.description") example=i18n.text("TradingPartners.label.useSsl.example")><@i18n.message key="TradingPartners.label.useSsl" /></@></div>
</fieldset>

<fieldset class="x-large">
    <legend><@i18n.message key="TradingPartners.legend.authentication" /></legend>

    <div class="row radio"><@form.radio name="authtype" value="AMI_ROLE" description=i18n.text("TradingPartners.AzureStorage.label.useRole.description") example=i18n.text("TradingPartners.AzureStorage.label.useRole.example")><@i18n.message key="TradingPartners.AzureStorage.label.useRole" /></@></div>
    <div class="row">
        <div class="radio"><@form.radio name="authtype" value="CREDENTIALS" description=i18n.text("TradingPartners.AzureStorage.label.useCredentials.description") example=i18n.text("TradingPartners.AzureStorage.label.useCredentials.example")><@i18n.message key="TradingPartners.AzureStorage.label.useCredentials" /></@></div>
        <div class="row-group">
            <div><@form.username name="username" required=false description=i18n.text("TradingPartners.AzureStorage.label.username.description") example=i18n.text("TradingPartners.AzureStorage.label.username.example")><@i18n.message key="TradingPartners.AzureStorage.label.username" /></@></div>
            <div><@form.dn name="password" required=false description=i18n.text("TradingPartners.AzureStorage.label.password.description") example=i18n.text("TradingPartners.AzureStorage.label.password.example")><@i18n.message key="TradingPartners.AzureStorage.label.password" /></@></div>
        </div>
    </div>
</fieldset>