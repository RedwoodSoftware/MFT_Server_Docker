<#ftl strip_whitespace=true>
<#-- @ftlvariable name="" type="com.jscape.inet.mft.subsystems.web.ui.view.account.password.LostPasswordTemplateModel" -->

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

<@decorator.template csrf=csrfToken title=i18n.text("LostPassword.TITLE")?html theme=themeName!'' branding=urlBranding  head_section=page_head; title>
    <div class="banner">
        <h1>${title}</h1>
        <p id="subheading"><@i18n.message key="LostPassword.INFO"/></p>
    </div>

    <div class="reset-password">
        <@r.response_result result=responseResult/>

        <#if showForm!false>
            <div class="card form-panel">
                <form action="LostPassword" method="post" accept-charset="utf-8" novalidate="novalidate" autocomplete="off">
                    <#if csrfToken?? && csrfToken.value??><input type="hidden" name="${csrfToken.name?html}" value="${csrfToken.value!""?html}" /></#if>

                    <#include "fields-domain.ftl" />
                    <div class="row"><@form.username name="username" required=true class="easyui-textbox" dataOptions="width:260,height:32" autocomplete="off"><@i18n.message key="Label.USERNAME" /></@></div>

                    <#if captchaRequired>
                        <@captcha.image challenge=(parameters.captchaChallenge)!'' inputName="lostpwdcaptcha" challengeName="lostpwdtoken" />
                    </#if>

                    <div>
                        <button id="reset-btn" type="submit" class="easyui-linkbutton" title="${i18n.text("LostPassword.BUTTON_RESET")?html}"><@i18n.message key="LostPassword.BUTTON_RESET" /></button>
                        <@form.button name="cancel" href="${theme.url('/', (urlBranding.context)!'')}"><@i18n.message key="LostPassword.BUTTON_CANCEL" /></@>
                    </div>
                </form>
                <div class="spacer"></div>
            </div>
        </#if>
    </div>
</@decorator.template>