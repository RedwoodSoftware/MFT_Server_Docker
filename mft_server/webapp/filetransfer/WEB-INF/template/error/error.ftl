<#ftl strip_whitespace=true>
<#import "/WEB-INF/tags/message.ftl" as i18n>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <title><@i18n.message "Application.Error.TITLE" /></title>
</head>
<body>
    <h2><@i18n.message "Application.Error.TITLE" /></h2>
    <#--<p>${i18n.text("Application.Error.MESSAGE", (requestUri!'')?url, false)}</p>-->
    <p>${i18n.text("Application.Error.MESSAGE", '', false)}</p>
</body>
</html>