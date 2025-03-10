<#ftl strip_whitespace=true>
<#-- @ftlvariable name="" type="com.jscape.inet.mft.subsystems.web.ui.view.adhoctransfer.ReceiveFileTemplateModel" -->

<#import "/WEB-INF/tags/form.ftl" as form/>
<#import "/WEB-INF/tags/message.ftl" as i18n/>
<#import "/WEB-INF/tags/theme.ftl" as theme/>
<#import "/WEB-INF/template/decorator.ftl" as decorator/>
<#import "/WEB-INF/template/response-result.ftl" as r/>

<#assign page_head>
    <link type="text/css" rel="stylesheet" href="/css/ui.css" />
    <style type="text/css">
        .adhoc {
            width: 490px;
            line-height: 2.5;
            margin: 0 auto;
        }
        .adhoc-box {
            margin-top: 2em ;
            line-height: 2.5;
        }
        .adhoc h1 {
            margin: 0;
            padding: 1em 0 0;
        }
        .adhoc #subheading {
            margin: 0;
            padding: 0;
        }
        .adhoc h1, .adhoc #subheading, .adhoc #messagebar {
            line-height: 1.6;
        }
        .adhoc fieldset {
            margin: 0;
            padding: 0;
            border: none;
        }
        .form-panel {
            padding: 2em 3em;
            background-color: #f8f8f8;
            border: 1px solid #DEDEDE;
        }
        .buttons-bar {
            text-align: right;
            clear: both;
            margin-top: 1em;
        }
        .buttons-bar button {
            float: right;
            font-weight: 500;
            text-transform: uppercase;
            outline: none;
            overflow: hidden;
            min-width: 77px;
            text-align: center;
        }
    </style>
</#assign>

<@decorator.template title=i18n.text("Application.TITLE")?html csrf=csrfToken theme=themeName!'' head_section=page_head; title, csp_nonce_attr>

<div class="adhoc">
    <h1>${title}</h1><p id="subheading"><@i18n.message key="EmailFile.Info.passwordProtected" /></p>
    <@r.response_result result=responseResult/>

    <div class="adhoc-box form-panel">
        <form id="receivetransfer" action="download" method="post" accept-charset="utf-8" novalidate="novalidate" autocomplete="off">
            <#if csrfToken?? && csrfToken.value??><input type="hidden" name="${csrfToken.name?html}"
                                                         value="${csrfToken.value!""?html}"/></#if>
            <#if (parameters.domain)??><input type="hidden" name="domain" value="${(parameters.domain!"")?html}"/></#if>
            <#if (parameters.id)??><input type="hidden" name="id" value="${(parameters.id!"")?html}"/></#if>
            <#if (parameters.format)??><input type="hidden" name="out" value="${(parameters.format!"")?html}"/></#if>

            <fieldset>
                <div><@form.dn name="pwd"><@i18n.message key="EmailFile.label.password" /></@></div>
                <div class="buttons-bar">
                    <button type="submit" name="receive" title="${i18n.text("EmailFile.button.download")?html}">
                        <@i18n.message key="EmailFile.button.download" />
                    </button>
                </div>
            </fieldset>
        </form>
    </div>
</div>
<script type="text/javascript"${csp_nonce_attr}>
    function jsc_focus(a){a&&a.each(function(_,b){if($(b).is(":not(:hidden)")&&!$(b).val()){b.focus();return false;}});}

    $(function () {
        var f = $("#receivetransfer");
        $("input[name=pwd]", f).passwordbox({
            required: true,
            lastDelay: 0,
            validateOnBlur: true,
            width: "100%",
            tipPosition: "bottom"
        });
        $("button[name=receive]", f).linkbutton();
        jsc_focus(f.find(":input"));
    });
</script>
</@decorator.template>