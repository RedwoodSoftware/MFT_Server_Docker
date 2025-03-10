<div id="service-aftp-config-fields">
    <div data-options="region:'center'">

        <fieldset class="noborder x-large" <#if !permissions.domainServicesControlAllowed> disabled="disabled"</#if>>
            <div><@form.number name="cmdtimeout" maxlength="3"><@i18n.message "Services.label.commandTimeout" /></@>&nbsp;<span><@i18n.message "Services.label.commandTimeoutUnit" /></span></div>
            <div><@form.number name="datatimeout" maxlength="3"><@i18n.message "Services.label.dataTimeout" /></@>&nbsp;<span><@i18n.message "Services.label.dataTimeoutUnit" /></span></div>
            <div><@form.number name="losslistsize" maxlength="2"><@i18n.message "Services.label.lossListSize" /></@>&nbsp;<span><@i18n.message "Services.label.lossListSizeUnit" /></span></div>
            <div class="checkbox"><@form.checkbox name="tcpnodelay"><@i18n.message key="Services.label.tcpNoDelay" /></@></div>
            <div><@form.number name="backlog" maxlength="3"><@i18n.message key="Services.label.backlog" /></@></div>
        </fieldset>

        <div class="viewpane-toolbar inline" style="padding: 0 2em 1em">
            <div class="toolbar-selection"><@form.button name="sslciphers"><@i18n.message "Services.button.sslCiphers" /></@></div>
        </div>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar toolbar-management inline">
            <@form.button name="apply" disabled=!permissions.domainServicesControlAllowed><@i18n.message "Application.button.apply" /></@>
            <@form.button name="discard" disabled=!permissions.domainServicesControlAllowed><@i18n.message "Application.button.discard" /></@>
        </div>
    </div>
</div>