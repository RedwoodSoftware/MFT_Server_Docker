<@form.dialog id="d-keysummary-view" title=i18n.text("KeyManager.ViewDialog.title")>
    <div class="content">
        <div data-options="region:'north',border:false">
            <h6><@i18n.message key="KeyManager.ViewDialog.info.short" /><span><@i18n.message key="KeyManager.ViewDialog.info.long" /></span></h6>
        </div>
        <div data-options="region:'center',border:false" class="wrap">
            <@form.datagrid name="summary" height=""/>
        </div>
    </div>
</@form.dialog>

<#if permissions.domainKeystoreControlAllowed>
    <@form.dialog id="d-pubkey-import" title=i18n.text("ImportPublicKeyDialog.title")>
        <@form.fields name="importpubkeyfields" title=i18n.text("ImportPublicKeyDialog.info.short") description=i18n.text("ImportPublicKeyDialog.info.long")>
            <div><@form.dn name="alias" maxlength="50" required=true><@i18n.message key="ImportPublicKeyDialog.label.alias" /></@></div>
            <div><@form.input type="text" name="file" required=true><@i18n.message key="ImportPublicKeyDialog.label.file" /></@></div>
        </@form.fields>
    </@form.dialog>
    <@form.dialog id="d-pubkey-importjson" title=i18n.text("ImportPublicKeyBatchDialog.title")>
        <@form.fields name="importpubkeyfields" title=i18n.text("ImportPublicKeyBatchDialog.info.short") description=i18n.text("ImportPublicKeyBatchDialog.info.long")>
            <div><@form.input type="text" name="file" required=true><@i18n.message key="ImportPublicKeyBatchDialog.label.file" /></@></div>
            <div class="checkbox"><@form.checkbox name="overwrite"><@i18n.message key="ImportPublicKeyBatchDialog.label.overwrite" /></@></div>
        </@form.fields>
    </@form.dialog>
</#if>

<#if permissions.domainKeystoreControlAllowed>
    <@form.dialog id="d-pubkey-import-tsl" title=i18n.text("ImportPublicKeyTslDialog.title")>
        <@form.fields name="importpubkeyfields" title=i18n.text("ImportPublicKeyTslDialog.info.short") description=i18n.text("ImportPublicKeyTslDialog.info.long")>
            <div><@form.url name="url" maxlength="50" required=true><@i18n.message key="ImportPublicKeyTslDialog.label.url" /></@></div>
        </@form.fields>
    </@form.dialog>
</#if>

<@form.dialog id="d-certificate-export" title=i18n.text("ExportCertificateDialog.title")>
    <fieldset name="exportkeyfields" class="large">
        <@form.fields_title title=i18n.text("ExportCertificateDialog.info.short") description=i18n.text("ExportCertificateDialog.info.long") />
        <div><@form.dn name="filename" required=true><@i18n.message key="ExportCertificateDialog.label.file" /></@></div>
        <div><@form.select name="format" items={
            "X509": i18n.text("ExportKeys.format.X509"),
            "PEM": i18n.text("ExportKeys.format.PEM")
        }><@i18n.message key="ExportCertificateDialog.label.format" /></@></div>
    </fieldset>
</@form.dialog>

<@form.dialog id="d-publickey-export" title=i18n.text("ExportPublicKeyDialog.title")>
    <fieldset name="exportkeyfields" class="large">
        <@form.fields_title title=i18n.text("ExportPublicKeyDialog.info.short") description=i18n.text("ExportPublicKeyDialog.info.long") />
        <div><@form.dn name="filename" required=true><@i18n.message key="ExportCertificateDialog.label.file" /></@></div>
        <div><@form.select name="format" items={
            "X509": i18n.text("ExportKeys.format.X509"),
            "PEM": i18n.text("ExportKeys.format.PEM"),
            "PUTTY": i18n.text("ExportKeys.format.PUTTY"),
            "OPENSSH": i18n.text("ExportKeys.format.OPENSSH"),
            "SSH": i18n.text("ExportKeys.format.SSH")
        }><@i18n.message key="ExportCertificateDialog.label.format" /></@></div>
    </fieldset>
</@form.dialog>

<@form.dialog id="d-privatekey-export" title=i18n.text("ExportPrivateKeyDialog.title")>
    <fieldset name="exportkeyfields" class="large">
        <@form.fields_title title=i18n.text("ExportPrivateKeyDialog.info.short") description=i18n.text("ExportPrivateKeyDialog.info.long")/>
        <div><@form.dn name="filename" required=true><@i18n.message key="ExportPrivateKeyDialog.label.file" /></@></div>
        <div><@form.text name="password" maxlength=50><@i18n.message key="ExportPrivateKeyDialog.label.password" /></@></div>
        <div><@form.text name="confirmpwd" maxlength=50><@i18n.message key="ExportPrivateKeyDialog.label.confirmPassword" /></@></div>
        <div><@form.select name="format" items={
            "JKS": i18n.text("ExportKeys.format.JKS"),
            "PKCS12": i18n.text("ExportKeys.format.PKCS12"),
            "PKCS8": i18n.text("ExportKeys.format.PKCS8"),
            "PEM": i18n.text("ExportKeys.format.PEM")
        }><@i18n.message key="ExportPrivateKeyDialog.label.format" /></@></div>
    </fieldset>
</@form.dialog>