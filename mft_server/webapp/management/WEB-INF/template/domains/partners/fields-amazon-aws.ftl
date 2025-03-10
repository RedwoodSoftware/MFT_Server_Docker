<fieldset>
    <legend><@i18n.message key="TradingPartners.legend.connection" /></legend>

    <div><@form.number name="timeout" maxlength=2 description=i18n.text("TradingPartners.label.timeout.description") example=i18n.text("TradingPartners.label.timeout.example")><@i18n.message key="TradingPartners.label.timeout" /></@>&nbsp;<@i18n.message key="TradingPartners.label.timeout.unit" /></div>
</fieldset>

<fieldset class="large">
    <legend><@i18n.message key="TradingPartners.legend.authentication" /></legend>

    <div class="row radio"><@form.radio name="authentication" value="IAM_ROLE" description=i18n.text("TradingPartners.Amazon.label.useRole.description") example=i18n.text("TradingPartners.Amazon.label.useRole.example")><@i18n.message key="TradingPartners.Amazon.label.useRole" /></@></div>
    <div class="row">
        <div class="radio"><@form.radio name="authentication" value="CREDENTIALS" description=i18n.text("TradingPartners.Amazon.label.useCredentials.description") example=i18n.text("TradingPartners.Amazon.label.useCredentials.example")><@i18n.message key="TradingPartners.Amazon.label.useCredentials" /></@></div>
        <div class="row-group">
            <div><@form.username name="username" description=i18n.text("TradingPartners.Amazon.label.accessKey.description") example=i18n.text("TradingPartners.Amazon.label.accessKey.example")><@i18n.message key="TradingPartners.Amazon.label.accessKey" /></@></div>
            <div><@form.password name="password" description=i18n.text("TradingPartners.Amazon.label.secretKey.description") example=i18n.text("TradingPartners.Amazon.label.secretKey.example")><@i18n.message key="TradingPartners.Amazon.label.secretKey" /></@></div>
        </div>
    </div>
    <div><@trading_partner.amazon_region name="region" /></div>
</fieldset>


