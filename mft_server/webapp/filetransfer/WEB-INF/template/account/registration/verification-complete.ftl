<#ftl strip_whitespace=true>

<#import "/WEB-INF/tags/form.ftl" as form/>
<#import "/WEB-INF/tags/message.ftl" as i18n/>
<#import "/WEB-INF/tags/theme.ftl" as theme/>
<#import "/WEB-INF/template/decorator.ftl" as decorator/>
<#import "/WEB-INF/template/response-result.ftl" as r/>

<#assign page_head>
    <link type="text/css" rel="stylesheet" href="/css/login.css"/>
    <link type="text/css" rel="stylesheet" href="/css/ui.css"/>
</#assign>

<@decorator.template title=i18n.text("SelfRegistration.TITLE")?html csrf=csrfToken theme=themeName!'' branding=urlBranding head_section=page_head; title>
    <div class="signup">
        <h1>${title}</h1><p><@i18n.message key="SelfRegistration.INFO"/></p>
        <@r.response_result result=responseResult/>
    </div>
</@decorator.template>