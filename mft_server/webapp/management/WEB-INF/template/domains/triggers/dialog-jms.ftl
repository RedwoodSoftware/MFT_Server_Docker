<@form.dialog id="d-jms-clientkeys" title=i18n.text("Triggers.ClientKeyDialog.title")>
    <@form.fields name="jmsclientkeyfields" title=i18n.text("Triggers.ClientKeyDialog.info.short") description=i18n.text("Triggers.ClientKeyDialog.info.long")  disabled=!permissions.triggersControlAllowed>
        <div class="radio"><@form.radio name="type" value="none"><@i18n.message key="Triggers.label.useNoneKey" /></@></div>
        <div><@form.radio name="type" value="serverkey"><@i18n.message key="Triggers.label.useServerKey" /></@><select name="serverkey"></select></div>
        <div><@form.radio name="type" value="keyfile"><@i18n.message key="Triggers.label.useKeyFile" /></@><input type="text" name="keyfile" size="40"/>&nbsp;<@form.button name="browsekeyfile"><@i18n.message key="Triggers.button.browse" /></@></div>
        <div><@form.password name="keyfilepwd" size="40"><@i18n.message key="Triggers.label.keyFilePassword" /></@></div>
    </@form.fields>
</@form.dialog>
