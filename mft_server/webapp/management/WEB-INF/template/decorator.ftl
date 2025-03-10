<#import "/WEB-INF/template/macro.ftl" as m />

<#macro script sources>
    <script type="text/javascript" src="/_/?<#list sources as r>${r}<#if r_has_next>&</#if></#list>"></script>
</#macro>

<#macro template title head="" protect=true><@compress single_line=true>
<!DOCTYPE html>
<html lang="${.lang?html}">
    <head>
        <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
        <title>${title}</title>
        <link rel="icon" href="/themes/icon_32.png" sizes="32x32" />
        <link rel="shortcut icon" href="/themes/favicon.ico" type="image/x-icon"/>
        <link type="text/css" rel="stylesheet" href="/css/base.css" media="all"/>
        <#if themeName?has_content>
            <link type="text/css" rel="stylesheet" href="/themes/${themeName}/easyui.css"/>
        <#else>
            <link type="text/css" rel="stylesheet" href="/themes/default/easyui.css"/>
        </#if>

        <@m.csp_nonce; csp_nonce_attr>
        <link type="text/css" rel="stylesheet" href="/themes/icon.css"/>
        <script type="text/javascript" src="/js/jquery-3.5.1.min.js"${csp_nonce_attr}></script>
        <script type="text/javascript" src="/js/jquery.easyui-1.10.19.min.js"${csp_nonce_attr}></script>
        <script type="text/javascript" src="/js/ui.js"${csp_nonce_attr}></script>
        </@m.csp_nonce>

        <#if head?has_content>${head}</#if>
        <#if protect && csrfToken?? && csrfToken.value??><meta name="csrf-token" http-equiv="${csrfToken.name?html}" content="${csrfToken.value!""?html}" /></#if>
        <#if (model.heapAnalytics)??><@m.heap_analytics appId=model.heapAnalytics.id options=model.heapAnalytics.options /></#if>
    </head>
    <body<#if (model.applicationVersion)??> data-version="${model.applicationVersion?html}"</#if>>
        <div id="header"><#include "*/header.ftl" /></div>
        <div id="main"><#nested title, m.csp_nonce_attr() /></div>
        <div id="footer"><#include "*/footer.ftl" /></div>
    </body>
</html></@compress>
</#macro>