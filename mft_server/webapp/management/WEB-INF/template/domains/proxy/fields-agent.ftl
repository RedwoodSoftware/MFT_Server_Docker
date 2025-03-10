<fieldset class="x-large">
    <@form.fields_title title=i18n.text("ReverseProxies.legend.authentication")/>
    <div><@form.select name="agent" items=[] required=true description=i18n.text("ReverseProxies.Agent.label.name.description") example=i18n.text("ReverseProxies.Agent.label.name.example")><@i18n.message key="ReverseProxies.Agent.label.name" /></@></div>
</fieldset>

<fieldset class="x-large">
    <@form.fields_title title=i18n.text("ReverseProxies.legend.advanced")/>
    <@reverse_proxy.remote_directory />
</fieldset>