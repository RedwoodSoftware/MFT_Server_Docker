<@form.dialog id="d-pubkeyauth-generate" title="${i18n.text('PublicKeyAuth.GenerateDialog.title')}">
    <@form.fields name="keypairfields" title="" description=i18n.text('PublicKeyAuth.GenerateDialog.title')?html>
        <div><@form.select name="type" items=["RSA", "DSA", "EC", "ED"]><@i18n.message key="PublicKeyAuth.label.keyType" /></@></div>
        <div><@form.select name="length" items=[1024?c, 2048?c, 4096?c]><@i18n.message key="PublicKeyAuth.label.keyLength" /></@></div>
        <div><@form.select name="keycurve" items=[]><@i18n.message key="PublicKeyAuth.label.keyCurve" /></@></div>
        <div class="radio"><@form.label style="padding-right:5em"><span><@i18n.message key="PublicKeyAuth.label.fileType" /></span></@>
            <#list ["PEM", "PKCS8", "PKCS12", "JKS"] as filetype>
                <@form.radio name="filetype" value="${filetype}"><@i18n.message key="PublicKeyAuth.fileType.${filetype}" /></@>
            </#list>
        </div>
        <div><@form.text name="password" maxlength=50><@i18n.message key="PublicKeyAuth.label.filePassword" /></@></div>
        <div><@form.text name="confirmpwd" maxlength=50><@i18n.message key="PublicKeyAuth.label.confirmPassword" /></@></div>
    </@form.fields>
</@form.dialog>

<@form.dialog id="d-pubkeyauth-import" title=i18n.text('PublicKeyAuth.ImportDialog.title')>
    <@form.fields name="publickeyfields" title="" description=i18n.text('PublicKeyAuth.ImportDialog.title')?html>
        <div><@form.input type="text" name="file" required="true"><@i18n.message key="PublicKeyAuth.label.publicKey" /></@></div>
        <div class="radio">
            <span style="width:9em;display:inline-block;padding-right:5em"><@i18n.message key="PublicKeyAuth.label.fileType" /></span>
            <#list ["X509", "PEM", "PUTTY", "SSH"] as filetype>
                <@form.radio name="filetype" value="${filetype}"><@i18n.message key="PublicKeyAuth.fileType.${filetype}" /></@>
            </#list>
        </div>
    </@form.fields>
</@form.dialog>