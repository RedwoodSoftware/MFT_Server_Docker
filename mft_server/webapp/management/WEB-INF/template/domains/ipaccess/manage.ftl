<div id="ip-access-fields"<#if !permissions.ipAccessSettingsControlAllowed> data-options="disabled:true" aria-disabled="true"</#if>>
    <div data-options="region:'center'" style="padding:16px">

        <div class="content">
            <div data-options="region:'center',border:false">
                <@form.datagrid name="ipaccess" dataOptions="disabled:${(!permissions.ipAccessSettingsControlAllowed)?string}" height="" columns=["mask", "access", "reason"]; col><@i18n.message key="IpAccess.column.${col}" /></@>
            </div>
            <div data-options="region:'south',border:false" class="layout-pane-bottom">
                <div class="viewpane-toolbar inline">
                    <div class="toolbar-selection">
                        <@form.button name="moveup" disabled=!permissions.ipAccessSettingsControlAllowed><@i18n.message key="IpAccess.button.moveUp" /></@>
                        <@form.button name="movedown" disabled=!permissions.ipAccessSettingsControlAllowed><@i18n.message key="IpAccess.button.moveDown" /></@>
                    </div>
                    <div class="toolbar-management">
                        <@form.button name="add" disabled=!permissions.ipAccessSettingsControlAllowed><@i18n.message key="IpAccess.button.add" /></@>
                        <@form.button name="edit" disabled=!permissions.ipAccessSettingsControlAllowed><@i18n.message key="IpAccess.button.edit" /></@>
                        <@form.button name="delete" disabled=!permissions.ipAccessSettingsControlAllowed><@i18n.message key="IpAccess.button.delete" /></@>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar inline">
            <div class="toolbar-selection">
                <@form.button name="refresh"><@i18n.message key="IpAccess.button.refresh" /></@>
            </div>
            <div class="toolbar-management">
                <@form.button name="apply" disabled=!permissions.ipAccessSettingsControlAllowed><@i18n.message key="Application.button.apply" /></@>
                <@form.button name="discard" disabled=!permissions.ipAccessSettingsControlAllowed><@i18n.message key="Application.button.discard" /></@>
            </div>
        </div>
    </div>
</div>

