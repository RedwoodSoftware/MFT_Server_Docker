<#ftl strip_text=true strip_whitespace=true>
<#macro stringify data><@compress single_line=true>
    <#if data?is_hash_ex>{<#list data?keys as key>"${key?json_string}":<#if data[key]??><@stringify data[key] /><#else>""</#if><#if key?has_next>,</#if></#list>}
    <#elseif data?is_sequence>[<#list data as item><@stringify item /><#if item?has_next>,</#if></#list>]
    <#elseif data?is_date>"${data?datetime?string.iso?json_string}"
    <#elseif data?is_number>${data?c}
    <#elseif data?is_boolean>${data?string}
    <#elseif data?is_string>"${data?json_string}"
    <#else>"${data?string.computer?json_string}"
    </#if>
</@compress></#macro>