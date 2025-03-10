<div id="domain-two-factor-auth-fields" role="group">

    <div data-options="region:'north',border:false" class="layout-pane-top">
        <fieldset class="noborder pane">
            <div><@form.select name="type" dataOptions="disabled:${permissions.authenticationSettingsControlAllowed?string('false','true')}" items={
                'NONE': i18n.text("Authentication.type.NONE"),
                'PHONE': i18n.text("Authentication.type.PHONE"),
                'TOTP': i18n.text("Authentication.type.TOTP"),
                'CUSTOM': i18n.text("Authentication.type.CUSTOM")
            }><@i18n.message "Authentication.label.type" /></@>
            </div>
        </fieldset>
    </div>

    <div data-options="region:'center'" class="wrap">
        <div id="phonefactorauthfields" class="hidden">
            <div data-options="region:'center',border:false">
                <fieldset class="noborder">
                    <div><@form.path name="dir" required=true><@i18n.message "Authentication.label.licenseDirectory" /></@>&nbsp;<@form.button name="browsedir"><@i18n.message "Authentication.button.browse" /></@></div>
                    <div><@form.password name="password"><@i18n.message "Authentication.label.phoneFactorPassword" /></@></div>
                    <div class="checkbox"><@form.checkbox name="allowinterncall"><@i18n.message "Authentication.label.allowInternationalCalls" /></@></div>
                </fieldset>
            </div>
            <div data-options="region:'south',border:false">
                <div class="viewpane-toolbar toolbar-selection inline">
                    <@form.button name="addvar"><@i18n.message "Authentication.button.addVariable" /></@>
                </div>
            </div>
        </div>

        <div id="totpuserconfirmfields" class="hidden">
            <div data-options="region:'center',border:false">
                <fieldset class="noborder"><@i18n.message key="Authentication.type.TOTP.description" /></fieldset>
            </div>
        </div>

        <div id="customuserconfirmfields" class="hidden">
            <div data-options="region:'center',border:false">
                <fieldset class="large noborder">
                    <div><@form.dn name="classname" required=true><@i18n.message "Authentication.label.class" /></@></div>
                </fieldset>
            </div>
        </div>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar toolbar-management inline">
            <@form.button name="apply" disabled=!permissions.authenticationSettingsControlAllowed><@i18n.message key="Application.button.apply" /></@>
            <@form.button name="discard" disabled=!permissions.authenticationSettingsControlAllowed><@i18n.message key="Application.button.discard" /></@>
        </div>
    </div>
</div>