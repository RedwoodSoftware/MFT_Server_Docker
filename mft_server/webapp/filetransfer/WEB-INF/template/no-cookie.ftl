<#ftl strip_whitespace=true>
<#import "/WEB-INF/tags/message.ftl" as i18n/>

<!DOCTYPE html>
<html lang="${(lang!'en')?html}">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <link rel="icon" href="/themes/icon_32.png" sizes="32x32" />
    <link rel="shortcut icon" href="/themes/favicon.ico" type="image/x-icon"/>
    <link type="text/css" rel="stylesheet" href="/css/base.css" media="all"/>
    <link type="text/css" rel="stylesheet" href="/themes/default/easyui.css"/>
    <link type="text/css" rel="stylesheet" href="/themes/icon.css"/>
</head>
<body<#if applicationVersion??> data-version="${applicationVersion?html}"</#if>>
    <div class="error-message ac">
        <@i18n.message key="Application.message.cookieDisabled" />
    </div>
</body>
</html>