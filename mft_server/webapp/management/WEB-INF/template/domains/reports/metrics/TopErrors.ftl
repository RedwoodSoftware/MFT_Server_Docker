<#ftl strip_whitespace=true>
<#import "/WEB-INF/tags/file.ftl" as fs>
<#-- @ftlvariable name="metrics" type="com.jscape.inet.mft.audit.reporting.metricses.TopErrors" -->

<#assign errors=metrics.errors?chunk(50)?first![] />

<div title="${i18n.text("Reports.Metrics.title.topErrors", [errors?size])}" data-options="collapsed:false">
    <table id="top-errors-grid" role="grid" aria-label="top-errors" style="height:310px"></table>
    <#if errors?size != 0>
        <div id="top-errors" style="width:900px;height:350px"></div>
    </#if>
</div>

<script type="text/javascript"${csp_nonce_attr}>
    $(document).ready(function() {
        $("#top-errors-grid").propertygrid({
            height: 300,
            sortName: "value",
            sortOrder: "desc",
            columns: [[
                {field: "name", title: "${i18n.text('Reports.Metrics.column.error')?js_string}", sortable: true, width: "60%"},
                {field: "value", title: "${i18n.text('Reports.Metrics.column.count')?js_string}", sortable: true, width: "40%"}
            ]],
            data: {
                total: ${errors?size?c},
                rows: [<#list errors as error>
                    {name: "${error?js_string}", value: ${metrics.getErrorCount(error)?c}}<#if error_has_next>,</#if>
                </#list>]
            }
        });
    <#if errors?size != 0>
        $.plot($("#top-errors").on("plothover", function (e, pos, item) {
                   if (item) {
                       var offset = $(this).offset();
                       $(this).tooltip({
                           showEvent: "none",
                           position: "right",
                           deltaX: pos.pageX - (offset.left + $(this)._outerWidth()),
                           deltaY: pos.pageY - (offset.top + $(this)._outerHeight()/2),
                           content: item.series.data[item.dataIndex][0],
                           onHide: function() { $(this).tooltip("destroy"); }
                       }).tooltip("show");
                   } else {
                       $(this).tooltip("destroy");
                   }
               }),
                [[<#list errors?chunk(5)?first![] as error>["${error?js_string}",${metrics.getErrorCount(error)}]<#if error_has_next>,</#if></#list>]],
                {
                    series: {bars: {show: true, barWidth: .7, align: "center"}},
                    xaxis: {mode: "categories"},
                    yaxis: {min: 0, tickDecimals: 0},
                    grid: {borderWidth: 1, margin: 10, clickable: true, hoverable: true}
                });
    </#if>
    });
</script>