<#ftl strip_whitespace=true>
<#-- @ftlvariable name="model" type="com.jscape.inet.mft.subsystems.web.ui.view.DashboardTemplateModel" -->
<#import "macros.ftl" as macros />


<fieldset name="quotasfields" class="x-large">
    <legend><@i18n.message key="Users.legend.quotas" /></legend>
    <#if model.permission.quotasControlAllowed>
        <div><@macros.user_quota name="maxdload" resettable=true><@i18n.message key="Users.label.maxDownloads" /></@></div>
        <div><@macros.user_quota name="maxupload" resettable=true><@i18n.message key="Users.label.maxUploads" /></@></div>
        <div><@macros.user_quota name="maxtransfer" resettable=true><@i18n.message key="Users.label.maxTransfers" /></@></div>
        <div><@macros.user_quota name="maxtransferrate" unit="bitrate"><@i18n.message "Users.label.maxTransferRate" /></@></div>
        <div><@macros.user_quota name="maxdloadsession"><@i18n.message "Users.label.maxUploadsPerSession" /></@></div>
        <div><@macros.user_quota name="maxuploadsession"><@i18n.message "Users.label.maxDownloadsPerSession" /></@></div>
    <#else>
        <div><@i18n.message key="Users.Message.sharedQuotas" args=["${model.username!''?html}"]/></div>
    </#if>
</fieldset>