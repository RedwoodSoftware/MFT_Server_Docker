<#macro oftp_spec_button name>
    <@form.button name=name><@i18n.message "TradingPartners.button.specButton" /></@>&nbsp;<span role="tooltip" class="info hidden" title="${i18n.text("TradingPartners.button.specButton.description")?html}"></span>
</#macro>


<fieldset>
    <legend><@i18n.message key="TradingPartners.legend.connection" /></legend>
    <div><@form.host name="host" required=true description=i18n.text("TradingPartners.OFTP.label.host.description") example=i18n.text("TradingPartners.label.host.example")><@i18n.message key="TradingPartners.OFTP.label.host" /></@></div>
    <div><@form.port name="port" description=i18n.text("TradingPartners.OFTP.label.port.description") example=i18n.text("TradingPartners.OFTP.label.port.example")><@i18n.message key="TradingPartners.OFTP.label.port" /></@></div>
    <div><@form.number name="timeout" maxlength=2 description=i18n.text("TradingPartners.OFTP.label.timeout.description") example=i18n.text("TradingPartners.label.timeout.example")><@i18n.message key="TradingPartners.OFTP.label.timeout" /></@>&nbsp;<@i18n.message key="TradingPartners.OFTP.label.timeout.unit" /></div>
    <div><@form.username name="username" description=i18n.text("TradingPartners.OFTP.label.username.description") example=i18n.text("TradingPartners.OFTP.label.username.example")><@i18n.message key="TradingPartners.OFTP.label.username" /></@></div>
    <div><@form.password name="password" description=i18n.text("TradingPartners.OFTP.label.password.description") example=i18n.text("TradingPartners.OFTP.label.password.example")><@i18n.message key="TradingPartners.OFTP.label.password" /></@></div>
</fieldset>
<fieldset>
    <legend><@i18n.message key="TradingPartners.legend.proxy" /></legend>
    <@trading_partner.proxy />
</fieldset>
<fieldset>
    <legend><@i18n.message key="TradingPartners.legend.ssl" /></legend>
    <div class="checkbox" style="white-space:nowrap">
        <span id="oftppartner-usessl" style="display:inline-block;width:9em;"><@i18n.message key="TradingPartners.OFTP.label.useSsl" /></span>
        <@form.checkbox name="usessl" ariaLabelledby="oftppartner-usessl" description=i18n.text("TradingPartners.OFTP.label.useSsl.description") example=i18n.text("TradingPartners.OFTP.label.useSsl.example") />
    </div>
    <div>
        <@form.checkbox name="sslcertenabled"><@i18n.message key="TradingPartners.OFTP.label.hostCertificate" /></@>
        <@form.select name="sslcert" items=[] description=i18n.text("TradingPartners.OFTP.label.hostCertificate.description") example=i18n.text("TradingPartners.OFTP.label.hostCertificate.example")/>&nbsp;&nbsp;
        <@oftp_spec_button name="sslcertspecbutton" />
    </div>
    <div>
        <@form.checkbox name="sslkeyenabled"><@i18n.message key="TradingPartners.OFTP.label.key" /></@>
        <@form.select name="sslkey" items=[] description=i18n.text("TradingPartners.OFTP.label.key.description") example=i18n.text("TradingPartners.OFTP.label.key.example") />
    </div>
</fieldset>
<fieldset>
    <legend><@i18n.message key="TradingPartners.legend.message" /></legend>
    <div><@form.dn name="destinationid" required=true description=i18n.text("TradingPartners.OFTP.label.destinationId.description") example=i18n.text("TradingPartners.OFTP.label.destinationId.example")><@i18n.message key="TradingPartners.OFTP.label.destinationId" /></@></div>

    <fieldset class="large">
        <legend><@i18n.message key="TradingPartners.legend.secureAuth" /></legend>
        <div class="checkbox" style="white-space:nowrap">
            <span id="oftppartner-secureauth" style="display:inline-block;width:12em;"><@i18n.message key="TradingPartners.OFTP.label.secureAuthentication" /></span>
            <@form.checkbox name="secureauth" ariaLabelledby="oftppartner-secureauth" description=i18n.text("TradingPartners.OFTP.label.secureAuthentication.description") example=i18n.text("TradingPartners.OFTP.label.secureAuthentication.example") />
        </div>
        <div>
            <@form.select name="authcert" items=[] description=i18n.text("TradingPartners.OFTP.label.authenticationCertificate.description") example=i18n.text("TradingPartners.OFTP.label.authenticationCertificate.example")><@i18n.message key="TradingPartners.OFTP.label.authenticationCertificate" /></@>&nbsp;&nbsp;
            <@oftp_spec_button name="authcertspecbutton" />
        </div>
        <div><@form.select name="authkey" items=[] description=i18n.text("TradingPartners.OFTP.label.authenticationKey.description") example=i18n.text("TradingPartners.OFTP.label.authenticationKey.example")><@i18n.message key="TradingPartners.OFTP.label.authenticationKey" /></@></div>
    </fieldset>

    <fieldset class="xxx-large">
        <legend><@i18n.message key="TradingPartners.legend.signatureReceipt" /></legend>
        <div>
            <@form.checkbox name="filesignatureverification"><@i18n.message key="TradingPartners.OFTP.label.fileSignatureVerificationCertificate" /></@>
            <@form.select name="filesignatureverificationcert" items=[] description=i18n.text("TradingPartners.OFTP.label.fileSignatureVerificationCertificate.description") example=i18n.text("TradingPartners.OFTP.label.fileSignatureVerificationCertificate.example")/>&nbsp;&nbsp;
            <@oftp_spec_button name="filesignatureverificationcertspecbutton" />
        </div>
        <div><@form.checkbox name="filesigning"><@i18n.message key="TradingPartners.OFTP.label.fileSigningKey" /></@><@form.select name="filesignkey" items=[] description=i18n.text("TradingPartners.OFTP.label.fileSigningKey.description") example=i18n.text("TradingPartners.OFTP.label.fileSigningKey.example")/></div>
        <div>
            <@form.checkbox name="receiptsignaturerequire"><@i18n.message key="TradingPartners.OFTP.label.receiptSignatureVerificationCertificate" /></@>
            <@form.select name="receiptsignatureverificationcert" items=[] description=i18n.text("TradingPartners.OFTP.label.receiptSignatureVerificationCertificate.description") example=i18n.text("TradingPartners.OFTP.label.receiptSignatureVerificationCertificate.example")/>&nbsp;&nbsp;
            <@oftp_spec_button name="receiptsignatureverificationcertspecbutton" />
        </div>
        <div>
            <@form.checkbox name="receiptsignkeyenabled"><@i18n.message key="TradingPartners.OFTP.label.receiptSigningKey" /></@>
            <@form.select name="receiptsignkey" items=[] description=i18n.text("TradingPartners.OFTP.label.receiptSigningKey.description") example=i18n.text("TradingPartners.OFTP.label.receiptSigningKey.example") />
        <div>
        <div><@form.select name="cipher" items={
            'TRIPLE_DES_CBC_RSA_PKCS1_15_SHA1': '3DES/SHA1',
            'TRIPLE_DES_CBC_RSA_PKCS1_15_SHA256': '3DES/SHA256',
            'TRIPLE_DES_CBC_RSA_PKCS1_15_SHA512': '3DES/SHA512',
            'AES_256_CBC_RSA_PKCS1_15_SHA1': 'AES256/SHA1',
            'AES_256_CBC_RSA_PKCS1_15_SHA256': 'AES256/SHA256',
            'AES_256_CBC_RSA_PKCS1_15_SHA512': 'AES256/SHA512'
        } description=i18n.text("TradingPartners.OFTP.label.cipherSuite.description") example=i18n.text("TradingPartners.OFTP.label.cipherSuite.example")><@i18n.message key="TradingPartners.OFTP.label.cipherSuite" />&nbsp;&nbsp;</@>
        </div>
    </fieldset>

    <fieldset class="x-large">
        <legend><@i18n.message key="TradingPartners.legend.encryptionDecryption" /></legend>
        <div>
            <@form.checkbox name="fileencryption"><@i18n.message key="TradingPartners.OFTP.label.fileEncryptionCertificate" /></@>
            <@form.select name="fileencryptcert" items=[] description=i18n.text("TradingPartners.OFTP.label.fileEncryptionCertificate.description") example=i18n.text("TradingPartners.OFTP.label.fileEncryptionCertificate.example") />&nbsp;&nbsp;
            <@oftp_spec_button name="fileencryptcertspecbutton" />
        </div>
        <div><@form.checkbox name="filedecryption"><@i18n.message key="TradingPartners.OFTP.label.fileDecryptionKey" /></@><@form.select name="filedecryptkey" items=[] description=i18n.text("TradingPartners.OFTP.label.fileDecryptionKey.description") example=i18n.text("TradingPartners.OFTP.label.fileDecryptionKey.example")/></div>
    </fieldset>
    <fieldset class="xx-large">
        <legend><@i18n.message key="TradingPartners.legend.advanced" /></legend>
        <div class="checkbox"><@form.checkbox name="receiptautogenerationallowed" description=i18n.text("TradingPartners.OFTP.label.receiptAutoGenerationAllowed.description") example=i18n.text("TradingPartners.OFTP.label.receiptAutoGenerationAllowed.example")><@i18n.message key="TradingPartners.OFTP.label.receiptAutoGenerationAllowed" /></@></div>
        <div class="checkbox"><@form.checkbox name="compressionenabled" description=i18n.text("TradingPartners.OFTP.label.useCompression.description") example=i18n.text("TradingPartners.OFTP.label.useCompression.example")><@i18n.message key="TradingPartners.OFTP.label.useCompression" /></@></div>
        <div class="checkbox"><@form.checkbox name="certexchangeallowed" description=i18n.text("TradingPartners.OFTP.label.certificateExchangeAllowed.description") example=i18n.text("TradingPartners.OFTP.label.certificateExchangeAllowed.example")><@i18n.message key="TradingPartners.OFTP.label.certificateExchangeAllowed" /></@></div>
        <div class="checkbox"><@form.checkbox name="relayallowed" description=i18n.text("TradingPartners.OFTP.label.relayAllowed.description") example=i18n.text("TradingPartners.OFTP.label.relayAllowed.example")><@i18n.message key="TradingPartners.OFTP.label.relayAllowed" /></@></div>
    </fieldset>
</fieldset>