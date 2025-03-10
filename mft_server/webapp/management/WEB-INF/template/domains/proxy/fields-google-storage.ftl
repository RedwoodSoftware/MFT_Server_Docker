<fieldset class="xx-large">
    <legend><@i18n.message key="ReverseProxies.legend.authentication" /></legend>
    <div class="radio"><@form.radio name="authentication" value="DEFAULT" description=i18n.text("ReverseProxies.GoogleStorage.label.useDefaultCredentials.description") example=i18n.text("ReverseProxies.GoogleStorage.label.useDefaultCredentials.description")><@i18n.message key="ReverseProxies.GoogleStorage.label.useDefaultCredentials" /></@></div>
    <div class="radio"><@form.radio name="authentication" value="CREDENTIALS_FILE" description=i18n.text("ReverseProxies.GoogleStorage.label.usePrivateKeyFile.description") example=i18n.text("ReverseProxies.GoogleStorage.label.usePrivateKeyFile.example")><@i18n.message key="ReverseProxies.GoogleStorage.label.usePrivateKeyFile" /></@></div>
    <div style="margin-left:2em"><@reverse_proxy.json_credentials /></div>
</fieldset>

<fieldset class="large">
    <@form.fields_title title=i18n.text("ReverseProxies.legend.advanced")/>
    <@reverse_proxy.remote_directory />
    <@reverse_proxy.debug_directory />
</fieldset>