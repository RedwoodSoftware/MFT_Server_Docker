<div id="banned-files-fields">
    <div data-options="region:'center'" style="padding:16px">

        <div class="content">
            <div data-options="region:'north',border:false" class="layout-pane-top">
                <fieldset class="noborder pane"<#if !permissions.bannedFilesControlAllowed> disabled="disabled"</#if>>
                    <div class="checkbox"><@form.checkbox name="enabled"><@i18n.message key="BannedFiles.label.enabled" /></@form.checkbox></div>
                </fieldset>
            </div>

            <div data-options="region:'center',border:false">
                <@form.datagrid name="bannedfiles" height="" columns=["path", "recursive", "pattern", "scope"]; col><@i18n.message key="BannedFiles.column.${col}" /></@>
            </div>

            <div data-options="region:'south',border:false" class="layout-pane-bottom">
                <div class="viewpane-toolbar toolbar-management inline">
                    <@form.button name="add"><@i18n.message key="BannedFiles.button.add" /></@>
                    <@form.button name="edit"><@i18n.message key="BannedFiles.button.edit" /></@>
                    <@form.button name="delete"><@i18n.message key="BannedFiles.button.delete" /></@>
                </div>
            </div>
        </div>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar toolbar-management inline">
            <@form.button name="apply" disabled=!permissions.bannedFilesControlAllowed><@i18n.message key="Application.button.apply" /></@>
            <@form.button name="discard" disabled=!permissions.bannedFilesControlAllowed><@i18n.message key="Application.button.discard" /></@>
        </div>
    </div>
</div>