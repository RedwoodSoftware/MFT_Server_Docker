<@form.dialog id="d-pgpkey-import" title=i18n.text("PgpKeys.ImportDialog.title")>
    <@form.fields name="importpgpkeyfields" title=i18n.text("PgpKeys.ImportDialog.info.short") description=i18n.text("PgpKeys.ImportDialog.info.long")>
        <div>
            <label><@i18n.message key="PgpKeys.ImportDialog.label.type" /></label>
            <span class="radio">
                <@form.radio name="type" value="public"><@i18n.message key="PgpKeys.ImportDialog.label.typePublic" /></@>&nbsp;&nbsp;
                <@form.radio name="type" value="secret"><@i18n.message key="PgpKeys.ImportDialog.label.typeSecret" /></@>
            </span>
        </div>
        <div><@form.input type="text" name="filesource" required=true><@i18n.message key="PgpKeys.ImportDialog.label.file" /></@></div>
        <div><@form.text name="filepwd" maxlength=50><@i18n.message key="PgpKeys.ImportDialog.label.password" /></@></div>
    </@form.fields>
</@form.dialog>

<@form.dialog id="d-pgpkey-importjson" title=i18n.text("PgpKeys.ImportBatchDialog.title")>
    <@form.fields name="importpgpkeyjsonfields" title=i18n.text("PgpKeys.ImportBatchDialog.info.short") description=i18n.text("PgpKeys.ImportBatchDialog.info.long")>
        <div>
            <label><@i18n.message key="PgpKeys.ImportBatchDialog.label.type" /></label>
            <span class="radio">
                <@form.radio name="type" value="public"><@i18n.message key="PgpKeys.ImportBatchDialog.label.typePublic" /></@>&nbsp;&nbsp;
                <@form.radio name="type" value="secret"><@i18n.message key="PgpKeys.ImportBatchDialog.label.typeSecret" /></@>
             </span>
        </div>
        <div><@form.input type="text" name="file" required=true><@i18n.message key="PgpKeys.ImportBatchDialog.label.file" /></@></div>
        <div class="checkbox"><@form.checkbox name="overwrite"><@i18n.message key="PgpKeys.ImportBatchDialog.label.overwrite" /></@></div>
     </@form.fields>
</@form.dialog>

<@form.dialog id="d-pgpkey-exportpublic" title=i18n.text("PgpKeys.ExportPublicKeyDialog.title")>
    <@form.fields name="exportpgpkeyfields" title=i18n.text("PgpKeys.ExportPublicKeyDialog.info.short") description=i18n.text("PgpKeys.ExportPublicKeyDialog.info.long")>
        <div><@form.dn name="filename" required=true><@i18n.message key="PgpKeys.ExportPublicKeyDialog.label.file" /></@></div>
    </@form.fields>
</@form.dialog>

<@form.dialog id="d-pgpkey-exportsecret" title=i18n.text("PgpKeys.ExportSecretKeyDialog.title")>
    <@form.fields name="exportpgpkeyfields" title=i18n.text("PgpKeys.ExportSecretKeyDialog.info.short") description=i18n.text("PgpKeys.ExportSecretKeyDialog.info.long")>
        <div><@form.dn name="filename" required=true><@i18n.message key="PgpKeys.ExportSecretKeyDialog.label.file" /></@></div>
        <div><@form.text name="filepwd" required=true maxlength=50><@i18n.message key="PgpKeys.ExportSecretKeyDialog.label.password" /></@></div>
    </@form.fields>
</@form.dialog>

<@form.dialog id="d-pgpkey-generate" title=i18n.text("PgpKeys.GenerateDialog.title")>
    <@form.fields name="generatepgpkeyfields" title=i18n.text("PgpKeys.GenerateDialog.info.short") description=i18n.text("PgpKeys.GenerateDialog.info.long")>
        <div><@form.dn name="realname" required=true maxlength="50"><@i18n.message key="PgpKeys.GenerateDialog.label.name" /></@></div>
        <div><@form.email name="email"><@i18n.message key="PgpKeys.GenerateDialog.label.email" /></@></div>
        <div><@form.select name="keytype" items=["RSA", "DSA", "EC", "ED"]><@i18n.message key="PgpKeys.GenerateDialog.label.keyAlgorithm" /></@></div>
        <div><@form.select name="keylength" items=[1024?c, 2048?c, 4096?c]><@i18n.message key="PgpKeys.GenerateDialog.label.keyLength" /></@></div>
        <div><@form.select name="keycurve" items=[]><@i18n.message key="PgpKeys.GenerateDialog.label.keyCurve" /></@></div>
        <div><@form.number name="period" maxlength="5"><@i18n.message key="PgpKeys.GenerateDialog.label.validityPeriod" /></@>&nbsp;<span><@i18n.message key="PgpKeys.GenerateDialog.label.validityPeriodUnit" /></span></div>
    </@form.fields>
</@form.dialog>

<@form.dialog id="d-pgpkey-sign" title=i18n.text("PgpKeys.SignDialog.title")>
    <@form.fields name="signpgpkeyfields" title=i18n.text("PgpKeys.SignDialog.info.short") description=i18n.text("PgpKeys.SignDialog.info.long")>
        <div><@form.select name="signingkey" required=true items=[]><@i18n.message key="PgpKeys.SignDialog.signingKey" /></@></div>
    </@form.fields>
</@form.dialog>

<@form.dialog id="d-pgpkey-signatures" title=i18n.text("PgpKeys.SignaturesDialog.title")>
    <fieldset  name="pgpkeysignaturesfields" class="panel content" style="height:300px;overflow:auto">
        <fieldset name="pgpkeysignatureentryfields">
            <dl class="group">
                <dt><@i18n.message key="PgpKeys.SignaturesDialog.label.number" /></dt><dd><code aria-label="number"></code></dd>
                <dt><@i18n.message key="PgpKeys.SignaturesDialog.label.signingKey" /></dt><dd><code aria-label="signingkey"></code></dd>
                <dt><@i18n.message key="PgpKeys.SignaturesDialog.label.created" /></dt><dd><code aria-label="creationtime"></code></dd>
                <dt><@i18n.message key="PgpKeys.SignaturesDialog.label.type" /></dt><dd><code aria-label="type"></code></dd>
                <dt><@i18n.message key="PgpKeys.SignaturesDialog.label.version" /></dt><dd><code aria-label="version"></code></dd>
            </dl>
        </fieldset>
    </fieldset>
</@form.dialog>