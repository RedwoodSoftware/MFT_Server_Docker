<#ftl strip_whitespace=true>
<#import "/WEB-INF/tags/file.ftl" as fs>
<#-- @ftlvariable name="metrics" type="com.jscape.inet.mft.audit.reporting.metricses.TopUsers" -->

<#assign usernames=metrics.usernames?chunk(50)?first![] />

<div title="${i18n.text("Reports.Metrics.title.topUsers", [usernames?size])}" data-options="collapsed:false">
    <table id="top-users-grid" role="grid" aria-label="top-users" style="height:310px"></table>
    <div id="top-users" style="width:900px;height:350px"></div>
</div>

<script type="text/javascript"${csp_nonce_attr}>
    $(document).ready(function() {
        $("#top-users-grid").propertygrid({
            height: 300,
            sortName: "value",
            sortOrder: "desc",
            columns: [[
                {field: "name", title: "${i18n.text('Reports.Metrics.column.username')?js_string}", sortable: true, width: "60%"},
                {field: "value", title: "${i18n.text('Reports.Metrics.column.sessions')?js_string}", sortable: true, width: "40%"}
            ]],
            data: {
                total: ${usernames?size?c},
                rows: [<#list usernames as username>
                    {name: "${username?js_string}", value: ${metrics.getSessionCount(username)?c}}<#if username_has_next>,</#if>
                </#list>]
            }
        });
        $.plot($("#top-users").on("plothover", function(e, pos, item) {
                   if (item) {
                       var offset = $(this).offset();
                       $(this).tooltip({
                           showEvent: "none",
                           position: "right",
                           deltaX: pos.pageX - (offset.left + $(this)._outerWidth()),
                           deltaY: pos.pageY - (offset.top + $(this)._outerHeight()/2),
                           content: "" + item.series.data[item.dataIndex][0],
                           onHide: function() { $(this).tooltip("destroy"); }
                       }).tooltip("show");
                   } else {
                       $(this).tooltip("destroy");
                   }
               }),
               [[<#list usernames?chunk(5)?first![] as username>["${username?js_string}",${metrics.getSessionCount(username)}]<#if username_has_next>,</#if></#list>]],
               {
                   series: {bars: {show: true, barWidth: .7, align: "center"}},
                   xaxis: {mode: "categories"},
                   yaxis: {min: 0, tickDecimals: 0},
                   grid: {borderWidth: 1, margin: 10, clickable: true, hoverable: true}
               });
    });
</script>