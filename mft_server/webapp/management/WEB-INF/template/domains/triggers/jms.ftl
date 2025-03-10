<div id="triggers-remote-settings-fields">
    <div data-options="region:'center'" style="padding:16px">

        <div class="content">
            <div data-options="region:'north',border:false" class="layout-pane-top">
                <fieldset class="noborder pane"<#if !permissions.triggersControlAllowed> disabled="disabled"</#if>>
                    <@form.checkbox name="enabled"><@i18n.message key="Triggers.label.publishEvents" /></@>
                </fieldset>
            </div>

            <div data-options="region:'center'">
                <fieldset class="noborder pane"<#if !permissions.triggersControlAllowed> disabled="disabled"</#if>>
                    <fieldset class="x-large">
                        <legend><@i18n.message key="Triggers.legend.connection" /></legend>
                        <div><@form.dn name="brokerurl" maxlength=2048 size="50" required=true><@i18n.message key="Triggers.label.brokerUrl" /></@></div>
                        <div><@form.dn name="queuename" size="50" required=true><@i18n.message key="Triggers.label.queueName" /></@></div>
                        <div><@form.username name="username" size="40"><@i18n.message key="Triggers.label.username" /></@></div>
                        <div><@form.password name="password" size="40"><@i18n.message key="Triggers.label.password" /></@></div>
                        <div><@form.number name="queuesize" maxlength="5"><@i18n.message key="Triggers.label.jmsQueueSize" /></@></div>
                    </fieldset>
                    <fieldset>
                        <legend><@i18n.message key="Triggers.legend.ssl" /></legend>
                        <div><@form.checkbox name="usehostkey"><@i18n.message key="Triggers.label.useHostKey" /></@><select name="hostkey"></select></div>
                        <div><@form.button name="selectclientkey"><@i18n.message key="Triggers.button.selectClientKey" /></@form.button></div>
                    </fieldset>
                    <fieldset>
                        <legend><@i18n.message key="Triggers.legend.subscribedEvents" /></legend>
                        <div><@form.datagrid name="events" columns=["event", "description"]; col><@i18n.message key="Triggers.column.${col}" /></@></div>
                    </fieldset>
                </fieldset>
            </div>

            <div data-options="region:'south',border:false" class="layout-pane-bottom">
                <div class="viewpane-toolbar toolbar-management inline">
                    <@form.button name="testserver"><@i18n.message key="Triggers.button.testServer" /></@>
                </div>
            </div>
        </div>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar toolbar-management inline">
            <@form.button name="apply" disabled=!permissions.triggersControlAllowed><@i18n.message key="Application.button.apply" /></@>
            <@form.button name="discard" disabled=!permissions.triggersControlAllowed><@i18n.message key="Application.button.discard" /></@>
        </div>
    </div>
</div>