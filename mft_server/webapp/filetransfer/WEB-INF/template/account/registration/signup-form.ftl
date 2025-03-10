<#ftl strip_whitespace=true>

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

<@decorator.template title=i18n.text("SelfRegistration.TITLE")?html csrf=csrfToken theme=themeName!'' branding=urlBranding head_section=page_head; title, csp_nonce_attr>
<div class="banner">
    <h1>${title}</h1>
    <p id="subheading"><@i18n.message key="SelfRegistration.INFO"/></p>
</div>

<div class="signup">
    <@r.response_result result=responseResult/>

    <div class="card form-panel">
        <form id="signupform" action="SignUp" method="post" accept-charset="utf-8" novalidate="novalidate" autocomplete="off">
            <#if csrfToken?? && csrfToken.value??><input type="hidden" name="${csrfToken.name?html}" value="${csrfToken.value!""?html}"/></#if>

            <#include "../password/fields-domain.ftl" />
            <div class="row"><@form.username name="username" required=true autocomplete="off" value=(parameters.username)!""><@i18n.message key="Label.NAME" /></@></div>
            <div class="row"><@form.email name="email" required=true autocomplete="off" value=(parameters.emailAddress)!""><@i18n.message key="Label.EMAIL" /></@></div>
            <#if companyNameRequired>
            	<div class="row"><@form.text name="companyName" required=true autocomplete="off" value=(parameters.companyName)!""><@i18n.message key="Label.COMPANY" /></@></div>
            </#if>
            <#if loginRequired>
                <div class="row"><@form.dn name="login" required=true autocomplete="off" value=(parameters.login)!""><@i18n.message key="Label.LOGIN" /></@></div>
            </#if>
            <div class="row"><@form.password name="password" required=true><@i18n.message key="Label.PASSWORD" /></@></div>
            <div class="row"><@form.password name="confirmpwd" required=true><@i18n.message key="Label.PASSWORD_CONFIRM" /></@></div>
            <#if captchaRequired>
                <@captcha.image challenge=(parameters.captchaChallenge)!'' inputName="signupcaptcha" challengeName="signuptoken" />
            </#if>

            <div>
                <@form.checkbox name="agreement" id="agreement" value="true">
                    <@i18n.message key="SelfRegistration.AGREEMENT" />&nbsp;
                    <a href="${theme.url('/SignUp/tac', (urlBranding.context)!'')}" target="_blank"><@i18n.message key="SelfRegistration.AGREEMENT_LINK" /></a>
                </@>
            </div>

            <div id="signup-buttons">
                <button type="submit" title="${i18n.text("SelfRegistration.BUTTON")?html}" disabled="disabled"><@i18n.message key="SelfRegistration.BUTTON" /></button>
            </div>
        </form>
        <div class="spacer"></div>
    </div>
</div>

<script type="text/javascript"${csp_nonce_attr}>
    $(function () {
        var f = $("#signupform").form({
            iframe: false, ajax: true,
            onSubmit: function () {
                if ($(this).form("validate")) {
                    <#if loginRequired>
                    var opts = l.textbox("textbox").validatebox("options");
                    try {
                        opts.validType = "username_compliance";
                        opts.validParams = $(this).serialize();
                        if (l.textbox("isValid")) {
                            $(this).form({ajax: false, novalidate: true});
                            b.linkbutton("disable");
                            return true;
                        }
                    } finally {
                        opts.validType = opts.validParams = "";
                    }
                    <#else>
                    $(this).form({ajax: false, novalidate: true});
                    return true;
                    </#if>
                }
                return false;
            }
        });

        var id = "pwd_" + (1E9 * Math.random() >>> 0);
        var u = $("input[name=username]", f).textbox({required: true, validateOnCreate: false, width: 260, height: 32}),
        <#if loginRequired>l = $("input[name=login]", f).textbox({required: true, validType: "", validateOnCreate: false, validateOnBlur: false, delay: Number.MAX_VALUE, interval: Number.MAX_VALUE, invalidMessage: "${i18n.text("SelfRegistration.ERROR_USERNAME_NON_COMPLIANT")?js_string?html}", width: 260, height: 32}),</#if>
        e = $("input[name=email]", f).textbox({required: true, validType: "email", validateOnCreate: false, invalidMessage: "${i18n.text("SelfRegistration.ERROR_INVALID_EMAIL")?js_string?html}", width: 260, height: 32}),
        <#if companyNameRequired>cn =$("input[name=companyName]", f).textbox({required: true, validateOnCreate: false, width: 260, height: 32}),</#if>
        c = $("input[name=confirmpwd]", f).textbox({validType: "password_confirm", validParams: ["#" + id], tipPosition: "bottom", missingMessage: "${i18n.text("SelfRegistration.ERROR_CONFIRM_PASSWORD")?js_string?html}", width: 260, height: 32}),
        p = $("input[name=password]", f).textbox({required: true, validateOnCreate: false, width: 260, height: 32});
        p.textbox("textbox").on("input", function() { c.textbox({required: p.textbox("textbox").val().length != 0}); }).attr("id", id);
        var b = $("#signup-buttons").find("button").linkbutton({disabled: true});
        $("#agreement").click(function () { b.linkbutton($(this).is(":checked") ? "enable" : "disable"); });

        var rules = $.extend($.fn.validatebox.defaults.rules, {
            <#if loginRequired>"username_compliance": {validator: _compliant, message: ""},</#if>
            "password_confirm": {validator: _confirmed, message: "${i18n.text("SelfRegistration.ERROR_CONFIRM_PASSWORD")?js_string?html}"}
        });

        function _confirmed(val, params) {
            if (params && params.length) {
                var t = $(params[0]);
                if (t.length) {
                    return val == ($.data(t[0], "textbox") ? t.textbox("getValue") : t.val());
                }
            }
            return false;
        }

        <#if loginRequired>
        function _compliant(val, params) {
            var r = _sendForm("POST", "/SignUp/test-usr", params, function (data) {
                data && data.valid === false && (rules["username_compliance"].message = (data.message || ""));
            });
            return r && !!r.valid;
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
                statusCode: {401: function () { window.location.reload(true); }},
                success: success,
                error: error,
                <#if csrfToken?? && csrfToken.value??>
                beforeSend: function (jqXhr) {
                    jqXhr.setRequestHeader("${csrfToken.name?js_string}", encodeURIComponent('${csrfToken.value?js_string}'));
                }
                </#if>
            }).responseJSON;
        }
        </#if>

        function jsc_focus(a){a&&a.each(function(_,b){if($(b).is(":not(:hidden)")&&!$(b).val()){b.focus();return false;}});}
        jsc_focus(f.find(":input"));
    });
</script>
</@decorator.template>