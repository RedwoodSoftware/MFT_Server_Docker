<#ftl strip_whitespace=true>
<#-- @ftlvariable name="model" type="com.jscape.inet.mft.subsystems.management.web.rest.administrator.OtpLoginTemplateModel" -->
<#import "/WEB-INF/tags/form.ftl" as form/>
<#import "/WEB-INF/tags/message.ftl" as i18n/>
<#import "/WEB-INF/template/decorator.ftl" as decorator/>
<#import "/WEB-INF/template/macro.ftl" as m/>

<#assign login_page_head>
    <@m.csp_nonce; csp_nonce_attr><script type="text/javascript"${csp_nonce_attr}>if (top.location != self.location) { top.location = self.location.href; }</script></@m.csp_nonce>
</#assign>

<@decorator.template title=i18n.text("Application.title.text") head=login_page_head; title, csp_nonce_attr>
    <div id="viewpane">
        <div class="signin"<#if model.challenge?? && model.challenge.newSharedSecret> style="margin-top:10em"</#if>>
            <div id="signin-box" title="${i18n.text('Login.titleOtp')}">
                <form action="/settings/challenge/totp" method="post" accept-charset="utf-8" novalidate="novalidate" autocomplete="off">
                    <#if model.continueUri??><input type="hidden" name="ref" value="${(model.continueUri!'')?html}"/></#if>
                    <#if model.cookieChallenge?? && model.cookieChallenge.value??><input type="hidden" name="${model.cookieChallenge.name?html}" value="${model.cookieChallenge.value?html}"/></#if>
                    <#if model.csrfToken?? && model.csrfToken.value??><input type="hidden" name="${model.csrfToken.name?html}" value="${model.csrfToken.value!''?html}" /></#if>
                    <#if model.formToken?? && model.formToken.value??><input type="hidden" name="${model.formToken.name?html}" value="${model.formToken.value?html}" /></#if>

                    <#if model.challenge?? && model.challenge.newSharedSecret>
                        <#if model.challenge.qrCode?? && model.challenge.qrCode.dataUrl??>
                            <div style="text-align:center;margin-top:20px"><img src="${model.challenge.qrCode.dataUrl}" width="${model.challenge.qrCode.width?c}" height="${model.challenge.qrCode.height?c}"/></div>
                        </#if>
                    </#if>

                    <fieldset name="userloginfields">
                        <#if model.challenge?? && model.challenge.newSharedSecret>
                            <#if model.challenge.sharedSecret??>
                                <div>
                                    <@form.dn name="secret" id="otpsecret" ariaLabel="${i18n.text('Login.label.otpSharedSecret')?html}" readonly="true" value="${model.challenge.sharedSecret?html}" autocomplete="off"/>
                                </div>
                            </#if>
                        </#if>
                        <div>
                            <@form.dn name="code" id="otpcode" ariaLabel="${i18n.text('Login.label.otpVerificationCode')?html}" required=true maxlength="6" autocomplete="off" />
                            <#if model.errorMessage??><div class="erm">${model.errorMessage?html}</div></#if>
                        </div>
                        <div class="ar" style="">
                            <@form.button name="signin" id="otploginbtn" class="submit-btn"><@i18n.message key="Login.button.otpSubmit"/></@>
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
    <#include "copyright.ftl" />

    <script type="text/javascript"${csp_nonce_attr}>
        window.R = {
            string: $.extend({contains: function (key) { return this.hasOwnProperty(key); }},
            <#include "i18n-js.ftl" />)
        };
        <#include "i18n-easyui.ftl" />
        $(document).ready(function() {
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
            var p = $("#signin-box").panel({border: true});
            var f = p.find("form:first");
            f.submit(function(){ return $(this).form("validate"); });
            var c = $("#otpcode"), m = parseInt(c.prop("maxlength"));
            c.textbox({
                label: "${i18n.text('Login.label.otpVerificationCode')?js_string}",
                labelPosition: "top",
                width: "100%",
                required: true,
                validateOnCreate: false,
                validateOnBlur: true,
                validType: c.prop("pattern") ? "pattern['" + c.prop("pattern") + "','g']" : undefined,
                invalidMessage: '${i18n.text("Login.Error.emptyOtpData")?js_string?html}',
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
            var s = $("#otpsecret");
            s.length && s.textbox({
                label: "${i18n.text('Login.label.otpSharedSecret')?js_string}",
                labelPosition: "top",
                width: "100%",
                readOnly: true
            });
            $("#otploginbtn").linkbutton({onClick:function(){f.submit();}});
            $("#viewpane").css("visibility", "visible");
            c.textbox("textbox").focus();
        });
    </script>
</@decorator.template>