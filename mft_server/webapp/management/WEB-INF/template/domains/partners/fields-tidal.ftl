<fieldset class="large">
    <legend><@i18n.message key="TradingPartners.legend.connection" /></legend>
    <div><@form.url name="url" required=true description=i18n.text("TradingPartners.Tidal.label.url.description") example=i18n.text("TradingPartners.Tidal.label.url.example")><@i18n.message key="TradingPartners.Tidal.label.url" /></@></div>
    <div><@form.username name="username" required=true description=i18n.text("TradingPartners.Tidal.label.username.description") example=i18n.text("TradingPartners.Tidal.label.username.example")><@i18n.message key="TradingPartners.Tidal.label.username" /></@></div>
    <div><@form.password name="password" required=false description=i18n.text("TradingPartners.Tidal.label.password.description") example=i18n.text("TradingPartners.Tidal.label.password.example")><@i18n.message key="TradingPartners.Tidal.label.password" /></@></div>
</fieldset>