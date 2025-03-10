<#-- @ftlvariable name="" type="com.jscape.inet.mft.subsystems.web.ui.view.TemplateModel" -->

<#import "/WEB-INF/tags/theme.ftl" as theme/>
<#import "/WEB-INF/template/macro.ftl" as m />

<#macro script sources base_uri=(scriptsBaseUrl)!''><@m.csp_nonce; csp_nonce_attr>
    <#list sources as entry><script type="text/javascript" src="${base_uri}${entry}"${csp_nonce_attr}></script></#list></@m.csp_nonce>
</#macro>

<#macro logo url title branding={}>
    <@theme.link path="/" context=(branding.context)!"" title=title>
        <#if branding?? && branding.name?has_content>
            <@theme.image path=url context="${branding.name}" id="logo" class="tenant-logo" alt="Home" title=title />
        <#else>
            <@theme.image path=url id="logo" class="tenant-logo" alt="Home" title=title />
        </#if>
    </@>
</#macro>

<#macro template title name="default" theme="" branding={} protect=true csrf={} head_section=""><@compress single_line=false>
<!DOCTYPE html>
<html lang="${.lang?html}">
    <head>
        <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=Edge">
        <title>${title}</title>
        <link rel="icon" href="/themes/icon_32.png" sizes="32x32" />
        <link rel="shortcut icon" href="/themes/favicon.ico" type="image/x-icon"/>
        <link type="text/css" rel="stylesheet" href="/css/base.css" media="all"/>
        <#if (theme!'')?has_content>
            <link type="text/css" rel="stylesheet" href="/themes/${theme}/easyui.css"/>
        <#else>
            <link type="text/css" rel="stylesheet" href="/themes/default/easyui.css"/>
        </#if>
        <link type="text/css" rel="stylesheet" href="/themes/icon.css"/>
        <@m.csp_nonce; csp_nonce_attr>
        <script type="text/javascript" src="/js/jquery-3.5.1.min.js"${csp_nonce_attr}></script>
        <script type="text/javascript" src="/js/jquery.easyui-1.10.19.min.js"${csp_nonce_attr}></script>
        <script type="text/javascript" src="/js/jquery.easyui.ext.js"${csp_nonce_attr}></script>
        <script type="text/javascript" src="/js/jquery.easyui.section508.js"${csp_nonce_attr}></script>
        </@m.csp_nonce>

        <#if head_section?has_content>${head_section}</#if>
        <#if protect && csrf?? && csrf.value??><meta name="csrf-token" http-equiv="${csrf.name?html}" content="${csrf.value!""?html}" /></#if>
        <#if heapAnalytics??><@m.heap_analytics appId=heapAnalytics.id options=heapAnalytics.options /></#if>
    </head>
    <body<#if applicationVersion??> data-version="${applicationVersion?html}"</#if>>
        <#if name="user">
            <div class="easyui-layout" data-options="fit:true,border:false">
                <div data-options="region:'north',border:false">
                    <div id="header" class="wrapper">
                        <#include "no-script.ftl" />
                        <h1><@logo url="/img/domain/logo.png" title=title branding=branding!{} /></h1>
                        <a class="skip" href="#content"><@i18n.message key="Application.link.skipToContent"/></a>
                        <#include "login-info.ftl" />
                    </div>
                </div>
                <div id="content" data-options="region:'center',border:false">
                    <#nested "", m.csp_nonce_attr()/>
                </div>
                <div data-options="region:'south',border:false,minHeight:1">
                    <#include "*/footer.ftl" />
                </div>
            </div>
        <#elseif name="dropzone">
            <div class="easyui-layout" data-options="fit:true,border:false">
                <div data-options="region:'north',border:false">
                    <div id="header" class="wrapper">
                        <#include "no-script.ftl" />
                        <h1><@logo url="/img/logo.png" title=title branding=branding!{} /></h1>
                        <a class="skip" href="#content"><@i18n.message key="Application.link.skipToContent"/></a>
                    </div>
                </div>
                <div id="content" data-options="region:'center',border:false"><#nested "", m.csp_nonce_attr()/></div>
                <div id="footer"><#include "*/footer.ftl" /></div>
            </div>
        <#elseif name="default">
            <div class="wrapper">
                <div id="header">
                    <#include "no-script.ftl" />
                    <h1><@logo url="/img/logo.png" title=title branding=branding!{} /></h1>
                    <a class="skip" href="#content"><@i18n.message key="Application.link.skipToContent"/></a>
                </div>
                <div id="content"><#nested title, m.csp_nonce_attr() /></div>
                <div id="footer"><#include "*/footer.ftl" /></div>
            </div>
        <#else>
            <#nested "", m.csp_nonce_attr() />
        </#if>
    </body>
</html></@compress>
</#macro>