<#ftl strip_whitespace=true>

<#macro auth_service_fields id add_variable_btn=true test_service_btn=true>
    <#local roleInput>
        <@form.checkbox name="userole"><@i18n.message "AuthenticationService.label.useRole" /></@>&nbsp;<@form.select name="role" items=[]></@>
    </#local>
    <#local usernameConversionInput>
        <@form.checkbox name="useusernameconversion"><@i18n.message "AuthenticationService.label.useUsernameConversion" /></@>&nbsp;
        <@form.select name="usernameconversion" items={
            'LOWERCASE': i18n.text("AuthenticationService.usernameConversion.LOWERCASE"),
            'UPPERCASE': i18n.text("AuthenticationService.usernameConversion.UPPERCASE")
        }/>
    </#local>

    <div id="${id?html}" class="hidden">
        <div data-options="region:'center',border:false">
            <fieldset class="large noborder"><#nested roleInput, usernameConversionInput/></fieldset>
        </div>
        <#if add_variable_btn || test_service_btn>
            <div data-options="region:'south',border:false" class="layout-pane-bottom">
                <div class="viewpane-toolbar inline">
                    <#if add_variable_btn><div class="toolbar-selection"><@form.button name="addvar"><@i18n.message "AuthenticationService.button.addVariable" /></@></div></#if>
                    <#if test_service_btn><div class="toolbar-management"><@form.button name="test"><@i18n.message "AuthenticationService.button.test" /></@></div></#if>
                </div>
            </div>
        </#if>
    </div>
</#macro>

<#macro local_auth_service_fields id="localauthfields">
    <@auth_service_fields id=id add_variable_btn=false test_service_btn=false>
        <@i18n.message key="AuthenticationService.type.LOCAL.description" />
    </@auth_service_fields>
</#macro>

<#macro db_auth_service_fields id="dbauthfields">
    <@auth_service_fields id=id add_variable_btn=false; roleInput, usernameConversionInput>
        <div><@form.url name="dburl" required=true><@i18n.message "AuthenticationService.label.dbUrl" /></@></div>
        <div class="checkbox">${roleInput}</div>
        <div class="checkbox">${usernameConversionInput}</div>
    </@>
</#macro>

<#macro db_query_auth_service_fields id="dbqueryauthfields">
    <@auth_service_fields id=id; roleInput, usernameConversionInput>
        <div><@form.url name="dburl" required=true><@i18n.message "AuthenticationService.label.dbUrl" /></@></div>
        <div><@form.dn name="dbuser" required=true><@i18n.message "AuthenticationService.label.dbUser" /></@></div>
        <div><@form.password name="dbpwd"><@i18n.message "AuthenticationService.label.dbPassword" /></@></div>
        <div><@form.memo name="query" required=true style="width:50em;height:5em"><@i18n.message "AuthenticationService.label.sqlQuery" /></@></div>
        <div><@form.text name="hashclass"><@i18n.message "AuthenticationService.label.hashClass" /></@></div>
        <div class="checkbox">${roleInput}</div>
        <div class="checkbox">${usernameConversionInput}</div>
    </@>
</#macro>

<#macro ldap_auth_service_fields id="ldapauthfields">
    <@auth_service_fields id=id; roleInput, usernameConversionInput>
        <div><@form.host name="host" required=true><@i18n.message "AuthenticationService.label.host" /></@></div>
        <div><@form.port name="port"><@i18n.message "AuthenticationService.label.port" /></@></div>
        <div><@form.number name="timeout" maxlength="3"><@i18n.message "AuthenticationService.label.timeout" /></@>&nbsp;<span><@i18n.message "AuthenticationService.label.timeoutUnit" /></span></div>
        <div><@form.dn name="userdn" maxlength="255" required=true><@i18n.message "AuthenticationService.label.userDn" /></@></div>
        <div class="checkbox"><@form.checkbox name="usessl"><@i18n.message "AuthenticationService.label.useSsl" /></@></div>
        <div class="checkbox"><@form.checkbox name="allowanonymous"><@i18n.message "AuthenticationService.label.allowAnonymousBinding" /></@></div>
        <div class="checkbox"><@form.checkbox name="usefailover"><@i18n.message "AuthenticationService.label.useFailoverServer" /></@></div>
        <fieldset>
            <legend><@i18n.message "AuthenticationService.legend.failover" /></legend>
            <div><@form.host name="failoverhost" required=true><@i18n.message "AuthenticationService.label.host" /></@></div>
            <div><@form.port name="failoverport"><@i18n.message "AuthenticationService.label.port" /></@></div>
        </fieldset>
        <div class="checkbox">${roleInput}</div>
        <div class="checkbox">${usernameConversionInput}</div>
    </@>
</#macro>

<#macro ldap_query_auth_service_fields id="ldapqueryauthfields">
    <@auth_service_fields id=id; roleInput, usernameConversionInput>
        <div><@form.host name="host" required=true><@i18n.message "AuthenticationService.label.host" /></@></div>
        <div><@form.port name="port"><@i18n.message "AuthenticationService.label.port" /></@></div>
        <div><@form.number name="timeout" maxlength="3"><@i18n.message "AuthenticationService.label.timeout" /></@>&nbsp;<span><@i18n.message "AuthenticationService.label.timeoutUnit" /></span></div>
        <div><@form.dn name="userdn" required=true><@i18n.message "AuthenticationService.label.userDn" /></@></div>
        <div><@form.dn name="searchuserdn" required=true><@i18n.message "AuthenticationService.label.searchUserDn" /></@></div>
        <div><@form.password name="password"><@i18n.message "AuthenticationService.label.password" /></@></div>
        <div><@form.dn name="basedn" required=false><@i18n.message "AuthenticationService.label.baseDn" /></@></div>
        <div><@form.memo name="filter" required=true style="width:50em;height:3em"><@i18n.message "AuthenticationService.label.filter" /></@></div>
        <div><@form.text name="hasher"><@i18n.message "AuthenticationService.label.hasher" /></@></div>
        <div class="checkbox"><@form.checkbox name="usessl"><@i18n.message "AuthenticationService.label.useSsl" /></@></div>
        <div class="checkbox"><@form.checkbox name="allowanonymous"><@i18n.message "AuthenticationService.label.allowAnonymousBinding" /></@></div>
        <div class="checkbox"><@form.checkbox name="usefailover"><@i18n.message "AuthenticationService.label.useFailoverServer" /></@></div>
        <fieldset>
            <legend><@i18n.message "AuthenticationService.legend.failover" /></legend>
            <div><@form.host name="failoverhost" required=true><@i18n.message "AuthenticationService.label.host" /></@></div>
            <div><@form.port name="failoverport"><@i18n.message "AuthenticationService.label.port" /></@></div>
        </fieldset>
        <div class="checkbox">${roleInput}</div>
        <div class="checkbox">${usernameConversionInput}</div>
    </@>
</#macro>

<#macro ntlm_auth_service_fields id="ntlmauthfields">
    <@auth_service_fields id=id add_variable_btn=false; roleInput, usernameConversionInput>
        <div><@form.host name="host" required=true><@i18n.message "AuthenticationService.label.ntlmHost" /></@></div>
        <div><@form.dn name="domain" required=true><@i18n.message "AuthenticationService.label.ntlmDomain" /></@></div>
        <div class="checkbox">${roleInput}</div>
        <div class="checkbox">${usernameConversionInput}</div>
    </@>
</#macro>

<#macro pam_auth_service_fields id="pamauthfields">
    <@auth_service_fields id=id add_variable_btn=false; roleInput, usernameConversionInput>
        <div class="checkbox">${roleInput}</div>
        <div class="checkbox">${usernameConversionInput}</div>
    </@>
</#macro>

<#macro radius_auth_service_fields id="radiusauthfields">
    <@auth_service_fields id=id add_variable_btn=false; roleInput, usernameConversionInput>
        <div><@form.select name="localhost" required=true items={}><@i18n.message "AuthenticationService.label.localAddress" /></@></div>
        <div><@form.host name="serverhost" required=true><@i18n.message "AuthenticationService.label.serverAddress" /></@></div>
        <div><@form.port name="serverport"><@i18n.message "AuthenticationService.label.serverPort" /></@></div>
        <div><@form.number name="timeout" maxlength="3"><@i18n.message "AuthenticationService.label.timeout" /></@>&nbsp;<span><@i18n.message "AuthenticationService.label.timeoutUnit" /></span></div>
        <div><@form.number name="retransmitattempts" maxlength="3"><@i18n.message "AuthenticationService.label.maxRetransmitAttempts" /></@></div>
        <div><@form.dn name="identifier"><@i18n.message "AuthenticationService.label.identifier" /></@></div>
        <div><@form.dn name="secret"><@i18n.message "AuthenticationService.label.sharedSecret" /></@></div>
        <div class="checkbox">${roleInput}</div>
        <div class="checkbox">${usernameConversionInput}</div>
    </@>
</#macro>

<#macro custom_auth_service_fields id="customauthfields">
    <@auth_service_fields id=id add_variable_btn=false; roleInput, usernameConversionInput>
        <div><@form.dn name="classname" required=true><@i18n.message "AuthenticationService.label.class" /></@></div>
        <div class="checkbox">${roleInput}</div>
        <div class="checkbox">${usernameConversionInput}</div>
    </@>
</#macro>