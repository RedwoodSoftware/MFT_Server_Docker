<div id="dir-monitors-list-fields">
    <div data-options="region:'center',border:false">
        <@form.datagrid name="dirmonitors" height="" columns=["name", "dir", "interval", "quota", "owner", "events", "lastRunDate", "recursive", "tags", "partner"]; col><@i18n.message key="DirectoryMonitors.column.${col}" /></@>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar inline">
            <div class="toolbar-selection">
                <#if permissions.directoryMonitorsTriggersAllowed>
                <@form.button name="reportusage"><@i18n.message key="DirectoryMonitors.button.reportUsage" /></@>
                </#if>
            </div>
            <div class="toolbar-management">
                <@form.button name="add"><@i18n.message key="DirectoryMonitors.button.add" /></@>
                <@form.button name="edit"><@i18n.message key="DirectoryMonitors.button.edit" /></@>
                <@form.button name="run"><@i18n.message key="DirectoryMonitors.button.run" /></@>
                <@form.button name="delete"><@i18n.message key="DirectoryMonitors.button.delete" /></@>
            </div>
        </div>
    </div>
</div>

