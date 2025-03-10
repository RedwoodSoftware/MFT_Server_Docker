<#ftl strip_whitespace=true>
<#import "macro.ftl" as manager />

<div id="manager-web-sso-auth-fields" role="group">

    <div data-options="region:'north',border:false" class="layout-pane-top">
        <fieldset class="noborder pane">
            <div><@form.select name="type" dataOptions="disabled:${permissions.managementSettingsAllowed?string('false','true')}" items={
                'NONE': i18n.text("AuthenticationService.type.NONE"),
                'SAML': i18n.text("AuthenticationService.type.SAML"),
                'OPEN_ID': i18n.text("AuthenticationService.type.OPEN_ID"),
                'OPEN_ID_CONNECT': i18n.text("AuthenticationService.type.OPEN_ID_CONNECT")
            }><@i18n.message key="AuthenticationService.label.type" /></@>
            </div>
        </fieldset>
    </div>

    <div data-options="region:'center'">
        <@manager.auth_service_fields id="webssoauthsamlfields" add_variable_btn=false test_service_btn=false; roleInput, usernameConversionInput>
            <fieldset class="large">
                <legend><@i18n.message "AuthenticationService.legend.identityProvider" /></legend>

                <div><@form.url name="signinurl" required=true><@i18n.message "AuthenticationService.label.signInUrl" /></@></div>
                <div><@form.url name="signouturl" required=true><@i18n.message "AuthenticationService.label.signOutUrl" /></@></div>
                <div><@form.url name="changepwdurl"><@i18n.message "AuthenticationService.label.changePasswordUrl" /></@></div>
                <div><@form.checkbox name="usedecryptionkey"><@i18n.message key="AuthenticationService.label.useDecryptionKey" /></@><select name="decryptionkey"></select></div>
                <div><@form.select name="hostkey" items={}><@i18n.message "AuthenticationService.label.hostKey" /></@></div>
                <div><@form.select name="nameidformat" items={
                    'UNSPECIFIED': i18n.text("AuthenticationService.nameIdFormat.UNSPECIFIED"),
                    'PERSISTENT': i18n.text("AuthenticationService.nameIdFormat.PERSISTENT"),
                    'TRANSIENT': i18n.text("AuthenticationService.nameIdFormat.TRANSIENT")
                }><@i18n.message "AuthenticationService.label.nameIdFormat" /></@></div>
                <div class="checkbox">${roleInput}</div>
                <div class="checkbox">${usernameConversionInput}</div>
                <div class="checkbox"><@form.checkbox name="allownonsso"><@i18n.message "AuthenticationService.label.allowNonSsoLogin" /></@></div>
            </fieldset>
        </@>

        <@manager.auth_service_fields id="webssoauthopenidfields" add_variable_btn=false test_service_btn=false; roleInput, usernameConversionInput>
            <fieldset class="large">
                <legend><@i18n.message "AuthenticationService.legend.identityProvider" /></legend>

                <div><@form.url name="signinurl" required=true><@i18n.message "AuthenticationService.label.signInUrl" /></@></div>
                <div><@form.url name="signouturl" required=true><@i18n.message "AuthenticationService.label.signOutUrl" /></@></div>
                <div class="checkbox">${roleInput}</div>
                <div class="checkbox">${usernameConversionInput}</div>
                <div class="checkbox"><@form.checkbox name="allownonsso"><@i18n.message "AuthenticationService.label.allowNonSsoLogin" /></@></div>
            </fieldset>
        </@>

        <@manager.auth_service_fields id="webssoauthopenidconnectfields" add_variable_btn=false test_service_btn=false; roleInput, usernameConversionInput>
            <fieldset class="large">
                <legend><@i18n.message "AuthenticationService.legend.identityProvider" /></legend>

                <div><@form.url name="signinurl" required=true><@i18n.message "AuthenticationService.label.authorizationUrl" /></@></div>
                <div><@form.url name="tokenurl" required=true><@i18n.message "AuthenticationService.label.tokenVerificationUrl" /></@></div>
                <div><@form.dn name="clientid" required=true><@i18n.message "AuthenticationService.label.clientId" /></@></div>
                <div><@form.dn name="clientsecret" required=true><@i18n.message "AuthenticationService.label.clientSecret" /></@></div>
                <div><@form.url name="redirectionurl" required=false><@i18n.message "AuthenticationService.label.redirectionUrl" /></@></div>
                <div class="checkbox">${roleInput}</div>
                <div class="checkbox">${usernameConversionInput}</div>
                <div class="checkbox"><@form.checkbox name="allownonsso"><@i18n.message "AuthenticationService.label.allowNonSsoLogin" /></@></div>
            </fieldset>
        </@>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar toolbar-management inline">
            <@form.button name="apply" disabled=!permissions.managementSettingsAllowed><@i18n.message key="Application.button.apply" /></@>
            <@form.button name="discard" disabled=!permissions.managementSettingsAllowed><@i18n.message key="Application.button.discard" /></@>
        </div>
    </div>
</div>