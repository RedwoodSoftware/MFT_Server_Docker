<#ftl strip_whitespace=true>

<#import "/WEB-INF/tags/message.ftl" as i18n/>
<#import "/WEB-INF/template/decorator.ftl" as decorator/>

<#assign page_head>
    <link type="text/css" rel="stylesheet" href="/css/ui.css" media="all"/>
</#assign>

<@decorator.template title=i18n.text("SelfRegistration.TERMS_TITLE")?html theme=themeName!'' branding=urlBranding head_section=page_head protect=false; title>
    <div style="margin:auto 3em;">
        <h1>${title}</h1><p><@i18n.message key="SelfRegistration.TERMS_TEXT"/></p>
    </div>
</@decorator.template>