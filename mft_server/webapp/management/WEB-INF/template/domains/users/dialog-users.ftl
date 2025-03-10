<#if permissions.accountsControlAllowed>
    <#include "dialog-usercontrol.ftl">
</#if>
<#include "dialog-userportation.ftl">

<@form.dialog id="d-user-quota" title=i18n.text("Users.QuotaDialog.title") header=i18n.text("Users.QuotaDialog.info.short") description=i18n.text("Users.QuotaDialog.info.long")>
    <fieldset class="noborder pane">
        <dl class="group">
            <dt><@i18n.message key="Users.QuotaDialog.label.downloadQuota" /></dt>
            <dd><span aria-label="dloadquota"></span></dd>
            <dt><@i18n.message key="Users.QuotaDialog.label.uploadQuota" /></dt>
            <dd><span aria-label="uploadquota"></span></dd>
            <dt><@i18n.message key="Users.QuotaDialog.label.transferQuota" /></dt>
            <dd><span aria-label="transferquota"></span></dd>
        </dl>
    </fieldset>
</@form.dialog>

<@form.dialog id="d-users-reportparams" title=i18n.text("Users.ReportParamsDialog.title") header=i18n.text("Users.ReportParamsDialog.info.short") description=i18n.text("Users.ReportParamsDialog.info.long")>
    <fieldset class="noborder pane">
        <div class="checkbox"><@form.checkbox name="detailed"><@i18n.message key="Users.ReportParamsDialog.label.detailed" /></@></div>
    </fieldset>
</@form.dialog>

<@form.dialog id="d-users-email" title=i18n.text("Users.EmailDialog.title")>
    <fieldset class="content" style="padding:1.7em 2em">
        <div><@form.text name="subject" required=true><@i18n.message "Users.EmailDialog.label.subject" /></@></div>
        <div><@form.memo name="message" required=true><@i18n.message "Users.EmailDialog.label.message" /></@></div>
    </fieldset>
</@form.dialog>