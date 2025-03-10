<fieldset>
    <legend><@i18n.message key="TradingPartners.legend.connection" /></legend>

    <div><@form.url name="url" required=true description=i18n.text("TradingPartners.JDBC.label.url.description") example=i18n.text("TradingPartners.JDBC.label.url.example")><@i18n.message key="TradingPartners.JDBC.label.url" /></@></div>
    <div><@form.username name="username" required=false description=i18n.text("TradingPartners.JDBC.label.username.description") example=i18n.text("TradingPartners.JDBC.label.username.example")><@i18n.message key="TradingPartners.JDBC.label.username" /></@></div>
    <div><@form.dn name="password" required=false description=i18n.text("TradingPartners.JDBC.label.password.description") example=i18n.text("TradingPartners.JDBC.label.password.example")><@i18n.message key="TradingPartners.JDBC.label.password" /></@></div>
</fieldset>
