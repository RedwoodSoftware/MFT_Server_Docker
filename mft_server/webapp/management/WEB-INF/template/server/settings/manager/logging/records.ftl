<div id="manager-log-records-fields" class="easyui-layout" data-options="fit:true,doSize:false,border:false">
    <div data-options="region:'center',border:false">
        <@form.datagrid name="records" height="" columns=["date", "appInstanceId", "clientHost", "clientPort", "user", "domain", "action", "description"]; col><@i18n.message key="ManagerLogs.column.${col}" /></@>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar toolbar-management inline">
            <@form.button name="purge"><@i18n.message key="ManagerLogs.button.purge" /></@>
            <@form.button name="export"><@i18n.message key="ManagerLogs.button.export" /></@>
        </div>
    </div>
</div>