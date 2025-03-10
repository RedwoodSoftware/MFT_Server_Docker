<#ftl strip_whitespace=true>
<#import "/WEB-INF/tags/html.ftl" as html/>
<#import "/WEB-INF/tags/form.ftl" as form/>
<#import "/WEB-INF/tags/message.ftl" as i18n/>
<#import "/WEB-INF/template/macro.ftl" as m/>


<@html.template title=i18n.text("Menu.item.settings") + " - " + i18n.text("Application.title.text") header_section="/WEB-INF/template/server/settings/settings-js.ftl"; csp_nonce_attr>
    <div id="throbber" class="panel-loading"><@i18n.message key="Application.message.loading" /></div>

    <div id="viewpane" style="visibility:hidden">
        <div data-options="region:'north',border:false" style="height:100px;padding:8px;border-bottom-width:1px">
            <div id="navigation">
                <@m.menubar selected=i18n.text("Menu.item.settings") />
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
                    <@m.sidemenu id="settings-sidemenu" items=[
                    {
                        'id': "MANAGER_SERVICE",
                        'name': i18n.text('ServerSettings.sidemenu.ManagerService.title'),
                        'allowed': permissions.managementSettingsAllowed,
                        'items': [
                            {'id': "manager-service", 'text': i18n.text("ManagerService.title"), 'icon': "icon-s-manager m-icon", 'allowed': true},
                            {'id': "manager-logging", 'text': i18n.text("ManagerLogs.title"), 'icon': "icon-m-logging m-icon", 'allowed': true},
                            {'id': "manager-authentication", 'text': i18n.text("AuthenticationService.title"), 'icon': "icon-m-auth m-icon", 'allowed': true},
                            {'id': "manager-accounts", 'text': i18n.text("Administrators.title"), 'icon': "icon-m-users m-icon", 'allowed': true}
                        ]
                    },
                    {
                        'id': "DATASTORE",
                        'name': i18n.text('ServerSettings.sidemenu.Datastore.title'),
                        'allowed': permissions.serverDatabaseConfigurationAllowed,
                        'items': [
                            {'id': "server-datastore", 'text': i18n.text("ApplicationDatastore.title"), 'icon': "icon-s-datastore m-icon", 'allowed': true}
                        ]
                    },
                    {
                        'id': "GLOBAL_SERVICES",
                        'name': i18n.text('ServerSettings.sidemenu.GlobalServices.title'),
                        'allowed': permissions.globalServicesAllowed,
                        'items': [
                            {'id': "global-services", 'text': i18n.text("GlobalServices.title"), 'icon': "icon-s-listeners m-icon", 'allowed': true}
                        ]
                    },
                    {
                        'id': "MISCELLANEOUS",
                        'name': i18n.text('ServerSettings.sidemenu.Miscellaneous.title'),
                        'allowed': permissions.webSettingsAllowed || permissions.emailSettingsAllowed || permissions.failoverSettingsAllowed || permissions.searchingSettingsAllowed || permissions.jmxSettingsAllowed,
                        'items': [
                            {'id': "web-service", 'text': i18n.text("WebSettings.title"), 'icon': "icon-s-web m-icon", 'allowed': permissions.webSettingsAllowed},
                            {'id': "email-service", 'text': i18n.text("Email.title"), 'icon': "icon-s-email m-icon", 'allowed': permissions.emailSettingsAllowed},
                            {'id': "failover-service", 'text': i18n.text("Failover.title"), 'icon': "icon-s-failover m-icon", 'allowed': permissions.failoverSettingsAllowed},
                            {'id': "search-service", 'text': i18n.text("SearchService.title"), 'icon': "icon-s-search m-icon", 'allowed': permissions.searchingSettingsAllowed},
                            {'id': "jmx-service", 'text': i18n.text("JmxService.title"), 'icon': "icon-s-jmx m-icon", 'allowed': permissions.jmxSettingsAllowed}
                        ]
                    },
                    {
                        'id': "UPDATES",
                        'name': i18n.text('ServerSettings.sidemenu.Updates.title'),
                        'allowed': permissions.applicationUpdatesAllowed,
                        'items': [
                            {'id': "server-updates", 'text': i18n.text("AutomaticUpdates.title"), 'icon': "icon-s-updates m-icon", 'allowed': true}
                        ]
                    }
                    ] />
                </div>
            </div>
        </div>

        <div data-options="region:'center',border:false">
            <div id="server-settings" class="easyui-panel" data-options="fit:true,border:false">

                <#--Manager Service Module-->
                <#if permissions.managementSettingsAllowed>
                    <#-- Manager Service -->
                    <div id="manager-service" role="tablist">
                        <div id="manager-service-config" role="tab" class="wrap" title="${i18n.text('ManagerService.title')}"><#include "manager/service.ftl" /></div>
                        <div id="manager-service-access" role="tab" class="wrap" title="${i18n.text('ManagerAccess.title')}"><#include "manager/access.ftl" /></div>
                    </div>

                    <#-- Manager Logs -->
                    <div id="manager-logging" role="tablist">
                        <div id="manager-logging-records" role="tab" class="wrap" title="${i18n.text('ManagerLogs.title.records')}"><#include "manager/logging/records.ftl" /></div>
                        <div id="manager-logging-service" role="tab" class="wrap" title="${i18n.text('ManagerLogs.title.settings')}"><#include "manager/logging/service.ftl" /></div>
                        <div id="manager-logging-syslog" role="tab" class="wrap" title="${i18n.text('ManagerLogs.title.syslog')}"><#include "manager/logging/syslog.ftl" /></div>
                        <div id="manager-logging-extended" role="tab" class="wrap" title="${i18n.text('ManagerLogs.title.extensions')}"><#include "manager/logging/extensions.ftl" /></div>
                        <div id="manager-logging-debug" role="tab" class="wrap" title="${i18n.text('ManagerLogs.title.debug')}"><#include "manager/logging/debug.ftl" /></div>
                    </div>

                    <#--Manager Authentication-->
                    <div id="manager-authentication" role="tablist">
                        <div id="manager-authentication-service" role="tab" class="wrap" title="${i18n.text('AuthenticationService.title')}">
                            <#include "manager/authentication/authentication.ftl" />
                            <#include "manager/authentication/dialog-credentials.ftl" />
                            <#include "manager/authentication/dialog-service.ftl" />
                        </div>
                        <div id="manager-authentication-multifactor" role="tab" class="wrap" title="${i18n.text('AuthenticationService.title.multiFactor')}"><#include "manager/authentication/multi-factor.ftl" /></div>
                        <div id="manager-authentication-sso" role="tab" class="wrap" title="${i18n.text('AuthenticationService.title.SSO')}"><#include "manager/authentication/web-sso.ftl" /></div>
                    </div>

                    <#--Manager Administrators-->
                    <div id="manager-accounts" role="tablist">
                        <div id="manager-accounts-list" role="tab" class="wrap" title="${i18n.text('Administrators.title')}"><#include "manager/administrators.ftl" /></div>
                        <div id="manager-accounts-roles" role="tab" class="wrap" title="${i18n.text('Roles.title')}"><#include "manager/roles.ftl" /></div>
                        <div id="manager-accounts-tags" role="tab" class="wrap" title="${i18n.text('Tags.title')}"><#include "manager/tags.ftl" /></div>
                    </div>
                </#if>

                <#--Server Database Configuration Module-->
                <#if permissions.serverDatabaseConfigurationAllowed>
                    <div id="server-datastore" role="tablist">
                        <div role="tab" class="wrap" title="${i18n.text('ApplicationDatastore.title')}">
                            <#include "datastore/config.ftl" />
                        </div>
                    </div>
                </#if>

                <#--Global Services Module-->
                <#if permissions.globalServicesAllowed>
                    <div id="global-services" role="tablist">
                        <div id="global-services-list" role="tab" class="wrap" title="${i18n.text('GlobalServices.title')}">
                            <#include "services/manage.ftl" />
                            <#include "services/dialog-service.ftl" />
                        </div>
                        <div id="global-services-ftp" role="tab" class="wrap" title="${i18n.text('GlobalServices.title.FTP')}"><#include "services/ftp.ftl" /></div>
                        <div id="global-services-sftp" role="tab" class="wrap" title="${i18n.text('GlobalServices.title.SFTP')}"><#include "services/sftp.ftl" /></div>
                        <div id="global-services-aftp" role="tab" class="wrap" title="${i18n.text('GlobalServices.title.AFTP')}"><#include "services/aftp.ftl" /></div>
                    </div>
                </#if>

                <#--Web Settings Module-->
                <#if permissions.webSettingsAllowed>
                    <div id="web-service" role="tablist">
                        <div role="tab" class="wrap" title="${i18n.text('WebConfiguration.title')}"><#include "web/config.ftl" /></div>
                        <div role="tab" class="wrap" title="${i18n.text('WebRestConfiguration.title')}"><#include "web/config-rest.ftl" /></div>
                        <div role="tab" class="wrap" title="${i18n.text('AS2Configuration.title')}"><#include "web/as2.ftl" /></div>
                        <div role="tab" class="wrap" title="${i18n.text('SelfRegistration.title')}"><#include "web/registration.ftl" /></div>
                        <div role="tab" class="wrap" title="${i18n.text('WebResources.title')}"><#include "web/resources.ftl" /></div>
                        <div role="tab" class="wrap" title="${i18n.text('WebDocumentViewer.title')}"><#include "web/doc-viewer.ftl" /></div>
                    </div>
                </#if>

                <#--Email Settings Module-->
                <#if permissions.emailSettingsAllowed>
                    <div id="email-service" role="tablist">
                        <div role="tab" class="wrap" title="${i18n.text('Email.title')}"><#include "email/config.ftl" /></div>
                        <div role="tab" class="wrap" title="${i18n.text('AdHocTransfer.title')}"><#include "email/ad-hoc.ftl" /></div>
                        <div role="tab" class="wrap" title="${i18n.text('EmailResources.title')}"><#include "email/resources.ftl" /></div>
                    </div>
                </#if>

                <#--Failover Module-->
                <#if permissions.failoverSettingsAllowed>
                    <div id="failover-service" role="tablist">
                        <div role="tab" class="wrap" title="${i18n.text('Failover.title')}"><#include "failover/failover-config.ftl" /></div>
                        <div role="tab" class="wrap" title="${i18n.text('IPSubstitution.title')}"><#include "failover/ip-substitution.ftl" /></div>
                    </div>
                </#if>

                <#--Searching Service Module-->
                <#if permissions.searchingSettingsAllowed>
                    <div id="search-service" role="tablist">
                        <div role="tab" class="wrap" title="${i18n.text('SearchService.title')}">
                            <#include "searching/config.ftl" />
                        </div>
                    </div>
                </#if>

                <#--JMX Service Module-->
                <#if permissions.jmxSettingsAllowed>
                    <div id="jmx-service" role="tablist">
                        <div role="tab" class="wrap" title="${i18n.text('JmxService.title')}">
                            <#include "jmx/config.ftl" />
                        </div>
                    </div>
                </#if>

                <#--Updates-->
                <#if permissions.applicationUpdatesAllowed>
                    <div id="server-updates" role="tablist">
                        <div role="tab" class="wrap" title="${i18n.text('AutomaticUpdates.title')}">
                            <#include "updates/config.ftl" />
                        </div>
                    </div>
                </#if>
            </div>
        </div>
    </div>

    <#if permissions.webSettingsAllowed>
        <#include "web/dialog-ciphers.ftl" />
        <#include "web/dialog-hsts.ftl" />
    </#if>

    <#if permissions.managementSettingsAllowed>
        <#include "manager/dialog-acl.ftl" />
        <#include "manager/dialog-admin.ftl" />
        <#include "manager/logging/dialog-export.ftl" />
    </#if>

    <#if permissions.licenseControlAllowed>
        <#include "../dialog-license.ftl"/>
    </#if>

    <#if permissions.applicationUpdatesControlAllowed>
        <#include "updates/dialogs.ftl"/>
    </#if>

    <#include "../domains/dialog-add.ftl">
</@html.template>