<#ftl strip_whitespace=true>
<#import "/WEB-INF/tags/file.ftl" as fs>
<#-- @ftlvariable name="metrics" type="com.jscape.inet.mft.audit.reporting.metricses.UploadsDetail" -->

<div title="${i18n.text("Reports.Metrics.title.uploadsDetail", [metrics.entries?size])}" data-options="collapsed:false">
    <table id="uploads-detail-grid" role="grid" aria-label="uploads-detail" style="height:310px"></table>
</div>
<script type="text/javascript"${csp_nonce_attr}>
    $(document).ready(function() {
        $("#uploads-detail-grid").datagrid({
            remoteSort: false,
            singleSelect: false,
            rownumbers: true,
            view: $.fn.datagrid.defaults.scrollview,
            pageSize: 100,
            autoRowHeight: false,
            onLoadSuccess: function() { $(this).datagrid("fixRowHeight"); },
            columns: [[
                {field: "date", title: "${i18n.text('Reports.Metrics.column.date')?js_string}", width: "15%", align: "right", sortable: true, formatter: function(s) { var t = parseInt(s) || 0; return t ? new Date(t).toLocaleString() : ""}},
                {field: "username", title: "${i18n.text('Reports.Metrics.column.username')?js_string}", width: "15%", sortable: true},
                {field: "file", title: "${i18n.text('Reports.Metrics.column.file')?js_string}", width: "34%", sortable: true},
                {field: "uploads", title: "${i18n.text('Reports.Metrics.column.totalBytes')?js_string}", width: "12%", align: "right"},
                {field: "elapsed_time", title: "${i18n.text('Reports.Metrics.column.elapsedTime')?js_string}", width: "12%", align: "right"},
                {field: "throughput", title: "${i18n.text('Reports.Metrics.column.throughput')?js_string}", width: "12%", align: "right"}
            ]],
            data: {total: ${metrics.entries?size?c}, rows: [<#list metrics.entries as entry>
                <#assign bytes><@fs.size value=entry.bytes /></#assign>
                <#assign elapsed_time><@fs.time value=entry.elapsedTimeMillis /></#assign>
                <#assign throughput><@fs.speed value=entry.throughputBytesPerSecond /></#assign>
                {
                    date:${entry.date?c},
                    username:"${entry.username!?js_string}",
                    file:"${entry.path?js_string}",
                    uploads:"${bytes?js_string}",
                    elapsed_time:"${elapsed_time?js_string}",
                    throughput:"${throughput?js_string}"
                }<#if entry_has_next>,</#if>
            </#list>]}
        });
    });
</script>