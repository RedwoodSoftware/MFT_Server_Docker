<#ftl strip_whitespace=true>
<#import "/WEB-INF/tags/file.ftl" as fs>
<#-- @ftlvariable name="metrics" type="com.jscape.inet.mft.audit.reporting.metricses.TopExternalUploads" -->

<#assign external_filenames=metrics.filenames?chunk(50)?first![] />

<div title="${i18n.text("Reports.Metrics.title.topExternalUploads", [external_filenames?size])}" data-options="collapsed:false">
    <table id="top-external-uploads-grid" role="grid" aria-label="top-external-uploads" class="easyui-propertygrid" style="height:310px"></table>
    <#if external_filenames?size != 0>
        <div id="top-external-uploads" style="width:900px;height:350px"></div>
    </#if>
</div>

<script type="text/javascript"${csp_nonce_attr}>
    $(document).ready(function() {
        $("#top-external-uploads-grid").propertygrid({
            height: 300,
            sortName: "value",
            sortOrder: "desc",
            columns: [[
                {field: "name", title: "${i18n.text('Reports.Metrics.column.file')?js_string}", sortable: true, width: "60%"},
                {field: "value", title: "${i18n.text('Reports.Metrics.column.count')?js_string}", sortable: true, width: "40%"}
            ]],
            data: {
                total: ${external_filenames?size?c},
                rows: [<#list external_filenames as filename>
                    {name: "${filename?js_string}", value: ${metrics.getFileCount(filename)?c}}<#if filename_has_next>,</#if>
                </#list>]
            }
        });

    <#if external_filenames?size != 0>
        $.plot($("#top-external-uploads").on("plothover", function (e, pos, item) {
                   if (item) {
                       var offset = $(this).offset();
                       $(this).tooltip({
                           showEvent: "none",
                           position: "right",
                           deltaX: pos.pageX - (offset.left + $(this)._outerWidth()),
                           deltaY: pos.pageY - (offset.top + $(this)._outerHeight() / 2),
                           content: item.series.fullPath || item.series.data[item.dataIndex][0],
                           onHide: function () { $(this).tooltip("destroy"); }
                       }).tooltip("show");
                   } else {
                       $(this).tooltip("destroy");
                   }
               }),
                [<#list external_filenames?chunk(5)?first![] as filename>{data: [["${((filename?split("(\\\\|/)","r"))?last!filename)?js_string}", ${metrics.getFileCount(filename)?c}]], fullPath: "${filename?js_string}", hoverable: true}<#if filename_has_next>,</#if></#list>],
                {
                    series: {bars: {show: true, barWidth: .7, align: "center"}},
                    xaxis: {mode: "categories"},
                    yaxis: {min: 0, tickDecimals: 0},
                    grid: {borderWidth: 1, margin: 10, clickable: true, hoverable: true}
                });
    </#if>
    });
</script>