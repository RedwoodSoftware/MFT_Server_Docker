<#macro user_template_field>
    <div class="checkbox"><@form.checkbox name="usetemplate"><@i18n.message "Authentication.label.useTemplate" /></@>&nbsp;<select name="template"></select></div>
</#macro>

<#macro username_conversion_field>
    <div class="checkbox"><@form.checkbox name="useusernameconversion"><@i18n.message "Authentication.label.useUsernameConversion" /></@>&nbsp;
        <@form.select name="usernameconversion" items={
        'LOWERCASE': i18n.text("Authentication.usernameConversion.LOWERCASE"),
        'UPPERCASE': i18n.text("Authentication.usernameConversion.UPPERCASE")
        }/>
    </div>
</#macro>

<#macro domain_auth_service_fields id="domainauthfields">
    <div id="${id}" class="hidden"><fieldset class="noborder"><@i18n.message key="Authentication.type.DOMAIN.description" /></fieldset></div>
</#macro>

<#macro db_auth_service_fields id="dbauthfields">
    <div id="${id}" class="hidden">
        <div data-options="region:'center',border:false">
            <fieldset class="noborder">
                <div><@form.url name="dburl" required=true><@i18n.message "Authentication.label.dbUrl" /></@></div>
                <@user_template_field />
                <@username_conversion_field />
            </fieldset>
        </div>
        <div data-options="region:'south',border:false">
            <div class="viewpane-toolbar toolbar-management inline">
                <@form.button name="test"><@i18n.message "Authentication.button.test" /></@>
            </div>
        </div>
    </div>
</#macro>

<#macro db_query_auth_service_fields id="dbqueryauthfields">
    <div id="${id}" class="hidden">
        <div data-options="region:'center',border:false">
            <fieldset class="large noborder">
                <div><@form.url name="dburl" required=true><@i18n.message "Authentication.label.dbUrl" /></@></div>
                <div><@form.dn name="dbuser" required=true><@i18n.message "Authentication.label.dbUser" /></@></div>
                <div><@form.text name="dbpwd"><@i18n.message "Authentication.label.dbPassword" /></@></div>
                <div><@form.memo name="query" required=true><@i18n.message "Authentication.label.sqlQuery" /></@></div>
                <div><@form.text name="hashclass"><@i18n.message "Authentication.label.hashClass" /></@></div>
                <@user_template_field />
                <@username_conversion_field />
            </fieldset>
        </div>
        <div data-options="region:'south',border:false">
            <div class="viewpane-toolbar inline">
                <div class="toolbar-selection"><@form.button name="addvar"><@i18n.message "Authentication.button.addVariable" /></@></div>
                <div class="toolbar-management"><@form.button name="test"><@i18n.message "Authentication.button.test" /></@></div>
            </div>
        </div>
    </div>
</#macro>

<#macro ldap_auth_service_fields id="ldapauthfields">
    <div id="${id}" class="hidden">
        <div data-options="region:'center',border:false">
            <fieldset class="large noborder">
                <div><@form.host name="host" required=true><@i18n.message "Authentication.label.host" /></@></div>
                <div><@form.port name="port"><@i18n.message "Authentication.label.port" /></@></div>
                <div><@form.number name="timeout" maxlength="3"><@i18n.message "Authentication.label.timeout" /></@>&nbsp;<span><@i18n.message "Authentication.label.timeoutUnit" /></span></div>
                <div><@form.dn name="userdn" maxlength="255" required=true><@i18n.message "Authentication.label.userDn" /></@></div>
                <div class="checkbox"><@form.checkbox name="usessl"><@i18n.message "Authentication.label.useSsl" /></@></div>
                <div class="checkbox"><@form.checkbox name="allowanonymous"><@i18n.message "Authentication.label.allowAnonymousBinding" /></@></div>
                <@user_template_field />
                <@username_conversion_field />
                <div class="checkbox"><@form.checkbox name="usefailover"><@i18n.message "Authentication.label.useFailoverServer" /></@></div>
            </fieldset>
            <fieldset>
                <legend><@i18n.message "Authentication.legend.failover" /></legend>
                <div><@form.host name="failoverhost" required=true><@i18n.message "Authentication.label.host" /></@></div>
                <div><@form.port name="failoverport"><@i18n.message "Authentication.label.port" /></@></div>
            </fieldset>
        </div>
        <div data-options="region:'south',border:false">
            <div class="viewpane-toolbar inline">
                <div class="toolbar-selection"><@form.button name="addvar"><@i18n.message "Authentication.button.addVariable" /></@></div>
                <div class="toolbar-management"><@form.button name="test"><@i18n.message "Authentication.button.test" /></@></div>
            </div>
        </div>
    </div>
</#macro>

<#macro ladp_query_auth_service_fields id="ldapqueryauthfields">
    <div id="${id}" class="hidden">
        <div data-options="region:'center',border:false">
            <fieldset class="large noborder">
                <div><@form.host name="host" required=true><@i18n.message "Authentication.label.host" /></@></div>
                <div><@form.port name="port"><@i18n.message "Authentication.label.port" /></@></div>
                <div><@form.number name="timeout" maxlength="3"><@i18n.message "Authentication.label.timeout" /></@>&nbsp;<span><@i18n.message "Authentication.label.timeoutUnit" /></span></div>
                <div><@form.dn name="userdn" required=true><@i18n.message "Authentication.label.userDn" /></@></div>
                <div><@form.dn name="searchuserdn" required=true><@i18n.message "Authentication.label.searchUserDn" /></@></div>
                <div><@form.password name="password"><@i18n.message "Authentication.label.password" /></@></div>
                <div><@form.dn name="basedn" required=false><@i18n.message "Authentication.label.baseDn" /></@></div>
                <div><@form.memo name="filter" required=true><@i18n.message "Authentication.label.filter" /></@></div>
                <div><@form.text name="hasher"><@i18n.message "Authentication.label.hasher" /></@></div>
                <div class="checkbox"><@form.checkbox name="usessl"><@i18n.message "Authentication.label.useSsl" /></@></div>
                <div class="checkbox"><@form.checkbox name="allowanonymous"><@i18n.message "Authentication.label.allowAnonymousBinding" /></@></div>
                <@user_template_field />
                <@username_conversion_field />
                <div class="checkbox"><@form.checkbox name="usefailover"><@i18n.message "Authentication.label.useFailoverServer" /></@></div>
            </fieldset>
            <fieldset>
                <legend><@i18n.message "Authentication.legend.failover" /></legend>
                <div><@form.host name="failoverhost" required=true><@i18n.message "Authentication.label.host" /></@></div>
                <div><@form.port name="failoverport"><@i18n.message "Authentication.label.port" /></@></div>
            </fieldset>
        </div>
        <div data-options="region:'south',border:false">
            <div class="viewpane-toolbar inline">
                <div class="toolbar-selection"><@form.button name="addvar"><@i18n.message "Authentication.button.addVariable" /></@></div>
                <div class="toolbar-management"><@form.button name="test"><@i18n.message "Authentication.button.test" /></@></div>
            </div>
        </div>
    </div>
</#macro>

<#macro ntlm_auth_service_fields id="ntlmauthfields">
    <div id="${id}" class="hidden">
        <div data-options="region:'center',border:false">
            <fieldset class="noborder">
                <div><@form.host name="host" required=true><@i18n.message "Authentication.label.ntlmHost" /></@></div>
                <div><@form.dn name="domain" required=true><@i18n.message "Authentication.label.ntlmDomain" /></@></div>
                <@user_template_field />
                <@username_conversion_field />
            </fieldset>
        </div>
        <div data-options="region:'south',border:false">
            <div class="viewpane-toolbar toolbar-management inline">
                <@form.button name="test"><@i18n.message "Authentication.button.test" /></@>
            </div>
        </div>
    </div>
</#macro>

<#macro pam_auth_service_fields id="pamauthfields">
    <div id="${id}" class="hidden">
        <div data-options="region:'center',border:false">
            <fieldset class="noborder">
                <@user_template_field />
                <@username_conversion_field />
            </fieldset>
        </div>
        <div data-options="region:'south',border:false">
            <div class="viewpane-toolbar toolbar-management inline">
                <@form.button name="test"><@i18n.message "Authentication.button.test" /></@>
            </div>
        </div>
    </div>
</#macro>

<#macro radius_auth_service_fields id="radiusauthfields">
    <div id="${id}" class="hidden">
        <div data-options="region:'center',border:false">
            <fieldset class="large noborder">
                <div><@form.select name="localhost" required=true items={}><@i18n.message "Authentication.label.localAddress" /></@></div>
                <div><@form.host name="serverhost" required=true><@i18n.message "Authentication.label.serverAddress" /></@></div>
                <div><@form.port name="serverport"><@i18n.message "Authentication.label.serverPort" /></@></div>
                <div><@form.number name="timeout" maxlength="3"><@i18n.message "Authentication.label.timeout" /></@>&nbsp;<span><@i18n.message "Authentication.label.timeoutUnit" /></span></div>
                <div><@form.number name="retransmitattempts" maxlength="3"><@i18n.message "Authentication.label.maxRetransmitAttempts" /></@></div>
                <div><@form.dn name="identifier"><@i18n.message "Authentication.label.identifier" /></@></div>
                <div><@form.dn name="secret"><@i18n.message "Authentication.label.sharedSecret" /></@></div>
                <@user_template_field />
                <@username_conversion_field />
            </fieldset>
        </div>
        <div data-options="region:'south',border:false">
            <div class="viewpane-toolbar toolbar-management inline">
                <@form.button name="test"><@i18n.message "Authentication.button.test" /></@>
            </div>
        </div>
    </div>
</#macro>

<#macro custom_auth_service_fields id="customauthfields">
    <div id="${id}" class="hidden">
        <div data-options="region:'center',border:false">
            <fieldset name="" class="large noborder">
                <div><@form.dn name="classname" required=true><@i18n.message "Authentication.label.class" /></@></div>
                <@user_template_field />
                <@username_conversion_field />
            </fieldset>
        </div>
        <div data-options="region:'south',border:false">
            <div class="viewpane-toolbar toolbar-management inline">
                <@form.button name="test"><@i18n.message "Authentication.button.test" /></@>
            </div>
        </div>
    </div>
</#macro>