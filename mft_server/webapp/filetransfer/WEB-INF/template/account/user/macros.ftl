<#ftl strip_whitespace=true>


<#macro user_quota name resettable=false unit="">
    <@form.checkbox name="${name}enabled"><#nested /></@>&nbsp;
    <#if resettable>
        <@form.number name="${name}" maxlength="7"></@>&nbsp;<span><@quota_unit name="${name}unit" /></span>&nbsp;
        <span><@i18n.message "Users.label.quotaResetPeriod" /></span>&nbsp;<@form.number name="${name}resetperiod" maxlength="4"></@>&nbsp;<span><@i18n.message "Users.label.quotaResetPeriodUnit" /></span>
    <#else>
        <@form.number name="${name}" maxlength="4"></@><#if unit??>&nbsp;<span><@quota_unit name="${name}unit" type=unit /></span></#if>
    </#if>
</#macro>

<#macro quota_unit name type="size">
    <#if type=="size">
        <@form.select name="${name}" items={
            '${1?c}': i18n.text("Application.size.bytes")?html,
            '${1024?c}': i18n.text("Application.size.kilobyte")?html,
            '${(1024*1024)?c}': i18n.text("Application.size.megabyte")?html,
            '${(1024*1024*1024)?c}': i18n.text("Application.size.gigabyte")?html} />
    <#elseif type=="bitrate">
        <@form.select name="${name}" items={
            '${1024?c}': i18n.text("Application.bitrate.kilobyte")?html,
            '${(1024*1024)?c}': i18n.text("Application.bitrate.megabyte")?html,
            '${(1024*1024*1024)?c}': i18n.text("Application.bitrate.gigabyte")?html} />
    </#if>
</#macro>
