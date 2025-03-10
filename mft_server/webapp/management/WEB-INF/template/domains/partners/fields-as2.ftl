<fieldset>
    <legend><@i18n.message key="TradingPartners.legend.connection" /></legend>
    <div><@form.url name="url" required=true description=i18n.text("TradingPartners.AS2.label.url.description") example=i18n.text("TradingPartners.AS2.label.url.example")><@i18n.message key="TradingPartners.AS2.label.url" /></@></div>
    <div><@form.number name="timeout" maxlength=2 description=i18n.text("TradingPartners.AS2.label.timeout.description") example=i18n.text("TradingPartners.AS2.label.timeout.example")><@i18n.message key="TradingPartners.AS2.label.timeout" /></@>&nbsp;<@i18n.message key="TradingPartners.AS2.label.timeoutUnit" /></div>
    <div><@form.username name="username" description=i18n.text("TradingPartners.AS2.label.username.description") example=i18n.text("TradingPartners.AS2.label.username.example")><@i18n.message key="TradingPartners.AS2.label.username" /></@></div>
    <div><@form.password name="password" description=i18n.text("TradingPartners.AS2.label.password.description") example=i18n.text("TradingPartners.AS2.label.password.example")><@i18n.message key="TradingPartners.AS2.label.password" /></@></div>
</fieldset>
<fieldset>
    <legend><@i18n.message key="TradingPartners.legend.proxy" /></legend>
    <@trading_partner.proxy auth=true/>
</fieldset>
<fieldset>
    <legend><@i18n.message key="TradingPartners.legend.ssl" /></legend>
    <div class="checkbox">
        <@form.checkbox name="usehostkey"><@i18n.message key="TradingPartners.AS2.label.hostKey" /></@>&nbsp;
        <@form.select name="hostkey" items=[] description=i18n.text("TradingPartners.AS2.label.hostKey.description") example=i18n.text("TradingPartners.AS2.label.hostKey.example") />
    </div>
    <@trading_partner.use_client_key description=i18n.text("TradingPartners.AS2.label.clientKey.description")>
        <@i18n.message key="TradingPartners.AS2.button.clientKey" />
    </@>
</fieldset>
<fieldset class="large">
    <legend><@i18n.message key="TradingPartners.legend.message" /></legend>
    <div><@form.dn name="sender" maxlength=255 required=true description=i18n.text("TradingPartners.AS2.label.sender.description") example=i18n.text("TradingPartners.AS2.label.sender.example")><@i18n.message key="TradingPartners.AS2.label.sender" /></@></div>
    <div><@form.dn name="recipient" maxlength=255 required=true description=i18n.text("TradingPartners.AS2.label.recipient.description") example=i18n.text("TradingPartners.AS2.label.recipient.example")><@i18n.message key="TradingPartners.AS2.label.recipient" /></@></div>
    <div><@form.email name="from" description=i18n.text("TradingPartners.AS2.label.fromAddress.description") example=i18n.text("TradingPartners.AS2.label.fromAddress.example")><@i18n.message key="TradingPartners.AS2.label.fromAddress" /></@></div>
    <div><@form.select name="receipt" items={
            'SYNCHRONOUS': i18n.text("TradingPartners.receipt.SYNCHRONOUS"),
            'ASYNCHRONOUS': i18n.text("TradingPartners.receipt.ASYNCHRONOUS"),
            'NONE': i18n.text("TradingPartners.receipt.NONE")
        } description=i18n.text("TradingPartners.AS2.label.receiptType.description") example=i18n.text("TradingPartners.AS2.label.receiptType.example")><@i18n.message key="TradingPartners.AS2.label.receiptType" /></@>
    </div>
    <div class="checkbox"><@form.checkbox name="usereceiptssl" description=i18n.text("TradingPartners.AS2.label.receiptHttpsRequired.description") example=i18n.text("TradingPartners.AS2.label.receiptHttpsRequired.example")><@i18n.message key="TradingPartners.AS2.label.receiptHttpsRequired" /></@></div>
    <div class="checkbox"><@form.checkbox name="usereceiptsignature" description=i18n.text("TradingPartners.AS2.label.receiptSignatureRequired.description") example=i18n.text("TradingPartners.AS2.label.receiptSignatureRequired.example")><@i18n.message key="TradingPartners.AS2.label.receiptSignatureRequired" /></@></div>
    <div><@form.number name="receiptimeout" maxlength=4 description=i18n.text("TradingPartners.AS2.label.receiptAwaitingTimeout.description") example=i18n.text("TradingPartners.AS2.label.receiptAwaitingTimeout.example")><@i18n.message key="TradingPartners.AS2.label.receiptAwaitingTimeout" /></@>&nbsp;<@i18n.message key="TradingPartners.AS2.label.receiptAwaitingTimeout.unit" /></div>
    <div><@form.checkbox name="useencryptkey"><@i18n.message key="TradingPartners.AS2.label.encryptionKey" /></@><@form.select name="encryptkey" items=[] description=i18n.text("TradingPartners.AS2.label.encryptionKey.description") example=i18n.text("TradingPartners.AS2.label.encryptionKey.example") /></div>
    <div><@form.select name="encryptalgorithm" items={
            'DES_EDE3_CBC': i18n.text("AS2Messages.encryption.DES_EDE3_CBC"),
            'AES128_CBC': i18n.text("AS2Messages.encryption.AES128_CBC"),
            'AES192_CBC': i18n.text("AS2Messages.encryption.AES192_CBC"),
            'AES256_CBC': i18n.text("AS2Messages.encryption.AES256_CBC")
        } description=i18n.text("TradingPartners.AS2.label.encryptionAlgorithm.description") example=i18n.text("TradingPartners.AS2.label.encryptionAlgorithm.example")><@i18n.message key="TradingPartners.AS2.label.encryptionAlgorithm" /></@></div>
    <div><@form.checkbox name="usesigningkey"><@i18n.message key="TradingPartners.AS2.label.signingKey" /></@><@form.select name="signingkey" items=[] description=i18n.text("TradingPartners.AS2.label.signingKey.description") example=i18n.text("TradingPartners.AS2.label.signingKey.example") /></div>
    <div><@form.select name="signalgorithm" items=[] description=i18n.text("TradingPartners.AS2.label.signatureAlgorithm.description") example=i18n.text("TradingPartners.AS2.label.signatureAlgorithm.example")><@i18n.message key="TradingPartners.AS2.label.signatureAlgorithm" /></@></div>
    <div class="checkbox"><@form.checkbox name="usecompression" description=i18n.text("TradingPartners.AS2.label.useCompression.description") example=i18n.text("TradingPartners.AS2.label.useCompression.example")><@i18n.message key="TradingPartners.AS2.label.useCompression" /></@></div>
</fieldset>