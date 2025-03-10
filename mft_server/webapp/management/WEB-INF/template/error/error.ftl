<#ftl strip_whitespace=true>
<#import "/WEB-INF/tags/message.ftl" as i18n>
<!DOCTYPE html>
<html>
<head>
    <#include "/WEB-INF/template/meta.ftl"/>
    <title><@i18n.message "Application.Error.title" /></title>
</head>
<body>
    <h2><@i18n.message "Application.Error.title" /></h2>
    <p><@i18n.message "Application.Error.message" /></p>
</body>
</html>