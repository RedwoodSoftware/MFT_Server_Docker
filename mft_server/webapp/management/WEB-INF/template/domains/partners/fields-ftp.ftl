<fieldset>
    <legend><@i18n.message key="TradingPartners.legend.connection" /></legend>
    <div><@form.host name="host" required=true description=i18n.text("TradingPartners.label.host.description") example=i18n.text("TradingPartners.label.host.example")><@i18n.message key="TradingPartners.label.host" /></@></div>
    <div><@form.port name="port" description=i18n.text("TradingPartners.label.port.description") example=i18n.text("TradingPartners.FTP.label.port.example")><@i18n.message key="TradingPartners.label.port" /></@></div>
    <div><@form.number name="timeout" maxlength=2 description=i18n.text("TradingPartners.label.timeout.description") example=i18n.text("TradingPartners.label.timeout.example")><@i18n.message key="TradingPartners.label.timeout" /></@>&nbsp;<@i18n.message key="TradingPartners.label.timeout.unit" /></div>
    <div class="checkbox"><@form.checkbox name="tcpnodelay" description=i18n.text("TradingPartners.label.tcpNoDelay.description") example=i18n.text("TradingPartners.label.tcpNoDelay.example")><@i18n.message key="TradingPartners.label.tcpNoDelay" /></@></div>
    <div><@form.username name="username" description=i18n.text("TradingPartners.label.username.description") example=i18n.text("TradingPartners.label.username.example")><@i18n.message key="TradingPartners.label.username" /></@></div>
    <div><@form.password name="password" description=i18n.text("TradingPartners.label.password.description") example=i18n.text("TradingPartners.label.password.example")><@i18n.message key="TradingPartners.label.password" /></@></div>
</fieldset>
<fieldset>
    <legend><@i18n.message key="TradingPartners.legend.proxy" /></legend>
    <@trading_partner.proxy auth=true />
</fieldset>
<fieldset class="large">
    <legend><@i18n.message key="TradingPartners.legend.advanced" /></legend>
    <div><@form.text name="postlogincmd" maxlength=255 description=i18n.text("TradingPartners.FTP.label.postLoginCommand.description") example=i18n.text("TradingPartners.FTP.label.postLoginCommand.example")><@i18n.message key="TradingPartners.FTP.label.postLoginCommand" /></@></div>
    <div class="checkbox"><@form.checkbox name="passivemode" description=i18n.text("TradingPartners.FTP.label.usePassiveMode.description") example=i18n.text("TradingPartners.FTP.label.usePassiveMode.example")><@i18n.message key="TradingPartners.FTP.label.usePassiveMode" /></@></div>
    <div class="checkbox"><@form.checkbox name="useepsv" description=i18n.text("TradingPartners.FTP.label.useEpsv.description") example=i18n.text("TradingPartners.FTP.label.useEpsv.example")><@i18n.message key="TradingPartners.FTP.label.useEpsv" /></@></div>
</fieldset>