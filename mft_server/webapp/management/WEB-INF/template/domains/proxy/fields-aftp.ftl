<fieldset>
    <@form.fields_title title=i18n.text("ReverseProxies.legend.connection")/>
    <div><@form.host name="host" description=i18n.text("ReverseProxies.label.host.description") example=i18n.text("ReverseProxies.label.host.example")><@i18n.message key="ReverseProxies.label.host" /></@></div>
    <div><@form.port name="port" description=i18n.text("ReverseProxies.label.port.description") example=i18n.text("ReverseProxies.AFTP.label.port.example")><@i18n.message key="ReverseProxies.label.port" /></@></div>
    <div><@form.number name="timeout" maxlength=2 description=i18n.text("ReverseProxies.label.timeout.description") example=i18n.text("ReverseProxies.label.timeout.example")><@i18n.message key="ReverseProxies.label.timeout" /></@>&nbsp;<span><@i18n.message key="ReverseProxies.label.timeout.unit" /></span></div>
    <div><@form.select name="security" items={
        "NO_PROTECTION": i18n.text("ReverseProxies.AFTP.mode.NO_PROTECTION"),
        "FULL_TIME_PROTECTED": i18n.text("ReverseProxies.AFTP.mode.FULL_TIME_PROTECTED"),
        "AUTHENTICATION_PROTECTED": i18n.text("ReverseProxies.AFTP.mode.AUTHENTICATION_PROTECTED")
        } description=i18n.text("ReverseProxies.AFTP.label.securityMode.description") example=i18n.text("ReverseProxies.AFTP.label.securityMode.example")><@i18n.message key="ReverseProxies.AFTP.label.securityMode" /></@>
    </div>
    <div class="checkbox"><@form.checkbox name="tcpnodelay" description=i18n.text("ReverseProxies.label.tcpNoDelay.description") example=i18n.text("ReverseProxies.label.tcpNoDelay.example")><@i18n.message key="ReverseProxies.label.tcpNoDelay" /></@></div>
    <div><@form.number name="downloadrate" maxlength=4><@i18n.message key="ReverseProxies.label.downloadRate" /></@>&nbsp;
        <span><@form.select name="downloadrateunit" items={
            '${1000?c}': i18n.text("Application.bitrate.kilobit")?html,
            '${(1000*1000)?c}': i18n.text("Application.bitrate.megabit")?html,
            '${(1000*1000*1000)?c}': i18n.text("Application.bitrate.gigabit")?html
        } description=i18n.text("ReverseProxies.label.downloadRate.description") example=i18n.text("ReverseProxies.label.downloadRate.example") /></span>
    </div>
    <div><@form.number name="uploadrate" maxlength=4><@i18n.message key="ReverseProxies.label.uploadRate" /></@>&nbsp;
        <span><@form.select name="uploadrateunit" items={
            '${1000?c}': i18n.text("Application.bitrate.kilobit")?html,
            '${(1000*1000)?c}': i18n.text("Application.bitrate.megabit")?html,
            '${(1000*1000*1000)?c}': i18n.text("Application.bitrate.gigabit")?html
        } description=i18n.text("ReverseProxies.label.uploadRate.description") example=i18n.text("ReverseProxies.label.uploadRate.example") /></span>
    </div>
    <div class="checkbox"><@form.checkbox name="congestioncontrol" description=i18n.text("ReverseProxies.label.congestionControl.description") example=i18n.text("ReverseProxies.label.congestionControl.example")><@i18n.message key="ReverseProxies.label.congestionControl" /></@></div>
</fieldset>

<fieldset>
    <@form.fields_title title=i18n.text("ReverseProxies.legend.authentication")/>
    <div class="radio">
        <@form.radio name="credentials" value="enter" description=i18n.text("ReverseProxies.label.enterCredentials.description") example=i18n.text("ReverseProxies.label.enterCredentials.example")><@i18n.message key="ReverseProxies.label.enterCredentials" /></@>&nbsp;&nbsp;
        <@form.radio name="credentials" value="replay" description=i18n.text("ReverseProxies.label.replayCredentials.description") example=i18n.text("ReverseProxies.label.replayCredentials.example")><@i18n.message key="ReverseProxies.label.replayCredentials" /></@>
    </div>
    <div><@form.username name="username" description=i18n.text("ReverseProxies.label.username.description") example=i18n.text("ReverseProxies.label.username.example")><@i18n.message key="ReverseProxies.label.username" /></@></div>
    <div><@form.password name="userpwd" description=i18n.text("ReverseProxies.label.password.description") example=i18n.text("ReverseProxies.label.password.example")><@i18n.message key="ReverseProxies.label.password" /></@></div>
</fieldset>

<fieldset>
    <legend><@i18n.message key="ReverseProxies.legend.ssl" /></legend>
    <@reverse_proxy.use_host_key />
    <@reverse_proxy.use_client_key />
</fieldset>

<fieldset class="x-large">
    <@form.fields_title title=i18n.text("ReverseProxies.legend.advanced")/>
    <@reverse_proxy.remote_directory />
    <@reverse_proxy.debug_directory />
    <@reverse_proxy.max_age />
</fieldset>
