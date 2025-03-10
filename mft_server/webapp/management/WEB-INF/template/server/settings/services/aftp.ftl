<div id="service-aftp-config-fields">
    <div data-options="region:'center'">

        <fieldset class="noborder x-large" <#if !permissions.globalServicesControlAllowed> disabled="disabled"</#if>>
            <div><@form.number name="cmdtimeout" maxlength="3"><@i18n.message "GlobalServices.label.commandTimeout" /></@>&nbsp;<span><@i18n.message "GlobalServices.label.commandTimeoutUnit" /></span></div>
            <div><@form.number name="datatimeout" maxlength="3"><@i18n.message "GlobalServices.label.dataTimeout" /></@>&nbsp;<span><@i18n.message "GlobalServices.label.dataTimeoutUnit" /></span></div>
            <div><@form.number name="losslistsize" maxlength="2"><@i18n.message "GlobalServices.label.lossListSize" /></@>&nbsp;<span><@i18n.message "GlobalServices.label.lossListSizeUnit" /></span></div>
            <div class="checkbox"><@form.checkbox name="tcpnodelay"><@i18n.message key="GlobalServices.label.tcpNoDelay" /></@></div>
            <div><@form.number name="backlog" maxlength="3"><@i18n.message key="GlobalServices.label.backlog" /></@></div>
        </fieldset>

        <div class="viewpane-toolbar inline" style="padding: 0 2em 1em">
            <div class="toolbar-selection">
                <@form.button name="sslciphers"><@i18n.message "GlobalServices.button.sslCiphers" /></@>
            </div>
        </div>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar inline">
            <div class="toolbar-management">
                <@form.button name="apply" disabled=!permissions.globalServicesControlAllowed><@i18n.message "Application.button.apply" /></@>
                <@form.button name="discard" disabled=!permissions.globalServicesControlAllowed><@i18n.message "Application.button.discard" /></@>
            </div>
        </div>
    </div>
</div>