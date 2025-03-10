<#ftl strip_whitespace=true>
<#-- @ftlvariable name="" type="com.jscape.inet.mft.subsystems.web.ui.view.DashboardPageResource" -->

<#assign user_menu=[] />
<#assign user_menu=user_menu + [{"url": "//www.jscape.com/download-anyclient", "text": i18n.text("Storage.label.downloadAnyClient"), "target": "_blank"}] />


<div id="logininfo">
    <#if model.permission.loginInfoAvailable>
        <div><@i18n.message key="Storage.label.loggedInAs" args=["<b>${model.username?html}</b>", "<b>${model.domainName?html}</b>"] escapeXml=false/></div>
        <#if model.lastLoginDate??>
            <div class="desc">
                <@i18n.message key="Storage.label.lastLoginDate" args=['<span id="last-login" data-timestamp="${model.lastLoginDate?long?c}" lang="${.lang?html}">${model.lastLoginDate?datetime}</span>'] escapeXml=false/>
            </div>
        </#if>
    </#if>
    <#list user_menu as item>
        <#if item.target??>
            <a href="${item.url?html}" target="${item.target?html}">${item.text?html}</a>
        <#else>
            <a href="${item.url?html}">${item.text?html}</a>
        </#if>
        <#if item_has_next> &nbsp;|&nbsp;</#if>
    </#list>
</div>
