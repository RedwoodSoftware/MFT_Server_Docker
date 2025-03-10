<fieldset class="large">
    <@form.fields_title title=i18n.text("ReverseProxies.legend.connection")/>
    <div><@form.host name="host" description=i18n.text("ReverseProxies.label.host.description") example=i18n.text("ReverseProxies.label.host.example")><@i18n.message key="ReverseProxies.label.host" /></@></div>
    <div><@form.port name="port" description=i18n.text("ReverseProxies.label.port.description") example=i18n.text("ReverseProxies.TFTP.label.port.example")><@i18n.message key="ReverseProxies.label.port" /></@></div>
    <div><@form.number name="retransmitinterval" maxlength="3" description=i18n.text("ReverseProxies.label.retransmitInterval.description") example=i18n.text("ReverseProxies.label.retransmitInterval.example")><@i18n.message key="ReverseProxies.label.retransmitInterval" /></@>&nbsp;<span><@i18n.message key="ReverseProxies.label.retransmitInterval.unit" /></span></div>
    <div><@form.number name="retransmitattempts" maxlength="3" description=i18n.text("ReverseProxies.label.retransmitAttempts.description") example=i18n.text("ReverseProxies.label.retransmitAttempts.example")><@i18n.message key="ReverseProxies.label.retransmitAttempts" /></@></div>
</fieldset>

<fieldset class="large">
    <@form.fields_title title=i18n.text("ReverseProxies.legend.advanced")/>
    <@reverse_proxy.debug_directory />
</fieldset>
