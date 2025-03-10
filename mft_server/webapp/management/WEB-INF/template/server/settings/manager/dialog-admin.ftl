<#macro admin_fields login_disabled password_inline=true reset_otp_btn=false >
    <div class="content">
        <div data-options="region:'center',border:false">
            <fieldset class="large noborder">
                <div><@form.text name="name" maxlength="50"><@i18n.message key="Administrators.label.name" /></@></div>
                <div><@form.username name="login" disabled="${login_disabled?string}" required=true><@i18n.message key="Administrators.label.login" /></@></div>
                <#if password_inline>
                    <div><@form.password name="password" required=true><@i18n.message key="Administrators.label.password" /></@></div>
                    <div><@form.password name="confirmpwd" required=true><@i18n.message key="Administrators.label.confirmPassword" /></@></div>
                </#if>
                <div><@form.select name="role" required=true items=[]><@i18n.message key="Administrators.label.role" /></@></div>
                <div><label><@i18n.message "Administrators.label.phone" /></label><input type="tel" name="phonecode"/>&nbsp;<input type="tel" name="phonenum"/>&nbsp;<input type="tel" name="phoneext"/></div>
                <div><@form.checkbox name="usetheme"><@i18n.message key="Administrators.label.theme" /></@><@form.dn name="theme" readonly="readonly" required=false/>&nbsp;<@form.button name="changetheme"><@i18n.message key="Administrators.button.changeTheme" /></@></div>
                <div class="checkbox"><@form.checkbox name="system"><@i18n.message key="Administrators.label.system" /></@></div>
                <div class="checkbox"><@form.checkbox name="enabled"><@i18n.message key="Administrators.label.enabled" /></@></div>
                <div class="checkbox">
                    <@form.checkbox name="multifactorauth"><@i18n.message "Administrators.label.useMultiFactorAuth" /></@>
                    <#if reset_otp_btn>&nbsp;<@form.button name="resettotp"><@i18n.message key="Administrators.button.resetTotpKey" /></@></#if>
                </div>
            </fieldset>
        </div>
        <#if !password_inline>
            <div data-options="region:'south',border:false">
                <div><@form.button name="changepwd"><@i18n.message key="Administrators.button.changePassword" /></@></div>
            </div>
        </#if>
    </div>
</#macro>


<@form.dialog id="d-ssms-admin-add" title=i18n.text("Administrators.AddDialog.title") header=i18n.text("Administrators.AddDialog.info.short") description=i18n.text("Administrators.AddDialog.info.long")>
    <@admin_fields login_disabled=false />
</@form.dialog>

<@form.dialog id="d-ssms-admin-edit" title=i18n.text("Administrators.EditDialog.title") header=i18n.text("Administrators.EditDialog.info.short") description=i18n.text("Administrators.EditDialog.info.long")>
    <@admin_fields login_disabled=true password_inline=false reset_otp_btn=true />
</@form.dialog>

<@form.dialog id="d-ssms-admin-copy" title=i18n.text("Administrators.CopyDialog.title") header=i18n.text("Administrators.CopyDialog.info.short") description=i18n.text("Administrators.CopyDialog.info.long")>
    <fieldset class="noborder pane">
        <div><@form.username name="login" tabindex="0" required=true><@i18n.message "Administrators.CopyDialog.label.login" /></@></div>
        <div class="checkbox"><@form.checkbox name="editafterdone"><@i18n.message key="Administrators.CopyDialog.label.editAfterCopying" /></@></div>
    </fieldset>
</@form.dialog>

<@form.dialog id="d-ssms-admin-changepwd" title=i18n.text("Administrators.ChangePasswordDialog.title") header=i18n.text("Administrators.ChangePasswordDialog.info.short") description=i18n.text("Administrators.ChangePasswordDialog.info.long")>
    <fieldset class="noborder pane">
        <div class="row"><@form.password name="oldpassword"><@i18n.message key="Administrators.label.currentPassword" /></@></div>
        <div><@form.password name="newpassword" required=true><@i18n.message key="Administrators.label.password" /></@></div>
        <div><@form.password name="confirmpwd" required=true><@i18n.message key="Administrators.label.confirmPassword" /></@></div>
    </fieldset>
</@form.dialog>
