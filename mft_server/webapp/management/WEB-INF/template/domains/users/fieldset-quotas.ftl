<#macro user_quota name resettable=false unit="">
    <@form.checkbox name="${name}enabled"><#nested /></@>&nbsp;
    <#if resettable>
        <@form.number name="${name}" maxlength="7"></@>&nbsp;<span><@quota_unit name="${name}unit" /></span>&nbsp;
        <span><@i18n.message "UserQuotas.label.resetPeriod" /></span>&nbsp;<@form.number name="${name}resetperiod" maxlength="4"></@>&nbsp;<span><@i18n.message "UserQuotas.label.resetPeriodUnit" /></span>
    <#else>
        <@form.number name="${name}" maxlength="4"></@><#if unit??>&nbsp;<span><@quota_unit name="${name}unit" type=unit /></span></#if>
    </#if>
</#macro>
<#macro quota_unit name type="size">
    <#if type=="size">
        <@form.select name="${name}" items={
            '${1?c}': i18n.text("Application.size.bytes"),
            '${1024?c}': i18n.text("Application.size.kilobyte"),
            '${(1024*1024)?c}': i18n.text("Application.size.megabyte"),
            '${(1024*1024*1024)?c}': i18n.text("Application.size.gigabyte")} />
    <#elseif type=="bitrate">
        <@form.select name="${name}" items={
            '${1024?c}': i18n.text("Application.bitrate.kilobyte"),
            '${(1024*1024)?c}': i18n.text("Application.bitrate.megabyte"),
            '${(1024*1024*1024)?c}': i18n.text("Application.bitrate.gigabyte")} />
    </#if>
</#macro>

<div id="quotasfields">
    <fieldset class="x-large">
        <div><@user_quota name="maxdload" resettable=true><@i18n.message key="UserQuotas.label.maxDownloads" /></@></div>
        <div><@user_quota name="maxupload" resettable=true><@i18n.message key="UserQuotas.label.maxUploads" /></@></div>
        <div><@user_quota name="maxtransfer" resettable=true><@i18n.message key="UserQuotas.label.maxTransfers" /></@></div>
        <div><@user_quota name="maxtransferrate" unit="bitrate"><@i18n.message "UserQuotas.label.maxTransferRate" /></@></div>
        <div><@user_quota name="maxdloadsession"><@i18n.message "UserQuotas.label.maxDownloadsPerSession" /></@></div>
        <div><@user_quota name="maxuploadsession"><@i18n.message "UserQuotas.label.maxUploadsPerSession" /></@></div>
    </fieldset>
</div>