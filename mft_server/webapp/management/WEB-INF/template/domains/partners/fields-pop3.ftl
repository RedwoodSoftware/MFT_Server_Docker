<fieldset class="large">
    <legend><@i18n.message key="TradingPartners.legend.connection" /></legend>
    <@trading_partner.connection types=["PLAIN", "SSL", "START-TLS"] port_example=i18n.text("TradingPartners.POP3.label.port.example") />
</fieldset>
<fieldset class="large">
    <legend><@i18n.message key="TradingPartners.legend.authentication" /></legend>
    <@trading_partner.authentication types=["BASIC", <#--"APOP",--> "XOAUTH2"] />
    <fieldset>
        <legend><@i18n.message key="TradingPartners.legend.oauth" /></legend>
        <@trading_partner.oauth_credentials />
    </fieldset>
</fieldset>
<fieldset class="large">
    <legend><@i18n.message key="TradingPartners.legend.proxy" /></legend>
    <@trading_partner.proxy auth=true />
</fieldset>
<fieldset class="large">
    <legend><@i18n.message key="TradingPartners.legend.ssl" /></legend>
    <@trading_partner.use_host_key />
    <@trading_partner.use_client_key />
</fieldset>