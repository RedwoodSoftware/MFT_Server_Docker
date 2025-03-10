<div id="domain-search-results-fields">

    <div data-options="region:'center',border:false">
        <@form.datagrid name="searchresults" height="" columns=["name", "criteriaDate", "criteria", "status"]; col><@i18n.message key="Logging.column.${col}" /></@>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar inline">
            <div class="toolbar-selection">
                <@form.button name="reload"><@i18n.message key="Logging.button.reload" /></@>
            </div>
            <div class="toolbar-management">
                <@form.button name="export"><@i18n.message key="Logging.button.export" /></@>
                <@form.button name="view"><@i18n.message key="Logging.button.view" /></@>
                <@form.button name="start"><@i18n.message key="Logging.button.start" /></@>
                <@form.button name="delete"><@i18n.message key="Logging.button.delete" /></@>
            </div>
        </div>
    </div>
</div>
