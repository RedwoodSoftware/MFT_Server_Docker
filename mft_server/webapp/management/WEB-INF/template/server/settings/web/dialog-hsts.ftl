<@form.dialog id="d-ssweb-hsts" title=i18n.text("HstsDialog.title")>
    <@form.fields name="policyfields" title=i18n.text("HstsDialog.info.short") description=i18n.text("HstsDialog.info.long")>
        <div><@form.number name="maxage" size="8" required=true><@i18n.message key="HstsDialog.label.maxAge" /></@>&nbsp;<span><@i18n.message key="HstsDialog.label.maxAgeUnit" /></span></div>
        <div class="checkbox"><@form.checkbox name="includesubdomains"><@i18n.message key="HstsDialog.label.includeSubDomains" /></@></div>
        <div class="checkbox"><@form.checkbox name="preload"><@i18n.message key="HstsDialog.label.preload" /></@></div>
    </@form.fields>
</@form.dialog>