<#ftl strip_whitespace=true>
<#-- @ftlvariable name="" type="com.jscape.inet.mft.subsystems.web.ui.view.dropzone.DropZoneTemplateModel" -->

<#import "/WEB-INF/tags/form.ftl" as form/>
<#import "/WEB-INF/tags/message.ftl" as i18n/>
<#import "/WEB-INF/tags/theme.ftl" as theme/>
<#import "/WEB-INF/template/decorator.ftl" as decorator/>
<#import "/WEB-INF/template/response-result.ftl" as r/>


<#assign page_head>
    <link type="text/css" rel="stylesheet" href="/css/ui.css" media="all"/>
    <@decorator.script sources=["/app.js", "/ui.js", "/operation.js", "/storage/upload.js", "/storage/dropzone.js"] />
</#assign>


<@decorator.template name="dropzone" title=i18n.text("Application.TITLE")?html csrf=csrfToken theme=themeName!'' branding=urlBranding head_section=page_head; title, csp_nonce_attr>
    <div id="dropzone-layout">

        <div data-options="region:'center',border:false" class="wrap">
            <div class="dropzone-wrap">
                <#if title?has_content><h1>${title}</h1></#if>
                <p><@r.response_result result=responseResult/></p>

                <div class="dropzone">
                    <div class="filetoolbar">
                        <@form.button name="upload"><@i18n.message key="Storage.button.upload" /></@>
                        <#if fileTransferTypeControlAllowed>
                            <div id="uploadmodemenu">
                                <div><@form.radio name="uploadmode" value="ASCII"><@i18n.message key="Storage.label.ascii" /></@></div>
                                <div><@form.radio name="uploadmode" value="BINARY" checked=true><@i18n.message key="Storage.label.binary" /></@></div>
                            </div>
                        </#if>
                    </div>

                    <div class="article">
                        <@i18n.message key="Storage.Message.dropzone" />
                    </div>
                </div>

                <div class="upload-progress-container" style="padding: 1em 20%">
                    <ul class="upload-progress-list"></ul>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript"${csp_nonce_attr}>
        $.parser.auto = false;
        window.R = {
            string: $.extend({contains: function (key) { return this.hasOwnProperty(key); }}, {
            APPLICATION_TITLE: '${i18n.text("Application.TITLE")?js_string?html}',
            DIALOG_BUTTON_OK: '${i18n.text("Application.button.ok")?js_string?html}',
            DIALOG_BUTTON_CANCEL: '${i18n.text("Application.button.cancel")?js_string?html}',
            STORAGE_CONFIRM_OVERWRITE_MESSAGE: '${i18n.text("Storage.Message.confirmOverwrite")?js_string?html}',
            STORAGE_BUTTON_CANCEL_UPLOAD: '${i18n.text("Storage.button.cancelUpload")?js_string?html}',
            STORAGE_SUCCESS_UPLOAD: '${i18n.text("Storage.Success.upload.filesUploaded")?js_string?html}',
            STORAGE_ERROR_UPLOAD_FOLDER: '${i18n.text("Storage.Error.upload.folder")?js_string?html}',
            STORAGE_ERROR_UPLOAD: '${i18n.text("Storage.Error.upload.transfer")?js_string?html}'
        })};
        <#include "/WEB-INF/template/i18n-easyui.ftl" />
        (function() {
            window.jscape = window.jscape || {};
            window.jscape.API = $.extend(new jscape.ManagementService({timeout: ${connectionTimeout?c}}), {
                ping: function () {
                    return this._request("GET", "/dropzone/${(dropZoneId!"")?js_string}/ping").send({"${pingTokenName?js_string}":"${pingTokenValue?js_string}"});
                },
                openUploadSession: function () {
                    return this._request("POST", "/dropzone/${(dropZoneId!"")?js_string}/upload").send();
                },
                uploadFile: function (sid, file, mode, metadata, options) {
                    return this._request("POST", "/dropzone/${(dropZoneId!"")?js_string}/upload/{id}").uri({id: sid}).options($.extend({timeout: 0}, options || {})).headers({"x-js-file": file.name, "x-js-mode": mode, "x-js-metadata": JSON.stringify(metadata)}).sendFormMultipart({file: file}, true);
                },
                uploadFilePart: function(sid, file, mode, metadata, offset, options) {
                    offset = parseInt(offset) || 0;
                    var chunk = file.slice(offset);
                    var headers = {"Content-Range": "bytes {begin}-{end}/{size}".supplant({begin: offset, end: offset + chunk.size, size: file.size}), "x-js-file": file.name, "x-js-mode": mode, "x-js-metadata": JSON.stringify(metadata)};
                    try {
                        chunk.name = file.name;
                    } catch (ignored) {
                    }
                    return this._request("PUT", "/dropzone/${(dropZoneId!"")?js_string}/upload/{id}").uri({id: sid}).options($.extend({timeout: 0}, options || {})).headers(headers).sendFormMultipart({file: chunk}, true);
                },
                getUploadProgress: function(sid) {
                    return this._request("GET", "/dropzone/${(dropZoneId!"")?js_string}/upload/{id}").uri({id: sid}).options({global: false}).send()
                            .then(function (data) { return jscape.UploadSessionInfo.fromJSON(data); });
                },
                uploadStatus: function(sids) {
                    return this._request("POST", "/dropzone/${(dropZoneId!"")?js_string}/upload-status").options({global: false}).send(sids)
                            .then(function(data) { return $.map(data, jscape.UploadSessionInfo.fromJSON); });
                },
                cancelUpload: function (sid) {
                    return this._request("POST", "/dropzone/${(dropZoneId!"")?js_string}/upload/{id}/cancel").uri({id: sid}).send();
                },
                listUploadForms: function () {
                    return this._request("GET", "/dropzone/${(dropZoneId!"")?js_string}/upload-forms").send()
                            .then(function (data) { return $.map(data || [], jscape.UploadForm.fromJSON); });
                },
                getUploadForm: function (name) {
                    return this._request("GET", "/dropzone/${(dropZoneId!"")?js_string}/upload-forms/{name}").uri({name: name}).send()
                            .then(function (data) { return jscape.UploadForm.fromJSON(data); });
                },
                logout: function () {
                     return $.Deferred().reject().promise();
                },
                _request: function (method, url, parse) {
                    var req = new jscape.Request(method, url, this.timeout, parse);
                    req.csrf = this.csrf || {};
                    return req.headers(req.csrf);
                }
            });
            var app = new jscape.dropzone.DropZoneApplication(${fileUploadMetadataRequired?string}, ${pingPongTimeout?c});
            app.start();
        })();
    </script>

    <#include "dialogs.ftl" />
</@decorator.template>