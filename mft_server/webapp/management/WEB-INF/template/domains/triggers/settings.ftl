<div id="triggers-settings-fields">

    <div data-options="region:'center'" style="padding:16px">

        <div class="content">
            <div data-options="region:'north',border:false" style="min-height:125px">
                <fieldset class="noborder pane x-large" <#if !permissions.triggersControlAllowed> disabled="disabled"</#if>>
                    <div class="checkbox"><@form.checkbox name="limittriggers"><@i18n.message key="Triggers.label.limitTriggers" /></@>&nbsp;<input type="text" name="maxthreads" maxlength="4"/>&nbsp;<span><@i18n.message key="Triggers.label.limitTriggersQueue" /></span>&nbsp;<input name="triggersqueuesize" maxlength="4"/></div>
                    <div class="checkbox"><@form.checkbox name="limittransfers"><@i18n.message key="Triggers.label.limitTransfers" /></@>&nbsp;<input type="text" name="maxtransfers" maxlength="4"/></div>
                    <div class="checkbox"><@form.checkbox name="recenttriggerexpires"><@i18n.message key="Triggers.label.recentTriggerExpirationPeriod" /></@>&nbsp;<input type="text" name="recenttriggerexpiresperiod" maxlength="8"/>&nbsp;<span><@i18n.message key="Triggers.label.recentTriggerExpirationPeriodUnit" /></span></div>
                </fieldset>
            </div>

            <div data-options="region:'center',border:false">
                <@form.datagrid name="variables" height="" columns=["variable", "value"]; col><@i18n.message key="Triggers.column.${col}" /></@>
            </div>

            <div data-options="region:'south',border:false" class="layout-pane-bottom">
                <div class="viewpane-toolbar toolbar-management inline">
                    <@form.button name="add"><@i18n.message key="Triggers.button.add" /></@>
                    <@form.button name="delete"><@i18n.message key="Triggers.button.delete" /></@>
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