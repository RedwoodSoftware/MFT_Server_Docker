<fieldset>
    <@form.fields_title title=i18n.text("ReverseProxies.legend.connection")/>
    <div><@form.dn name="dir" description=i18n.text("ReverseProxies.OneDrive.label.directoryId.description") example=i18n.text("ReverseProxies.OneDrive.label.directoryId.example")><@i18n.message key="ReverseProxies.OneDrive.label.directoryId" /></@></div>
    <div><@form.dn name="client" description=i18n.text("ReverseProxies.OneDrive.label.clientId.description") example=i18n.text("ReverseProxies.OneDrive.label.clientId.example")><@i18n.message key="ReverseProxies.OneDrive.label.clientId" /></@></div>
    <div><@form.dn name="secret" description=i18n.text("ReverseProxies.OneDrive.label.clientSecret.description") example=i18n.text("ReverseProxies.OneDrive.label.clientSecret.example")><@i18n.message key="ReverseProxies.OneDrive.label.clientSecret" /></@></div>
    <div><@form.dn name="user" required=false description=i18n.text("ReverseProxies.label.username.description") example=i18n.text("ReverseProxies.label.username.example")><@i18n.message key="ReverseProxies.label.username" /></@></div>
    <div class="checkbox"><@form.checkbox name="rootaccess" description=i18n.text("ReverseProxies.OneDrive.label.rootAccess.description") example=i18n.text("ReverseProxies.OneDrive.label.rootAccess.example")><@i18n.message key="ReverseProxies.OneDrive.label.rootAccess" /></@></div>
</fieldset>

<fieldset class="x-large">
    <@form.fields_title title=i18n.text("ReverseProxies.legend.advanced")/>
    <@reverse_proxy.remote_directory />
</fieldset>
