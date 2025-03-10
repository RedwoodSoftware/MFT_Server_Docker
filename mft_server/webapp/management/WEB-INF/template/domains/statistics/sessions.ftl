<div id="sessions-fields">
    <div data-options="region:'center',border:false">
        <@form.datagrid name="sessions" height="" columns=["type", "server", "client", "user", "created", "uptime", "file", "appversion"]; col><@i18n.message key="Sessions.column.${col}" /></@>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar toolbar-management inline">
            <#if permissions.domainSessionsControlAllowed>
                <@form.button name="close"><@i18n.message key="Sessions.button.close" /></@>
            </#if>
            <#if permissions.domainAgentUpdateAllowed>
                <@form.button name="updateagent"><@i18n.message key="Sessions.button.updateAgent" /></@>
            </#if>
        </div>
    </div>
</div>
