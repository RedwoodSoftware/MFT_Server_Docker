<#ftl strip_whitespace=true>
<#import "/WEB-INF/tags/file.ftl" as fs>
<#-- @ftlvariable name="metrics" type="com.jscape.inet.mft.audit.reporting.metricses.TopHosts" -->

<#assign hosts=metrics.hosts?chunk(50)?first![] />

<div title="${i18n.text("Reports.Metrics.title.topHosts", [hosts?size])}" data-options="collapsed:false">
    <table id="top-hosts-grid" role="grid" aria-label="top-hosts" style="height:310px"></table>
    <div id="top-hosts" style="width:900px;height:350px"></div>
</div>

<script type="text/javascript"${csp_nonce_attr}>
    $(document).ready(function() {
        $("#top-hosts-grid").propertygrid({
            height: 300,
            sortName: "value",
            sortOrder: "desc",
            columns: [[
                {field: "name", title: "${i18n.text('Reports.Metrics.column.ip')?js_string}", sortable: true, width: "60%"},
                {field: "value", title: "${i18n.text('Reports.Metrics.column.sessions')?js_string}", sortable: true, width: "40%"}
            ]],
            data: {
                total: ${hosts?size?c},
                rows: [<#list hosts as host>
                    {name: "${host?js_string}", value: ${metrics.getSessionCount(host)?c}}<#if host_has_next>,</#if>
                </#list>]
            }
        });
        $.plot($("#top-hosts").on("plothover", function(e, pos, item) {
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
               [[<#list hosts?chunk(5)?first![] as host>["${host?js_string}",${metrics.getSessionCount(host)}]<#if host_has_next>,</#if></#list>]],
               {
                   series: {bars: {show: true, barWidth: .7, align: "center"}},
                   xaxis: {mode: "categories"},
                   yaxis: {min: 0, tickDecimals: 0},
                   grid: {borderWidth: 1, margin: 10, clickable: true, hoverable: true}
               });
    });
</script>