<#ftl strip_whitespace=true>
<#import "/WEB-INF/tags/file.ftl" as fs>
<#-- @ftlvariable name="metrics" type="com.jscape.inet.mft.audit.reporting.metricses.TotalUniqueIps" -->

<div title="${i18n.text("Reports.Metrics.title.totalUniqueIP", [metrics.value?c], true)}" data-options="collapsed:false">
    <ul id="total-unique-ips-list" role="list" aria-label="total-unique-ips"></ul>
</div>
<script type="text/javascript"${csp_nonce_attr}>
    $(document).ready(function() {
        $("#total-unique-ips-list").datalist({
            data: [<#list metrics.uniqueIps as entry>
                {text: "${entry?js_string}", value: "${entry?js_string}"}<#if entry_has_next>,</#if>
            </#list>]
        });
    });
</script>