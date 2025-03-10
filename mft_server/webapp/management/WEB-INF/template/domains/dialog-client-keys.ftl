<@form.dialog id="d-clientkeys" title=i18n.text("Domain.ClientKeyDialog.title") header=i18n.text("Domain.ClientKeyDialog.info.short") description=i18n.text("Domain.ClientKeyDialog.info.long")>
    <fieldset class="noborder pane">
        <div class="radio row"><@form.radio name="type" value="none" description=i18n.text("Domain.ClientKeyDialog.label.useNoneKey.description")><@i18n.message key="Domain.ClientKeyDialog.label.useNoneKey" /></@></div>
        <div class="radio row"><@form.radio name="type" value="onetimekey" description=i18n.text("Domain.ClientKeyDialog.label.useOneTimeKey.description")><@i18n.message key="Domain.ClientKeyDialog.label.useOneTimeKey" /></@></div>
        <div><@form.radio name="type" value="serverkey"><@i18n.message key="Domain.ClientKeyDialog.label.useServerKey" /></@><@form.select name="serverkey" items=[] description=i18n.text("Domain.ClientKeyDialog.label.useServerKey.description") /></div>
        <div><@form.radio name="type" value="keyfile"><@i18n.message key="Domain.ClientKeyDialog.label.useKeyFile" /></@><@form.input name="keyfile" description=i18n.text("Domain.ClientKeyDialog.label.useKeyFile.description") />&nbsp;<@form.button name="browsekeyfile"><@i18n.message key="Domain.ClientKeyDialog.button.browse" /></@></div>
        <div><@form.password name="keyfilepwd" description=i18n.text("Domain.ClientKeyDialog.label.keyFilePassword.description")><@i18n.message key="Domain.ClientKeyDialog.label.keyFilePassword" /></@></div>
    </fieldset>
</@form.dialog>
