<@form.dialog id="d-users-usertemplate" title=i18n.text("Users.TemplateDialog.title")?html escapeAttrs=false>
    <@form.fields name="usertemplatefileds" title=i18n.text("Users.TemplateDialog.info.short")?html description=i18n.text("Users.TemplateDialog.info.long")?html>
        <div><@form.select name="template" items={}><@i18n.message key="Users.TemplateDialog.label.template" /></@></div>
    </@form.fields>
</@form.dialog>

<@form.dialog id="d-users-add" title=i18n.text("Users.AddDialog.title")?html escapeAttrs=false>
    <fieldset name="userfields" class="content">
        <legend class="hidden-label"><@i18n.message key="Users.AddDialog.title" /></legend>
        <@form.fields_title title=i18n.text("Users.AddDialog.info.short")?html description=i18n.text("Users.AddDialog.info.long")?html />
        <div style="height:500px;overflow:auto">

            <fieldset name="userinfofields" class="large">
                <legend><@i18n.message key="Users.legend.info" /></legend>
                <div><@form.text name="name" maxlength="255" autocomplete="off"><@i18n.message key="Users.label.name" /></@></div>
                <div><@form.username name="username" required=true autocomplete="off"><@i18n.message key="Users.label.login" /></@></div>
                <div><@form.password name="password"><@i18n.message key="Users.label.password" /></@></div>
                <div><@form.password name="confirmpwd"><@i18n.message key="Users.label.confirmPassword" /></@></div>
                <#include "options.ftl" />
            </fieldset>

            <fieldset>
                <legend><@i18n.message key="Users.legend.paths" /></legend>
                <div><@form.path name="rootpath" required=true><@i18n.message key="Users.label.rootPath" /></@></div>
            </fieldset>

            <#include "quotas.ftl" />
        </div>
    </fieldset>
</@form.dialog>

<@form.dialog id="d-users-edit" title=i18n.text("Users.EditDialog.title")?html escapeAttrs=false>
    <fieldset name="userfields" class="content">
        <legend class="hidden-label"><@i18n.message key="Users.EditDialog.title" /></legend>
        <@form.fields_title title=i18n.text("Users.EditDialog.info.short")?html description=i18n.text("Users.EditDialog.info.long")?html/>

        <div role="tablist" style="height:490px">
            <div role="tab" title="${i18n.text('Users.legend.info')?html}">
                <fieldset name="userinfofields" class="large">
                    <legend><@i18n.message key="Users.legend.info" /></legend>
                    <div><@form.text name="name" maxlength="255" autocomplete="off"><@i18n.message key="Users.label.name" /></@>&nbsp;
                        <#if model.permission.userPasswordControlAllowed>
                            <@form.button name="changepwd"><@i18n.message "Users.button.changePassword" /></@>
                        <#else>
                            <@form.button name="changepwd" disabled="disabled"><@i18n.message "Users.button.changePassword" /></@>
                        </#if>
                    </div>

                    <#include "options.ftl" />
                </fieldset>
            </div>
            <div role="tab" title="${i18n.text('Users.legend.paths')?html}"><#include "vfs.ftl" /></div>
            <div role="tab" title="${i18n.text('Users.legend.quotas')?html}"><#include "quotas.ftl" /></div>
            <div role="tab" title="${i18n.text('Users.legend.ipAccess')?html}"><#include "ip-access.ftl" /></div>
            <div role="tab" title="${i18n.text('Users.legend.directoryMonitors')?html}">
                <fieldset name="dirmonitorsfields" role="presentation">
                    <legend><@i18n.message key="Users.legend.directoryMonitors" /></legend>
                    <div><@form.datagrid name="dirmonitors" columns=["directory", "quota"]; col><@i18n.message key="Users.column.${col}" /></@></div>
                </fieldset>
            </div>
        </div>
    </fieldset>
</@form.dialog>

<@form.dialog id="d-user-ipaccess-rule">
    <@form.fields name="ipaccessrulefields" title=i18n.text("Users.IpAccess.RuleDialog.info.short")?html description=i18n.text("Users.IpAccess.RuleDialog.info.long")?html>
        <div><@form.host name="mask" required=true><@i18n.message key="Users.IpAccess.RuleDialog.label.mask" /></@></div>
        <div><@form.text name="reason"><@i18n.message key="Users.IpAccess.RuleDialog.label.reason" /></@></div>
        <div class="radio"><@form.radio name="allowed" value="true" checked="checked"><@i18n.message key="Users.IpAccess.RuleDialog.button.allowed" /></@></div>
        <div class="radio"><@form.radio name="allowed" value="false"><@i18n.message key="Users.IpAccess.RuleDialog.button.denied" /></@></div>
    </@form.fields>
</@form.dialog>

<@form.dialog id="d-adhoc-settings" title=i18n.text("Users.AdHocSettingsDialog.title")>
    <fieldset name="adhocsettingsfields">
        <legend class="hidden-label"><@i18n.message key="Users.AdHocSettingsDialog.title" /></legend>
        <div class="checkbox"><@form.checkbox name="permissions" value="EXTERNAL"><@i18n.message key="Users.AdHocSettingsDialog.label.external" /></@></div>
        <div class="checkbox"><@form.checkbox name="permissions" value="INTERNAL"><@i18n.message key="Users.AdHocSettingsDialog.label.internal" /></@></div>
        <div class="checkbox"><@form.checkbox name="permissions" value="ANONYMOUS"><@i18n.message key="Users.AdHocSettingsDialog.label.anonymous" /></@></div>
    </fieldset>
</@form.dialog>
