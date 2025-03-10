<#ftl strip_whitespace=true>
<#import "/WEB-INF/tags/file.ftl" as fs>
<#import "/WEB-INF/tags/form.ftl" as form>
<#-- @ftlvariable name="metrics" type="com.jscape.inet.mft.audit.reporting.metricses.HourlyStatistics" -->

<#assign periods=0..metrics.innerPeriods-1 />

<div title="${i18n.text("Reports.Metrics.title.hourlyStatistics")}" data-options="collapsed:false">
    <table role="grid" aria-label="hourly-statistics" class="easyui-datagrid" style="height:310px">
        <thead>
        <tr>
            <th rowspan="2" data-options="field:'hour',width:50"><@i18n.message key="Reports.Metrics.column.hour" /></th>
            <th colspan="4"><@i18n.message key="Reports.Metrics.column.uploads" /></th>
            <th colspan="4"><@i18n.message key="Reports.Metrics.column.downloads" /></th>
        </tr>
        <tr>
            <th data-options="field:'uploads',width:120"><@i18n.message key="Reports.Metrics.column.totalBytes" /></th>
            <th data-options="field:'average_uploads',width:120"><@i18n.message key="Reports.Metrics.column.averageBytes" /></th>
            <th data-options="field:'average_upload_elapsed',width:150"><@i18n.message key="Reports.Metrics.column.averageElapsedTime" /></th>
            <th data-options="field:'average_upload_throughputs',width:150"><@i18n.message key="Reports.Metrics.column.averageThroughput" /></th>
            <th data-options="field:'downloads',width:120"><@i18n.message key="Reports.Metrics.column.totalBytes" /></th>
            <th data-options="field:'average_downloads',width:120"><@i18n.message key="Reports.Metrics.column.averageBytes" /></th>
            <th data-options="field:'average_download_elapsed',width:150"><@i18n.message key="Reports.Metrics.column.averageElapsedTime" /></th>
            <th data-options="field:'average_download_throughputs',width:150"><@i18n.message key="Reports.Metrics.column.averageThroughput" /></th>
        </tr>
        </thead>
        <tbody>
        <#list periods as i>
        <tr>
            <td>${i + 1}</td>
            <td><@fs.size value=metrics.uploads[i] /></td>
            <td><@fs.size value=metrics.averageUploads[i] /></td>
            <td><@fs.time value=metrics.averageUploadElapsed[i] /></td>
            <td><@fs.speed value=metrics.averageUploadThroughputs[i] /></td>
            <td><@fs.size value=metrics.downloads[i] /></td>
            <td><@fs.size value=metrics.averageDownloads[i] /></td>
            <td><@fs.time value=metrics.averageDownloadElapsed[i] /></td>
            <td><@fs.speed value=metrics.averageDownloadThroughputs[i] /></td>
        </tr>
        </#list>
        </tbody>
    </table>

    <div id="hourly-statistics" style="margin:2em">
        <div role="toolbar" style="text-align:right;margin:.6em 1em;">
            <@form.button name="uploads"><@i18n.message key="Reports.Metrics.legend.uploads" /></@>
            <@form.button name="downloads"><@i18n.message key="Reports.Metrics.legend.downloads" /></@>
        </div>
        <div role="presentation" style="height:350px"></div>
        <div role="menu"><div data-options="name:'zoom-out'"><@i18n.message key="Reports.Metrics.button.zoomOut" /></div></div>
    </div>
</div>
<script type="text/javascript"${csp_nonce_attr}>
    $(document).ready(function() {
        var dataset = {
            uploads: {
                total: {
                    label: "${i18n.text("Reports.Metrics.legend.uploads")}",
                    data: [<#list periods as i>[${i + 1},${metrics.uploads[i]?c}]<#if i_has_next>,</#if></#list>],
                    bars: {show: true, align: "left", barWidth: 0.5},
                    color: 1
                },
                average: {
                    label: "${i18n.text("Reports.Metrics.legend.averageUploads")}",
                    data: [<#list periods as i>[${i + 1},${metrics.averageUploads[i]?c}]<#if i_has_next>,</#if></#list>],
                    lines: {show: true},
                    color: 2
                }
            },
            downloads: {
                total: {
                    label: "${i18n.text("Reports.Metrics.legend.downloads")}",
                    data: [<#list periods as i>[${i+1}, ${metrics.downloads[i]?c}]<#if i_has_next>,</#if></#list>],
                    bars: {show: true, align: "right", barWidth: 0.5},
                    color: 3
                },
                average: {
                    label: "${i18n.text("Reports.Metrics.legend.averageDownloads")}",
                    data: [<#list periods as i>[${i + 1},${metrics.averageDownloads[i]?c}]<#if i_has_next>,</#if></#list>],
                    lines: {show: true},
                    color: 4
                }
            }
        };
        var options = {
            series: {stack: 0, lines: {show: false, steps: false}},
            xaxis: {min: 1, max: ${metrics.innerPeriods}, ticks: ${metrics.innerPeriods}, tickDecimals: 0},
            yaxis: {min: 0, minTickSize: 1024, position: "left", tickDecimals: 1, tickFormatter: function (value) { return jscape.SizeFormat.format(value); }},
            grid: {borderWidth: 1},
            selection: {mode: "x"}
        };
        var container = $("#hourly-statistics");
        var placeholder = container.find("div[role=presentation]");
        var buttons = container.find("div[role=toolbar] a[role=button]").linkbutton({toggle: true, onClick: hourlyStatisticsPlot});
        var menu = container.find("div[role=menu]");
        placeholder.bind("plotselected", onZoomIn)
                .bind("dblclick", onZoomOut)
                .bind("contextmenu ", function (e) { e.preventDefault(); menu.menu("show", {top: e.pageY, left: e.pageX}); });
        menu.menu({inline: true, onClick: function(item) { if (item && item.name == "zoom-out") { onZoomOut(); }}});
        var plot;

        function onZoomIn(e, ranges) {
            e && e.preventDefault();
            zoomPlot(plot, ranges.xaxis.from, ranges.xaxis.to);
        }

        function onZoomOut(e) {
            e && e.preventDefault();
            var axis = plot.getXAxes()[0];
            zoomPlot(plot, axis.datamin, axis.datamax);
        }

        function hourlyStatisticsPlot() {
            var data = [];
            buttons.each(function() {
                if ($(this).linkbutton("options").selected) {
                    var name = $(this).attr("name");
                    if (name && dataset[name]) {
                        data.push(dataset[name].total);
                        data.push(dataset[name].average);
                    }
                }
            });
            plot = $.plot(placeholder, data, options);
        }
        buttons.click();
    });
</script>