<#ftl strip_whitespace=true>
<#import "/WEB-INF/tags/file.ftl" as fs>
<#-- @ftlvariable name="metrics" type="com.jscape.inet.mft.audit.reporting.metricses.TopUploads" -->

<#assign filenames=metrics.filenames?chunk(50)?first![] />

<div title="${i18n.text("Reports.Metrics.title.topUploads", [filenames?size])}" data-options="collapsed:false">
    <table role="grid" id="top-uploads-grid" aria-label="top-uploads"></table><br/>
    <#if filenames?size != 0>
        <div id="top-uploads" style="width:900px;height:350px"></div>
    </#if>
</div>

<script type="text/javascript"${csp_nonce_attr}>
    $(document).ready(function() {
        $("#top-uploads-grid").propertygrid({
            height: 300,
            sortName: "value",
            sortOrder: "desc",
            columns: [[
                {field: "name", title: "${i18n.text('Reports.Metrics.column.file')?js_string}", sortable: true, width: "60%"},
                {field: "value", title: "${i18n.text('Reports.Metrics.column.count')?js_string}", sortable: true, width: "40%"}
            ]],
            data: {
                total: ${filenames?size?c},
                rows: [<#list filenames as filename>
                    {name: "${filename?js_string}", value: ${metrics.getFileCount(filename)?c}}<#if filename_has_next>,</#if>
                </#list>]
            }
        });

    <#if filenames?size != 0>
        $.plot($("#top-uploads").on("plothover", function (e, pos, item) {
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
                [<#list filenames?chunk(5)?first![] as filename>{data: [["${((filename?split("(\\\\|/)","r"))?last!filename)?js_string}", ${metrics.getFileCount(filename)?c}]], fullPath: "${filename?js_string}", hoverable: true}<#if filename_has_next>,</#if></#list>],
                {
                    series: {bars: {show: true, barWidth: .7, align: "center"}},
                    xaxis: {mode: "categories"},
                    yaxis: {min: 0, tickDecimals: 0},
                    grid: {borderWidth: 1, margin: 10, clickable: true, hoverable: true}
                });
    </#if>
    });
</script>