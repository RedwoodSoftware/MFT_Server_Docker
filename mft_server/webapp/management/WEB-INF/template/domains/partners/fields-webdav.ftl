<fieldset>
    <legend><@i18n.message key="TradingPartners.legend.connection" /></legend>
    <div><@form.url name="url" required=true description=i18n.text("TradingPartners.label.url.description") example=i18n.text("TradingPartners.label.url.example")><@i18n.message key="TradingPartners.label.url" /></@></div>
    <div><@form.number name="timeout" maxlength=2 description=i18n.text("TradingPartners.label.timeout.description") example=i18n.text("TradingPartners.label.timeout.example")><@i18n.message key="TradingPartners.label.timeout" /></@>&nbsp;<@i18n.message key="TradingPartners.label.timeout.unit" /></div>
    <div><@form.dn name="domain" required=false description=i18n.text("TradingPartners.label.domain.description") example=i18n.text("TradingPartners.label.domain.example")><@i18n.message key="TradingPartners.label.domain" /></@></div>
    <div><@form.username name="username" description=i18n.text("TradingPartners.label.username.description") example=i18n.text("TradingPartners.label.username.example")><@i18n.message key="TradingPartners.label.username" /></@></div>
    <div><@form.password name="password" description=i18n.text("TradingPartners.label.password.description") example=i18n.text("TradingPartners.label.password.example")><@i18n.message key="TradingPartners.label.password" /></@></div>
</fieldset>
<fieldset>
    <legend><@i18n.message key="TradingPartners.legend.proxy" /></legend>
    <@trading_partner.proxy types=["HTTP"] auth=false />
</fieldset>
<fieldset>
    <legend><@i18n.message key="TradingPartners.legend.ssl" /></legend>
    <@trading_partner.use_host_key />
    <@trading_partner.use_client_key />
</fieldset>