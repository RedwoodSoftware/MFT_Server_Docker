<div id="userinfoaddfields">
    <fieldset>
        <legend><@i18n.message "UserInfo.title.user" /></legend>

        <div><@form.text name="username" maxlength="255"><@i18n.message "UserInfo.label.username" /></@></div>
        <div><@form.username name="login" required=true><@i18n.message "UserInfo.label.login" /></@></div>
        <div><@form.dn name="password"><@i18n.message "UserInfo.label.password" /></@></div>
        <div><@form.dn name="confirmpwd"><@i18n.message "UserInfo.label.confirmPassword" /></@></div>
        <div><@form.email name="email"><@i18n.message "UserInfo.label.email" /></@></div>
        <div><@form.text name="company" maxlength="150"><@i18n.message "UserInfo.label.company" /></@></div>
        <div><label><@i18n.message "UserInfo.label.phone" /></label><input type="tel" name="phonecode"/>&nbsp;<input type="tel" name="phonenum"/>&nbsp;<input type="tel" name="phoneext"/></div>
        <div><@form.text name="notes"><@i18n.message "UserInfo.label.notes" /></@></div>
        <div><@form.datagrid name="usergroups" height="auto" title="${i18n.text('UserInfo.label.groups')?html}" columns=["groups"]; col><@i18n.message "UserInfo.label.${col}" /></@></div>
    </fieldset>

    <#include "fieldset-settings-user.ftl" />
    <#include "fieldset-auth.ftl" />
    <#include "fieldset-protocols.ftl" />
    <#include "fieldset-tags.ftl" />
</div>