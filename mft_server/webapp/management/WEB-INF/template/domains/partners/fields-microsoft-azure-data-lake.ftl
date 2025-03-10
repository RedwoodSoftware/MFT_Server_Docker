<fieldset>
    <legend><@i18n.message key="TradingPartners.legend.connection" /></legend>

    <div><@form.number name="timeout" maxlength=2 description=i18n.text("TradingPartners.label.timeout.description") example=i18n.text("TradingPartners.label.timeout.example")><@i18n.message key="TradingPartners.label.timeout" /></@>&nbsp;<@i18n.message key="TradingPartners.label.timeout.unit" /></div>
</fieldset>

<fieldset class="large">
    <legend><@i18n.message key="TradingPartners.legend.authentication" /></legend>

    <#--<div class="row radio"><@form.radio name="authtype" value="AMI_ROLE" description=i18n.text("TradingPartners.AzureDataLake.label.useRole.description") example=i18n.text("TradingPartners.AzureDataLake.label.useRole.example")><@i18n.message key="TradingPartners.AzureDataLake.label.useRole" /></@></div>-->
    <div class="row">
        <#--<div class="radio"><@form.radio name="authtype" value="CREDENTIALS" description=i18n.text("TradingPartners.AzureDataLake.label.useCredentials.description") example=i18n.text("TradingPartners.AzureDataLake.label.useCredentials.example")><@i18n.message key="TradingPartners.AzureDataLake.label.useCredentials" /></@></div>-->
        <#--<div class="row-group">-->
            <div><@form.username name="username" required=false description=i18n.text("TradingPartners.AzureDataLake.label.username.description") example=i18n.text("TradingPartners.AzureDataLake.label.username.example")><@i18n.message key="TradingPartners.AzureDataLake.label.username" /></@></div>
            <div><@form.dn name="password" required=false description=i18n.text("TradingPartners.AzureDataLake.label.password.description") example=i18n.text("TradingPartners.AzureDataLake.label.password.example")><@i18n.message key="TradingPartners.AzureDataLake.label.password" /></@></div>
        <#--</div>-->
    </div>
    <div><@form.dn name="tenantid" required=true description=i18n.text("TradingPartners.AzureDataLake.label.tenantid.description") example=i18n.text("TradingPartners.AzureDataLake.label.tenantid.example")><@i18n.message key="TradingPartners.AzureDataLake.label.tenantid" /></@></div>
    <div><@form.dn name="azureaccount" required=true description=i18n.text("TradingPartners.AzureDataLake.label.account.description") example=i18n.text("TradingPartners.AzureDataLake.label.account.example")><@i18n.message key="TradingPartners.AzureDataLake.label.account" /></@></div>
</fieldset>