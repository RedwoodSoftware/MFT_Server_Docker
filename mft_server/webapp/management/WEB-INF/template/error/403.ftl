<#ftl strip_whitespace=true>
<#import "/WEB-INF/tags/message.ftl" as i18n>
<!DOCTYPE html>
<html>
<head>
    <#include "/WEB-INF/template/meta.ftl"/>
    <title><@i18n.message "Application.Error.403.title" /></title>
</head>
<body>
    <h2><@i18n.message "Application.Error.403.title" /></h2>
    <p><@i18n.message "Application.Error.403.message" /></p>
</body>
</html>