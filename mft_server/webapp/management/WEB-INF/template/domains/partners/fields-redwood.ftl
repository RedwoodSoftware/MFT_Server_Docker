<fieldset>
    <legend><@i18n.message key="TradingPartners.legend.connection" /></legend>
    <div><@form.url name="url" required=true description=i18n.text("TradingPartners.Redwood.label.url.description") example=i18n.text("TradingPartners.Redwood.label.url.example")><@i18n.message key="TradingPartners.Redwood.label.url" /></@></div>
    <div><@form.number name="timeout" maxlength=2 description=i18n.text("TradingPartners.label.timeout.description") example=i18n.text("TradingPartners.label.timeout.example")><@i18n.message key="TradingPartners.label.timeout" /></@>&nbsp;<@i18n.message key="TradingPartners.label.timeout.unit" /></div>
    <div><@form.username name="username" required=true description=i18n.text("TradingPartners.Redwood.label.username.description") example=i18n.text("TradingPartners.Redwood.label.username.example")><@i18n.message key="TradingPartners.Redwood.label.username" /></@></div>
</fieldset>