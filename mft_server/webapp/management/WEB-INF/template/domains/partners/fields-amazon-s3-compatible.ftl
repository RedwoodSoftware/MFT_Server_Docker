<fieldset class="large">
    <legend><@i18n.message key="TradingPartners.legend.connection" /></legend>
    <div><@form.url name="endpoint" required=true description=i18n.text("TradingPartners.AmazonS3Compatible.label.endPoint.description") example=i18n.text("TradingPartners.AmazonS3Compatible.label.endPoint.example")><@i18n.message key="TradingPartners.AmazonS3Compatible.label.endPoint" /></@></div>
    <div><@form.number name="timeout" maxlength=2 description=i18n.text("TradingPartners.label.timeout.description") example=i18n.text("TradingPartners.label.timeout.example")><@i18n.message key="TradingPartners.label.timeout" /></@>&nbsp;<@i18n.message key="TradingPartners.label.timeout.unit" /></div>
</fieldset>
<fieldset class="large">
    <legend><@i18n.message key="TradingPartners.legend.authentication" /></legend>
    <div><@form.username name="username" description=i18n.text("TradingPartners.AmazonS3Compatible.label.accessKey.description") example=i18n.text("TradingPartners.AmazonS3Compatible.label.accessKey.example")><@i18n.message key="TradingPartners.AmazonS3Compatible.label.accessKey" /></@></div>
    <div><@form.password name="password" description=i18n.text("TradingPartners.AmazonS3Compatible.label.secretKey.description") example=i18n.text("TradingPartners.AmazonS3Compatible.label.secretKey.example")><@i18n.message key="TradingPartners.AmazonS3Compatible.label.secretKey" /></@></div>
    <div><@form.text name="region" description=i18n.text("TradingPartners.Amazon.label.region.description") example=i18n.text("TradingPartners.Amazon.label.region.example")><@i18n.message key="TradingPartners.Amazon.label.region" /></@></div>
</fieldset>


