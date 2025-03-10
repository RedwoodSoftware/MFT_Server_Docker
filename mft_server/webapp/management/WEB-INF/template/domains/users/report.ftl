<#ftl strip_whitespace=true>
<#-- @ftlvariable name="report" type="com.jscape.inet.mft.subsystems.management.web.rest.PageManagementServer.UserReportModel" -->
<#import "/WEB-INF/tags/html.ftl" as html/>
<#import "/WEB-INF/tags/form.ftl" as form/>
<#import "/WEB-INF/tags/message.ftl" as i18n/>

<#macro format_date date="">
    <#local date_pattern>${i18n.text("Users.ReportDialog.date.pattern")}</#local>
    <#if date?is_date>${date?string(date_pattern)}<#else>${i18n.text("Users.ReportDialog.date.null")}</#if>
</#macro>
<#macro format_quota quota="">
    <#local quota_factor=1024 * 1024/>
    <#local quota_reset_factor=24 * 60 * 60 * 1000/>
    <#if quota?has_content>${i18n.text("Users.ReportDialog.template.quota", [quota.bytes / quota_factor, quota.resetPeriod / quota_reset_factor])}</#if>
</#macro>
<#macro format_login_redirect value="">
    <#if value?has_content && value.class.simpleName == "DirectoryRedirection">
        ${i18n.text("Users.ReportDialog.template.redirection.directory")}
    <#else>
        ${i18n.text("Users.ReportDialog.template.redirection.management")}
    </#if>
</#macro>
<#macro format_administration value="">
    <#if value?has_content>
        <#local manage_non_owned><@format_allowed value.manageNonOwned!false /></#local>
        <#local group_assignment><@format_allowed value.allowGroupAssignment!false /></#local>
        <#local user_password_changing><@format_allowed value.userPasswordChangingAllowed!false /></#local>
        <#local resource_mapping><@format_allowed value.allowResourceMapping!false /></#local>
        <#local multi_factor_auth><@format_allowed value.allowSetPhoneAuth!false /></#local>
        <#local share_quotas><@format_enabled value.shareQuotas!false /></#local>
        <#local restrict_path><#if value.restrictDir??>${i18n.text("Users.ReportDialog.administration.restrictPath", value.restrictDir)}</#if></#local>
        <#local manage_public_contact><@format_allowed value.allowManagePublicContact!false /></#local>
        <#local administration=[
            '${i18n.text("Users.ReportDialog.administration.managedAccounts", [value.maxOwnedCount!0])}',
            '${i18n.text("Users.ReportDialog.administration.manageNonOwned", [manage_non_owned])}',
            '${i18n.text("Users.ReportDialog.administration.groupAssignment", [group_assignment])}',
            '${i18n.text("Users.ReportDialog.administration.passwordChanging", [user_password_changing])}',
            '${i18n.text("Users.ReportDialog.administration.resourceMapping", [resource_mapping])}',
            '${i18n.text("Users.ReportDialog.administration.multiFactorAuthentication", [multi_factor_auth])}',
            '${i18n.text("Users.ReportDialog.administration.shareQuotas", [share_quotas])}',
            restrict_path,
            '${i18n.text("Users.ReportDialog.administration.managePublicContacts", [manage_public_contact])}'
        ] />
        <ul>
        <#list administration as entry>
            <#if entry?has_content><li>${entry?html}<#if entry_has_next>,</#if></li></#if>
        </#list>
        </ul>
    </#if>
</#macro>
<#macro format_enabled value><#if value>${i18n.text("Users.ReportDialog.template.enabled")}<#else>${i18n.text("Users.ReportDialog.template.disabled")}</#if></#macro>
<#macro format_allowed value><#if value>${i18n.text("Users.ReportDialog.template.allowed")}<#else>${i18n.text("Users.ReportDialog.template.disabled")}</#if></#macro>
<#macro format_required value><#if value>${i18n.text("Users.ReportDialog.template.required")}<#else>${i18n.text("Users.ReportDialog.template.disabled")}</#if></#macro>
<#macro format_ignored value><#if value>${i18n.text("Users.ReportDialog.template.ignored")}<#else>${i18n.text("Users.ReportDialog.template.followed")}</#if></#macro>


<@html.template title=i18n.text("Users.ReportDialog.title"); csp_nonce_attr>
<style type="text/css"${csp_nonce_attr}>html, body { font-size: 90% }</style>

<h1 style="text-align: center"><@i18n.message key="Users.ReportDialog.title" /></h1>

<#list report.users as user>
    <h2>${(user.username!user.login)?html}</h2>
<fieldset class="x-large">
    <dl class="group">
        <dt><@i18n.message key="Users.ReportTemplate.label.login" /></dt><dd>${user.login?html}</dd>
        <dt><@i18n.message key="Users.ReportTemplate.label.status" /></dt><dd><#if user.enabled><@i18n.message key="Users.ReportDialog.template.enabled" /><#else><@i18n.message key="Users.ReportDialog.template.disabled" /></#if></dd>
        <dt><@i18n.message key="Users.ReportTemplate.label.expires" /></dt><dd><@format_date user.expirationDate/></dd>
        <dt><@i18n.message key="Users.ReportTemplate.label.email" /></dt><dd>${(user.emailAddress!"")?html}</dd>
        <dt><@i18n.message key="Users.ReportTemplate.label.phone" /></dt><dd><#if user.phone??>${i18n.text("Users.ReportDialog.template.phone", [(user.phone.code!"")?html, (user.phone.number!"")?html, (user.phone.extension!"")?html])}<#else>&nbsp;</#if></dd>
        <dt><@i18n.message key="Users.ReportTemplate.label.company" /></dt><dd><#if user.company??>${(user.company.name!"")?html}</#if></dd>
        <#if report.detailed><dt><@i18n.message key="Users.ReportTemplate.label.notes" /></dt><dd>${(user.notes!"")?html}</dd></#if>
        <dt><@i18n.message key="Users.ReportTemplate.label.group" /></dt><dd><#if user.groups??><#list user.groups as group>${group?html}<#if group_has_next>, </#if></#list></#if></dd>
        <dt><@i18n.message key="Users.ReportTemplate.label.lastLogin" /></dt><dd><@format_date user.lastLoginDate/></dd>

<#if report.detailed>
    <dt><@i18n.message key="Users.ReportTemplate.label.uploadQuota" /></dt><dd><@format_quota user.uploadsQuota/></dd>
    <dt><@i18n.message key="Users.ReportTemplate.label.downloadQuota" /></dt><dd><@format_quota user.downloadsQuota/></dd>
    <dt><@i18n.message key="Users.ReportTemplate.label.transferQuota" /></dt><dd><@format_quota user.transfersQuota/></dd>
    <dt><@i18n.message key="Users.ReportTemplate.label.securedConnection" /></dt><dd><@format_required user.secured/></dd>
    <dt><@i18n.message key="Users.ReportTemplate.label.passwordChanging" /></dt><dd><@format_allowed user.passwordChangingAllowed/></dd>
    <dt><@i18n.message key="Users.ReportTemplate.label.emailFileTransfer" /></dt><dd><@format_allowed user.emailFileTransferAllowed/></dd>
    <dt><@i18n.message key="Users.ReportTemplate.label.multiFactorAuthentication" /></dt><dd><@format_required user.usePhoneAuthentication/></dd>
    <dt><@i18n.message key="Users.ReportTemplate.label.passwordCreationDate" /></dt><dd><@format_date user.passwordDate/></dd>
    <dt><@i18n.message key="Users.ReportTemplate.label.passwordAgingRules" /></dt><dd><@format_ignored user.ignorePasswordAgingRules /></dd>
    <dt><@i18n.message key="Users.ReportTemplate.label.ownedBy" /></dt><dd>${(user.owner!"")?html}</dd>
    <dt><@i18n.message key="Users.ReportTemplate.label.domainAdministration" /></dt><dd><@format_administration user.administration /></dd>
    <dt><@i18n.message key="Users.ReportTemplate.label.passwordReminderSent" /></dt><dd><@format_date report.passwordNotificationDateOf(user) /></dd>
    <dt><@i18n.message key="Users.ReportTemplate.label.webLoginDefaultView" /></dt><dd><@format_login_redirect user.loginRedirection /></dd>
    <dt><@i18n.message key="Users.ReportTemplate.label.boundKeys" /></dt><dd><#if user.bindedKeys??><#list user.bindedKeys as key>${key?html}<#if key_has_next>, </#if></#list></#if></dd>
    <dt><@i18n.message key="Users.ReportTemplate.label.restrictProtocols" /></dt><dd><#if user.allowedProtocols??><#list user.allowedProtocols as protocol>${protocol?html}<#if protocol_has_next>, </#if></#list></#if></dd>
    <dt><@i18n.message key="Users.ReportTemplate.label.virtualPaths" /></dt>
    <dd>
        <table class="easyui-datagrid" data-options="fitcolumns:true">
            <thead>
            <tr>
                <th data-options="field:'path'"><@i18n.message key="Users.ReportTemplate.column.virtualPath" /></th>
                <th data-options="field:'mapping'" width="400"><@i18n.message key="Users.ReportTemplate.column.realPath" /></th>
                <th data-options="field:'permissions'"><@i18n.message key="Users.ReportTemplate.column.permissions" /></th>
            </tr>
            </thead>
            <tbody>
                <#list user.resources as resource>
                    <tr>
                        <td><#if resource.path?has_content>${resource.path?html}<#else>/</#if></td>
                        <td>${(resource.realPath!resource.name)?html}</td>
                        <td>${report.formatAccessPermissions(resource.accessPermissions)?html}</td>
                    </tr>
                </#list>
            </tbody>
        </table>
    </dd>
</#if>
    </dl>
</fieldset>
<br/>
</#list>

</@html.template>