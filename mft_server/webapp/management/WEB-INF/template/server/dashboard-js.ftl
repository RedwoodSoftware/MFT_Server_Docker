<#import "*/macro.ftl" as m/>

<@m.csp_nonce; csp_nonce_attr>
<!--[if lte IE 8]><script language="javascript" type="text/javascript" src="/js/excanvas.min.js"${csp_nonce_attr}></script><![endif]-->
<#if ['de','es','fr','ru','zh','ja']?seq_contains(.lang)><script type="text/javascript" src="/js/momentjs/locale/${.lang?url}.js" charset="utf-8"${csp_nonce_attr}></script><script type="text/javascript"${csp_nonce_attr}>window.moment&&moment.locale('${.lang?js_string}');</script></#if>
<@html.script base_uri="/js" sources=["/jquery.flot.min.js", "/jquery.flot.time.min.js", "/jquery.flot.selection.min.js", "/momentjs/moment-2.29.4.min.js"] />


<#assign resources=["/lang.js", "/crypto-js.js", "/application.js", "/management.js", "/domain/add-domain.js", "/server/lifecycle.js", "/server/server.js"] />
<#if permissions.serverStatisticsAllowed><#assign resources=resources + ["/server/dashboard.js"] /></#if>
<#if permissions.actionCenterAllowed><#assign resources=resources + ["/server/dload-update.js", "/server/action-center.js"] /></#if>
<#if permissions.licenseControlAllowed><#assign resources=resources + ["/server/license.js"] /></#if>
<@html.script sources=resources />


<script type="text/javascript"${csp_nonce_attr}>
    $.parser.auto = false;
    window.R = {
        string: $.extend({contains: function (key) { return this.hasOwnProperty(key); }},
        <#include "errors-js.ftl" />,
        <#if permissions.actionCenterAllowed><#include "updates/i18n-js.ftl" />,</#if>
        <#include "i18n-js.ftl" />)
    };
    <#include "/WEB-INF/template/i18n-easyui.ftl" />
    $(function () {
        window.jscape = window.jscape || {};
        window.jscape.API = new jscape.management.ManagementService();
        var app = new jscape.server.ServerDashboardApplication();
        <#if permissions.serverStatisticsAllowed>app.register('server-dashboard', new jscape.server.DashboardModule());</#if>
        <#if permissions.actionCenterAllowed>app.register('action-center', new jscape.server.ActionCenterModule(${permissions.actionCenterControlAllowed?string}));</#if>
        app.register('server-statistics', new jscape.server.StatisticsModule(${permissions.serverStatisticsAllowed?string}, ${permissions.serverRestartAllowed?string}));
        app.register('server-interfaces', new jscape.server.InterfacesModule());
        <#if permissions.licenseControlAllowed>app.register('server-license', new jscape.server.LicenseModule(), true);</#if>
        app.register('domains-create', new jscape.domain.CreateDomainModule(), true);
        app.start();
    });
</script>
</@m.csp_nonce>