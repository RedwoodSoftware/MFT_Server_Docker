<#ftl strip_whitespace=true>
<#-- @ftlvariable name="" type="com.jscape.inet.mft.subsystems.web.ui.view.account.password.ResetPasswordTemplateModel" -->

<#import "/WEB-INF/tags/form.ftl" as form/>
<#import "/WEB-INF/tags/message.ftl" as i18n/>
<#import "/WEB-INF/tags/theme.ftl" as theme/>
<#import "/WEB-INF/template/decorator.ftl" as decorator/>
<#import "/WEB-INF/template/response-result.ftl" as r/>

<#assign page_head>
    <link type="text/css" rel="stylesheet" href="/css/login.css"/>
    <link type="text/css" rel="stylesheet" href="/css/ui.css"/>
</#assign>

<@decorator.template protect=false title=i18n.text("LostPassword.Reset.TITLE")?html theme=themeName!'' head_section=page_head; title>
<div class="banner">
    <h1>${title}</h1>
</div>

<div class="reset-password">
    <@r.response_result result=responseResult/>
</div>

</@decorator.template>