<div id="domain-reports-fields">

    <div data-options="region:'center',border:false">
        <@form.datagrid name="reports" height="" columns=["name", "date", "description", "search", "status"]; col><@i18n.message key="Reports.column.${col}" /></@>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar inline">
            <div class="toolbar-selection">
                <@form.button name="export"><@i18n.message key="Reports.button.export" /></@>
            </div>
            <div class="toolbar-management">
                <@form.button name="add"><@i18n.message key="Reports.button.add" /></@>
                <@form.button name="edit"><@i18n.message key="Reports.button.edit" /></@>
                <@form.button name="view"><@i18n.message key="Reports.button.view" /></@>
                <@form.button name="run"><@i18n.message key="Reports.button.reRun" /></@>
                <@form.button name="delete"><@i18n.message key="Reports.button.delete" /></@>
            </div>
        </div>
    </div>
</div>