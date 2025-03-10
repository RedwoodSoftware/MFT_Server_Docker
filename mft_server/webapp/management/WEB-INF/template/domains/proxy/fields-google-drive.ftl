<fieldset class="xx-large">
    <legend><@i18n.message key="ReverseProxies.legend.authentication" /></legend>
    <@reverse_proxy.json_credentials />
</fieldset>

<fieldset class="large">
    <@form.fields_title title=i18n.text("ReverseProxies.legend.advanced") />
    <@reverse_proxy.remote_directory />
    <@reverse_proxy.debug_directory />
</fieldset>