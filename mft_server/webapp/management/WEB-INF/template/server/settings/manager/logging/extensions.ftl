<div id="manager-extendedlog-fields" role="group" class="easyui-layout" data-options="fit:true,doSize:false,border:false">
    <div data-options="region:'center'">
        <fieldset class="noborder">
            <div class="checkbox">
                <@form.checkbox name="enabled"><@i18n.message key="ManagerLogs.label.enableExtended" />&nbsp;</@>
                <@form.select name="type" items={
                    'SPLUNK': i18n.text("ManagerLogs.type.SPLUNK")?html
                } />
            </div>
        </fieldset>

        <fieldset id="manager-splunklog-fields" class="noborder pane">
            <fieldset class="large">
                <legend><@i18n.message key="ManagerLogs.legend.splunkServer" /></legend>
                <div><@form.host name="host" required=true><@i18n.message key="ManagerLogs.label.host" /></@></div>
                <div><@form.port name="port"><@i18n.message key="ManagerLogs.label.port" /></@></div>
                <div><@form.number name="timeout"><@i18n.message key="ManagerLogs.label.timeout" /></@>&nbsp;<@i18n.message key="ManagerLogs.label.timeoutSec" /></div>
                <div><@form.dn name="token" required=true><@i18n.message key="ManagerLogs.label.accessToken" /></@></div>
                <div class="checkbox"><@form.checkbox name="ssl"><@i18n.message key="ManagerLogs.label.useSsl" /></@></div>
            </fieldset>

            <fieldset class="large">
                <legend><@i18n.message key="ManagerLogs.legend.splunkMessage" /></legend>
                <div><@form.text name="source" maxlength=255><@i18n.message key="ManagerLogs.label.splunkSource" /></@></div>
                <div><@form.text name="sourcetype" maxlength=255><@i18n.message key="ManagerLogs.label.splunkSourceType" /></@></div>
                <div><@form.text name="index" maxlength=255><@i18n.message key="ManagerLogs.label.splunkIndex" /></@></div>
            </fieldset>
        </fieldset>

        <fieldset class="noborder">
            <div class="viewpane-toolbar toolbar-management inline">
                <@form.button name="test"><@i18n.message key="ManagerLogs.button.test" /></@>
            </div>
        </fieldset>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar toolbar-management inline">
            <@form.button name="apply"><@i18n.message key="Application.button.apply" /></@>
            <@form.button name="discard"><@i18n.message key="Application.button.discard" /></@>
        </div>
    </div>
</div>