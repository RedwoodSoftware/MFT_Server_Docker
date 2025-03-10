<#ftl strip_whitespace=true>
<#-- @ftlvariable name="" type="com.jscape.inet.mft.subsystems.web.ui.view.account.OtpFormTemplateModel" -->

<#import "/WEB-INF/tags/form.ftl" as form/>
<#import "/WEB-INF/tags/message.ftl" as i18n/>
<#import "/WEB-INF/tags/theme.ftl" as theme/>
<#import "/WEB-INF/template/decorator.ftl" as decorator/>
<#import "/WEB-INF/template/response-result.ftl" as r/>

<#assign page_head>
    <link type="text/css" rel="stylesheet" href="/css/login.css" />
    <link type="text/css" rel="stylesheet" href="/css/ui.css" />
</#assign>

<@decorator.template csrf=csrfToken title=i18n.text("Login.Otp.TITLE")?html theme=themeName!'' branding=urlBranding head_section=page_head; title, csp_nonce_attr>
    <div class="signin">
        <h1>${title}</h1><p id="subheading"><@i18n.message key="Login.Otp.INFO"/></p>

        <div class="card form-panel">
            <@r.response_result result=responseResult/>

            <form id="signinform" action="${theme.url('/challenge/totp', (urlBranding.context)!'')}" method="post" accept-charset="utf-8" novalidate="novalidate" autocomplete="off">
                <fieldset>
                    <#if csrfToken?? && csrfToken.value??><input type="hidden" name="${csrfToken.name?html}" value="${csrfToken.value!''?html}" /></#if>
                    <#if (parameters.continuePath)??><input type="hidden" name="continue" value="${parameters.continuePath?html}" /></#if>
                    <#if otpToken??><input type="hidden" name="t" value="${otpToken?html}" /></#if>
                    <#if showSharedSecret>
                        <#if qrCodeDataUrl??><div style="text-align:center"><img src="${qrCodeDataUrl}" width="${qrCodeWidth?html}" height="${qrCodeHeight?html}"/></div></#if>
                        <#if sharedSecret??><div><@form.dn name="secret" id="otpsecret" class="easyui-textbox" readonly="true" value="${sharedSecret?html}" autocomplete="off"><@i18n.message key="Login.Otp.LABEL_SHARED_SECRET" /></@></div></#if>
                    </#if>
                    <div><@form.dn name="code" id="otpcode" required=true class="easyui-textbox" pattern="[0-9]{6}" maxlength="6" autocomplete="off"><@i18n.message key="Login.Otp.LABEL_VERIFICATION_CODE" /></@></div>

                    <div id="signin-buttons">
                        <button type="submit" class="easyui-linkbutton" title="${i18n.text("Login.Otp.BUTTON_VERIFY")?html}"><@i18n.message key="Login.Otp.BUTTON_VERIFY" /></button>
                    </div>
                </fieldset>
            </form>
        </div>
        <p id="signin-footer"><@i18n.message key="Login.FOOTER" /></p>
    </div>

    <script type="text/javascript"${csp_nonce_attr}>
        $(function () {
            $.extend($.fn.validatebox.defaults.rules, {
                pattern: {
                    validator: function (a, b) {
                        var p = b && b.length ? b[0] : "";
                        var f = b && b.length > 1 ? b[1] : "";
                        try { return new RegExp(p, f).test(a);} catch (e) { return false; }
                    },
                    message: $.fn.validatebox.defaults.missingMessage || ""
                }
            });
            var f = $("#signinform"), c = $("#otpcode"), s = $("#otpsecret"), m = parseInt(c.prop("maxlength")), p = c.prop("pattern");
            c.textbox({
                width: 275,
                height: 32,
                required: true,
                validateOnCreate: false,
                validateOnBlur: true,
                validType: p ? "pattern['" + p + "','g']" : undefined,
                invalidMessage: '${i18n.text("Login.Otp.ERROR_EMPTY_OTP_DATA")?js_string?html}',
                inputEvents: $.extend({}, $.fn.textbox.defaults.inputEvents, {
                    keydown: function(e) {
                        if (e.keyCode == 13) {
                            var t = $(e.data.target);
                            t.textbox("setValue", t.textbox("getText"));
                            f.submit();
                        }
                    },
                    keypress: function (e) {
                        var tb = $(e.data.target).textbox("textbox");
                        return $.inArray(String(e.which), ["0", "13", "8", "46"]) != -1 || isNaN(m) || tb.val().length < m;
                    }
                })
            });
            s.textbox({width: 275, height: 32, readOnly: true});
            f.submit(function(){ return $(this).form("validate"); });

            function jsc_focus(a){a&&a.each(function(_,b){if($(b).is(":not(:hidden)")&&!$(b).val()){b.focus();return false;}});}
            jsc_focus(f.find(":input"));
        });
    </script>
</@decorator.template>