<#ftl strip_whitespace=true>

<#function url path context="">
    <#if path?matches('([a-zA-Z]+:)?//')><#return path />
    <#else>
        <#if context??>
            <#return "" + context + path/>
        <#else>
            <#return path />
        </#if>
    </#if>
</#function>

<#macro image path context="" attrs...><img src="${url(path, context)}"<@_attributes attrs />/></#macro>
<#macro link path context="" attrs...><a href="${url(path, context)}"<@_attributes attrs/>><#nested /></a></#macro>
<#macro _attributes items><#list items?keys as key> ${key?replace("([a-z])([A-Z])", "$1-$2", "r")?lower_case}="${items[key]?html}"</#list></#macro>