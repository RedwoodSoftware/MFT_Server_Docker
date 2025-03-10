<#import "*/macro.ftl" as m/>

<#assign resources=[
"/easyui-path-selector.js",
"/lang.js",
"/crypto-js.js",
"/application.js",
"/management.js",
"/domain/domain.js",
"/domain/add-domain.js",
"/domain/services/service.js",
"/domain/statistics.js",
"/domain/event-logs.js",
"/server/domains.js"
] />
<#if permissions.licenseControlAllowed><#assign resources = resources + ["/server/license.js"] /></#if>
<@html.script sources=resources />

<@m.csp_nonce; csp_nonce_attr>
<script type="text/javascript" src="/js/momentjs/moment-2.29.4.min.js"${csp_nonce_attr}></script>
<#if ['de','es','fr','ru','zh','ja']?seq_contains(.lang)><script type="text/javascript" src="/js/momentjs/locale/${.lang?url}.js" charset="utf-8"${csp_nonce_attr}></script><script type="text/javascript"${csp_nonce_attr}>window.moment&&moment.locale('${.lang?js_string}');</script></#if>

<script type="text/javascript"${csp_nonce_attr}>
    $.parser.auto = false;
    window.R = {
        string: $.extend({contains: function (key) { return this.hasOwnProperty(key); }},
        <#include "/WEB-INF/template/dialog-js.ftl" />,
        <#include "*/errors-js.ftl" />,
        <#include "*/i18n-js.ftl" />,
        <#include "/WEB-INF/template/domains/statistics/i18n-js.ftl" />,
        <#include "i18n-js.ftl" />)
    };
    <#include "/WEB-INF/template/i18n-easyui.ftl" />
    $(function () {
        window.jscape = window.jscape || {};
        window.jscape.API = new jscape.management.ManagementService();
        var app = new jscape.server.DomainsDashboardAppication();
        app.register('server-domains', new jscape.server.DomainsModule());
        <#if permissions.licenseControlAllowed>app.register('server-license', new jscape.server.LicenseModule(), true);</#if>
        app.start();
    });
</script>
</@m.csp_nonce>