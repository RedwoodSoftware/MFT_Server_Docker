<#ftl strip_whitespace=true>
<#import "/WEB-INF/tags/message.ftl" as i18n>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <title><@i18n.message "Application.401.TITLE" /></title>
</head>
<body>
    <h2>${status!''} <@i18n.message "Application.401.TITLE" /></h2>
    <p>${i18n.text("Application.401.MESSAGE", '', false)}</p>
</body>
</html>