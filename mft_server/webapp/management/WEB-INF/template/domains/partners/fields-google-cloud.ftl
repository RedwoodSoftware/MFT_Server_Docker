<fieldset>
    <legend><@i18n.message key="TradingPartners.legend.connection" /></legend>
    <div><@form.number name="timeout" maxlength=2 description=i18n.text("TradingPartners.label.timeout.description") example=i18n.text("TradingPartners.label.timeout.example")><@i18n.message key="TradingPartners.label.timeout" /></@>&nbsp;<@i18n.message key="TradingPartners.label.timeout.unit" /></div>
</fieldset>
<fieldset class="xx-large">
    <legend><@i18n.message key="TradingPartners.legend.authentication" /></legend>
    <div class="radio"><@form.radio name="authentication" value="DEFAULT" description=i18n.text("TradingPartners.GoogleStorage.label.useDefaultCredentials.description") example=i18n.text("TradingPartners.GoogleStorage.label.useDefaultCredentials.example")><@i18n.message key="TradingPartners.GoogleStorage.label.useDefaultCredentials" /></@></div>
    <div class="radio"><@form.radio name="authentication" value="CREDENTIALS_FILE" description=i18n.text("TradingPartners.GoogleStorage.label.usePrivateKeyFile.description") example=i18n.text("TradingPartners.GoogleStorage.label.usePrivateKeyFile.example")><@i18n.message key="TradingPartners.GoogleStorage.label.usePrivateKeyFile" /></@></div>
    <div style="margin-left:2em"><@trading_partner.json_credentials /></div>
</fieldset>