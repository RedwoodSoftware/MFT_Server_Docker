<div id="log-config-fields">

    <div data-options="region:'center'">
        <fieldset class="noborder">
            <div class="checkbox"><@form.number name="buffersize" dataOptions="disabled:${permissions.logSettingsControlAllowed?string('false','true')}">
                <@i18n.message key="Logging.label.bufferSize" />&nbsp;
            </@><span>&nbsp;<@i18n.message key="Logging.label.bufferSizeUnit" /></span>
            </div>
        </fieldset>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar toolbar-management inline">
            <@form.button name="apply" disabled=!permissions.logSettingsControlAllowed><@i18n.message key="Application.button.apply" /></@>
            <@form.button name="discard" disabled=!permissions.logSettingsControlAllowed><@i18n.message key="Application.button.discard" /></@>
        </div>
    </div>
</div>