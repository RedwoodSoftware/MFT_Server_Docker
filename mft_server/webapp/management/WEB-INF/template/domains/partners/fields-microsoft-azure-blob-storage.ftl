<fieldset>
    <legend><@i18n.message key="TradingPartners.legend.connection" /></legend>

    <div><@form.dn name="endpointsuffix" required=false description=i18n.text("TradingPartners.AzureBlob.label.endPointSuffix.description") example=i18n.text("TradingPartners.AzureBlob.label.endPointSuffix.example")><@i18n.message key="TradingPartners.AzureBlob.label.endPointSuffix" /></@></div>
    <div><@form.number name="timeout" maxlength=2 description=i18n.text("TradingPartners.label.timeout.description") example=i18n.text("TradingPartners.label.timeout.example")><@i18n.message key="TradingPartners.label.timeout" /></@>&nbsp;<@i18n.message key="TradingPartners.label.timeout.unit" /></div>
    <div class="checkbox"><@form.checkbox name="ssl" description=i18n.text("TradingPartners.label.useSsl.description") example=i18n.text("TradingPartners.label.useSsl.example")><@i18n.message key="TradingPartners.label.useSsl" /></@></div>
</fieldset>

<fieldset class="x-large">
    <legend><@i18n.message key="TradingPartners.legend.authentication" /></legend>

    <div class="row radio"><@form.radio name="authtype" value="AMI_ROLE" description=i18n.text("TradingPartners.AzureBlob.label.useRole.description") example=i18n.text("TradingPartners.AzureBlob.label.useRole.example")><@i18n.message key="TradingPartners.AzureBlob.label.useRole" /></@></div>
    <div class="row">
        <div class="radio"><@form.radio name="authtype" value="CREDENTIALS" description=i18n.text("TradingPartners.AzureBlob.label.useCredentials.description") example=i18n.text("TradingPartners.AzureBlob.label.useCredentials.example")><@i18n.message key="TradingPartners.AzureBlob.label.useCredentials" /></@></div>
        <div class="row-group">
            <div><@form.username name="username" required=false description=i18n.text("TradingPartners.AzureBlob.label.username.description") example=i18n.text("TradingPartners.AzureBlob.label.username.example")><@i18n.message key="TradingPartners.AzureBlob.label.username" /></@></div>
            <div><@form.dn name="password" required=false description=i18n.text("TradingPartners.AzureBlob.label.password.description") example=i18n.text("TradingPartners.AzureBlob.label.password.example")><@i18n.message key="TradingPartners.AzureBlob.label.password" /></@></div>
        </div>
    </div>
</fieldset>