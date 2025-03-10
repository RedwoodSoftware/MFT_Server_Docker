<#ftl strip_whitespace=true>

<div><@form.email name="email" autocomplete="off"><@i18n.message key="Users.label.email" /></@></div>
<div><@form.text name="company" maxlength="150"><@i18n.message key="Users.label.company" /></@></div>
<div><label><@i18n.message "Users.label.phone" /></label>
    <input type="tel" name="phonecode" aria-label="${i18n.text("Users.label.phoneCode")?html}" data-options="prompt:'${i18n.text("Users.label.phoneCode")?js_string?html}'" />&nbsp;
    <input type="tel" name="phonenum" aria-label="${i18n.text("Users.label.phoneNumber")?html}" data-options="prompt:'${i18n.text("Users.label.phoneNumber")?js_string?html}'" />&nbsp;x&nbsp;
    <input type="tel" name="phoneext" aria-label="${i18n.text("Users.label.phoneExtension")?html}" data-options="prompt:'${i18n.text("Users.label.phoneExtension")?js_string?html}'" />&nbsp;
</div>
<div><@form.text name="notes"><@i18n.message key="Users.label.notes" /></@></div>
<div><@form.select name="loginredirect" items={
        'STORAGE': i18n.text("Users.loginRedirection.STORAGE")?html,
        'MANAGEMENT': i18n.text("Users.loginRedirection.MANAGEMENT")?html
    }><@i18n.message "Users.label.loginRedirection" />&nbsp;</@>
</div>
<#if model.permission.userGroupsControlAllowed>
    <div><@form.datagrid name="usergroups" height="auto" title="${i18n.text('Users.label.group')?html}" columns=["groups"] height="auto"><@i18n.message "Users.label.group" /></@></div>
</#if>
<div class="row"><@form.checkbox name="enabled"><@i18n.message key="Users.label.enabled" /></@></div>
<div class="row"><@form.checkbox name="secured"><@i18n.message key="Users.label.secured" /></@></div>
<div class="row"><@form.checkbox name="expires"><@i18n.message "Users.label.expires" /></@>&nbsp;<input type="text" name="expirationdate" title="${i18n.text("Users.label.expires")?html}"/></div>
<div class="row"><@form.checkbox name="pwdchange"><@i18n.message key="Users.label.passwordChangingAllowed" /></@></div>
<div class="row">
    <@form.checkbox name="adhocallowed"><@i18n.message key="Users.label.adHocTransferEnabled" /></@>&nbsp;
    <@form.button name="adhocsettings"><@i18n.message key="Users.button.settings" /></@>
</div>
<#if model.permission.multiFactorAuthControlAllowed>
    <div class="checkbox">
        <@form.checkbox name="multifactorauth"><@i18n.message key="Users.label.useMultiFactorAuth" /></@>&nbsp;
        <@form.button name="resettotp"><@i18n.message key="Users.button.resetTotpKey" /></@>
    </div>
</#if>
<div class="row"><@form.checkbox name="sftppublickeyauth"><@i18n.message key="Users.label.sftpPublicKeyAuthRequired" /></@></div>
