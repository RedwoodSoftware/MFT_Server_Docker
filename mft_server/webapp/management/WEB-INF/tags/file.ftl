<#macro size value=0
             units=["byte(s)", "KiB", "MiB", "GiB", "TiB"]
             factors=[1, 1024, 1024 * 1024, 1024 * 1024 * 1024, 1024 * 1024 * 1024 * 1024]>
    <@_format value=value units=units factors=factors template="0.## " />
</#macro>

<#macro speed value=0
              units=["byte/s", "KiB/s", "MiB/s", "GiB/s", "TiB/s"]
              factors=[1, 1024, 1024 * 1024, 1024 * 1024 * 1024, 1024 * 1024 * 1024 * 1024]>
    <@_format value=value units=units factors=factors template="0.## " />
</#macro>

<#macro time value=0
             units=["ms", "sec", "min", "hrs"]
             factors=[1, 1000, 60 * 1000, 60 * 60 * 1000]><@compress single_line=true>
    <#list factors?sort?reverse as factor>
        <#if (value/factor)?long != 0>
            <@_format value=(value/factor)?long * factor units=units factors=factors template="0 "/>
            <#if factor_has_next> </#if>
        </#if>
        <#local value = value % factor />
    </#list>
</@compress></#macro>

<#macro _format value units factors template><@compress single_line=true>
    <#local factor = factors?first />
    <#local unit = units?first />
    <#list factors?sort?reverse as factor>
        <#if (value >= factor)>
            <#local factor = factor />
            <#local unit = units[factors?seq_index_of(factor)] />
            <#break />
        </#if>
    </#list>
    <#local value = value / factor />
    ${value?string(template)}<#if value != 0>${unit}</#if>
</@compress></#macro>