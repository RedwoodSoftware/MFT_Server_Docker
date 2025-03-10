<div id="weboptionsfields" style="line-height:2.7;padding:1em 2em;">
    <div class="checkbox row"><@form.select name="loginredirect" items={
            'storage': i18n.text("WebOptions.redirection.DIRECTORY"),
            'account': i18n.text("WebOptions.redirection.MANAGEMENT")
        }><@i18n.message "WebOptions.label.defaultView" />&nbsp;</@>
    </div>
    <div><@form.checkbox name="showaccountlink"><@i18n.message "WebOptions.label.showAccountLink" /></@></div>
    <div><@form.checkbox name="showpersonalinfo"><@i18n.message "WebOptions.label.showPersonalInfo" /></@></div>
    <div><@form.checkbox name="showpubkeyauth"><@i18n.message "WebOptions.label.showPublicKeyAuth" /></@></div>
    <div><@form.checkbox name="showpgpencrypt"><@i18n.message "WebOptions.label.showPgpEncryption" /></@></div>
    <div><@form.checkbox name="showquotas"><@i18n.message "WebOptions.label.showQuotas" /></@></div>
    <div><@form.checkbox name="showcontacts"><@i18n.message "WebOptions.label.showContacts" /></@></div>
    <div><@form.checkbox name="showadhoc"><@i18n.message "WebOptions.label.showAdHocActivity" /></@></div>
    <div><@form.checkbox name="showdropzones"><@i18n.message "WebOptions.label.showDropZones" /></@></div>
</div>