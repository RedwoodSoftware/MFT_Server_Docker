<#ftl strip_whitespace=true>
<#-- @ftlvariable name="" type="com.jscape.inet.mft.subsystems.web.ui.view.FormTemplateModel" -->

<#import "/WEB-INF/tags/message.ftl" as i18n/>
<#import "/WEB-INF/tags/theme.ftl" as theme/>
<#import "/WEB-INF/template/decorator.ftl" as decorator/>
<#import "/WEB-INF/template/response-result.ftl" as r/>

<@decorator.template title=i18n.text("Application.TITLE")?html csrf=csrfToken theme=themeName!''; title>
    <h1 style="font-size:1.5em;text-align:center;margin-top:6em;">
        <#if (responseResult.messageKey)??>
            ${i18n.text(responseResult.messageKey, responseResult.messageArguments, true)}
        </#if>
    </h1>
</@decorator.template>