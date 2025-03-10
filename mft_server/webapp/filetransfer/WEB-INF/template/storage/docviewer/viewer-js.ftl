<#-- @ftlvariable name="model" type="com.jscape.inet.mft.subsystems.web.ui.view.storage.DocumentViewerTemplateModel" -->
<#import "/WEB-INF/tags/message.ftl" as i18n/>
<#import "/WEB-INF/template/macro.ftl" as m />
<@compress single_line=true>
    this.jscape = this.jscape || {};
    (function (_) {
        _.docviewer = function (target) {
            target.on("onDocumentLoadedError", function (e, message) {
                var fp;
                try {
                    fp = $FlowPaper($(this).attr("id"));
                    fp && fp.dispose();
                } catch (ignored) {
                } finally {
                    $(document).triggerHandler("onDocumentViewerLoadError", {message: message});
                    $(fp).remove();
                }
            });
            <#if !(model.success!true)>
                target.triggerHandler("onDocumentLoadedError", ["${(model.errorMessage!'')?js_string?html}"]);
            <#elseif (model.mimeType!'')?starts_with("image/")>
                target.html("<img src=\"${model.documentUri}\" alt=\"\" />")
                        .css({textAlign: "center", verticalAlign: "middle"})
                        .children("img")
                        .on("error", {target: target}, function (e) { $(e.data.target).triggerHandler("onDocumentLoadedError"); });
            <#elseif (model.mimeType!'')?contains("flash")>
                target.fpembed({src: "${model.swfUri?js_string}", width: "100%", height: "100%"});
            <#else>
                target.FlowPaperViewer({
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
        }
    })(this.jscape);
</@compress>