<#ftl strip_whitespace=true>
<#-- @ftlvariable name="" type="com.jscape.inet.mft.subsystems.web.ui.view.account.password.ResetPasswordTemplateModel" -->

<#import "/WEB-INF/tags/form.ftl" as form/>
<#import "/WEB-INF/tags/message.ftl" as i18n/>
<#import "/WEB-INF/tags/theme.ftl" as theme/>
<#import "/WEB-INF/template/decorator.ftl" as decorator/>
<#import "/WEB-INF/template/captcha.ftl" as captcha/>
<#import "/WEB-INF/template/response-result.ftl" as r/>

<#assign page_head>
    <link type="text/css" rel="stylesheet" href="/css/login.css"/>
    <link type="text/css" rel="stylesheet" href="/css/ui.css"/>
</#assign>

<@decorator.template csrf=csrfToken title=i18n.text("LostPassword.Reset.TITLE")?html theme=themeName!'' branding=urlBranding head_section=page_head; title, csp_nonce_attr>
<div class="banner">
    <h1>${title}</h1>
    <p id="subheading"><@i18n.message key="LostPassword.Reset.INFO"/></p>
</div>

<div class="reset-password">
    <@r.response_result result=responseResult/>

    <div class="card form-panel">
        <form id="resetlostpassword" action="rp" method="post" accept-charset="utf-8" novalidate="novalidate" autocomplete="off">
            <#if csrfToken?? && csrfToken.value??><input type="hidden" name="${csrfToken.name?html}" value="${csrfToken.value!""?html}"/></#if>
            <#if continueUri??><input type="hidden" name="continue" value="${continueUri?html}"/></#if>
            <input type="hidden" name="c" value="${(challenge!"")?html}"/>

            <div class="row"><@form.dn name="password" required=true><@i18n.message key="Label.PASSWORD" /></@></div>
            <div class="row"><@form.dn name="confirmpwd" required=true><@i18n.message key="Label.PASSWORD_CONFIRM" /></@></div>
            <#if captchaRequired>
                <@captcha.image challenge=(parameters.captchaChallenge)!'' inputName="resetpwdcaptcha" challengeName="resetpwdtoken" />
            </#if>

            <div>
                <button id="reset-btn" name="reset" type="submit" title="${i18n.text("Button.SAVE")?html}">
                    <@i18n.message key="Button.SAVE" />
                </button>
                <@form.button name="cancel" href="${theme.url('/', (urlBranding.context)!'')}">
                    <@i18n.message key="LostPassword.BUTTON_CANCEL" />
                </@>
            </div>
        </form>
        <div class="spacer"></div>
    </div>

    <script type="text/javascript"${csp_nonce_attr}>
        (function($) {
            var f = $("#resetlostpassword").form({
                iframe: false,
                ajax: true,
                onSubmit: function () {
                    if ($(this).form("validate")) {
                        try {
                            b.linkbutton("disable");
                            p.passwordbox2("options", true).validType = "password_compliance";
                            if (p.passwordbox2("isSatisfied", p.passwordbox2("getValue"))) {
                                $(this).form({ajax: false, iframe: false, novalidate: true});
                                return true;
                            }
                        } finally {
                            b.linkbutton("enable");
                            p.passwordbox2("options", true).validType = "";
                        }
                    }
                    return false;
                }
            });
            var id = "newpwd_" + (1E9 * Math.random() >>> 0);
            var c = $("input[name=confirmpwd]", f).passwordbox2({validType: "password_confirm", validParams: ["#" + id], missingMessage: "${i18n.text("LostPassword.Reset.ERROR_CONFIRM_PASSWORD")?js_string?html}", tipPosition: "bottom", width: 260, height: 32});
            var p = $("input[name=password]", f).passwordbox2({required: true, validType: "", validateOnCreate: false, validateOnBlur: false, delay: Number.MAX_VALUE, interval: Number.MAX_VALUE, width: 260, height: 32, tipPosition: "bottom"});
            p.passwordbox2("textbox").on("input", function() { c.passwordbox2({required: p.passwordbox2("textbox").val().length != 0}); }).attr("id", id);
            var b = $("#reset-btn").linkbutton();

            var rules = $.extend($.fn.validatebox.defaults.rules, {
                "password_compliance": {validator: _compliant, message: ""},
                "password_confirm": {validator: _confirmed, message: "${i18n.text("LostPassword.Reset.ERROR_CONFIRM_PASSWORD")?js_string?html}"}
            });

            function _compliant(value) {
                var r = _sendForm("POST", "/rp/test-pwd", {c: "${(challenge!'')?html?js_string}", password: value},
                                  function (data) { data && data.valid === false && (rules["password_compliance"].message = (data.message || "")); });
                return r && !!r.valid;
            }

            function _confirmed(val, params) {
                if (params && params.length) {
                    var t = $(params[0]);
                    if (t.length) {
                        return val == ($.data(t[0], "textbox") ? t.textbox("getValue") : t.val());
                    }
                }
                return false;
            }

            function _sendForm(method, url, data, success, error) {
                return $.ajax(url, {
                    type: method,
                    cache: false,
                    async: false,
                    timeout: ${timeout?c?js_string},
                    data: data,
                    contentType: "application/x-www-form-urlencoded",
                    dataType: "json",
                    statusCode: {401: function () { window.location.replace("/"); }},
                    success: success,
                    error: error,
                    <#if csrfToken?? && csrfToken.value??>
                    beforeSend: function (jqXhr) {
                        jqXhr.setRequestHeader("${csrfToken.name?js_string}", encodeURIComponent('${csrfToken.value?js_string}'));
                    }
                    </#if>
                }).responseJSON;
            }
        })(jQuery);
    </script>
</@decorator.template>