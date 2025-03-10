<div id="dir-monitor-events-list-fields">
    <div data-options="region:'center',border:false">
        <@form.datagrid name="dirmonitorevents" height="" columns=["eventId", "monitorName", "partner", "path", "date", "eventType", "error"]; col><@i18n.message key="DirectoryMonitors.column.${col}" /></@>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <#if permissions.directoryMonitorsControlAllowed>
            <div class="viewpane-toolbar inline">
                <div class="toolbar-selection">
                    <@form.button name="purge"><@i18n.message key="DirectoryMonitors.button.purge" /></@>
                    <@form.button name="raise"><@i18n.message key="DirectoryMonitors.button.raise" /></@>
                </div>
                <div class="toolbar-management">
                    <@form.button name="reraise"><@i18n.message key="DirectoryMonitors.button.reraise" /></@>
                </div>
            </div>
        </#if>
    </div>
</div>

