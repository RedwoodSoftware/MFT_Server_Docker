<div id="templateinfoaddfields">
    <fieldset>
        <legend><@i18n.message "UserInfo.title.user" /></legend>

        <div><@form.dn name="name"><@i18n.message "UserInfo.label.templateName" /></@></div>
        <div><@form.username name="username"><@i18n.message "UserInfo.label.username" /></@></div>
        <div><@form.email name="email"><@i18n.message "UserInfo.label.email" /></@></div>
        <div><@form.text name="company" maxlength="150"><@i18n.message "UserInfo.label.company" /></@></div>
        <div><label><@i18n.message "UserInfo.label.phone" /></label><input type="tel" name="phonecode" />&nbsp;<input type="tel" name="phonenum" />&nbsp;<input type="tel" name="phoneext" /></div>
        <div><@form.datagrid name="usergroups" title="${i18n.text('UserInfo.label.groups')?html}" height="auto" columns=["groups"]; col><@i18n.message "UserInfo.label.${col}" /></@form.datagrid>
        </div>
    </fieldset>

    <#include "fieldset-settings-template.ftl" />
    <#include "fieldset-auth.ftl" />
    <#include "fieldset-protocols.ftl" />
    <#include "fieldset-tags.ftl" />
</div>