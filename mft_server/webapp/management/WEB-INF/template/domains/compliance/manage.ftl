<div id="password-compliance-fields">
    <div data-options="region:'center'">
        <fieldset class="noborder pane xx-large" style="padding:1em" <#if !permissions.passwordComplianceSettingsControlAllowed> disabled="disabled"</#if>>
            <fieldset>
                <legend><@i18n.message key="Compliance.title.passwordCompliance" /></legend>

                <div><@form.checkbox name="usepwdlength"><@i18n.message key="Compliance.label.minPasswordLength" /></@>&nbsp;<input type="text" name="pwdlength"/>&nbsp;<span><@i18n.message key="Compliance.label.minPasswordLengthUnit" /></span></div>
                <div><@form.checkbox name="useminpwdage"><@i18n.message key="Compliance.label.minPasswordAge" /></@>&nbsp;<input type="text" name="minpwdage"/>&nbsp;<span><@i18n.message key="Compliance.label.minPasswordAgeUnit" /></span></div>
                <div><@form.checkbox name="usemaxpwdage"><@i18n.message key="Compliance.label.maxPasswordAge" /></@>&nbsp;<input type="text" name="maxpwdage"/>&nbsp;<span><@i18n.message key="Compliance.label.maxPasswordAgeUnit" /></span></div>
                <div><@form.checkbox name="usepwdreminder"><@i18n.message key="Compliance.label.passwordChangeReminder" /></@>&nbsp;<input type="text" name="pwdreminder"/>&nbsp;<span><@i18n.message key="Compliance.label.passwordChangeReminderUnit" /></span></div>
                <div><@form.checkbox name="usepwdhistory"><@i18n.message key="Compliance.label.passwordHistory" /></@>&nbsp;<input type="text" name="pwdhistory"/>&nbsp;<span><@i18n.message key="Compliance.label.passwordHistoryUnit" /></span></div>
                <div class="checkbox"><@form.checkbox name="ftlresetpwd"><@i18n.message key="Compliance.label.firstTimeLoginResetPassword" /></@></div>
            </fieldset>

            <fieldset>
                <legend><@i18n.message key="Compliance.title.passwordRequiredChars" /></legend>

                <div class="checkbox"><@form.checkbox name="uppercase"><@i18n.message key="Compliance.label.uppercase" /></@></div>
                <div class="checkbox"><@form.checkbox name="lowercase"><@i18n.message key="Compliance.label.lowercase" /></@></div>
                <div class="checkbox"><@form.checkbox name="numeric"><@i18n.message key="Compliance.label.numeric" /></@></div>
                <div class="checkbox"><@form.checkbox name="nonalphanumeric"><@i18n.message key="Compliance.label.nonAlphaNumeric" /></@></div>
                <div class="checkbox"><@form.checkbox name="denylogin"><@i18n.message key="Compliance.label.denyLogin" /></@></div>
            </fieldset>

            <fieldset>
                <legend><@i18n.message key="Compliance.title.username" /></legend>
                <div><@i18n.message key="Compliance.info.username" /></div>

                <div class="checkbox"><@form.checkbox name="enableusernameregex"><@i18n.message key="Compliance.label.usernameRegex" /></@>&nbsp;<input type="text" name="usernameregex"/></div>
            </fieldset>
        </fieldset>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar toolbar-management inline">
            <@form.button name="apply" disabled=!permissions.passwordComplianceSettingsControlAllowed><@i18n.message key="Application.button.apply" /></@>
            <@form.button name="discard" disabled=!permissions.passwordComplianceSettingsControlAllowed><@i18n.message key="Application.button.discard" /></@>
        </div>
    </div>
</div>