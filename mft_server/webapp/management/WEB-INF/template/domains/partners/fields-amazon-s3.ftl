<fieldset>
    <legend><@i18n.message key="TradingPartners.legend.connection" /></legend>
    <div><@form.number name="timeout" maxlength=2 description=i18n.text("TradingPartners.label.timeout.description") example=i18n.text("TradingPartners.label.timeout.example")><@i18n.message key="TradingPartners.label.timeout" /></@>&nbsp;<@i18n.message key="TradingPartners.label.timeout.unit" /></div>
</fieldset>
<fieldset>
    <legend><@i18n.message key="TradingPartners.legend.proxy" /></legend>
    <@trading_partner.proxy types=["HTTP"] auth=true/>
</fieldset>
<fieldset class="large">
    <legend><@i18n.message key="TradingPartners.legend.authentication" /></legend>

    <div class="row radio">
        <@form.radio name="authentication" value="IAM_ROLE" description=i18n.text("TradingPartners.Amazon.label.useRole.description") example=i18n.text("TradingPartners.Amazon.label.useRole.example")><@i18n.message key="TradingPartners.Amazon.label.useRole" /></@>
    </div>
    <div class="row">
        <div class="radio"><@form.radio name="authentication" value="CREDENTIALS" description=i18n.text("TradingPartners.Amazon.label.useCredentials.description") example=i18n.text("TradingPartners.Amazon.label.useCredentials.example")><@i18n.message key="TradingPartners.Amazon.label.useCredentials" /></@></div>
        <div class="row-group">
            <div><@form.username name="username" description=i18n.text("TradingPartners.Amazon.label.accessKey.description") example=i18n.text("TradingPartners.Amazon.label.accessKey.example")><@i18n.message key="TradingPartners.Amazon.label.accessKey" /></@></div>
            <div><@form.password name="password" description=i18n.text("TradingPartners.Amazon.label.secretKey.description") example=i18n.text("TradingPartners.Amazon.label.secretKey.example")><@i18n.message key="TradingPartners.Amazon.label.secretKey" /></@></div>
        </div>
    </div>
    <div>
        <dl class="group radio">
            <dt><@form.checkbox name="encrypt" description=i18n.text("TradingPartners.label.useEncryption.description") example=i18n.text("TradingPartners.label.useEncryption.example")><@i18n.message key="TradingPartners.label.useEncryption" /></@></dt>
            <dd style="margin-left:12em"><@form.radio name="encryption" value="AMAZON_S3_MANAGED_KEYS" description=i18n.text("TradingPartners.AmazonS3.label.encryption.AES_256.description")><@i18n.message key="TradingPartners.AmazonS3.label.encryption.AES_256" /></@></dd>
            <dd style="margin-left:12em"><@form.radio name="encryption" value="AWS_KMS_MANAGED_KEYS" description=i18n.text("TradingPartners.AmazonS3.label.encryption.AWS_KMS.description")><@i18n.message key="TradingPartners.AmazonS3.label.encryption.AWS_KMS" /></@>&nbsp;<@form.select name="kmskey" items={}/></dd>
        </dl>
    </div>
    <div><@trading_partner.amazon_region name="region" /></div>
    <div class="checkbox"><@form.checkbox name="requesterpays" description=i18n.text("TradingPartners.Amazon.label.requesterPays.description") example=i18n.text("TradingPartners.Amazon.label.requesterPays.example")><@i18n.message key="TradingPartners.Amazon.label.requesterPays" /></@></div>
</fieldset>


