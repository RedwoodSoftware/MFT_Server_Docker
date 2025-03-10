<div id="debug-logging-config-fields">

    <div data-options="region:'center',border:false">
        <@form.memo name="properties" dataOptions="disabled:${permissions.logSettingsControlAllowed?string('false','true')}"/>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar inline">
            <div class="toolbar-selection">
                <@form.button name="viewlog" disabled=!permissions.logSettingsControlAllowed><@i18n.message key="ManagerLogs.button.viewServerLog" /></@>
            </div>
            <div class="toolbar-management">
                <@form.button name="edit" disabled=!permissions.logSettingsControlAllowed><@i18n.message key="Application.button.edit" /></@>
                <@form.button name="apply" disabled=!permissions.logSettingsControlAllowed><@i18n.message key="Application.button.apply" /></@>
                <@form.button name="discard" disabled=!permissions.logSettingsControlAllowed><@i18n.message key="Application.button.discard" /></@>
            </div>
        </div>
    </div>
</div>