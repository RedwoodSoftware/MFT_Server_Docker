<fieldset class="large">
    <legend><@i18n.message key="TradingPartners.legend.connection" /></legend>
    <div><@form.host name="host" required=true description=i18n.text("TradingPartners.label.host.description") example=i18n.text("TradingPartners.label.host.example")><@i18n.message key="TradingPartners.label.host" /></@></div>
    <div><@form.port name="port" description=i18n.text("TradingPartners.label.port.description") example=i18n.text("TradingPartners.Splunk.label.port.example")><@i18n.message key="TradingPartners.label.port" /></@></div>
    <div><@form.number name="timeout" description=i18n.text("TradingPartners.label.timeout.description") example=i18n.text("TradingPartners.label.timeout.example")><@i18n.message key="TradingPartners.label.timeout" /></@>&nbsp;<@i18n.message key="TradingPartners.label.timeout.unit" /></div>
    <div><@form.dn name="token" required=true description=i18n.text("TradingPartners.Splunk.label.accessToken.description") example=i18n.text("TradingPartners.Splunk.label.accessToken.example")><@i18n.message key="TradingPartners.Splunk.label.accessToken" /></@></div>
    <div class="checkbox"><@form.checkbox name="ssl" description=i18n.text("TradingPartners.label.useSsl.description") example=i18n.text("TradingPartners.label.useSsl.example")><@i18n.message key="TradingPartners.label.useSsl" /></@></div>
</fieldset>