<div id="web-server-as2-fields">
    <div data-options="region:'center'">
        <fieldset class="noborder">
            <div class="checkbox"><@form.checkbox name="enabled"><@i18n.message key="AS2Configuration.label.serviceEnabled" /></@></div>
        </fieldset>

        <fieldset>
            <legend><@i18n.message key="AS2Configuration.title.messages" /></legend>

            <fieldset class="x-large">
                <legend><@i18n.message key="AS2Configuration.title.outbound" /></legend>
                <dl>
                    <dt><@i18n.message key="AS2Configuration.label.primary" /></dt>
                    <dd><@form.checkbox name="useprimarydecryptkey"><@i18n.message key="AS2Configuration.label.useDecryptionKey" /></@>&nbsp;&nbsp;<select name="primarydecryptkey"></select></dd>
                    <dd><@form.checkbox name="useprimarysignkey"><@i18n.message key="AS2Configuration.label.useReceiptSigningKey" /></@>&nbsp;&nbsp;<select name="primaryreceiptsingkey"></select></dd>
                    <dd><label><@i18n.message key="AS2Configuration.label.receiptSignatureAlgorithm" /></label>&nbsp;&nbsp;<select name="primaryreceiptsignature"></select></dd>
                </dl>
                <dl>
                    <dt><@i18n.message key="AS2Configuration.label.secondary" /></dt>
                    <dd><@form.checkbox name="usesecondarydecryptkey"><@i18n.message key="AS2Configuration.label.useDecryptionKey" /></@><select name="secondarydecryptkey"></select></dd>
                    <dd><@form.checkbox name="usesecondarysignkey"><@i18n.message key="AS2Configuration.label.useReceiptSigningKey" /></@><select name="secondaryreceiptsingkey"></select></dd>
                    <dd><label><@i18n.message key="AS2Configuration.label.receiptSignatureAlgorithm" /></label><select name="secondaryreceiptsignature"></select></dd>
                </dl>
                <div><@form.email name="from"><@i18n.message key="AS2Configuration.label.fromAddress" /></@></div>
                <div><@form.memo name="receiptext"><@i18n.message key="AS2Configuration.label.receiptText" /></@></div>
            </fieldset>

            <fieldset>
                <legend><@i18n.message key="AS2Configuration.title.inbound" /></legend>
                <div>
                    <span><@i18n.message key="AS2Configuration.label.httpURL" /></span>&nbsp;<span aria-label="plain-url" style="font-weight:bold;padding:0 .7em"></span>
                    <span><@form.button name="copy-plain-url"><@i18n.message key="AS2Configuration.button.copy" /></@></span>
                </div>
                <div>
                    <span><@i18n.message key="AS2Configuration.label.httpsURL" /></span>&nbsp;<span aria-label="secure-url" style="font-weight:bold;padding:0 .7em"></span>
                    <span><@form.button name="copy-secure-url"><@i18n.message key="AS2Configuration.button.copy" /></@></span>
                </div>
                <div class="checkbox"><@form.checkbox name="encryptrequired"><@i18n.message key="AS2Configuration.label.encryptionRequired" /></@></div>
                <div class="checkbox"><@form.checkbox name="signaturerequired"><@i18n.message key="AS2Configuration.label.signatureRequired" /></@></div>
                <div class="checkbox"><@form.checkbox name="allowmessagewofile"><@i18n.message key="AS2Configuration.label.messageWithoutFilenameAllowed" /></@></div>
                <div class="checkbox"><@form.checkbox name="keeprawfile"><@i18n.message key="AS2Configuration.label.keepRawFile" /></@></div>
                <div class="checkbox"><@form.checkbox name="fileoverwriting"><@form.select name="fileoverwritingpolicy" items={
                    "OVERWRITE": i18n.text("AS2Configuration.label.fileExistingOwerwrite"),
                    "GENERATE_UNIQUE_NAME": i18n.text("AS2Configuration.label.fileExistingGenerateUnique")
                } />&nbsp;<@i18n.message key="AS2Configuration.label.fileExistingFound" /></@></div>
                <div class="checkbox"><@form.checkbox name="bindtransfers"><@i18n.message key="AS2Configuration.label.bindUnauthTransfers" /></@>&nbsp;&nbsp;<input type="text" name="transfdomain" maxlength="50"/>&nbsp;&nbsp;<span><@i18n.message key="AS2Configuration.label.bindUnauthTransfers.2" /></span>&nbsp;&nbsp;<input type="text" name="transferuser" maxlength="50"/></div>
                <div class="checkbox"><@form.path name="uploaddir" size="70"><@i18n.message key="AS2Configuration.label.uploadDirectory" />&nbsp;&nbsp;</@></div>
            </fieldset>

            <fieldset>
                <legend><@i18n.message key="AS2Configuration.title.asyncReceiptProxy" /></legend>

                <div><@form.select name="proxytype" items={
                    "NONE": i18n.text("Application.proxyType.NONE"),
                    "HTTP": i18n.text("Application.proxyType.HTTP"),
                    "SOCKS4": i18n.text("Application.proxyType.SOCKS4"),
                    "SOCKS5": i18n.text("Application.proxyType.SOCKS5")
                }><@i18n.message key="AS2Configuration.label.proxyType" /></@></div>
                <div><@form.host name="proxyhost"><@i18n.message key="AS2Configuration.label.proxyHost" /></@></div>
                <div><@form.port name="proxyport"><@i18n.message key="AS2Configuration.label.proxyPort" /></@></div>
                <div><@form.username name="proxyuser"><@i18n.message key="AS2Configuration.label.proxyUsername" /></@></div>
                <div><@form.password name="proxypwd"><@i18n.message key="AS2Configuration.label.proxyPassword" /></@></div>
            </fieldset>
        </fieldset>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar toolbar-management inline">
            <@form.button name="apply"><@i18n.message key="Application.button.apply" /></@>
            <@form.button name="discard"><@i18n.message key="Application.button.discard" /></@>
        </div>
    </div>
</div>