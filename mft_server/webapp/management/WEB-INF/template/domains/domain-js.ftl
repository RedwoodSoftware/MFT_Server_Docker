<#import "*/macro.ftl" as m/>

<@m.csp_nonce; csp_nonce_attr>
<script type="text/javascript" src="/js/momentjs/moment-2.29.4.min.js"${csp_nonce_attr}></script>
<#if ['de','es','fr','ru','zh','ja']?seq_contains(.lang)><script type="text/javascript" src="/js/momentjs/locale/${.lang?url}.js" charset="utf-8"${csp_nonce_attr}></script><script type="text/javascript"${csp_nonce_attr}>window.moment&&moment.locale('${.lang?js_string}');</script></#if>

<#assign resources=[
"/easyui-path-selector.js",
"/lang.js",
"/crypto-js.js",
"/application.js",
"/management.js",
"/domain/domain.js",
"/domain/common.js",
"/domain/event-logs.js",
"/domain/add-domain.js"
]/>
<#if permissions.domainStatisticsAllowed || permissions.domainSessionsAllowed><#assign resources=resources + ["/domain/statistics.js"] /></#if>
<#if permissions.domainDescriptionAllowed><#assign resources=resources + ["/domain/description.js"] /></#if>
<#if permissions.domainLimitsAllowed><#assign resources=resources + ["/domain/limits.js"] /></#if>
<#if permissions.domainServicesAllowed><#assign resources=resources + ["/themes.js", "/domain/services/service.js", "/domain/services/config.js"] /></#if>
<#if permissions.domainKeystoreAllowed><#assign resources=resources + ["/domain/keystore/operation.js", "/domain/keystore/keymanager.js", "/domain/keystore/server-keys.js", "/domain/keystore/host-keys.js", "/domain/keystore/client-keys.js", "/domain/keystore/pgp-keys.js"] /></#if>
<#if permissions.logRecordsAllowed><#assign resources=resources + ["/domain/logging/records.js"] /></#if>
<#if permissions.logSettingsAllowed><#assign resources=resources + ["/domain/logging/settings.js"] /></#if>
<#if permissions.reportsAllowed><#assign resources=resources + ["/domain/reports.js"] /></#if>
<#if permissions.adHocTransfersAllowed><#assign resources=resources + ["/domain/adhoctransfers.js"] /></#if>
<#if permissions.as2MessagesAllowed><#assign resources=resources + ["/domain/as2messages.js"] /></#if>
<#if permissions.oftpMessagesAllowed><#assign resources=resources + ["/domain/oftpmessages.js"] /></#if>
<#if permissions.timeAccessSettingsAllowed><#assign resources=resources + ["/domain/timeaccess.js"] /></#if>
<#if permissions.bannedFilesAllowed><#assign resources=resources + ["/domain/bannedfiles.js"] /></#if>
<#if permissions.passwordComplianceSettingsAllowed><#assign resources=resources + ["/domain/compliance.js"] /></#if>
<#if permissions.ipAccessSettingsAllowed><#assign resources=resources + ["/domain/ipaccess.js"] /></#if>
<#if permissions.dlpRulesAllowed><#assign resources=resources + ["/domain/dlp.js"] /></#if>
<#if permissions.connectionSettingsAllowed><#assign resources=resources + ["/domain/connections.js"] /></#if>
<#if permissions.triggersAllowed>
    <link type="text/css" rel="stylesheet" href="/css/jquery.flowchart-1.1.min.css"/>
    <link type="text/css" rel="stylesheet" href="/css/query-builder.default.3.0.0.min.css"/>
    <@html.script base_uri="/js" sources=["/jquery.flowchart.js", "/jquery.mousewheel.min.js", "/panzoom-4.3.2.min.js", "/query-builder.standalone.3.0.0.min.js", "/query-builder.plugins.js"] />

    <#assign resources=resources + ["/domain/triggers/trigger-actions.js", "/domain/triggers/triggers.js", "/domain/triggers/trigger-templates.js"] />
</#if>
<#if permissions.authenticationSettingsAllowed><#assign resources=resources + ["/domain/authentication.js"] /></#if>
<#if permissions.accountsAllowed><#assign resources=resources + ["/domain/users/common.js", "/domain/users/vfs.js", "/domain/users/users.js", "/domain/users/templates.js"] /></#if>
<#if permissions.groupsAllowed><#assign resources=resources + ["/domain/groups.js"] /></#if>
<#if permissions.reverseProxiesAllowed><#assign resources=resources + ["/domain/networkstorage.js"] /></#if>
<#if permissions.directoryMonitorsAllowed><#assign resources=resources + ["/domain/dirmonitors.js"] /></#if>
<#if permissions.dropZonesAllowed><#assign resources=resources + ["/domain/dropzones.js"] /></#if>
<#if permissions.urlBrandingAllowed><#assign resources=resources + ["/domain/urlbranding.js"] /></#if>
<#if permissions.tradingPartnersAllowed><#assign resources=resources + ["/domain/tradingpartners.js"] /></#if>
<#if permissions.contactsAllowed><#assign resources=resources + ["/domain/contacts.js"] /></#if>
<#if permissions.licenseControlAllowed><#assign resources=resources + ["/server/license.js"] /></#if>
<@html.script sources=resources />


<script type="text/javascript"${csp_nonce_attr}>
    $.parser.auto = false;
    window.R = {
        string: $.extend({contains: function (key) { return this.hasOwnProperty(key); }},
        <#include "/WEB-INF/template/dialog-js.ftl" />,
        <#include "/WEB-INF/template/server/errors-js.ftl" />,
        <#include "/WEB-INF/template/domains/statistics/i18n-js.ftl" />,
        <#include "i18n-js.ftl" />)
    };
    <#include "/WEB-INF/template/i18n-easyui.ftl" />
    <#include "/WEB-INF/template/i18n-findbar.ftl" />
    $(function() {
        window.jscape = window.jscape || {};
        window.jscape.acl = {tic: ${permissions.domainStatusAllowed?string}};
        jscape.API = new jscape.management.ManagementService();
        var app = new jscape.DomainSettingsApplication();
        <#if permissions.domainStatusAllowed>app.register('domain-state', new jscape.domain.DomainStateModule(), true);</#if>
        <#if permissions.domainStatisticsAllowed>app.register('domain-overview', new jscape.domain.StatisticsModule());</#if>
        <#if permissions.domainSessionsAllowed>app.register('domain-sessions', new jscape.domain.SessionsModule());</#if>
        <#if permissions.domainDescriptionAllowed>app.register('domain-description', new jscape.domain.DescriptionModule(${permissions.domainDescriptionControlAllowed?string}));</#if>
        <#if permissions.domainLimitsAllowed>app.register('domain-limits', new jscape.domain.DomainLimitsModule(${permissions.domainLimitsControlAllowed?string}));</#if>
        <#if permissions.domainServicesAllowed>app.register('domain-services', new jscape.domain.ServicesModule("${(page.themeUrlPattern!'')?js_string}","${(page.currentThemeName!'')?js_string}"));</#if>
        <#if permissions.domainKeystoreAllowed>app.register('domain-keystore', new jscape.domain.KeystoreModule(${permissions.domainKeystoreControlAllowed?string}));</#if>
        <#if permissions.logRecordsAllowed>app.register('domain-logging', new jscape.domain.LoggingModule());</#if>
        <#if permissions.logSettingsAllowed>app.register('domain-logging', new jscape.domain.LoggingSettingsModule(${permissions.logSettingsControlAllowed?string}));</#if>
        <#if permissions.reportsAllowed>app.register('domain-reports', new jscape.domain.ReportsModule());</#if>
        <#if permissions.adHocTransfersAllowed>app.register('domain-adhoctransfers', new jscape.domain.AdHocActivityModule(${permissions.adHocTransfersControlAllowed?string}));</#if>
        <#if permissions.as2MessagesAllowed>app.register('domain-as2-messages', new jscape.domain.AS2Module(${permissions.as2MessagesSendOperationAllowed?string}, ${permissions.as2MessagesDeleteAllowed?string}));</#if>
        <#if permissions.oftpMessagesAllowed>app.register('domain-oftp-messages', new jscape.domain.OftpModule(${permissions.oftpMessagesSendOperationAllowed?string}, ${permissions.oftpMessagesDeleteAllowed?string}));</#if>
        <#if permissions.timeAccessSettingsAllowed>app.register('domain-time-access', new jscape.domain.TimeAccessModule());</#if>
        <#if permissions.bannedFilesAllowed>app.register('domain-banned-files', new jscape.domain.BannedFilesModule());</#if>
        <#if permissions.passwordComplianceSettingsAllowed>app.register('domain-compliance', new jscape.domain.ComplianceModule());</#if>
        <#if permissions.ipAccessSettingsAllowed>app.register('domain-ip-access', new jscape.domain.IPAccessModule());</#if>
        <#if permissions.dlpRulesAllowed>app.register('domain-dlp', new jscape.domain.DlpModule());</#if>
        <#if permissions.connectionSettingsAllowed>app.register('domain-connections', new jscape.domain.ConnectionsModule());</#if>
        <#if permissions.triggersAllowed>app.register('domain-triggers', new jscape.domain.TriggersModule());</#if>
        <#if permissions.authenticationSettingsAllowed>app.register('domain-authentication', new jscape.domain.AuthenticationModule());</#if>
        <#if permissions.accountsAllowed>app.register('domain-accounts', new jscape.domain.UsersModule(${permissions.accountsControlAllowed?string}));</#if>
        <#if permissions.accountsAllowed>app.register('domain-user-templates', new jscape.domain.UserTemplatesModule(${permissions.accountsControlAllowed?string}));</#if>
        <#if permissions.groupsAllowed>app.register('domain-groups', new jscape.domain.GroupsModule());</#if>
        <#if permissions.reverseProxiesAllowed>app.register('domain-network-storage', new jscape.domain.NetworkStorageModule());</#if>
        <#if permissions.directoryMonitorsAllowed>app.register('domain-dir-monitors', new jscape.domain.DirectoryMonitorsModule(${permissions.directoryMonitorsControlAllowed?string}, ${permissions.directoryMonitorsTriggersAllowed?string}));</#if>
        <#if permissions.dropZonesAllowed>app.register('domain-dropzones', new jscape.domain.DropZonesModule());</#if>
        <#if permissions.urlBrandingAllowed>app.register('domain-url-branding', new jscape.domain.UrlBrandingModule());</#if>
        <#if permissions.tradingPartnersAllowed>app.register('domain-trading-partners', new jscape.domain.TradingPartnersModule(${permissions.tradingPartnersControllAllowed?string}, ${permissions.tradingPartnerTriggersAllowed?string}));</#if>
        <#if permissions.contactsAllowed>app.register('domain-contacts', new jscape.domain.ContactsModule(${permissions.contactsControllAllowed?string}));</#if>
        <#if permissions.licenseControlAllowed>app.register('server-license', new jscape.server.LicenseModule(), true);</#if>
        app.register('domains-create', new jscape.domain.CreateDomainModule(), true);
        app.start('${domainName?js_string?html}');
    });
</script>
</@m.csp_nonce>
