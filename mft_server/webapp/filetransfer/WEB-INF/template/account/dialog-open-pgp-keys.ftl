<@form.dialog id="d-pgpencrypt-generate" title=i18n.text('PgpEncryption.GenerateDialog.title')>
    <@form.fields name="pgpencryptfields" title=i18n.text('PgpEncryption.GenerateDialog.info.short')?html description=i18n.text('PgpEncryption.GenerateDialog.info.long')?html>
        <div><@form.dn name="realname" required=true style="width:50%"><@i18n.message key="PgpEncryption.label.realName" /></@></div>
        <div><@form.email name="email" style="width:50%"><@i18n.message key="PgpEncryption.label.email" /></@></div>
        <div><@form.select name="keytype" items=["RSA", "DSA", "EC", "ED"]><@i18n.message key="PgpEncryption.label.keyType" /></@></div>
        <div><@form.select name="keylength" items=[1024?c, 2048?c, 4096?c]><@i18n.message key="PgpEncryption.label.keyLength" /></@></div>
        <div><@form.select name="keycurve" items=[]><@i18n.message key="PgpEncryption.label.keyCurve" /></@></div>
        <div><@form.number name="period" maxlength="5"><@i18n.message key="PgpEncryption.label.validityPeriod" /></@>&nbsp;<span><@i18n.message key="PgpEncryption.label.validityPeriodUnit" /></span></div>
        <div><@form.dn name="password" required=false style="width:40%"><@i18n.message key="PgpEncryption.label.filePassword" /></@></div>
        <div><@form.dn name="confirmpwd"  required=false style="width:40%"><@i18n.message key="PgpEncryption.label.confirmPassword" /></@></div>
    </@form.fields>
</@form.dialog>

<@form.dialog id="d-pgpencrypt-import" title=i18n.text('PgpEncryption.ImportDialog.title')>
    <@form.fields name="pgpencryptfields" title="" description=i18n.text('PgpEncryption.ImportDialog.title')?html>
        <div><@form.input type="text" name="file" required="true"><@i18n.message key="PgpEncryption.label.publicKey" /></@></div>
    </@form.fields>
</@form.dialog>