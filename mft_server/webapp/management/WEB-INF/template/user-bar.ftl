<div id="userbar" role="menubar" class="menu-right">
    <#if username??>
        <div id="userinfo">
            <@i18n.message key="LoginInfo.label.loggedInAs" /> <b>${username?html}</b>
            <#if lastLoginDate??><div class="desc"><@i18n.message key="LoginInfo.label.lastLoginDate" /><span id="last-login" data-timestamp="${lastLoginDate?long?c}" lang="${.lang?html}">${lastLoginDate?datetime}</span></div></#if>
        </div>
    </#if>
    <ul role="menu" class="menu-items">
        <li role="menuitem" aria-labelledby="menu-logout"><a role="button" id="menu-logout" href="/settings/logout"><@i18n.message key="Menu.item.logout"/></a></li>
    </ul>
</div>