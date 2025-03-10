<#-- @ftlvariable name="model" type="com.jscape.inet.mft.subsystems.web.ui.view.account.UserTemplateModel" -->

<@form.dialog id="d-user-changepwd" title=i18n.text("Users.PasswordDialog.title")?html escapeAttrs=false>
    <@form.fields name="userpasswordfields" title=i18n.text("Users.PasswordDialog.info.short")?html description=i18n.text("Users.PasswordDialog.info.long")?html>
        <div class="row"><@form.dn name="oldpassword" required=false><@i18n.message "Users.PasswordDialog.label.oldPassword" /></@></div>
        <div><@form.dn name="newpassword"><@i18n.message "Users.PasswordDialog.label.password" /></@></div>
        <div><@form.dn name="confirmpwd"><@i18n.message "Users.PasswordDialog.label.confirmationPassword" /></@></div>
        <#if model.showResetPasswordRequired>
            <div class="checkbox"><@form.checkbox name="resetrequired"><@i18n.message key="Users.PasswordDialog.label.resetRequired" /></@></div>
        </#if>
    </@form.fields>
</@form.dialog>