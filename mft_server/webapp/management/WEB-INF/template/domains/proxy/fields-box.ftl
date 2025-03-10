<fieldset class="xx-large">
    <@form.fields_title title=i18n.text("ReverseProxies.legend.authentication")/>
    <@reverse_proxy.json_credentials />
</fieldset>

<fieldset class="x-large">
    <@form.fields_title title=i18n.text("ReverseProxies.legend.advanced")/>
    <@reverse_proxy.remote_directory />
    <#--<@reverse_proxy.debug_directory />-->
</fieldset>