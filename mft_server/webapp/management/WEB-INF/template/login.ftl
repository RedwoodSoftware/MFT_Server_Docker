<#ftl strip_whitespace=true>
<#-- @ftlvariable name="model" type="com.jscape.inet.mft.subsystems.management.web.rest.administrator.LoginTemplateModel" -->
<#import "/WEB-INF/tags/form.ftl" as form/>
<#import "/WEB-INF/tags/message.ftl" as i18n/>
<#import "/WEB-INF/template/decorator.ftl" as decorator/>
<#import "/WEB-INF/template/macro.ftl" as m/>

<#assign login_page_head>
    <@m.csp_nonce; cps_nonce_attr><script type="text/javascript"${cps_nonce_attr}>if (top.location != self.location) { top.location = self.location.href; }</script></@m.csp_nonce>
</#assign>

<@decorator.template title=i18n.text("Application.title.text") head=login_page_head; title, csp_nonce_attr>
    <div id="viewpane">
        <div class="signin">
            <div id="signin-box" title="${i18n.text('Login.title')}">
                <form action="/settings/login" method="post" accept-charset="utf-8" novalidate="novalidate" autocomplete="off">
                    <#if model.continueUri??><input type="hidden" name="ref" value="${model.continueUri?html}"/></#if>
                    <#if model.cookieChallenge?? && model.cookieChallenge.value??><input type="hidden" name="${model.cookieChallenge.name?html}" value="${model.cookieChallenge.value?html}"/></#if>
                    <#if model.csrfToken?? && model.csrfToken.value??><input type="hidden" name="${model.csrfToken.name?html}" value="${model.csrfToken.value!''?html}" /></#if>
                    <#if model.formTimestamp?? && model.formTimestamp.value??><input type="hidden" name="${model.formTimestamp.name?html}" value="${model.formTimestamp.value?c}"/></#if>
                    <#if model.encryptJsonResponse?? && model.encryptJsonResponse.value??><input type="hidden" name="${model.encryptJsonResponse.name?html}" value="${model.encryptJsonResponse.value?string}"/></#if>
                    <fieldset name="userloginfields">
                        <dl class="group">
                            <dt><label for="username"><@i18n.message key="Login.label.username" /><em>*</em></label></dt>
                            <dd><@form.username id="username" name="login" required=true autofocus="autofocus" autocomplete="off"/></dd>
                            <dt><label for="password"><@i18n.message key="Login.label.password" /></label></dt>
                            <dd><@form.password id="password" name="pwd"/><#if model.errorMessage??><div class="erm">${model.errorMessage?html}</div></#if></dd>
                        </dl>
                        <div class="submit-btn ar">
                            <@form.button name="signin" id="loginbtn"><@i18n.message key="Login.button.submit"/></@>
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
            var b = $("#signin-box").panel({border: true});
            var f = b.find("form:first").on("submit",function(){return $(this).form("validate");});
            var u = b.find("input[name=login]").textbox({required:true,missingMessage:'${i18n.text("Login.Error.emptyUsername")}',invalidMessage:'${i18n.text("Login.Error.emptyUsername")}',width:"100%"});
            u.textbox("textbox").keydown(function(e){if(e.keyCode==13){f.submit();}});
            var p = b.find("input[name=pwd]").textbox({type:"password",width:"100%"});
            p.textbox("textbox").keydown(function(e){if(e.keyCode==13){f.submit();}});
            var s = $("#loginbtn").linkbutton({onClick:function(){f.submit();}});
            $("#viewpane").css("visibility", "visible");
            u.textbox("textbox").focus();
        });
    </script>
</@decorator.template>