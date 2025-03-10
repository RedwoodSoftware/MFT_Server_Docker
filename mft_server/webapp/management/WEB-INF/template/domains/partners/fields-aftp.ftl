<fieldset>
    <legend><@i18n.message key="TradingPartners.legend.connection" /></legend>
    <div><@form.host name="host" required=true description=i18n.text("TradingPartners.label.host.description") example=i18n.text("TradingPartners.label.host.example")><@i18n.message key="TradingPartners.label.host" /></@></div>
    <div><@form.port name="port" description=i18n.text("TradingPartners.label.port.description") example=i18n.text("TradingPartners.AFTP.label.port.example")><@i18n.message key="TradingPartners.label.port" /></@></div>
    <div><@form.number name="timeout" maxlength=2 description=i18n.text("TradingPartners.label.timeout.description") example=i18n.text("TradingPartners.label.timeout.example")><@i18n.message key="TradingPartners.label.timeout" /></@>&nbsp;<@i18n.message key="TradingPartners.label.timeout.unit" /></div>
    <div class="checkbox"><@form.checkbox name="tcpnodelay" description=i18n.text("TradingPartners.label.tcpNoDelay.description") example=i18n.text("TradingPartners.label.tcpNoDelay.example")><@i18n.message key="TradingPartners.label.tcpNoDelay" /></@></div>
    <div><@form.number name="downloadrate" maxlength=4>   <@i18n.message key="TradingPartners.AFTP.label.downloadRate" /></@>&nbsp;
        <span><@form.select name="downloadrateunit" items={
            '${1000?c}': i18n.text("Application.bitrate.kilobit")?html,
            '${(1000*1000)?c}': i18n.text("Application.bitrate.megabit")?html,
            '${(1000*1000*1000)?c}': i18n.text("Application.bitrate.gigabit")?html}
        description=i18n.text("TradingPartners.AFTP.label.downloadRate.description") example=i18n.text("TradingPartners.AFTP.label.downloadRate.example") /></span>
    </div>
    <div><@form.number name="uploadrate" maxlength=4><@i18n.message key="TradingPartners.AFTP.label.uploadRate" /></@>&nbsp;
        <span><@form.select name="uploadrateunit" items={
            '${1000?c}': i18n.text("Application.bitrate.kilobit")?html,
            '${(1000*1000)?c}': i18n.text("Application.bitrate.megabit")?html,
            '${(1000*1000*1000)?c}': i18n.text("Application.bitrate.gigabit")?html}
        description=i18n.text("TradingPartners.AFTP.label.uploadRate.description") example=i18n.text("TradingPartners.AFTP.label.uploadRate.example") /></span>
    </div>
    <div class="checkbox"><@form.checkbox name="congestioncontrol" description=i18n.text("TradingPartners.AFTP.label.congestionControl.description") example=i18n.text("TradingPartners.AFTP.label.congestionControl.example")><@i18n.message key="TradingPartners.AFTP.label.congestionControl" /></@></div>
    <div><@form.username name="username" description=i18n.text("TradingPartners.label.username.description") example=i18n.text("TradingPartners.label.username.example")><@i18n.message key="TradingPartners.label.username" /></@></div>
    <div><@form.password name="password" description=i18n.text("TradingPartners.label.password.description") example=i18n.text("TradingPartners.label.password.example")><@i18n.message key="TradingPartners.label.password" /></@></div>
</fieldset>
<fieldset>
    <legend><@i18n.message key="TradingPartners.legend.ssl" /></legend>
    <@trading_partner.use_host_key />
    <@trading_partner.use_client_key />
</fieldset>