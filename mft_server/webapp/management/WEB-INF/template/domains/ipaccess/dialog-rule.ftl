<@form.dialog id="d-ipaccess-rule" title=i18n.text("IpAccess.RuleDialog.title")>
    <@form.fields name="ipaccessrulefields" title=i18n.text("IpAccess.RuleDialog.info.short") description=i18n.text("IpAccess.RuleDialog.info.long") disabled=!permissions.ipAccessSettingsControlAllowed>

        <div><@form.dn name="mask" required=true><@i18n.message key="IpAccess.RuleDialog.label.mask" /></@></div>
        <div><@form.text name="reason"><@i18n.message key="IpAccess.RuleDialog.label.reason" /></@></div>
        <div class="radio">
            <@form.radio name="allowed" value="true" checked="checked"><@i18n.message key="IpAccess.RuleDialog.label.allowed" /></@><br/>
            <@form.radio name="allowed" value="false"><@i18n.message key="IpAccess.RuleDialog.label.denied" /></@>
        </div>
    </@form.fields>
</@form.dialog>