<#ftl strip_whitespace=true>
<#-- @ftlvariable name="model" type="com.jscape.inet.mft.subsystems.management.web.rest.domain.ReportTemplateModel" -->
<#import "/WEB-INF/tags/html.ftl" as html/>
<#import "/WEB-INF/tags/message.ftl" as i18n/>
<#import "/WEB-INF/tags/file.ftl" as f/>

<@html.template title=model.reportName base=model.baseUrl; csp_nonce_attr>
<style type="text/css">body{margin:1em;}</style>
<!--[if lte IE 8]><script language="javascript" type="text/javascript" src="${html.url("/js/excanvas.min.js", model.baseUrl)}"${csp_nonce_attr}></script><![endif]-->
<script type="text/javascript" src="${html.url("/js/jquery.easyui.scrollview.min.js", model.baseUrl)}"${csp_nonce_attr}></script>
<script type="text/javascript" src="${html.url("/js/jquery.flot.min.js", model.baseUrl)}"${csp_nonce_attr}></script>
<script type="text/javascript" src="${html.url("/js/jquery.flot.selection.min.js", model.baseUrl)}"${csp_nonce_attr}></script>
<script type="text/javascript" src="${html.url("/js/jquery.flot.categories.min.js", model.baseUrl)}"${csp_nonce_attr}></script>
<script type="text/javascript"${csp_nonce_attr}>
    $.parser.auto = false;
    $(document).ready(function () {
        $.parser.onComplete = function () {
            $("#throbber").hide().remove();
            $("#viewpane").css("visibility", "visible");
        };
        setTimeout(function () { $.parser.parse(document); }, 0);
    });
</script>

<div id="throbber" class="panel-loading"><@i18n.message key="Application.message.loading" /></div>

<div id="viewpane" style="visibility: hidden">
    <h1>${model.reportName?html}</h1>
    <div class="easyui-accordion" data-options="multiple:true">
        <#list model.metricses?keys as type>
            <#assign template_path="metrics/" + type + ".ftl" />
            <#assign metrics=model.metricses[type]/>

            <#include template_path />
        </#list>
    </div>
</div>
<style type="text/css">
    .tickLabel {overflow: hidden; text-overflow: ellipsis; }
</style>
<script type="text/javascript"${csp_nonce_attr}>
    function zoomPlot(plot, min, max) {
        $.each(plot.getXAxes(), function (_, axis) {
            $.extend(axis.options, {min: min, max: max});
        });
        plot.setupGrid();
        plot.draw();
        plot.clearSelection();
    }
</script>
</@html.template>