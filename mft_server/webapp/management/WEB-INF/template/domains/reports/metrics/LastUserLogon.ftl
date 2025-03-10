<#ftl strip_whitespace=true>
<#import "/WEB-INF/tags/file.ftl" as fs>
<#-- @ftlvariable name="metrics" type="com.jscape.inet.mft.audit.reporting.metricses.LastUserLogon" -->

<div title="${i18n.text("Reports.Metrics.title.lastUserLogon")}" data-options="collapsed:false">
    <table id="top-last-user-logon-grid" role="grid" aria-label="top-last-user-logon" style="height:310px"></table>
</div>
<script type="text/javascript"${csp_nonce_attr}>
    $(document).ready(function() {
        $("#top-last-user-logon-grid").propertygrid({
            height: 300,
            sortName: "name",
            columns: [[
                {field: "name", title: "${i18n.text('Reports.Metrics.column.username')?js_string}", sortable: true, width: "60%"},
                {field: "value", title: "${i18n.text('Reports.Metrics.column.lastLogonDate')?js_string}", sortable: true, width: "40%"}
            ]],
            data: {
                total: ${metrics.logons?size?c},
                rows: [<#list metrics.logons?keys as username>
                    {name: "${username?js_string}", value: "${metrics.logons[username]?datetime}"}<#if username_has_next>,</#if>
                </#list>]
            }
        });
    });
</script>