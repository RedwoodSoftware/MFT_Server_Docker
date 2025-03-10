<fieldset>
    <legend><@i18n.message key="TradingPartners.legend.connection" /></legend>
    <div><@form.host name="host" required=true description=i18n.text("TradingPartners.label.host.description") example=i18n.text("TradingPartners.label.host.example")><@i18n.message key="TradingPartners.label.host" /></@></div>
    <div><@form.port name="port" description=i18n.text("TradingPartners.label.port.description") example=i18n.text("TradingPartners.SMB.label.port.example")><@i18n.message key="TradingPartners.label.port" /></@></div>
    <div><@form.number name="timeout" maxlength=2 description=i18n.text("TradingPartners.label.timeout.description") example=i18n.text("TradingPartners.label.timeout.example")><@i18n.message key="TradingPartners.label.timeout" /></@>&nbsp;<@i18n.message key="TradingPartners.label.timeout.unit" /></div>
    <div><@form.username name="username" required=true description=i18n.text("TradingPartners.label.username.description") example=i18n.text("TradingPartners.label.username.example")><@i18n.message key="TradingPartners.label.username" /></@></div>
    <div><@form.password name="password" description=i18n.text("TradingPartners.label.password.description") example=i18n.text("TradingPartners.label.password.example")><@i18n.message key="TradingPartners.label.password" /></@></div>
    <div><@form.dn name="domain" required=false description=i18n.text("TradingPartners.label.domain.description") example=i18n.text("TradingPartners.label.domain.example")><@i18n.message key="TradingPartners.label.domain" /></@></div>
</fieldset>