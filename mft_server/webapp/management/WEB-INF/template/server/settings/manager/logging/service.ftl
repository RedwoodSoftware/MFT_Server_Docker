<div id="manager-log-settings-fields" class="easyui-layout" data-options="fit:true,doSize:false,border:false">
    <div data-options="region:'center',border:true">
        <fieldset class="large noborder">
            <legend class="hidden-label"><@i18n.message key="ManagerLogs.legend.settings" /></legend>
            <div class="checkbox"><@form.checkbox name="logexpires"><@i18n.message key="ManagerLogs.label.expirationPeriod" /></@>&nbsp;<input type="text" name="logexpiresperiod" maxlength="8"/>&nbsp;<span><@i18n.message key="ManagerLogs.label.expirationPeriodUnit" /></span></div>
        </fieldset>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar toolbar-management inline">
            <@form.button name="apply"><@i18n.message key="Application.button.apply" /></@>
            <@form.button name="discard"><@i18n.message key="Application.button.discard" /></@>
        </div>
    </div>
</div>