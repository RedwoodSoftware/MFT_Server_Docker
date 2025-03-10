<#ftl strip_whitespace=true>
<#import "/WEB-INF/tags/file.ftl" as fs>
<#-- @ftlvariable name="metrics" type="com.jscape.inet.mft.audit.reporting.metricses.UserDetail" -->

<div title="${i18n.text("Reports.Metrics.title.userDetail", [metrics.entries?size])}" data-options="collapsed:false">
    <table id="user-detail-grid" role="grid" aria-label="top-user-detail" style="height:310px"></table>
</div>
<script type="text/javascript"${csp_nonce_attr}>
    $(document).ready(function() {
        $("#user-detail-grid").datagrid({
            remoteSort: false,
            singleSelect: false,
            rownumbers: true,
            view: $.fn.datagrid.defaults.scrollview,
            pageSize: 100,
            autoRowHeight: false,
            onLoadSuccess: function() { $(this).datagrid("fixRowHeight"); },
            columns: [[
                {field: "username", title: "${i18n.text('Reports.Metrics.column.username')}", width: "15%", sortable: true},
                {field: "sessions", title: "${i18n.text('Reports.Metrics.column.sessions')}", width: "10%", sortable: true},
                {field: "last_login", title: "${i18n.text('Reports.Metrics.column.lastLogin')}", width: "15%"},
                {field: "files_uploaded", title: "${i18n.text('Reports.Metrics.column.filesUploaded')}", width: "15%", align: "right", sortable: true},
                {field: "files_downloaded", title: "${i18n.text('Reports.Metrics.column.filesDownloaded')}", width: "15%", align: "right", sortable: true},
                {field: "bytes_uploaded", title: "${i18n.text('Reports.Metrics.column.bytesUploaded')}", width: "15%", align: "right"},
                {field: "bytes_downloaded", title: "${i18n.text('Reports.Metrics.column.bytesDownloaded')}", width: "15%", align: "right"}
            ]],
            data: {total: ${metrics.entries?size?c}, rows: [<#list metrics.entries?values as entry>
                <#assign bytes_uploaded><@fs.size value=entry.bytesUploaded /></#assign>
                <#assign bytes_downloaded><@fs.size value=entry.bytesDownloaded /></#assign>
                {
                    username: "${entry.username?js_string}",
                    sessions: ${entry.sessions?c},
                    last_login: "<#if entry.lastLoginDate != 0>${entry.lastLoginDate?number_to_datetime}</#if>",
                    files_uploaded: ${entry.filesUploaded?c},
                    files_downloaded: ${entry.filesDownloaded?c},
                    bytes_uploaded: "${bytes_uploaded?js_string}",
                    bytes_downloaded: "${bytes_downloaded?js_string}"
                }<#if entry_has_next>,</#if>
            </#list>]}
        });
    });
</script>
