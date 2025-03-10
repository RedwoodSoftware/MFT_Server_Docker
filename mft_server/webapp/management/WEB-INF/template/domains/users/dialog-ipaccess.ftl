<@form.dialog id="d-user-ipaccess-rule" header=i18n.text("UserIpAccess.RuleDialog.info.short") description=i18n.text("UserIpAccess.RuleDialog.info.long")>
    <fieldset class="noborder pane">
        <div><@form.host name="mask" required=true><@i18n.message key="UserIpAccess.RuleDialog.label.mask" /></@></div>
        <div><@form.text name="reason"><@i18n.message key="UserIpAccess.RuleDialog.label.reason" /></@></div>
        <div class="radio"><@form.radio name="allowed" value="true" checked="checked"><@i18n.message key="UserIpAccess.RuleDialog.button.allowed" /></@></div>
        <div class="radio"><@form.radio name="allowed" value="false"><@i18n.message key="UserIpAccess.RuleDialog.button.denied" /></@></div>
    </fieldset>
</@form.dialog>