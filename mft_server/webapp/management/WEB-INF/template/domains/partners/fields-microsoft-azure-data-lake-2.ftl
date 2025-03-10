<fieldset>
    <legend><@i18n.message key="TradingPartners.legend.connection" /></legend>

    <div><@form.number name="timeout" maxlength=2 description=i18n.text("TradingPartners.label.timeout.description") example=i18n.text("TradingPartners.label.timeout.example")><@i18n.message key="TradingPartners.label.timeout" /></@>&nbsp;<@i18n.message key="TradingPartners.label.timeout.unit" /></div>
</fieldset>

<fieldset class="x-large">
    <legend><@i18n.message key="TradingPartners.legend.authentication" /></legend>

    <div class="row radio"><@form.radio name="authtype" value="AMI_ROLE" description=i18n.text("TradingPartners.AzureDataLake2.label.useRole.description") example=i18n.text("TradingPartners.AzureDataLake2.label.useRole.example")><@i18n.message key="TradingPartners.AzureDataLake2.label.useRole" /></@></div>
    <div class="row">
        <div class="radio"><@form.radio name="authtype" value="CREDENTIALS" description=i18n.text("TradingPartners.AzureDataLake2.label.useCredentials.description") example=i18n.text("TradingPartners.AzureDataLake2.label.useCredentials.example")><@i18n.message key="TradingPartners.AzureDataLake2.label.useCredentials" /></@></div>
        <div class="row-group">
            <div><@form.username name="username" required=false description=i18n.text("TradingPartners.AzureDataLake2.label.username.description") example=i18n.text("TradingPartners.AzureDataLake2.label.username.example")><@i18n.message key="TradingPartners.AzureDataLake2.label.username" /></@></div>
            <div><@form.dn name="password" required=false description=i18n.text("TradingPartners.AzureDataLake2.label.password.description") example=i18n.text("TradingPartners.AzureDataLake2.label.password.example")><@i18n.message key="TradingPartners.AzureDataLake2.label.password" /></@></div>
            <div><@form.dn name="endpoint" required=false description=i18n.text("TradingPartners.AzureDataLake2.label.endpoint.description") example=i18n.text("TradingPartners.AzureDataLake2.label.endpoint.example")><@i18n.message key="TradingPartners.AzureDataLake2.label.endpoint" /></@></div>
        </div>
    </div>
</fieldset>