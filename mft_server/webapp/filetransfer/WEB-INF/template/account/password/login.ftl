<#ftl strip_whitespace=true>
<#-- @ftlvariable name="" type="com.jscape.inet.mft.subsystems.web.ui.view.account.LoginFormTemplateModel" -->

<#import "/WEB-INF/tags/form.ftl" as form/>
<#import "/WEB-INF/tags/message.ftl" as i18n/>
<#import "/WEB-INF/tags/theme.ftl" as theme/>
<#import "/WEB-INF/template/decorator.ftl" as decorator/>
<#import "/WEB-INF/template/captcha.ftl" as captcha/>
<#import "/WEB-INF/template/response-result.ftl" as r/>

<#assign page_head>
    <link type="text/css" rel="stylesheet" href="/css/login.css" />
    <link type="text/css" rel="stylesheet" href="/css/ui.css" />
</#assign>

<@decorator.template csrf=csrfToken title=i18n.text("Login.TITLE")?html theme=themeName!'' branding=urlBranding head_section=page_head; title, csp_nonce_attr>
    <div class="banner">
        <h1>${title}</h1>
        <p id="subheading"><@i18n.message key="Login.INFO"/></p>
    </div>

    <div class="signin">
        <@r.response_result result=responseResult/>

        <div class="card form-panel">
            <form id="signinform" action="${theme.url('/login', (urlBranding.context)!'')}" method="post" accept-charset="utf-8" novalidate="novalidate" autocomplete="off">
                <#if csrfToken?? && csrfToken.value??><input type="hidden" name="${csrfToken.name?html}" value="${csrfToken.value!''?html}" /></#if>
                <#if (parameters.continuePath)??><input type="hidden" name="continue" value="${(parameters.continuePath!'')?html}" /></#if>
                <#if cookieChallengeName??><input type="hidden" name="${cookieChallengeName}" value="${(parameters.cookieChallenge)!''?html}" /></#if>

                <#include "fields-domain.ftl" />
                <div class="row"><@form.username name="user" required=true class="easyui-textbox" dataOptions="width:260,height:32" autocomplete="off" value=(parameters.username)!""><@i18n.message key="Label.USERNAME" /></@></div>
                <div class="row"><@form.password name="pwd" class="easyui-textbox" dataOptions="width:260,height:32"><@i18n.message key="Label.PASSWORD" /></@></div>

                <#if captchaRequired>
                    <@captcha.image challenge=(parameters.captchaChallenge)!'' inputName="logincaptcha" challengeName="logintoken" />
                </#if>

                <div id="signin-buttons">
                    <button type="submit" class="easyui-linkbutton" title="${i18n.text("Button.LOGIN")?html}"><@i18n.message key="Button.LOGIN" /></button>
                    <#if showLostPasswordLink><a href="${theme.url('/LostPassword', (urlBranding.context)!'')}" id="lostpassword"><@i18n.message key="LostPassword.Link" /></a></#if>
                    <#if showSelfRegistrationLink><a href="${theme.url('/SignUp', (urlBranding.context)!'')}" id="signup-link"><@i18n.message key="SelfRegistration.link" /></a></#if>
                </div>
            </form>
            <div class="spacer"></div>
        </div>
        <p id="signin-footer"><@i18n.message key="Login.FOOTER" /></p>
    </div>

    <script type="text/javascript"${csp_nonce_attr}>
        function jsc_focus(a){a&&a.each(function(_,b){if($(b).is(":not(:hidden)")&&!$(b).val()){b.focus();return false;}});}
        $(function(){var f=$('#signinform');jsc_focus(f.find(":input"));});
    </script>
</@decorator.template>