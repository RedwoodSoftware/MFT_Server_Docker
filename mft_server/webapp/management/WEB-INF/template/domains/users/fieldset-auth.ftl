<fieldset>
    <legend><@i18n.message "UserInfo.legend.authentication" /></legend>

    <div class="checkbox"><@form.checkbox name="secured"><@i18n.message "UserInfo.label.secured" /></@></div>
    <div class="checkbox">
        <@form.checkbox name="multifactorauth"><@i18n.message "UserInfo.label.useMultiFactorAuth" /></@>&nbsp;
        <@form.button name="resettotp"><@i18n.message key="UserInfo.button.resetTotpKey" /></@>
    </div>
    <div class="checkbox"><@form.checkbox name="sftppublickeyauth"><@i18n.message key="UserInfo.label.sftpPublicKeyAuthRequired" /></@></div>
    <div class="checkbox"><@form.checkbox name="allowpwdchange"><@i18n.message "UserInfo.label.allowPasswordChange" /></@></div>
    <div class="checkbox"><@form.checkbox name="ignorepwdaging"><@i18n.message "UserInfo.label.ignorePasswordAging" /></@></div>
    <div><@form.datagrid name="clientkeys" height="auto" title="${i18n.text('UserInfo.label.publicKeys')?html}" columns=["publicKeys"]; col><@i18n.message "UserInfo.label.${col}" /></@form.datagrid></div>
</fieldset>