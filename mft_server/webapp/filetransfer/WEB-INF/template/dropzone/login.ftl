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
                <#--<p><@r.response_result result=responseResult/></p>-->

                <div class="card form-panel">
                    <form id="dropzonelogin" action="" method="post" accept-charset="utf-8" novalidate="novalidate" autocomplete="off">
                        <#if csrfToken?? && csrfToken.value??><input type="hidden" name="${csrfToken.name?html}" value="${csrfToken.value!""?html}"/></#if>
                        <fieldset>
                            <div><@form.dn name="pwd"><@i18n.message key="Storage.label.dropzonePassword" /></@></div>
                            <div class="buttons-bar">
                                <button type="submit" name="login" title="${i18n.text("Storage.button.dropzoneLogin")?html}">
                                    <@i18n.message key="Storage.button.dropzoneLogin" />
                                </button>
                            </div>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>

<script type="text/javascript"${csp_nonce_attr}>
    function jsc_focus(a){a&&a.each(function(_,b){if($(b).is(":not(:hidden)")&&!$(b).val()){b.focus();return false;}});}

    $(function () {
        var f = $("#dropzonelogin");
        $("input[name=pwd]", f).passwordbox2({
            required: true,
            lastDelay: 0,
            validateOnCreate: ${(responseResult?? && !responseResult.isSuccess())?string},
            validateOnBlur: true,
            <#if responseResult?? && !responseResult.isSuccess()>
            missingMessage: "${i18n.text(responseResult.messageKey)?js_string}",
            invalidMessage: "${i18n.text(responseResult.messageKey)?js_string}",
            </#if>
            width: "100%",
            tipPosition: "top"
        });
        $("button[name=login]", f).linkbutton();
        jsc_focus(f.find(":input"));
    });
</script>
</@decorator.template>