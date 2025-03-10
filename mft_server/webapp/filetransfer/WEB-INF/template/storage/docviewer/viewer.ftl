<#-- @ftlvariable name="model" type="com.jscape.inet.mft.subsystems.web.ui.view.storage.DocumentViewerTemplateModel" -->
<#import "/WEB-INF/tags/message.ftl" as i18n/>
<#import "/WEB-INF/template/macro.ftl" as m />

<!DOCTYPE html>
<html lang="${.lang}">
<head>
    <title><@i18n.message key="Application.TITLE" /></title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <meta name="viewport" content="initial-scale=1,user-scalable=no,maximum-scale=1,width=device-width" />
    <link rel="icon" href="/themes/icon_32.png" sizes="32x32" />
    <link rel="shortcut icon" href="/themes/favicon.ico" type="image/x-icon"/>
    <#if !jquery_is_loaded!false><@m.csp_nonce; csp_nonce_attr><script type="text/javascript" src="/js/jquery-3.5.1.min.js"${csp_nonce_attr}></script></@></#if>
    <link href="/assets/docviewer/css/flowpaper.css" rel="stylesheet" type="text/css"/>
</head>
<@compress single_line=true>
<body>
    <@m.csp_nonce; csp_nonce_attr>
    <script type="text/javascript" src="/assets/docviewer/js/jquery.extensions.min.js"${csp_nonce_attr}></script>
    <!--[if gte IE 10 | !IE ]><!-->
    <script type="text/javascript" src="/assets/docviewer/js/three.min.js"${csp_nonce_attr}></script>
    <!--<![endif]-->
    <script type="text/javascript" src="/assets/docviewer/js/flowpaper.js"${csp_nonce_attr}></script>
    <#--<script type="text/javascript" src="/assets/docviewer/js/flowpaper_handlers.js"></script>-->
    <div id="documentViewer" class="flowpaper_viewer" style="height:100%!important;"></div>

    <script type="text/javascript"${csp_nonce_attr}>
        $(function() {
            var c = $("#documentViewer");
                c.on("onDocumentLoadedError", function(e, message) {
                    $(document).triggerHandler("onDocumentViewerLoadError", {message: message});
                    var fp = $FlowPaper($(this).attr("id"));
                    try { fp && fp.dispose(); } catch (ignored) {} finally { $(fp).remove(); }
                });
            <#if (model.mimeType!'')?starts_with("image/")>
                c.html("<img src=\"${model.documentUri}\" alt=\"\" />")
                        .css({textAlign: "center", verticalAlign: "middle"})
                        .children("img")
                        .on("error", function() { $(document).triggerHandler("loaderror.docviewer"); });
            <#elseif (model.mimeType!'')?contains("flash")>
                c.fpembed({src: "${model.swfUri?js_string}", width: "100%", height: "100%"});
            <#else>
                c.FlowPaperViewer({
                    config: {
                        EnableWebGL: true,
                        PDFFile: "${model.pdfUri}",
                        SWFFile: "${model.swfUri}",
                        <#--UIConfig: "/assets/docviewer/ui.xml",-->
                        jsDirectory: "/assets/docviewer/js/",
                        cssDirectory: "/assets/docviewer/css/",
                        localeDirectory: "/assets/docviewer/locale/",
                        localeChain: "${.lang?js_string}",
                        key: "${model.viewerLicenseKey?js_string}",
                        StartAtPage: 1,
                        ZoomToolsVisible: true,
                        ZoomTransition: "easeout",
                        ZoomTime: 0.3,
                        ZoomInterval: 0.1,
                        MinZoomSize: 0.2,
                        MaxZoomSize: 5,
                        FitPageOnLoad: false,
                        FitWidthOnLoad: true,
                        FullScreenAsMaxWindow: false,
                        ProgressiveLoading: true,
                        SearchMatchAll: false,
                        InitViewMode: "Portrait",
                        ViewModeToolsVisible: true,
                        NavToolsVisible: true,
                        CursorToolsVisible: true,
                        SearchToolsVisible: true,
                        WMode: "window"
                    }
                });
            </#if>
        });
    </script></@m.csp_nonce>
</body>
</@compress>
</html>