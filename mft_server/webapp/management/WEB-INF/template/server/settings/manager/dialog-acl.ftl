<#import "macro.ftl" as m />

<@form.dialog id="d-settings-acl-addrole" title=i18n.text("Roles.AddDialog.title") header=i18n.text("Roles.AddDialog.info.short") description=i18n.text("Roles.AddDialog.info.long")>
    <div class="content">
        <div data-options="region:'center',border:false">
            <div><fieldset class="noborder"><@form.dn name="name" required=true><@i18n.message key="Roles.label.name" /></@></fieldset></div>
            <div><#include "role-permissions.ftl" /></div>
        </div>
    </div>
</@form.dialog>

<@form.dialog id="d-settings-acl-editrole" title=i18n.text("Roles.EditDialog.title") header=i18n.text("Roles.EditDialog.info.short") description=i18n.text("Roles.EditDialog.info.long")>
    <div class="content">
        <div data-options="region:'center',border:false">
            <div><#include "role-permissions.ftl" /></div>
        </div>
    </div>
</@form.dialog>

<@form.dialog id="d-settings-acl-copyrole" title=i18n.text("Roles.CopyDialog.title") header=i18n.text("Roles.CopyDialog.info.short") description=i18n.text("Roles.CopyDialog.info.long")>
    <fieldset class="noborder pane">
        <div><@form.dn name="name" tabindex="0" required=true><@i18n.message "Roles.CopyDialog.label.name" /></@></div>
        <div class="checkbox"><@form.checkbox name="editafterdone"><@i18n.message key="Roles.CopyDialog.label.editAfterCopying" /></@></div>
    </fieldset>
</@form.dialog>

<@form.dialog id="d-settings-acl-domainaccess" title=i18n.text("Roles.DomainAccessDialog.title") header=i18n.text("Roles.DomainAccessDialog.info.short") description=i18n.text("Roles.DomainAccessDialog.info.long")>
    <fieldset class="noborder pane">
        <div><@form.select name="domain" items=[]><@i18n.message key="Roles.label.domain" /></@></div>
    </fieldset>
</@form.dialog>

<@form.dialog id="d-settings-acl-domainpermissions" title=i18n.text("Roles.DomainPermissionsDialog.title")>
    <fieldset name="domainpermissionsfields" style="margin:2em">
        <legend><@i18n.message key="Roles.legend.permissions" /></legend>

        <fieldset name="domainpermissions" class="large" style="margin-top:0">
            <legend><@i18n.message key="Roles.legend.modules" /></legend>

            <div style="height:470px;overflow:auto">
                <div class="checkbox"><@form.button name="grantallpermissions">&nbsp;<@i18n.message key="Roles.button.grantAllPermissions" /></@></div>

                <div><@m.role_permission name="domaindescription" items={
                    'DOMAIN_DESCRIPTION_READ': i18n.text("Roles.permissions.READ"),
                    'DOMAIN_DESCRIPTION_WRITE': i18n.text("Roles.permissions.WRITE")
                }><@i18n.message key="Roles.label.domainDescription" /></@></div>
                <div><@m.role_permission name="domainlimits" items={
                    'DOMAIN_LIMITS_READ': i18n.text("Roles.permissions.READ"),
                    'DOMAIN_LIMITS_WRITE': i18n.text("Roles.permissions.WRITE")
                }><@i18n.message key="Roles.label.domainLimits" /></@></div>
                <div><@m.role_permission name="domainstatistics" items={
                    'DOMAIN_STATISTICS_READ': i18n.text("Roles.permissions.READ")
                }><@i18n.message key="Roles.label.domainStatistics" /></@></div>
                <div><@m.role_permission name="domainsessions" items={
                    'DOMAIN_SESSIONS_READ': i18n.text("Roles.permissions.READ"),
                    'DOMAIN_SESSIONS_WRITE': i18n.text("Roles.permissions.WRITE")
                }><@i18n.message key="Roles.label.domainSessions" /></@></div>
                <div><@m.role_permission name="domainsessions" items={
                    'DOMAIN_STATUS_WRITE': i18n.text("Roles.permissions.WRITE")
                }><@i18n.message key="Roles.label.domainStatus" /></@></div>
                <div><@m.role_permission name="domainservices" items={
                    'DOMAIN_SERVICES_READ': i18n.text("Roles.permissions.READ"),
                    'DOMAIN_SERVICES_WRITE': i18n.text("Roles.permissions.WRITE")
                }><@i18n.message key="Roles.label.domainServices" /></@></div>
                <div><@m.role_permission name="domainkeys" items={
                    'DOMAIN_KEYS_READ': i18n.text("Roles.permissions.READ"),
                    'DOMAIN_KEYS_WRITE': i18n.text("Roles.permissions.WRITE")
                }><@i18n.message key="Roles.label.domainKeys" /></@></div>
                <div><@m.role_permission name="domainlog" items={
                    'DOMAIN_LOG_READ': i18n.text("Roles.permissions.READ")
                }><@i18n.message key="Roles.label.domainLog" /></@></div>
                <div><@m.role_permission name="domainlogsettings" items={
                    'DOMAIN_LOG_SETTINGS_READ': i18n.text("Roles.permissions.READ"),
                    'DOMAIN_LOG_SETTINGS_WRITE': i18n.text("Roles.permissions.WRITE")
                }><@i18n.message key="Roles.label.domainLogSettings" /></@></div>
                <div><@m.role_permission name="domainsearching" items={
                    'DOMAIN_SEARCHING_READ': i18n.text("Roles.permissions.READ"),
                    'DOMAIN_SEARCHING_WRITE': i18n.text("Roles.permissions.WRITE")
                }><@i18n.message key="Roles.label.domainSearching" /></@></div>
                <div><@m.role_permission name="domainreports" items={
                    'DOMAIN_REPORTS_READ': i18n.text("Roles.permissions.READ"),
                    'DOMAIN_REPORTS_WRITE': i18n.text("Roles.permissions.WRITE")
                }><@i18n.message key="Roles.label.domainReports" /></@></div>
                <div><@m.role_permission name="domainadhocactivity" items={
                    'DOMAIN_ADHOC_TRANSFERS_READ': i18n.text("Roles.permissions.READ"),
                    'DOMAIN_ADHOC_TRANSFERS_WRITE': i18n.text("Roles.permissions.WRITE")
                }><@i18n.message key="Roles.label.domainAdHocActivity" /></@></div>
                <div><@m.role_permission name="domainas2messages" items={
                    'DOMAIN_AS2_MESSAGES_READ': i18n.text("Roles.permissions.READ"),
                    'DOMAIN_AS2_MESSAGES_DELETE': i18n.text("Roles.permissions.DELETE")
                }><@i18n.message key="Roles.label.domainAs2Messages" /></@></div>
                <div><@m.role_permission name="domainoftpmessages" items={
                    'DOMAIN_OFTP_MESSAGES_READ': i18n.text("Roles.permissions.READ"),
                    'DOMAIN_OFTP_MESSAGES_DELETE': i18n.text("Roles.permissions.DELETE")
                }><@i18n.message key="Roles.label.domainOftpMessages" /></@></div>
                <div><@m.role_permission name="domaintimeaccesssettings" items={
                    'DOMAIN_TIME_ACCESS_SETTINGS_READ': i18n.text("Roles.permissions.READ"),
                    'DOMAIN_TIME_ACCESS_SETTINGS_WRITE': i18n.text("Roles.permissions.WRITE")
                }><@i18n.message key="Roles.label.domainTimeAccessSettings" /></@></div>
                <div><@m.role_permission name="domainbannedfiles" items={
                    'DOMAIN_BANNED_FILES_READ': i18n.text("Roles.permissions.READ"),
                    'DOMAIN_BANNED_FILES_WRITE': i18n.text("Roles.permissions.WRITE")
                }><@i18n.message key="Roles.label.domainBannedFiles" /></@></div>
                <div><@m.role_permission name="domainpasswordcompliance" items={
                    'DOMAIN_PASSWORD_COMPLIANCE_SETTINGS_READ': i18n.text("Roles.permissions.READ"),
                    'DOMAIN_PASSWORD_COMPLIANCE_SETTINGS_WRITE': i18n.text("Roles.permissions.WRITE")
                }><@i18n.message key="Roles.label.domainPasswordCompliance" /></@></div>
                <div><@m.role_permission name="domainipaccesssettings" items={
                    'DOMAIN_IP_ACCESS_SETTINGS_READ': i18n.text("Roles.permissions.READ"),
                    'DOMAIN_IP_ACCESS_SETTINGS_WRITE': i18n.text("Roles.permissions.WRITE")
                }><@i18n.message key="Roles.label.domainIpAccessSettings" /></@></div>
                <div><@m.role_permission name="domaindlprules" items={
                    'DOMAIN_DLP_RULES_READ': i18n.text("Roles.permissions.READ"),
                    'DOMAIN_DLP_RULES_WRITE': i18n.text("Roles.permissions.WRITE")
                }><@i18n.message key="Roles.label.domainDlpRules" /></@></div>
                <div><@m.role_permission name="domainconnectionssettings" items={
                    'DOMAIN_CONNECTIONS_SETTINGS_READ': i18n.text("Roles.permissions.READ"),
                    'DOMAIN_CONNECTIONS_SETTINGS_WRITE': i18n.text("Roles.permissions.WRITE")
                }><@i18n.message key="Roles.label.domainConnectionsSettings" /></@></div>
                <div><@m.role_permission name="domainTriggers" items={
                    'DOMAIN_TRIGGERS_READ': i18n.text("Roles.permissions.READ"),
                    'DOMAIN_TRIGGERS_WRITE': i18n.text("Roles.permissions.WRITE"),
                    'DOMAIN_TRIGGERS_RUN': i18n.text("Roles.permissions.RUN")
                }><@i18n.message key="Roles.label.domainTriggers" /></@></div>
                <div><@m.role_permission name="domainauthsettings" items={
                    'DOMAIN_AUTHENTICATION_SETTINGS_READ': i18n.text("Roles.permissions.READ"),
                    'DOMAIN_AUTHENTICATION_SETTINGS_WRITE': i18n.text("Roles.permissions.WRITE")
                }><@i18n.message key="Roles.label.domainAuthenticationSettings" /></@></div>
                <div><@m.role_permission name="domainaccounts" items={
                    'DOMAIN_ACCOUNT_READ': i18n.text("Roles.permissions.READ"),
                    'DOMAIN_ACCOUNT_WRITE': i18n.text("Roles.permissions.WRITE")
                }><@i18n.message key="Roles.label.domainAccounts" /></@></div>
                <div><@m.role_permission name="domaingroups" items={
                    'DOMAIN_GROUPS_READ': i18n.text("Roles.permissions.READ"),
                    'DOMAIN_GROUPS_WRITE': i18n.text("Roles.permissions.WRITE")
                }><@i18n.message key="Roles.label.domainGroups" /></@></div>
                <div><@m.role_permission name="domainnetworkstorage" items={
                    'DOMAIN_REVERSE_PROXIES_READ': i18n.text("Roles.permissions.READ"),
                    'DOMAIN_REVERSE_PROXIES_WRITE': i18n.text("Roles.permissions.WRITE")
                }><@i18n.message key="Roles.label.domainNetworkStorage" /></@></div>
                <div><@m.role_permission name="domaindirectorymonitors" items={
                    'DOMAIN_DIRECTORY_MONITORS_READ': i18n.text("Roles.permissions.READ"),
                    'DOMAIN_DIRECTORY_MONITORS_WRITE': i18n.text("Roles.permissions.WRITE")
                }><@i18n.message key="Roles.label.domainDirectoryMonitors" /></@></div>
                <div><@m.role_permission name="domaindropzones" items={
                    'DOMAIN_DROP_ZONES_READ': i18n.text("Roles.permissions.READ"),
                    'DOMAIN_DROP_ZONES_WRITE': i18n.text("Roles.permissions.WRITE")
                }><@i18n.message key="Roles.label.domainDropZones" /></@></div>
                <div><@m.role_permission name="domainurlbranding" items={
                    'DOMAIN_WEB_THEME_READ': i18n.text("Roles.permissions.READ"),
                    'DOMAIN_WEB_THEME_WRITE': i18n.text("Roles.permissions.WRITE")
                }><@i18n.message key="Roles.label.domainUrlBranding" /></@></div>
                <div><@m.role_permission name="domaintradingpartners" items={
                    'DOMAIN_TRADING_PARTNERS_READ': i18n.text("Roles.permissions.READ"),
                    'DOMAIN_TRADING_PARTNERS_WRITE': i18n.text("Roles.permissions.WRITE"),
                    'DOMAIN_TRADING_PARTNERS_SEND_FILE': i18n.text("Roles.permissions.SEND")
                }><@i18n.message key="Roles.label.domainTradingPartners" /></@></div>
                <div><@m.role_permission name="domaincontacts" items={
                    'DOMAIN_CONTACTS_READ': i18n.text("Roles.permissions.READ"),
                    'DOMAIN_CONTACTS_WRITE': i18n.text("Roles.permissions.WRITE")
                }><@i18n.message key="Roles.label.domainContacts" /></@></div>
            </div>
        </fieldset>

        <fieldset>
            <legend><@i18n.message key="Roles.legend.triggers" /></legend>

            <div style="white-space:nowrap">
                <span id="d-acl-restrictevents" style="display: inline-block; width: 20em; margin-right: 1em"><@i18n.message key="Roles.label.restrictTriggerEvents" /></span>
                <input type="checkbox" name="restrictevents" aria-labelledby="d-acl-restrictevents"/>
            </div>
            <div><@form.datagrid name="triggerevents" height="" title=i18n.text("Roles.legend.events") columns=["event", "description"]; col><@i18n.message "Roles.column.${col}" /></@></div>

            <div style="white-space: nowrap; margin-top: 1.7em">
                <span id="d-acl-restrictfunctions" style="display: inline-block; width: 20em; margin-right: 1em"><@i18n.message key="Roles.label.restrictTriggerFunctions" /></span>
                <input type="checkbox" name="restrictfunctions" aria-labelledby="d-acl-restrictfunctions"/>
            </div>
            <div><@form.datagrid name="triggerfunctions" height="" title=i18n.text("Roles.legend.functions") columns=["function", "description"]; col><@i18n.message "Roles.column.${col}" /></@></div>

            <div style="white-space: nowrap; margin-top: 1.7em">
                <span id="d-acl-restrictactions" style="display: inline-block; width: 20em; margin-right: 1em"><@i18n.message key="Roles.label.restrictTriggerActions" /></span>
                <input type="checkbox" name="restrictactions" aria-labelledby="d-acl-restrictactions"/>
            </div>
            <div><@form.datagrid name="triggeractions" height="" title=i18n.text("Roles.legend.actions") columns=["action", "description"]; col><@i18n.message "Roles.column.${col}" /></@></div>
        </fieldset>

    </fieldset>
</@form.dialog>