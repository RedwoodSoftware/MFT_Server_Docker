<div id="log-extensions-fields" role="group">
    <div data-options="region:'center'">
        <fieldset class="noborder">
            <div class="checkbox">
                <@form.checkbox name="enabled"><@i18n.message key="Logging.label.enableExtended" />&nbsp;</@>
                <@form.select name="type" items={
                    'SPLUNK': i18n.text("Logging.type.SPLUNK")?html
                } />
            </div>
        </fieldset>

        <fieldset id="log-extensions-splunk-fields" class="noborder pane">
            <fieldset class="large">
                <legend><@i18n.message key="Logging.legend.splunkServer" /></legend>
                <div><@form.host name="host" required=true><@i18n.message key="Logging.label.host" /></@></div>
                <div><@form.port name="port"><@i18n.message key="Logging.label.port" /></@></div>
                <div><@form.number name="timeout"><@i18n.message key="Logging.label.timeout" /></@>&nbsp;<@i18n.message key="Logging.label.timeoutSec" /></div>
                <div><@form.dn name="token" required=true><@i18n.message key="Logging.label.accessToken" /></@></div>
                <div class="checkbox"><@form.checkbox name="ssl"><@i18n.message key="Logging.label.useSsl" /></@></div>
            </fieldset>

            <fieldset class="large">
                <legend><@i18n.message key="Logging.legend.splunkMessage" /></legend>
                <div><@form.text name="source" maxlength=255><@i18n.message key="Logging.label.splunkSource" /></@></div>
                <div><@form.text name="sourcetype" maxlength=255><@i18n.message key="Logging.label.splunkSourceType" /></@></div>
                <div><@form.text name="index" maxlength=255><@i18n.message key="Logging.label.splunkIndex" /></@></div>
            </fieldset>
        </fieldset>

        <fieldset class="noborder">
            <div class="viewpane-toolbar toolbar-management inline">
                <@form.button name="test"><@i18n.message key="Logging.button.test" /></@>
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