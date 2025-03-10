<div id="dir-monitor-settings-fields">
    <div data-options="region:'center'">
        <fieldset class="noborder"<#if !permissions.directoryMonitorsSettingsControlAllowed> disabled="disabled"</#if>>
            <div><@form.number name="maxthreads" maxlength="3"><@i18n.message key="DirectoryMonitors.label.maxThreads" /></@></div>
            <div class="checkbox"><@form.checkbox name="clearrecords"><@i18n.message key="DirectoryMonitors.label.clearRecords" /></@>&nbsp;<input type="text" name="expirationperiod" maxlength="5"/><span>&nbsp;<@i18n.message key="DirectoryMonitors.label.clearRecordsUnit" /></span></div>
        </fieldset>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar toolbar-management inline">
            <@form.button name="apply" disabled=!permissions.directoryMonitorsSettingsControlAllowed><@i18n.message key="Application.button.apply" /></@>
            <@form.button name="discard" disabled=!permissions.directoryMonitorsSettingsControlAllowed><@i18n.message key="Application.button.discard" /></@>
        </div>
    </div>
</div>