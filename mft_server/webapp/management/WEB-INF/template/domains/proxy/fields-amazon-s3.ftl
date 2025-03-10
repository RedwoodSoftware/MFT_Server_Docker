<fieldset class="large">
    <@form.fields_title title=i18n.text("ReverseProxies.legend.authentication")/>

    <div class="radio" style="margin-bottom: 12px !important;">
        <@form.radio name="authentication" value="CREDENTIALS" description=i18n.text("ReverseProxies.Amazon.label.useCredentials.description") example=i18n.text("ReverseProxies.Amazon.label.useCredentials.example")><@i18n.message key="ReverseProxies.Amazon.label.useCredentials" /></@>&nbsp;&nbsp;
        <@form.radio name="authentication" value="USER_CREDENTIALS" description=i18n.text("ReverseProxies.label.replayCredentials.description") example=i18n.text("ReverseProxies.label.replayCredentials.example")><@i18n.message key="ReverseProxies.label.replayCredentials" /></@>&nbsp;&nbsp;
        <@form.radio name="authentication" value="IAM_ROLE" description=i18n.text("ReverseProxies.Amazon.label.useRole.description") example=i18n.text("ReverseProxies.Amazon.label.useRole.example")><@i18n.message key="ReverseProxies.Amazon.label.useRole" /></@>
    </div>
    <div><@form.username name="username" description=i18n.text("ReverseProxies.Amazon.label.accessKey.description") example=i18n.text("ReverseProxies.Amazon.label.accessKey.example")><@i18n.message key="ReverseProxies.Amazon.label.accessKey" /></@></div>
    <div><@form.password name="password" description=i18n.text("ReverseProxies.Amazon.label.secretKey.description") example=i18n.text("ReverseProxies.Amazon.label.secretKey.example")><@i18n.message key="ReverseProxies.Amazon.label.secretKey" /></@></div>
    <dl class="group radio">
       <dt><@form.checkbox name="encrypt" description=i18n.text("ReverseProxies.label.useEncryption.description") example=i18n.text("ReverseProxies.label.useEncryption.example")><@i18n.message key="ReverseProxies.label.useEncryption" /></@></dt>
       <dd style="margin-left:12em"><@form.radio name="encryption" value="AMAZON_S3_MANAGED_KEYS" description=i18n.text("ReverseProxies.AmazonS3.encryption.AES_256.description")><@i18n.message key="ReverseProxies.AmazonS3.encryption.AES_256" /></@></dd>
       <dd style="margin-left:12em"><@form.radio name="encryption" value="AWS_KMS_MANAGED_KEYS" description=i18n.text("ReverseProxies.AmazonS3.encryption.AWS_KMS.description")><@i18n.message key="ReverseProxies.AmazonS3.encryption.AWS_KMS" /></@>&nbsp;<@form.select name="kmskey" items={}/></dd>
    </dl>
    <div><@reverse_proxy.amazon_region name="region" /></div>
    <div class="checkbox"><@form.checkbox name="requesterpays" description=i18n.text("ReverseProxies.label.requesterPays.description") example=i18n.text("ReverseProxies.label.requesterPays.example")><@i18n.message key="ReverseProxies.label.requesterPays" /></@></div>
</fieldset>

<fieldset class="large">
    <@form.fields_title title=i18n.text("ReverseProxies.legend.advanced") />
    <@reverse_proxy.remote_directory />
    <@reverse_proxy.debug_directory />
</fieldset>