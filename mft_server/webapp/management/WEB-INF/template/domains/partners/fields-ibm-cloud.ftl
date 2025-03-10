<fieldset>
    <legend><@i18n.message key="TradingPartners.legend.connection" /></legend>
    <div><@form.dn name="endpoint" required=true description=i18n.text("TradingPartners.IbmCloud.label.endPoint.description") example=i18n.text("TradingPartners.IbmCloud.label.endPoint.example")><@i18n.message key="TradingPartners.IbmCloud.label.endPoint" /></@></div>
    <div><@form.username name="username" required=true description=i18n.text("TradingPartners.label.username.description") example=i18n.text("TradingPartners.label.username.example")><@i18n.message key="TradingPartners.label.username" /></@></div>
    <div><@form.dn name="password" required=false description=i18n.text("TradingPartners.label.password.description") example=i18n.text("TradingPartners.label.password.example")><@i18n.message key="TradingPartners.label.password" /></@></div>
</fieldset>
<fieldset>
    <legend><@i18n.message key="TradingPartners.legend.proxy" /></legend>
    <@trading_partner.proxy types=["HTTP"] auth=true />
</fieldset>
