<#ftl strip_whitespace=true>
<#import "/WEB-INF/template/macro.ftl" as m />

<#macro script sources base_uri=(model.scriptsBaseUri)!''><@m.csp_nonce; csp_nonce_attr>
    <#list sources as entry><script type="text/javascript" src="${url(entry, base_uri)}"${csp_nonce_attr}></script></#list></@m.csp_nonce>
</#macro>

<#function url path base="">
    <#--todo: use ?url_path since 2.3.21-->
    <#if base?has_content>
        <#return (base + path)?html />
    <#else>
        <#return path?html />
    </#if>
</#function>

<#macro template title base="" lang="en" header_section=""><@m.csp_nonce; csp_nonce_attr>
<!DOCTYPE html>
<html lang="${lang?html}">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <title>${title?html}</title>
    <link rel="icon" href="${url("/themes/icon_32.png", base)}" sizes="32x32" />
    <link rel="shortcut icon" href="${url("/themes/favicon.ico", base)}" type="image/x-icon"/>
    <link type="text/css" rel="stylesheet" href="${url("/css/base.css", base)}" media="all"/>
    <#if themeName?has_content>
        <link type="text/css" rel="stylesheet" href="${url("/themes/${themeName}/easyui.css", base)}"/>
    <#else>
        <link type="text/css" rel="stylesheet" href="${url("/themes/default/easyui.css", base)}"/>
    </#if>
    <link type="text/css" rel="stylesheet" href="${url("/themes/icon.css", base)}"/>
    <script type="text/javascript" src="${url("/js/jquery-3.5.1.min.js", base)}"${csp_nonce_attr}></script>
    <script type="text/javascript" src="${url("/js/jquery.easyui-1.10.19.min.js", base)}"${csp_nonce_attr}></script>
    <script type="text/javascript" src="${url("/js/jquery.easyui.findbar.js", base)}"${csp_nonce_attr}></script>
    <script type="text/javascript" src="${url("/js/jquery.easyui.ext.js", base)}"${csp_nonce_attr}></script>
    <script type="text/javascript" src="${url("/js/datagrid-filter.js", base)}"${csp_nonce_attr}></script>
    <script type="text/javascript" src="${url("/js/ui.js", base)}"${csp_nonce_attr}></script>
    <#if csrfToken?? && csrfToken.value??><meta name="csrf-token" http-equiv="${csrfToken.name?html}" content="${csrfToken.value!""?html}" /></#if>
    <#if (model.heapAnalytics)??><@m.heap_analytics appId=model.heapAnalytics.id options=model.heapAnalytics.options /></#if>
    <#if header_section?? && header_section?has_content><@compress single_line=true><#include "${header_section}" /></@compress></#if>
</head>
<body<#if (model.applicationVersion)??> data-version="${model.applicationVersion?html}"</#if>>
<@compress single_line=true>
    <#include "/WEB-INF/template/no-script.ftl"  />
    <#nested csp_nonce_attr/>
    <#include "/WEB-INF/template/footer.ftl" />
</@compress>
</body>
</html>
</@m.csp_nonce>
</#macro>