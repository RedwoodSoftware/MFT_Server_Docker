<div id="service-sftp-config-fields">
    <div data-options="region:'center'">

        <fieldset class="noborder x-large" <#if !permissions.globalServicesControlAllowed> disabled="disabled"</#if>>
            <div><@form.text name="version" maxlength="255"><@i18n.message key="GlobalServices.label.version" /></@></div>
            <div><@form.memo name="startupbanner" rows="3" style="width:35em"><@i18n.message key="GlobalServices.label.startupBanner" /></@></div>
            <div><@form.memo name="authbanner" rows="3" style="width:35em"><@i18n.message key="GlobalServices.label.authBanner" /></@></div>
            <div><@form.number name="timeout" maxlength="3"><@i18n.message "GlobalServices.label.timeout" /></@>&nbsp;<span><@i18n.message "GlobalServices.label.timeoutUnitMin" /></span></div>
            <div><@form.checkbox name="usesendbuffer"><@i18n.message key="GlobalServices.label.sendBuffer" /></@><input type="text" name="sendbuffer" maxlength="4" />&nbsp;<span><@i18n.message key="GlobalServices.label.sendBufferUnit" /></span></div>
            <div><@form.checkbox name="usereceivebuffer"><@i18n.message key="GlobalServices.label.receiveBuffer" /></@><input type="text" name="receivebuffer" maxlength="4"/>&nbsp;<span><@i18n.message key="GlobalServices.label.receiveBufferUnit" /></span></div>
            <div class="checkbox"><@form.checkbox name="tcpnodelay"><@i18n.message key="GlobalServices.label.tcpNoDelay" /></@></div>
            <div><@form.number name="backlog" maxlength="3"><@i18n.message key="GlobalServices.label.backlog" /></@></div>
            <div class="checkbox"><@form.checkbox name="disablelongname"><@i18n.message key="GlobalServices.label.disableExpandedLongName" /></@></div>
        </fieldset>

        <div class="viewpane-toolbar inline" style="padding: 0 2em 1em">
            <div class="toolbar-selection">
                <@form.button name="algorithms"><@i18n.message "GlobalServices.button.algorithms" /></@>
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