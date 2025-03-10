<fieldset>
    <@form.fields_title title=i18n.text("ReverseProxies.legend.connection")/>
    <div><@form.dn name="token" description=i18n.text("ReverseProxies.Dropbox.label.accessToken.description") example=i18n.text("ReverseProxies.Dropbox.label.accessToken.example")><@i18n.message key="ReverseProxies.Dropbox.label.accessToken" /></@></div>
</fieldset>

<fieldset class="x-large">
    <@form.fields_title title=i18n.text("ReverseProxies.legend.advanced")/>
    <@reverse_proxy.remote_directory />
    <#--<@reverse_proxy.debug_directory />-->
</fieldset>
