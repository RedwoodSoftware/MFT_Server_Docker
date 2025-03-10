<div id="failover-settings-fields" class="easyui-layout" data-options="fit:true,doSize:false,border:false">
    <div data-options="region:'center'">
        <fieldset>
            <legend><@i18n.message key="Failover.title.server" /></legend>

            <div><@form.host name="host" size="40" required=true><@i18n.message key="Failover.label.host" /></@></div>
            <div><@form.port name="port"><@i18n.message key="Failover.label.port" /></@></div>
            <div><@form.number name="timeout" maxlength="3"><@i18n.message key="Failover.label.timeout" /></@></div>
            <div><@form.username name="username" size="40" required=true><@i18n.message key="Failover.label.username" /></@></div>
            <div><@form.password name="password" required=true size="40"><@i18n.message key="Failover.label.password" /></@></div>
        </fieldset>

        <fieldset class="noborder">
            <div class="checkbox"><@form.checkbox name="forcestart"><@i18n.message key="Failover.label.forceStart" /></@></div>
            <div class="checkbox"><@form.checkbox name="enabled"><@i18n.message key="Failover.label.enabled" /></@></div>
        </fieldset>

        <div class="viewpane-toolbar toolbar-management inline">
            <@form.button name="synchronize" dataToggleText=i18n.text("Failover.button.synchronizingProgress")><@i18n.message key="Failover.button.synchronize" /></@>
        </div>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar toolbar-management inline">
            <@form.button name="apply"><@i18n.message key="Application.button.apply" /></@>
            <@form.button name="discard"><@i18n.message key="Application.button.discard" /></@>
        </div>
    </div>
</div>