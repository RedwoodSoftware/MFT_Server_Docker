<fieldset class="large">
    <legend><@i18n.message key="TradingPartners.legend.connection" /></legend>
    <div><@form.host name="host" required=true description=i18n.text("TradingPartners.label.host.description") example=i18n.text("TradingPartners.label.host.example")><@i18n.message key="TradingPartners.label.host" /></@></div>
    <div><@form.port name="port" description=i18n.text("TradingPartners.label.port.description") example=i18n.text("TradingPartners.SFTP.label.port.example")><@i18n.message key="TradingPartners.label.port" /></@></div>
    <div><@form.number name="timeout" maxlength=2 description=i18n.text("TradingPartners.label.timeout.description") example=i18n.text("TradingPartners.label.timeout.example")><@i18n.message key="TradingPartners.label.timeout" /></@>&nbsp;<@i18n.message key="TradingPartners.label.timeout.unit" /></div>
    <div class="checkbox"><@form.checkbox name="tcpnodelay" description=i18n.text("TradingPartners.label.tcpNoDelay.description") example=i18n.text("TradingPartners.label.tcpNoDelay.example")><@i18n.message key="TradingPartners.label.tcpNoDelay" /></@></div>
    <div><@form.username name="username" required=true description=i18n.text("TradingPartners.label.username.description") example=i18n.text("TradingPartners.label.username.example") example=i18n.text("TradingPartners.label.username.example")><@i18n.message key="TradingPartners.label.username" /></@></div>
    <div><@form.password name="password" description=i18n.text("TradingPartners.label.password.description") example=i18n.text("TradingPartners.label.password.example")><@i18n.message key="TradingPartners.label.password" /></@></div>
    <div><@form.select name="publickeyalgorithm" items=sftpPublicKeyAlgorithms description=i18n.text("TradingPartners.label.publicKeyAlgorithm.description") example=i18n.text("TradingPartners.label.publicKeyAlgorithm.example")><@i18n.message key="TradingPartners.label.publicKeyAlgorithm" /></@></div>
    <@trading_partner.use_client_key />
</fieldset>
<fieldset class="large">
    <legend><@i18n.message key="TradingPartners.legend.proxy" /></legend>
    <@trading_partner.proxy auth=true />
</fieldset>
<fieldset>
    <legend><@i18n.message key="TradingPartners.legend.ssh" /></legend>
    <@trading_partner.use_host_key />
    <div class="checkbox"><@form.checkbox name="startsubsystemreply" description=i18n.text("TradingPartners.SFTP.label.startSubsystemReplyRequired.description") example=i18n.text("TradingPartners.SFTP.label.startSubsystemReplyRequired.example")><@i18n.message key="TradingPartners.SFTP.label.startSubsystemReplyRequired" /></@></div>
    <div class="checkbox"><@form.checkbox name="transferpipelining" description=i18n.text("TradingPartners.SFTP.label.pipelinedTransferEnabled.description") example=i18n.text("TradingPartners.SFTP.label.pipelinedTransferEnabled.example")><@i18n.message key="TradingPartners.SFTP.label.pipelinedTransferEnabled" /></@></div>
</fieldset>