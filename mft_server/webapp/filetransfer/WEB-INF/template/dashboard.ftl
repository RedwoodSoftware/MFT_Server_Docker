<#ftl strip_whitespace=true>
<#-- @ftlvariable name="" type="com.jscape.inet.mft.subsystems.web.ui.view.DashboardPageResource" -->

<#import "/WEB-INF/tags/form.ftl" as form/>
<#import "/WEB-INF/tags/message.ftl" as i18n/>
<#import "/WEB-INF/template/decorator.ftl" as decorator/>
<#import "/WEB-INF/template/macro.ftl" as m/>


<#assign page_head>
    <link type="text/css" rel="stylesheet" href="/css/ui.css" media="all"/>
    <link type="text/css" rel="stylesheet" href="/css/file.types.css"/>
    <#if model.permission.fileViewingAllowed><link href="/assets/docviewer/css/flowpaper.css" rel="stylesheet" type="text/css"/></#if>
    <@m.csp_nonce ; csp_nonce_attr>
    <script type="text/javascript" src="/js/jquery.easyui.datagrid-dnd.js"${csp_nonce_attr}></script>
    <script type="text/javascript" src="/js/jquery.easyui.bufferview.js"${csp_nonce_attr}></script>
    <script type="text/javascript" src="/js/jquery.easyui.findbar.js"${csp_nonce_attr}></script>
    <script type="text/javascript" src="/js/momentjs/moment-2.29.4.min.js"${csp_nonce_attr}></script>
    <#if ['de','es','fr','ru','zh','ja']?seq_contains(.lang)><script type="text/javascript" src="/js/momentjs/locale/${.lang?url}.js" charset="utf-8"${csp_nonce_attr}></script><script type="text/javascript"${csp_nonce_attr}>window.moment&&moment.locale('${.lang?js_string}');</script></#if>
    </@m.csp_nonce>
</#assign>

<@decorator.template name="user" title=i18n.text("Application.TITLE")?html csrf=model.csrfToken theme=model.themeName!'' branding=model.urlBranding head_section=page_head>
    <div id="modules" role="tablist" style="display:none">

        <div id="user-file-storage" title="${i18n.text("Storage.title")}" role="tab" class="wrapper"<#if model.storageAccess> data-options="selected:true"</#if>>
            <#include "storage/dashboard.ftl" />
            <#include "storage/dialogs.ftl" />
            <#include "storage/shares/dialogs.ftl" />
            <#if model.permission.contactsControlAllowed>
                <#include "storage/shares/dialog-contacts.ftl" />
            </#if>
        </div>

        <div id="user-file-shares" title="${i18n.text("Storage.title.shares")}" role="tab" class="wrapper"<#if model.fileSharesAccess> data-options="selected:true"</#if>>
            <#include "storage/shares/dashboard.ftl" />
        </div>

        <#if model.permission.accountControlAllowed>
            <div id="user-settings" title="${i18n.text("Storage.title.myAccount")}" role="tab"<#if model.manageAccountAccess> data-options="selected:true"</#if>>
                <#include "account/dashboard.ftl" />
                <#--<#if permission.passwordChangingAllowed || permission.userPasswordControlAllowed>-->
                    <#include "account/dialog-password.ftl" />
                <#--</#if>-->
            </div>
        </#if>

        <div id="user-logout" title="${i18n.text("Storage.title.logout")}" role="tab"></div>

    </div>

    <#include "dashboard-js.ftl" />

    <#if model.passwordAboutToExpire>
        <span id="password-reminder" class="easyui-tooltip" style="display:none">
            <div class="tooltip-title"><@i18n.message key="Account.Password.reminderTitle" /></div>
            <div><@i18n.message key="Account.Password.reminderMessage" /></div>
            <div><@form.button name="changepwd"><@i18n.message key="PersonalInfo.button.changePassword" /></@></div>
        </span>
        <#--todo: <#include "account/dialog-password.ftl" /> -->
    </#if>
</@decorator.template>