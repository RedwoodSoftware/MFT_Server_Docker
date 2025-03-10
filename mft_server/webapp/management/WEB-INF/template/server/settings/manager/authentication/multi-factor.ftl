<#ftl strip_whitespace=true>
<#import "macro.ftl" as manager />

<div id="manager-two-factor-auth-fields" role="group">

    <div data-options="region:'north',border:false" class="layout-pane-top">
        <fieldset class="noborder pane">
            <div><@form.select name="type" dataOptions="disabled:${permissions.managementSettingsAllowed?string('false','true')}" items={
                'NONE': i18n.text("AuthenticationService.type.NONE"),
                'GOOGLE_AUTHENTICATOR': i18n.text("AuthenticationService.type.TOTP")
            }><@i18n.message "AuthenticationService.label.type" /></@>
            </div>
        </fieldset>
    </div>

    <div data-options="region:'center'">
        <@manager.auth_service_fields id="totpuserconfirmfields" add_variable_btn=false test_service_btn=false>
            <@i18n.message key="AuthenticationService.type.TOTP.description" />
        </@>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar toolbar-management inline">
            <@form.button name="apply" disabled=!permissions.managementSettingsAllowed><@i18n.message key="Application.button.apply" /></@>
            <@form.button name="discard" disabled=!permissions.managementSettingsAllowed><@i18n.message key="Application.button.discard" /></@>
        </div>
    </div>
</div>