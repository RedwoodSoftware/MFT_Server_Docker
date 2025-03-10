<div id="domain-web-sso-auth-fields" role="group">

    <div data-options="region:'north',border:false" class="layout-pane-top">
        <fieldset class="noborder pane">
            <div><@form.select name="type" dataOptions="disabled:${permissions.authenticationSettingsControlAllowed?string('false','true')}" items={
                'NONE': i18n.text("Authentication.type.NONE"),
                'SAML': i18n.text("Authentication.type.SAML"),
                'OPEN_ID': i18n.text("Authentication.type.OPEN_ID"),
                'OPEN_ID_CONNECT': i18n.text("Authentication.type.OPEN_ID_CONNECT")
            }><@i18n.message key="Authentication.label.type" /></@>
            </div>
        </fieldset>
    </div>

    <div data-options="region:'center'">
        <div id="webssoauthsamlfields" class="hidden">
            <div data-options="region:'center',border:false">
                <fieldset class="large">
                    <legend><@i18n.message "Authentication.legend.identityProvider" /></legend>

                    <div><@form.url name="signinurl" required=true><@i18n.message "Authentication.label.signInUrl" /></@></div>
                    <div><@form.url name="signouturl" required=true><@i18n.message "Authentication.label.signOutUrl" /></@></div>
                    <div><@form.url name="changepwdurl"><@i18n.message "Authentication.label.changePasswordUrl" /></@></div>
                    <div><@form.checkbox name="usedecryptionkey"><@i18n.message key="Authentication.label.useDecryptionKey" /></@><select name="decryptionkey"></select></div>
                    <div><@form.select name="hostkey" items={}><@i18n.message "Authentication.label.hostKey" /></@></div>
                    <div><@form.select name="nameidformat" items={
                        'UNSPECIFIED': i18n.text("Authentication.nameIdFormat.UNSPECIFIED"),
                        'PERSISTENT': i18n.text("Authentication.nameIdFormat.PERSISTENT"),
                        'TRANSIENT': i18n.text("Authentication.nameIdFormat.TRANSIENT")
                    }><@i18n.message "Authentication.label.nameIdFormat" /></@></div>
                    <div class="checkbox"><@form.checkbox name="usetemplate"><@i18n.message "Authentication.label.useTemplate" /></@>&nbsp;<select name="template"></select></div>
                    <div class="checkbox"><@form.checkbox name="useusernameconversion"><@i18n.message "Authentication.label.useUsernameConversion" /></@>&nbsp;
                    <@form.select name="usernameconversion" items={
                        'LOWERCASE': i18n.text("Authentication.usernameConversion.LOWERCASE"),
                        'UPPERCASE': i18n.text("Authentication.usernameConversion.UPPERCASE")
                    }/>
                    </div>
                    <div class="checkbox"><@form.checkbox name="allownonsso"><@i18n.message "Authentication.label.allowNonSsoLogin" /></@></div>
                </fieldset>
            </div>
        </div>

        <div id="webssoauthopenidfields" class="hidden">
            <div data-options="region:'center',border:false">
                <fieldset class="large">
                    <legend><@i18n.message "Authentication.legend.identityProvider" /></legend>

                    <div><@form.url name="signinurl" required=true><@i18n.message "Authentication.label.signInUrl" /></@></div>
                    <div><@form.url name="signouturl" required=true><@i18n.message "Authentication.label.signOutUrl" /></@></div>
                    <div class="checkbox"><@form.checkbox name="usetemplate"><@i18n.message "Authentication.label.useTemplate" /></@>&nbsp;<select name="template"></select></div>
                    <div class="checkbox"><@form.checkbox name="useusernameconversion"><@i18n.message "Authentication.label.useUsernameConversion" /></@>&nbsp;
                    <@form.select name="usernameconversion" items={
                        'LOWERCASE': i18n.text("Authentication.usernameConversion.LOWERCASE"),
                        'UPPERCASE': i18n.text("Authentication.usernameConversion.UPPERCASE")
                    }/>
                    </div>
                    <div class="checkbox"><@form.checkbox name="allownonsso"><@i18n.message "Authentication.label.allowNonSsoLogin" /></@></div>
                </fieldset>
            </div>
        </div>

        <div id="webssoauthopenidconnectfields" class="hidden">
            <div data-options="region:'center',border:false">
                <fieldset class="large">
                    <legend><@i18n.message "Authentication.legend.identityProvider" /></legend>

                    <div><@form.url name="signinurl" required=true><@i18n.message "Authentication.label.authorizationUrl" /></@></div>
                    <div><@form.url name="tokenurl" required=true><@i18n.message "Authentication.label.tokenVerificationUrl" /></@></div>
                    <div><@form.dn name="clientid" required=true><@i18n.message "Authentication.label.clientId" /></@></div>
                    <div><@form.dn name="clientsecret" required=true><@i18n.message "Authentication.label.clientSecret" /></@></div>
                    <div><@form.url name="redirectionurl" required=false><@i18n.message "Authentication.label.redirectionUrl" /></@></div>
                    <div class="checkbox"><@form.checkbox name="usetemplate"><@i18n.message "Authentication.label.useTemplate" /></@>&nbsp;<select name="template"></select></div>
                    <div class="checkbox"><@form.checkbox name="useusernameconversion"><@i18n.message "Authentication.label.useUsernameConversion" /></@>&nbsp;
                    <@form.select name="usernameconversion" items={
                        'LOWERCASE': i18n.text("Authentication.usernameConversion.LOWERCASE"),
                        'UPPERCASE': i18n.text("Authentication.usernameConversion.UPPERCASE")
                    }/>
                    </div>
                    <div class="checkbox"><@form.checkbox name="allownonsso"><@i18n.message "Authentication.label.allowNonSsoLogin" /></@></div>
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