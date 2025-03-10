<div id="jmx-service-fields">
    <div data-options="region:'center'">
        <fieldset class="noborder">
            <div><@form.checkbox name="enabled"><@i18n.message key="JmxService.label.enabled" /></@></div>
        </fieldset>

        <fieldset>
            <legend><@i18n.message key="JmxService.title.server" /></legend>

            <div><@form.select name="host" items={}><@i18n.message key="JmxService.label.host" /></@></div>
            <div><@form.port name="serverport"><@i18n.message key="JmxService.label.serverPort" /></@></div>
            <div><@form.port name="registryport"><@i18n.message key="JmxService.label.registryPort" /></@></div>
            <div><label><@i18n.message key="JmxService.label.url" /></label><code id="jmx-service-url"></code></div>
        </fieldset>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar toolbar-management inline">
            <@form.button name="apply"><@i18n.message key="Application.button.apply" /></@>
            <@form.button name="discard"><@i18n.message key="Application.button.discard" /></@>
        </div>
    </div>
</div>