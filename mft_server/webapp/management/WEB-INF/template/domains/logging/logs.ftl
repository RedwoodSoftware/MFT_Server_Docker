<div id="domain-log-records-content">
    <div data-options="region:'north',border:false" class="layout-pane-top" style="min-height:80px">
        <div id="domain-logs-filter" style="padding:1em">
            <@form.number name="maxrecords" maxlength="4"><@i18n.message key="Logging.label.maxRecords" /></@><span style="display:inline-block;margin:0 .7em"><@i18n.message key="Logging.label.maxRecordsUnit" /></span>
            <@form.button name="pauselog" dataToggleText=i18n.text("Logging.button.resume")><@i18n.message key="Logging.button.pause" /></@>
        </div>
    </div>

    <div data-options="region:'center',border:false">
        <@form.datagrid name="records" height="" dataOptions="bufferingMsg:'${i18n.text('Logging.Message.bufferingRecords')?js_string}',noRecordsMsg:'${i18n.text('Logging.Message.noRecords')?js_string}'" columns=["date", "clientHost", "clientPort", "serverHost", "serverPort", "user", "clientRequest", "clientMessage", "serverStatus", "serverMessage", "inboundBytes", "outboundBytes", "sessionId", "appInstanceId"]; col><@i18n.message key="Logging.column.${col}" /></@>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar inline">
            <div class="toolbar-management">
                <@form.button name="exportlog"><@i18n.message key="Logging.button.export" /></@>
            </div>
        </div>
    </div>
</div>
