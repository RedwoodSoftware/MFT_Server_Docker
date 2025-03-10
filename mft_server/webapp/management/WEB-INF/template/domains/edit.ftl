<#ftl strip_whitespace=true>
<#import "/WEB-INF/tags/html.ftl" as html/>
<#import "/WEB-INF/tags/form.ftl" as form/>
<#import "/WEB-INF/tags/message.ftl" as i18n/>
<#import "/WEB-INF/template/macro.ftl" as m/>


<@html.template title=i18n.text("Menu.item.domains") + " - " + i18n.text("Application.title.text") header_section="/WEB-INF/template/domains/domain-js.ftl"; csp_nonce_attr>

    <div id="throbber" class="panel-loading"><@i18n.message key="Application.message.loading" /></div>

    <div id="viewpane" style="visibility: hidden">
        <div data-options="region:'north',border:false" style="height:100px;padding:8px;border-bottom-width:1px">
            <div id="navigation">
                <@m.menubar selected=i18n.text("Menu.item.domains") />
                <#include "*/user-bar.ftl" />
            </div>
        </div>

        <div data-options="region:'west',border:false,split:true" style="width:15%;min-width:210px;max-width:25%">
            <div class="easyui-layout" data-options="fit:true,border:false">

                <div data-options="region:'north',border:false" style="height:36px;padding:3px">
                    <div class="sidemenu-tools-wrap">
                        <a id="domain-sidemenu-tools-ec-btn" role="button" data-toggle-text="${i18n.text("Domain.sidemenu.tools.collapseAll")?html?js_string}"><@i18n.message key="Domain.sidemenu.tools.expandAll" /></a>
                    </div>
                </div>

                <div data-options="region:'center',border:false">
                    <@m.sidemenu id="domain-sidemenu" items=[
                        {
                            'id': "GENERAL",
                            'name': i18n.text('Domain.sidemenu.General.title'),
                            'allowed': permissions.domainStatisticsAllowed || permissions.domainSessionsAllowed || permissions.domainDescriptionAllowed || permissions.domainLimitsAllowed,
                            'items': [
                                {'id': "domain-overview", 'text': i18n.text("Overview.title"), 'icon': "icon-m-overview m-icon", 'allowed': true}
                            ]
                        },
                        {
                            'id': "AUDIT",
                            'name': i18n.text('Domain.sidemenu.Audit.title'),
                            'allowed': permissions.logRecordsAllowed || permissions.reportsAllowed,
                            'items': [
                                {'id': "domain-logging", 'text': i18n.text("Logging.title"), 'icon': "icon-m-logging m-icon", 'allowed': permissions.logRecordsAllowed},
                                {'id': "domain-reports", 'text': i18n.text("Reports.title"), 'icon': "icon-m-reports m-icon", 'allowed': permissions.reportsAllowed}
                            ]
                        },
                        {
                            'id': "SERVICES",
                            'name': i18n.text('Domain.sidemenu.Services.title'),
                            'allowed': permissions.domainServicesAllowed || permissions.connectionSettingsAllowed,
                            'items': [
                                {'id': "domain-services", 'text': i18n.text("Services.title"), 'icon': "icon-m-services m-icon", 'allowed': permissions.domainServicesAllowed},
                                {'id': "domain-connections", 'text': i18n.text("Connections.title"), 'icon': "icon-m-connections m-icon", 'allowed': permissions.connectionSettingsAllowed}
                            ]
                        },
                        {
                            'id': "ACCOUNTS",
                            'name': i18n.text('Domain.sidemenu.Accounts.title'),
                            'allowed': permissions.authenticationSettingsAllowed || permissions.accountsAllowed || permissions.groupsAllowed || permissions.reverseProxiesAllowed,
                            'items': [
                                {'id': "domain-authentication", 'text': i18n.text("Authentication.title"), 'icon': "icon-m-auth m-icon", 'allowed': permissions.authenticationSettingsAllowed},
                                {'id': "domain-accounts", 'text': i18n.text("Users.title"), 'icon': "icon-m-users m-icon", 'allowed': permissions.accountsAllowed},
                                {'id': "domain-groups", 'text': i18n.text("Groups.title"), 'icon': "icon-m-groups m-icon", 'allowed': permissions.groupsAllowed},
                                {'id': "domain-network-storage", 'text': i18n.text("ReverseProxies.title"), 'icon': "icon-m-proxies m-icon", 'allowed': permissions.reverseProxiesAllowed}
                            ]
                        },
                        {
                            'id': "AUTOMATION",
                            'name': i18n.text('Domain.sidemenu.Automation.title'),
                            'allowed': permissions.directoryMonitorsAllowed || permissions.triggersAllowed || permissions.tradingPartnersAllowed,
                            'items': [
                                {'id': "domain-dir-monitors", 'text': i18n.text("DirectoryMonitors.title"), 'icon': "icon-m-dirmonitors m-icon", 'allowed': permissions.directoryMonitorsAllowed},
                                {'id': "domain-triggers", 'text': i18n.text("Triggers.title"), 'icon': "icon-m-triggers m-icon", 'allowed': permissions.triggersAllowed},
                                {'id': "domain-trading-partners", 'text': i18n.text("TradingPartners.title"), 'icon': "icon-m-partners m-icon", 'allowed': permissions.tradingPartnersAllowed}
                            ]
                        },
                        {
                            'id': "SHARING",
                            'name': i18n.text('Domain.sidemenu.Sharing.title'),
                            'allowed': permissions.adHocTransfersAllowed || permissions.contactsAllowed || permissions.dropZonesAllowed,
                            'items': [
                                {'id': "domain-adhoctransfers", 'text': i18n.text("AdHocTransfers.title"), 'icon': "icon-m-adhocactivity m-icon", 'allowed': permissions.adHocTransfersAllowed},
                                {'id': "domain-contacts", 'text': i18n.text("Contacts.title"), 'icon': "icon-m-contacts m-icon", 'allowed': permissions.contactsAllowed},
                                {'id': "domain-dropzones", 'text': i18n.text("DropZones.title"), 'icon': "icon-m-dropzones m-icon", 'allowed': permissions.dropZonesAllowed}
                            ]
                        },
                        {
                            'id': "EDI",
                            'name': i18n.text('Domain.sidemenu.EDI.title'),
                            'allowed': permissions.as2MessagesAllowed || permissions.oftpMessagesAllowed,
                            'items': [
                                {'id': "domain-as2-messages", 'text': i18n.text("AS2Messages.title"), 'icon': "icon-m-as2 m-icon", 'allowed': permissions.as2MessagesAllowed},
                                {'id': "domain-oftp-messages", 'text': i18n.text("OftpMessages.title"), 'icon': "icon-m-oftp m-icon", 'allowed': permissions.oftpMessagesAllowed}
                            ]
                        },
                        {
                            'id': "SECURITY",
                            'name': i18n.text('Domain.sidemenu.Security.title'),
                            'allowed': permissions.bannedFilesAllowed || permissions.passwordComplianceSettingsAllowed || permissions.dlpRulesAllowed || permissions.ipAccessSettingsAllowed || permissions.domainKeystoreAllowed || permissions.timeAccessSettingsAllowed,
                            'items': [
                                {'id': "domain-banned-files", 'text': i18n.text("BannedFiles.title"), 'icon': "icon-m-bannedfiles m-icon", 'allowed': permissions.bannedFilesAllowed},
                                {'id': "domain-compliance", 'text': i18n.text("Compliance.title"), 'icon': "icon-m-compliance m-icon", 'allowed': permissions.passwordComplianceSettingsAllowed},
                                {'id': "domain-dlp", 'text': i18n.text("DlpRules.title"), 'icon': "icon-m-dlp m-icon", 'allowed': permissions.dlpRulesAllowed},
                                {'id': "domain-ip-access", 'text': i18n.text("IpAccess.title"), 'icon': "icon-m-ipaccess m-icon", 'allowed': permissions.ipAccessSettingsAllowed},
                                {'id': "server-keys", 'text': i18n.text("KeyManager.title"), 'icon': "icon-m-key m-icon", 'allowed': permissions.domainKeystoreAllowed},
                                {'id': "domain-time-access", 'text': i18n.text("TimeAccess.title"), 'icon': "icon-m-timeaccess m-icon", 'allowed': permissions.timeAccessSettingsAllowed}
                            ]
                        },
                        {
                            'id': "MISCELLANEOUS",
                            'name': i18n.text('Domain.sidemenu.Miscellaneous.title'),
                            'allowed': permissions.urlBrandingAllowed,
                            'items': [
                                {'id': "domain-url-branding", 'text': i18n.text("UrlBranding.title"), 'icon': "icon-m-urlbranding m-icon", 'allowed': permissions.urlBrandingAllowed}
                            ]
                        }
                    ]/>
                </div>
            </div>
        </div>

        <div data-options="region:'center',border:false" style="border-left-width:1px;">
            <div id="modules" class="easyui-panel" data-options="fit:true,border:false">

            <#-- GENERAL -->
                <#--Overview-->
                <#if permissions.domainStatisticsAllowed || permissions.domainSessionsAllowed || permissions.domainDescriptionAllowed || permissions.domainLimitsAllowed>
                    <div id="domain-overview" role="tablist">
                        <#if permissions.domainStatisticsAllowed>
                            <div role="tab" class="wrap" id="domain-statistics" title="${i18n.text('Statistics.title')}">
                                <#include "statistics/stats.ftl" />
                                <#include "statistics/dialog-export-stats.ftl" />
                            </div>
                        </#if>
                        <#if permissions.domainSessionsAllowed>
                            <div role="tab" class="wrap" id="domain-sessions" title="${i18n.text('Sessions.title')}">
                                <#include "statistics/sessions.ftl" />
                                <#if permissions.domainSessionsControlAllowed>
                                    <#include "statistics/dialog-close-session.ftl" />
                                </#if>
                            </div>
                        </#if>
                        <#if permissions.domainDescriptionAllowed || permissions.domainLimitsAllowed>
                            <div role="tab" id="domain-general" title="${i18n.text('General.title')}">
                                <div role="tablist">
                                    <#if permissions.domainDescriptionAllowed>
                                        <div role="tab" class="wrap" id="domain-description" title="${i18n.text('Description.title')}"><#include "description.ftl" /></div>
                                    </#if>
                                    <#if permissions.domainLimitsAllowed>
                                        <div role="tab" class="wrap" id="domain-limits" title="${i18n.text('Limits.title')}"><#include "limits.ftl" /></div>
                                    </#if>
                                </div>
                            </div>
                        </#if>
                    </div>
                </#if>

            <#-- AUDIT -->
                <#--Logging-->
                <#if permissions.logRecordsAllowed>
                    <div id="domain-logging" role="tablist">
                        <div role="tab" class="wrap" title="${i18n.text('Logging.titleEvents')}">
                            <#include "logging/logs.ftl" />
                        </div>
                        <div role="tab" class="wrap" title="${i18n.text('Logging.titleSearch')}">
                            <#include "logging/search-criteria.ftl" />
                        </div>
                        <div role="tab" class="wrap" title="${i18n.text('Logging.titleResults')}">
                            <#include "logging/search-results.ftl" />
                            <#include "logging/dialog-view.ftl" />
                            <#include "logging/dialog-export.ftl" />
                        </div>
                        <#if permissions.logSettingsAllowed>
                            <div role="tab" class="wrap" title="${i18n.text('Logging.titleService')}">
                                <#include "logging/service.ftl" />
                                <#include "logging/dialog-migrate.ftl" />
                            </div>
                            <div role="tab" class="wrap" title="${i18n.text('Logging.titleSyslog')}"><#include "logging/syslog.ftl" /></div>
                            <div role="tab" class="wrap" title="${i18n.text('Logging.titleExtensions')}"><#include "logging/extensions.ftl" /></div>
                            <div role="tab" class="wrap" title="${i18n.text('Logging.titleSettings')}"><#include "logging/settings.ftl" /></div>
                        </#if>
                    </div>
                </#if>
                <#--Reports-->
                <#if permissions.reportsAllowed>
                    <div id="domain-reports" role="tablist">
                        <div role="tab" class="wrap" title="${i18n.text('Reports.title')}">
                            <#include "reports/manage.ftl" />
                            <#include "reports/dialog-add.ftl" />
                            <#include "reports/dialog-edit.ftl" />
                            <#include "reports/dialog-portation.ftl" />
                        </div>
                    </div>
                </#if>


            <#-- SERVICES -->
                <#--Services-->
                <#if permissions.domainServicesAllowed>
                    <div id="domain-services" role="tablist">
                        <div id="domain-service-list" role="tab" class="wrap" title="${i18n.text('Services.title')}">
                            <#include "services/manage.ftl" />
                            <#include "services/dialog-service.ftl" />
                            <#include "services/dialog-ciphers.ftl" />
                            <#include "services/dialog-algorithms.ftl" />
                            <#include "services/dialog-uploadforms.ftl" />
                            <#include "services/dialog-resources.ftl" />
                        </div>
                        <div id="domain-service-ftp" role="tab" class="wrap" title="${i18n.text('Application.protocol.FTP_COMMON')}">
                            <#include "services/ftp.ftl" />
                        </div>
                        <div id="domain-service-sftp" role="tab" class="wrap" title="${i18n.text('Application.protocol.SFTP')}">
                            <#include "services/sftp.ftl" />
                        </div>
                        <div id="domain-service-aftp" role="tab" class="wrap" title="${i18n.text('Application.protocol.AFTP')}">
                            <#include "services/aftp.ftl" />
                        </div>
                        <div id="domain-service-oftp" role="tab" class="wrap" title="${i18n.text('Application.protocol.OFTP')}">
                            <#include "services/oftp.ftl" />
                        </div>
                        <div id="domain-service-tftp" role="tab" class="wrap" title="${i18n.text('Application.protocol.TFTP')}">
                            <#include "services/tftp.ftl" />
                        </div>
                        <div id="domain-service-http" role="tab" class="wrap" title="${i18n.text('Application.protocol.HTTP_COMMON')}">
                            <#include "services/http.ftl" />
                        </div>
                    </div>
                </#if>
                <#--Connections-->
                <#if permissions.connectionSettingsAllowed>
                    <div id="domain-connections" role="tablist">
                        <div role="tab" class="wrap" title="${i18n.text('Connections.title')}">
                            <#include "connections/manage.ftl" />
                        </div>
                    </div>
                </#if>


            <#-- ACCOUNTS -->
                <#--Authentication-->
                <#if permissions.authenticationSettingsAllowed>
                    <div id="domain-authentication" role="tablist">
                        <div role="tab" class="wrap" title="${i18n.text('Authentication.titleService')}">
                            <#include "auth/service.ftl" />
                            <#include "auth/dialog-credentials.ftl" />
                            <#include "auth/dialog-service.ftl" />
                        </div>
                        <div role="tab" class="wrap" title="${i18n.text('Authentication.titleMultiFactor')}">
                            <#include "auth/multi-factor.ftl" />
                        </div>
                        <div role="tab" class="wrap" title="${i18n.text('Authentication.titleSSO')}">
                            <#include "auth/web-sso.ftl" />
                        </div>
                    </div>
                </#if>
                <#--Accounts-->
                <#if permissions.accountsAllowed>
                    <div id="domain-accounts" role="tablist">
                        <div role="tab" class="wrap" title="${i18n.text('Users.title')}">
                            <#include "users/manage-users.ftl">
                            <#include "users/dialog-users.ftl" />
                            <#include "users/dialog-adhocsettings.ftl" />
                        </div>
                        <div role="tab" class="wrap" id="domain-user-templates" title="${i18n.text('UserTemplates.title')}">
                            <#include "users/manage-templates.ftl">
                            <#include "users/dialog-usertemplates.ftl" />
                        </div>
                    </div>
                </#if>
                <#--Groups-->
                <#if permissions.groupsAllowed>
                    <div id="domain-groups" role="tablist">
                        <div role="tab" class="wrap" title="${i18n.text('Groups.title')}">
                            <#include "groups/manage.ftl" />
                            <#include "groups/dialog-groups.ftl" />
                        </div>
                    </div>
                </#if>
                <#--Network Storage-->
                <#if permissions.reverseProxiesAllowed>
                    <div id="domain-network-storage" role="tablist">
                        <div role="tab" class="wrap" title="${i18n.text('ReverseProxies.title')}">
                            <#include "proxy/manage.ftl" />
                            <#include "proxy/dialog-protocol.ftl" />
                            <#include "proxy/dialog-add-proxies.ftl" />
                            <#include "proxy/dialog-edit-proxies.ftl" />
                            <#include "proxy/dialog-test.ftl" />
                        </div>
                    </div>
                </#if>


            <#-- AUTOMATION -->
                <#--Directory Monitors-->
                <#if permissions.directoryMonitorsAllowed>
                    <div role="tablist" id="domain-dir-monitors">
                        <div role="tab" class="wrap" id="dir-monitor-list" title="${i18n.text('DirectoryMonitors.title')}">
                            <#include "dirmonitors/manage.ftl" />
                            <#include "dirmonitors/dialog-monitors.ftl" />
                            <#if permissions.directoryMonitorsTriggersAllowed>
                            <#include "dirmonitors/dialog-triggers.ftl" />
                            </#if>
                        </div>
                        <div role="tab" class="wrap" id="dir-monitor-events" title="${i18n.text('DirectoryMonitors.title.events')}">
                            <#include "dirmonitors/events.ftl" />
                            <#if permissions.directoryMonitorsControlAllowed>
                                <#include "dirmonitors/dialog-events.ftl" />
                            </#if>
                        </div>
                        <div role="tab" class="wrap" id="dir-monitor-settings" title="${i18n.text('DirectoryMonitors.title.settings')}">
                            <#include "dirmonitors/settings.ftl" />
                        </div>
                    </div>
                </#if>
                <#--Triggers-->
                <#if permissions.triggersAllowed>
                    <div id="domain-triggers" role="tablist">
                        <div role="tab" class="wrap" title="${i18n.text('Triggers.title')}">
                            <#include "triggers/manage.ftl" />
                            <#include "triggers/dialog-order.ftl" />
                            <#include "triggers/dialog-portation.ftl" />
                            <#include "triggers/dialog-add.ftl" />
                            <#include "triggers/dialog-edit.ftl" />
                            <#include "triggers/dialog-manage.ftl" />
                            <#include "triggers/dialog-expression.ftl" />
                            <#include "triggers/dialog-action.ftl" />
                        </div>
                        <div role="tab" class="wrap" id="trigger-templates" title="${i18n.text('Triggers.title.templates')}">
                            <#include "triggers/templates.ftl" />
                            <#include "triggers/dialog-template-add.ftl" />
                            <#include "triggers/dialog-template-edit.ftl" />
                            <#include "triggers/dialog-template-action.ftl" />
                            <#include "triggers/dialog-template-manage.ftl" />
                        </div>
                        <div role="tab" class="wrap" id="trigger-history" title="${i18n.text('Triggers.title.history')}">
                            <#include "triggers/history.ftl" />
                            <#include "triggers/dialog-history.ftl" />
                        </div>
                        <div role="tab" class="wrap" id="trigger-settings" title="${i18n.text('Triggers.title.settings')}">
                            <#include "triggers/settings.ftl" />
                            <#include "triggers/dialog-settings.ftl" />
                        </div>
                        <div role="tab" class="wrap" id="trigger-remote-settings" title="${i18n.text('Triggers.title.jms')}">
                            <#include "triggers/jms.ftl" />
                            <#include "triggers/dialog-jms.ftl" />
                        </div>
                        <div role="tab" class="wrap" id="trigger-actions" title="${i18n.text('Triggers.title.actions')}">
                            <#include "triggers/actions.ftl" />
                        </div>
                        <div role="tab" class="wrap" id="trigger-functions" title="${i18n.text('Triggers.title.functions')}">
                            <#include "triggers/functions.ftl" />
                        </div>
                    </div>
                </#if>
                <#--Trading Partners-->
                <#if permissions.tradingPartnersAllowed>
                    <div id="domain-trading-partners" role="tablist">
                        <div role="tab" class="wrap" title="${i18n.text('TradingPartners.title')}">
                            <#include "partners/manage.ftl" />
                            <#if permissions.tradingPartnersControllAllowed>
                                <#include "partners/dialog-protocol.ftl" />
                                <#include "partners/dialog-add.ftl" />
                                <#include "partners/dialog-edit.ftl" />
                                <#include "partners/dialog-copy.ftl" />
                                <#include "partners/dialog-import.ftl" />
                                <#include "partners/dialog-export.ftl" />
                            </#if>
                            <#if permissions.tradingPartnerTriggersAllowed>
                                <#include "partners/dialog-triggers.ftl" />
                            </#if>
                            <#include "partners/dialog-oftp-spec.ftl" />
                            <#include "partners/dialog-email.ftl" />
                        </div>
                    </div>
                </#if>


            <#-- SHARING -->
                <#--Ad-Hoc Activity-->
                <#if permissions.adHocTransfersAllowed>
                    <div id="domain-adhoctransfers" role="tablist">
                        <div role="tab" class="wrap" title="${i18n.text('AdHocTransfers.title')}">
                            <#include "adhoc-transfers/manage.ftl" />
                            <#include "adhoc-transfers/dialog-transfers.ftl" />
                        </div>
                    </div>
                </#if>
                <#--Concats-->
                <#if permissions.contactsAllowed>
                    <div id="domain-contacts" role="tablist">
                        <div role="tab" class="wrap" title="${i18n.text('Contacts.title')}">
                            <#include "contancts/manage.ftl" />
                            <#include "contancts/dialog-contacts.ftl" />
                        </div>
                    </div>
                </#if>
                <#--Drop Zones-->
                <#if permissions.dropZonesAllowed>
                    <div id="domain-dropzones" role="tablist">
                        <div role="tab" class="wrap" title="${i18n.text('DropZones.title')}">
                            <#include "dropzones/manage.ftl" />
                            <#include "dropzones/dialog-dropzones.ftl" />
                        </div>
                    </div>
                </#if>


            <#--EDI-->
                <#--AS2 Messages-->
                <#if permissions.as2MessagesAllowed>
                    <div id="domain-as2-messages" role="tablist">
                        <div role="tab" class="wrap" title="${i18n.text('AS2Messages.title')}">
                            <#include "as2/manage.ftl" />
                            <#include "as2/dialog-messages.ftl" />
                        </div>
                    </div>
                </#if>
                <#--OFTP2 Messages-->
                <#if permissions.oftpMessagesAllowed>
                    <div id="domain-oftp-messages" role="tablist">
                        <div role="tab" class="wrap" title="${i18n.text('OftpMessages.title')}">
                            <#include "oftp/manage.ftl" />
                            <#include "oftp/dialog-messages.ftl" />
                        </div>
                    </div>
                </#if>

            <#-- SECURITY -->
                <#--Banned Files-->
                <#if permissions.bannedFilesAllowed>
                    <div id="domain-banned-files" role="tablist">
                        <div role="tab" class="wrap" title="${i18n.text('BannedFiles.title')}">
                            <#include "banned-files/manage.ftl" />
                            <#include "banned-files/dialog-rule.ftl" />
                        </div>
                    </div>
                </#if>
                <#--Password Compliance-->
                <#if permissions.passwordComplianceSettingsAllowed>
                    <div id="domain-compliance" role="tablist">
                        <div role="tab" class="wrap" title="${i18n.text('Compliance.title')}">
                            <#include "compliance/manage.ftl" />
                        </div>
                        <div role="tab" class="wrap" title="${i18n.text('Compliance.title.fips')}">
                            <#include "compliance/fips.ftl" />
                        </div>
                    </div>
                </#if>
                <#--DLP Rules-->
                <#if permissions.dlpRulesAllowed>
                    <div id="domain-dlp" role="tablist">
                        <div role="tab" class="wrap" data-options="id:'domain-dlp-rules'" title="${i18n.text('DlpRules.title')}"><#include "dlp/manage.ftl" /><#include "dlp/dialog-rule.ftl" /></div>
                        <#if permissions.dlpIcapServerAllowed>
                            <div role="tab" class="wrap" data-options="id:'domain-dlp-icap'" title="${i18n.text('DlpIcap.title')}"><#include "dlp/icap.ftl" /></div>
                        </#if>
                    </div>
                </#if>
                <#--IP Access-->
                <#if permissions.ipAccessSettingsAllowed>
                    <div id="domain-ip-access" role="tablist">
                        <div role="tab" class="wrap" title="${i18n.text('IpAccess.title')}">
                            <#include "ipaccess/manage.ftl" />
                            <#include "ipaccess/dialog-rule.ftl" />
                        </div>
                    </div>
                </#if>
                <#--Keys-->
                <#if permissions.domainKeystoreAllowed>
                    <div role="tablist" id="server-keys">
                        <div role="tab" class="wrap" title="${i18n.text('ServerKeys.title')}">
                            <#include "keystore/serverkeys/manage.ftl" />
                            <#include "keystore/serverkeys/dialog-keys.ftl" />
                        </div>
                        <div role="tab" class="wrap" id="host-keys" title="${i18n.text('HostKeys.title')}">
                            <#include "keystore/hostkeys/manage.ftl" />
                            <#include "keystore/hostkeys/dialog-keys.ftl" />
                        </div>
                        <div role="tab" class="wrap" id="client-keys" title="${i18n.text('ClientKeys.title')}">
                            <#include "keystore/clientkeys/manage.ftl" />
                            <#include "keystore/clientkeys/dialog-keys.ftl" />
                        </div>
                        <div role="tab" class="wrap" id="pgp-keys" title="${i18n.text('PgpKeys.title')}">
                            <#include "keystore/pgpkeys/manage.ftl" />
                            <#include "keystore/pgpkeys/dialog-keys.ftl" />
                        </div>
                        <div role="tab" class="wrap" id="key-expiry-report" title="${i18n.text('KeyExpiryReport.title')}">
                            <#include "../server/keystore/key-expiry-report.ftl" />
                        </div>
                    </div>
                </#if>
                <#--Time Access-->
                <#if permissions.timeAccessSettingsAllowed>
                    <div id="domain-time-access" role="tablist">
                        <div role="tab" class="wrap" title="${i18n.text('TimeAccess.title')}"><#include "timeaccess/manage.ftl" /></div>
                    </div>
                </#if>

             <#-- MISCELLANEOUS -->
                <#--URL Branding-->
                <#if permissions.urlBrandingAllowed>
                    <div id="domain-url-branding" role="tablist">
                        <div role="tab" class="wrap" title="${i18n.text('UrlBranding.title')}">
                            <#include "urlbranding/manage.ftl" />
                            <#include "urlbranding/dialog-webthemes.ftl" />
                        </div>
                    </div>
                </#if>
            </div>
        </div>


        <div class="layout-pane-bottom" data-options="region:'south',border:false" style="border-top-width:1px;padding:7px 32px;text-align:center">
            <div class="viewpane-toolbar viewpane-toolbar-selection" style="margin:0">
                <span id="domain-state" style="min-width:180px;display:inline-block"><@i18n.message key="${i18n.text('Domain.title', [domainName, ''], true)}" /></span>
                <#if permissions.domainStatusAllowed>
                    <@form.button name="startdomain"><@i18n.message key="Domain.button.start" /></@>
                    <@form.button name="stopdomain"><@i18n.message key="Domain.button.stop" /></@>
                    <@form.button name="pausedomain"><@i18n.message key="Domain.button.pause" /></@>
                    <@form.button name="resumedomain"><@i18n.message key="Domain.button.resume" /></@>
                </#if>
            </div>
        </div>

    </div>

    <#if permissions.tagInlineControlAllowed>
        <#include "dialog-tags-inline.ftl" />
    </#if>
    <#if permissions.accountsAllowed>
        <#include "users/dialog-ipaccess.ftl" />
        <#include "vfs/dialog-path.ftl" />
        <#include "vfs/dialog-pgp-encrypt.ftl" />
        <#include "vfs/dialog-dlp.ftl" />
    </#if>
    <#if permissions.reverseProxiesAllowed || permissions.tradingPartnersAllowed || permissions.triggersAllowed>
        <#include "dialog-client-keys.ftl" />
    </#if>

    <#if permissions.domainKeystoreAllowed>
        <#include "keystore/dialog-keystore.ftl" />
    </#if>

    <#if permissions.licenseControlAllowed>
        <#include "../server/dialog-license.ftl" />
    </#if>
    <#include "../server/domains/dialog-add.ftl" />
</@html.template>
