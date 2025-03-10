<div id="userbar">
    <#if username??>
    <div id="userinfo">
        <@i18n.message key="LoginInfo.label.loggedInAs" /> <b>${username?html}</b>
        <#if lastLoginDate??><div class="desc"><@i18n.message key="LoginInfo.label.lastLoginDate" />${lastLoginDate?datetime}</div></#if>
    </div>
    </#if>
    <ul class="menu-items">
        <li><a href="/action/Logout" id="menu-logout"><@i18n.message key="Menu.item.logout"/></a></li>
    </ul>
</div>