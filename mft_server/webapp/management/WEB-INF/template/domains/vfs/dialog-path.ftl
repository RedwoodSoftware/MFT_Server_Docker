<@form.dialog id="d-vfs-path" header=i18n.text("VirtualFiles.PathDialog.info.short") description=i18n.text("VirtualFiles.PathDialog.info.long")>
    <div class="content">
        <div data-options="region:'center',border:false">
            <fieldset class="large">
                <dl class="group">
                    <dt><@form.label for="vfs-path"><@i18n.message key="VirtualFiles.PathDialog.label.path" /></@></dt>
                    <dd><@form.dn name="path" id="vfs-path" required="true" size="45" /></dd>

                    <dt class="radio"><@form.radio name="type" value="realpath" required=true><@i18n.message key="VirtualFiles.PathDialog.label.realPath" /></@></dt>
                    <dd><input type="text" name="realpath" size="45"/>&nbsp;<@form.button name="browse"><@i18n.message key="VirtualFiles.PathDialog.button.browse" /></@></dd>

                    <dt class="radio"><@form.radio name="type" value="reverseproxy" required=true><@i18n.message key="VirtualFiles.PathDialog.label.networkStorage" /></@></dt>
                    <dd><select name="reverseproxy" tabindex="0"></select></dd>
                </dl>

                <div class="checkbox"><@form.checkbox name="createifnotfound"><@i18n.message key="VirtualFiles.PathDialog.label.createIfNotExists" /></@></div>
                <div class="checkbox"><@form.checkbox name="includeinsearchindex"><@i18n.message key="VirtualFiles.PathDialog.label.indexable" /></@></div>
                <div class="checkbox">
                    <@form.checkbox name="pgpencryptupload"><@i18n.message key="VirtualFiles.PathDialog.label.pgpEncryptUploads" /></@>
                    <@form.button name="pgpsettings" class="toolbar-management"><@i18n.message key="VirtualFiles.PathDialog.button.pgpSettings" /></@>
                </div>
                <div class="checkbox">
                    <@form.checkbox name="enabledlp"><@i18n.message key="VirtualFiles.PathDialog.label.dlpEnabled" /></@>
                    <@form.button name="dlpsettings" class="toolbar-management"><@i18n.message key="VirtualFiles.PathDialog.button.dlpSettings" /></@>
                </div>
                <div class="checkbox"><@form.checkbox name="secured"><@i18n.message key="VirtualFiles.PathDialog.label.secured" /></@></div>
                <div class="checkbox"><@form.checkbox name="denied"><@i18n.message key="VirtualFiles.PathDialog.label.denied" /></@></div>
                <div class="checkbox"><@form.button name="permissions"><@i18n.message key="VirtualFiles.PathDialog.button.permissions" /></@></div>
            </fieldset>
        </div>

        <div data-options="region:'south',border:false">
            <div class="viewpane-toolbar inline">
                <div class=" toolbar-selection"<#-- style="margin:0 1.6em 1em"-->>
                    <@form.button name="addvar"><@i18n.message "UserTemplates.button.addVariable" /></@>
                    <@form.button name="addfunc"><@i18n.message "UserTemplates.button.addFunction" /></@>
                </div>
            </div>
        </div>
    </div>
</@form.dialog>


<@form.dialog id="d-vfs-path-permissions" title=i18n.text("VirtualFiles.PermissionsDialog.title") header=i18n.text("VirtualFiles.PermissionsDialog.info.short") description=i18n.text("VirtualFiles.PermissionsDialog.info.long")>
    <fieldset class="noborder pane">
        <div class="checkbox"><@form.checkbox name="filedownload"><@i18n.message "VirtualFiles.PermissionsDialog.label.fileDownload" /></@></div>
        <div class="checkbox"><@form.checkbox name="fileupload"><@i18n.message "VirtualFiles.PermissionsDialog.label.fileUpload" /></@></div>
        <div class="checkbox"><@form.checkbox name="fileoverwrite"><@i18n.message "VirtualFiles.PermissionsDialog.label.fileOverwrite" /></@></div>
        <div class="checkbox"><@form.checkbox name="fileappend"><@i18n.message "VirtualFiles.PermissionsDialog.label.fileAppend" /></@></div>
        <div class="checkbox"><@form.checkbox name="filedelete"><@i18n.message "VirtualFiles.PermissionsDialog.label.fileDeletion" /></@></div>
        <div class="checkbox"><@form.checkbox name="filerename"><@i18n.message "VirtualFiles.PermissionsDialog.label.fileRenaming" /></@></div>
        <div class="checkbox"><@form.checkbox name="filelisting"><@i18n.message "VirtualFiles.PermissionsDialog.label.fileListing" /></@></div>
        <div class="checkbox"><@form.checkbox name="filesharing"><@i18n.message "VirtualFiles.PermissionsDialog.label.fileSharing" /></@></div>
        <div class="checkbox"><@form.checkbox name="dirlisting"><@i18n.message "VirtualFiles.PermissionsDialog.label.subdirsListing" /></@></div>
        <div class="checkbox"><@form.checkbox name="dircreate"><@i18n.message "VirtualFiles.PermissionsDialog.label.directoryCreation" /></@></div>
        <div class="checkbox"><@form.checkbox name="dirdelete"><@i18n.message "VirtualFiles.PermissionsDialog.label.directoryDeletion" /></@></div>
        <div class="checkbox"><@form.checkbox name="subdirbrowse"><@i18n.message "VirtualFiles.PermissionsDialog.label.subdirsBrowsing" /></@></div>
    </fieldset>
</@form.dialog>