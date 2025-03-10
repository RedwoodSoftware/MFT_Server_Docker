<#import "*/macro.ftl" as m/>

<@m.csp_nonce; csp_nonce_attr>
<#if ['de','es','fr','ru','zh','ja']?seq_contains(.lang)><script type="text/javascript" src="/js/momentjs/locale/${.lang?url}.js" charset="utf-8"${csp_nonce_attr}></script><script type="text/javascript"${csp_nonce_attr}>window.moment&&moment.locale('${.lang?js_string}');</script></#if>
<@html.script base_uri="/js" sources=["/momentjs/moment-2.29.4.min.js"] />

<#assign resources = ["/easyui-path-selector.js", "/lang.js", "/crypto-js.js", "/management.js", "/application.js", "/domain/add-domain.js", "/settings/settings.js"]>
<#if permissions.licenseControlAllowed><#assign resources = resources + ["/server/license.js"] /></#if>
<#if permissions.managementSettingsAllowed>
    <#assign resources = resources + ["/settings/manager-service.js", "/settings/manager-auth.js", "/settings/manager-acl.js"] />
    <link type="text/css" rel="stylesheet" href="/css/prism.1.29.0.min.css"/>
    <script type="text/javascript" src="/js/prism.1.29.0.min.js" data-manual ${csp_nonce_attr}></script>
</#if>
<#if permissions.serverDatabaseConfigurationAllowed><#assign resources = resources + ["/settings/datastore.js"] /></#if>
<#if permissions.globalServicesAllowed><#assign resources = resources + ["/settings/services.js"] /></#if>
<#if permissions.webSettingsAllowed><#assign resources = resources + ["/settings/web.js"] /></#if>
<#if permissions.emailSettingsAllowed><#assign resources = resources + ["/settings/email-config.js"] /></#if>
<#if permissions.failoverSettingsAllowed><#assign resources = resources + ["/settings/failover.js"] /></#if>
<#if permissions.searchingSettingsAllowed><#assign resources = resources + ["/settings/searching.js"] /></#if>
<#if permissions.jmxSettingsAllowed><#assign resources = resources + ["/settings/jmx.js"] /></#if>
<#if permissions.applicationUpdatesAllowed><#assign resources = resources + ["/server/dload-update.js", "/server/lifecycle.js", "/settings/updates.js"] /></#if>
<#if permissions.managementSettingsAllowed || permissions.globalServicesAllowed || permissions.webSettingsAllowed><#assign resources = resources + ["/themes.js"] /></#if>
<@html.script sources=resources />


<script type="text/javascript"${csp_nonce_attr}>
    $.parser.auto = false;
    window.R = {
        string: $.extend({contains: function (key) { return this.hasOwnProperty(key); }},
        <#include "/WEB-INF/template/dialog-js.ftl" />,
        <#include "/WEB-INF/template/server/errors-js.ftl" />,
        <#if permissions.globalServicesAllowed>
            <#include "services/i18n-js.ftl" />,
        </#if>
        <#if permissions.applicationUpdatesAllowed>
            <#include "updates/i18n-js.ftl" />,
            <#include "../updates/i18n-js.ftl" />,
        </#if>
        <#include "i18n-js.ftl" />)
    };
    <#include "/WEB-INF/template/i18n-easyui.ftl" />
    <#include "/WEB-INF/template/i18n-findbar.ftl" />
    $(function () {
        window.jscape = window.jscape || {};
        jscape.API = new jscape.management.ManagementService();
        var app = new jscape.settings.ServerSettingsApplication();
        <#if permissions.managementSettingsAllowed || permissions.globalServicesAllowed || permissions.webSettingsAllowed>
            var tl = new jscape.themes.WebThemeLoader("${(page.themeUrlPattern!'')?js_string}", "${(page.currentThemeName!'')?js_string}");
        </#if>
        <#if permissions.managementSettingsAllowed>
            app.register('manager-service', new jscape.settings.ManagerServiceModule());
            app.register('manager-logging', new jscape.settings.ManagerLoggingModule());
            app.register('manager-authentication', new jscape.settings.ManagerAuthenticationModule());
            app.register('manager-accounts', new jscape.settings.ManagerAccountsModule(tl));
        </#if>
        <#if permissions.serverDatabaseConfigurationAllowed>app.register('server-datastore', new jscape.settings.DatastoreModule());</#if>
        <#if permissions.globalServicesAllowed>app.register('global-services', new jscape.settings.GlobalServicesModule(tl));</#if>
        <#if permissions.webSettingsAllowed>app.register('web-service', new jscape.settings.WebServiceModule(tl));</#if>
        <#if permissions.emailSettingsAllowed>app.register('email-service', new jscape.settings.EmailModule());</#if>
        <#if permissions.failoverSettingsAllowed>app.register('failover-service', new jscape.settings.FailoverModule());</#if>
        <#if permissions.searchingSettingsAllowed>app.register('search-service', new jscape.settings.SearchingModule());</#if>
        <#if permissions.jmxSettingsAllowed>app.register('jmx-service', new jscape.settings.JmxModule());</#if>
        <#if permissions.applicationUpdatesAllowed>app.register('server-updates', new jscape.settings.ApplicationUpdatesModule(${permissions.applicationUpdatesControlAllowed?string}));</#if>
        <#if permissions.licenseControlAllowed>app.register('server-license', new jscape.server.LicenseModule(), true);</#if>
        app.register('domains-create', new jscape.domain.CreateDomainModule(), true);
        app.start();
    });
</script>
</@m.csp_nonce>