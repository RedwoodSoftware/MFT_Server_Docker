<div id="service-tftp-config-fields">
    <div data-options="region:'center'">

        <fieldset class="noborder x-large" <#if !permissions.domainServicesControlAllowed> disabled="disabled"</#if>>
            <div><@form.number name="retransmitattempts" maxlength="3"><@i18n.message "Services.label.retransmitAttempts" /></@></div>
            <div><@form.number name="retransmitinterval" maxlength="3"><@i18n.message "Services.label.retransmitInterval" /></@>&nbsp;<span><@i18n.message "Services.label.retransmitIntervalUnit" /></span></div>
            <div class="checkbox"><@form.checkbox name="generatedirlisting"><@i18n.message "Services.label.directoryListingGeneration" /></@></div>
            <div class="checkbox"><@form.checkbox name="generatefilehash"><@i18n.message "Services.label.fileHashGeneration" /></@></div>
        </fieldset>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar toolbar-management inline">
            <@form.button name="apply" disabled=!permissions.domainServicesControlAllowed><@i18n.message "Application.button.apply" /></@>
            <@form.button name="discard" disabled=!permissions.domainServicesControlAllowed><@i18n.message "Application.button.discard" /></@>
        </div>
    </div>
</div>