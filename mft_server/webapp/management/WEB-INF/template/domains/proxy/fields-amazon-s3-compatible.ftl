<fieldset class="large">
    <legend><@i18n.message key="ReverseProxies.legend.connection" /></legend>
    <div><@form.url name="endpoint" required=true description=i18n.text("ReverseProxies.AmazonS3Compatible.label.endPoint.description") example=i18n.text("ReverseProxies.AmazonS3Compatible.label.endPoint.example")><@i18n.message key="ReverseProxies.AmazonS3Compatible.label.endPoint" /></@></div>
</fieldset>

<fieldset class="large">
    <@form.fields_title title=i18n.text("ReverseProxies.legend.authentication")/>
    <div><@form.username name="username" description=i18n.text("ReverseProxies.Amazon.label.accessKey.description") example=i18n.text("ReverseProxies.Amazon.label.accessKey.example")><@i18n.message key="ReverseProxies.Amazon.label.accessKey" /></@></div>
    <div><@form.password name="password" description=i18n.text("ReverseProxies.Amazon.label.secretKey.description") example=i18n.text("ReverseProxies.Amazon.label.secretKey.example")><@i18n.message key="ReverseProxies.Amazon.label.secretKey" /></@></div>
    <div><@form.text name="region" description=i18n.text("ReverseProxies.Amazon.label.region.description") example=i18n.text("ReverseProxies.Amazon.label.region.example")><@i18n.message key="ReverseProxies.Amazon.label.region" /></@></div>
</fieldset>

<fieldset class="large">
    <@form.fields_title title=i18n.text("ReverseProxies.legend.advanced") />
    <@reverse_proxy.remote_directory />
    <@reverse_proxy.debug_directory />
</fieldset>