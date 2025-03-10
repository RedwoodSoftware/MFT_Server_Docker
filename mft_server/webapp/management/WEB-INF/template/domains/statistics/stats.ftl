<div id="domain-usage-fields">
    <div data-options="region:'north',border:false" class="layout-pane-top" style="min-height:80px">
        <div id="domain-status-info" style="float:right"></div>
        <div id="domain-statistics-filter">
            <div style="font-weight:bold;clear:right"><@i18n.message key="Statistics.label.period" /></div>
            <span><@i18n.message "Statistics.label.startDate" />&nbsp;<@form.input name="startdate" style="width:150px"/></span>&nbsp;
            <span><@i18n.message "Statistics.label.endDate" />&nbsp;<@form.input name="enddate" style="width:150px"/></span>
        </div>
    </div>

    <div data-options="region:'center',border:false">
        <@form.datagrid name="metrics" height="" columns=["category", "metric", "value"]; col><@i18n.message key="Statistics.column.${col}" /></@>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar toolbar-management inline">
            <@form.button name="export"><@i18n.message key="Statistics.button.export" /></@>
        </div>
    </div>
</div>