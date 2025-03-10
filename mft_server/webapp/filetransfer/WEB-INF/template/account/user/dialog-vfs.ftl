<#ftl strip_whitespace=true>
<#-- @ftlvariable name="model" type="com.jscape.inet.mft.subsystems.web.ui.view.DashboardTemplateModel" -->

<@form.dialog id="d-vfs-path">
    <@form.fields name="pathfields" class="large" title=i18n.text("VirtualPath.PathDialog.info.short")?html description=i18n.text("VirtualPath.PathDialog.info.long")?html>
        <dl class="group">
            <dt><@form.label for="vfs-path"><@i18n.message key="VirtualPath.PathDialog.label.path" /></@></dt>
            <dd><@form.dn name="path" id="vfs-path" required=true/></dd>

            <dt class="radio"><@form.radio name="type" value="realpath" required=true><@i18n.message key="VirtualPath.PathDialog.label.realPath" /></@></dt>
            <dd><@form.path name="realpath" value="${model.vfsRestrictPath!''?html}" title=i18n.text("VirtualPath.PathDialog.label.realPath")?html/></dd>

            <dt class="radio"><@form.radio name="type" value="reverseproxy" required=true><@i18n.message key="VirtualPath.PathDialog.label.networkStorage" /></@></dt>
            <dd><select name="reverseproxy" tabindex="0" aria-label="${i18n.text("VirtualPath.PathDialog.label.networkStorage")?html}"></select></dd>
        </dl>

        <div class="row"><@form.checkbox name="createifnotfound"><@i18n.message key="VirtualPath.PathDialog.label.createIfNotExists" /></@></div>
        <div class="row"><@form.checkbox name="includeinsearchindex"><@i18n.message key="VirtualPath.PathDialog.label.indexable" /></@></div>
        <div class="row">
            <@form.checkbox name="pgpencryptupload"><@i18n.message key="VirtualPath.PathDialog.label.pgpEncryptUploads" /></@>
            <@form.button name="pgpsettings" class="toolbar-management"><@i18n.message key="VirtualPath.PathDialog.button.settings" /></@>
        </div>
        <div class="row">
            <@form.checkbox name="enabledlp"><@i18n.message key="VirtualPath.PathDialog.label.dlpEnabled" /></@>
            <@form.button name="dlpsettings" class="toolbar-management"><@i18n.message key="VirtualPath.PathDialog.button.settings" /></@>
        </div>
        <div class="row"><@form.checkbox name="secured"><@i18n.message key="VirtualPath.PathDialog.label.secured" /></@></div>
        <div class="row"><@form.checkbox name="denied"><@i18n.message key="VirtualPath.PathDialog.label.denied" /></@></div>
        <div class="row"><@form.button name="permissions"><@i18n.message key="VirtualPath.PathDialog.button.permissions" /></@></div>
    </@form.fields>

    <div class="viewpane-toolbar toolbar-selection" style="margin:0 1.6em 1em">
        <@form.button name="addvar"><@i18n.message "Application.button.addVariable" /></@>
    </div>
</@form.dialog>


<@form.dialog id="d-vfs-path-permissions" title=i18n.text("VirtualPath.PermissionsDialog.title")?html escapeAttrs=false>
    <@form.fields name="permissionsfields" title=i18n.text("VirtualPath.PermissionsDialog.info.short")?html description=i18n.text("VirtualPath.PermissionsDialog.info.long")?html>
        <div class="row"><@form.checkbox name="filedownload"><@i18n.message "VirtualPath.PermissionsDialog.label.fileDownload" /></@></div>
        <div class="row"><@form.checkbox name="fileupload"><@i18n.message "VirtualPath.PermissionsDialog.label.fileUpload" /></@></div>
        <div class="row"><@form.checkbox name="fileoverwrite"><@i18n.message "VirtualPath.PermissionsDialog.label.fileOverwrite" /></@></div>
        <div class="row"><@form.checkbox name="fileappend"><@i18n.message "VirtualPath.PermissionsDialog.label.fileAppend" /></@></div>
        <div class="row"><@form.checkbox name="filedelete"><@i18n.message "VirtualPath.PermissionsDialog.label.fileDeletion" /></@></div>
        <div class="row"><@form.checkbox name="filerename"><@i18n.message "VirtualPath.PermissionsDialog.label.fileRenaming" /></@></div>
        <div class="row"><@form.checkbox name="filelisting"><@i18n.message "VirtualPath.PermissionsDialog.label.fileListing" /></@></div>
        <div class="row"><@form.checkbox name="filesharing"><@i18n.message "VirtualPath.PermissionsDialog.label.fileSharing" /></@></div>
        <div class="row"><@form.checkbox name="dirlisting"><@i18n.message "VirtualPath.PermissionsDialog.label.subdirsListing" /></@></div>
        <div class="row"><@form.checkbox name="dircreate"><@i18n.message "VirtualPath.PermissionsDialog.label.directoryCreation" /></@></div>
        <div class="row"><@form.checkbox name="dirdelete"><@i18n.message "VirtualPath.PermissionsDialog.label.directoryDeletion" /></@></div>
        <div class="row"><@form.checkbox name="subdirbrowse"><@i18n.message "VirtualPath.PermissionsDialog.label.subdirsBrowsing" /></@></div>
    </@form.fields>
</@form.dialog>

<@form.dialog id="d-vfs-dlpsettings" title=i18n.text("VirtualPath.DlpSettingsDialog.title")?html escapeAttrs=false>
    <fieldset name="dlpsettingsfields">
        <legend class="hidden-label"><@i18n.message key="VirtualPath.DlpSettingsDialog.title" /></legend>
        <dl class="group">
            <dt><@form.radio name="type" value="rules" checked=""><@i18n.message key="VirtualPath.DlpSettingsDialog.label.useRules" /></@></dt>
            <dd><@form.button name="dlprules"><@i18n.message key="VirtualPath.DlpSettingsDialog.button.rules" /></@></dd>

            <dt><@form.radio name="type" value="icap"><@i18n.message key="VirtualPath.DlpSettingsDialog.label.useIcap" /></@></dt>
            <dd><@form.select name="icapaccess" title=i18n.text("VirtualPath.DlpSettingsDialog.label.useIcap")?html items={
                'ALLOW_ALL': i18n.text("VirtualPath.DlpSettingsDialog.access.ALLOW_ALL")?html,
                'DENY_ALL': i18n.text("VirtualPath.DlpSettingsDialog.access.DENY_ALL")?html,
                'DENY_AD_HOC': i18n.text("VirtualPath.DlpSettingsDialog.access.DENY_AD_HOC")?html
            }/></dd>
        </dl>
    </fieldset>
</@form.dialog>

<@form.dialog id="d-vfs-dlprules" title=i18n.text("VirtualPath.DlpRulesDialog.title")?html escapeAttrs=false>
    <fieldset name="dlprulesfields" role="presentation">
    <legend class="hidden-label"><@i18n.message key="VirtualPath.DlpRulesDialog.title" /></legend>
    <@form.fields_title title=i18n.text("VirtualPath.DlpRulesDialog.info.short")?html description=i18n.text("VirtualPath.DlpRulesDialog.info.long")?html/>
        <div><@form.datagrid name="entries" height="220px" columns=["rule", "enabled", "access"]; col><@i18n.message key="VirtualPath.DlpRulesDialog.column.${col}" /></@></div>

        <div class="viewpane-toolbar inline">
            <div class="toolbar-selection">
                <@form.button name="moveup"><@i18n.message key="VirtualPath.DlpRulesDialog.button.moveUp" /></@>&nbsp;
                <@form.button name="movedown"><@i18n.message key="VirtualPath.DlpRulesDialog.button.moveDown" /></@>
            </div>
            <div class="toolbar-management">
                <@form.button name="add"><@i18n.message key="VirtualPath.DlpRulesDialog.button.add" /></@>&nbsp;
                <@form.button name="edit"><@i18n.message key="VirtualPath.DlpRulesDialog.button.edit" /></@>&nbsp;
                <@form.button name="delete"><@i18n.message key="VirtualPath.DlpRulesDialog.button.delete" /></@>
            </div>
        </div>
    </fieldset>
</@form.dialog>

<@form.dialog id="d-vfs-dlp-rule">
    <@form.fields name="dlprulefields" title=i18n.text("VirtualPath.DlpEntryDialog.info.short")?html description=i18n.text("VirtualPath.DlpEntryDialog.info.long")?html>
        <div><@form.select name="rule" items={}><@i18n.message key="VirtualPath.DlpEntryDialog.label.rule" /></@></div>
        <div><@form.select name="access" items={
            "ALLOW_ALL": i18n.text("VirtualPath.DlpEntryDialog.access.ALLOW_ALL")?html,
            "DENY_ALL": i18n.text("VirtualPath.DlpEntryDialog.access.DENY_ALL")?html,
            "DENY_AD_HOC": i18n.text("VirtualPath.DlpEntryDialog.access.DENY_AD_HOC")?html
        }><@i18n.message key="VirtualPath.DlpEntryDialog.label.access" /></@></div>
        <div><@form.checkbox name="enabled"><@i18n.message key="VirtualPath.DlpEntryDialog.label.enabled" /></@></div>
    </@form.fields>
</@form.dialog>

<@form.dialog id="d-vfs-pgpencrypt" title=i18n.text("VirtualPath.PgpSettingsDialog.title")?html escapeAttrs=false>
    <@form.fields name="pgpencryptfields" title=i18n.text("VirtualPath.PgpSettingsDialog.info.short")?html description=i18n.text("VirtualPath.PgpSettingsDialog.info.long")>
        <div class="radio">
            <@form.radio name="type" value="user" checked=""><@i18n.message key="VirtualPath.PgpSettingsDialog.label.userKey" /></@>
        </div>
        <div class="radio">
            <@form.radio name="type" value="system"><@i18n.message key="VirtualPath.PgpSettingsDialog.label.systemKey" /></@>
            <select name="systemkeys" tabindex="0" title="${i18n.text("VirtualPath.PgpSettingsDialog.label.systemKey")?html}"></select>
        </div>
    </@form.fields>
</@form.dialog>