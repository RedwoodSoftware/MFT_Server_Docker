<div id="manager-service-fields">
    <div data-options="region:'center'">
        <fieldset class="noborder">
            <div><@form.checkbox name="enabled"><@i18n.message key="ManagerService.label.enabled" /></@></div>
        </fieldset>

        <fieldset>
            <legend><@i18n.message key="ManagerService.legend.connection" /></legend>

            <div><@form.select name="host" items={}><@i18n.message key="ManagerService.label.host" /></@></div>
            <div><@form.port name="port"><@i18n.message key="ManagerService.label.port" /></@></div>
            <div><@form.number name="timeout" maxlength="4"><@i18n.message key="ManagerService.label.timeout" /></@></div>
        </fieldset>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar toolbar-management inline">
            <@form.button name="apply"><@i18n.message key="Application.button.apply" /></@>
            <@form.button name="discard"><@i18n.message key="Application.button.discard" /></@>
        </div>
    </div>
</div>