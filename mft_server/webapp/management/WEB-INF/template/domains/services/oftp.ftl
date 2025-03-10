<div id="service-oftp-config-fields">
    <div data-options="region:'center'">

        <fieldset class="noborder x-large" <#if !permissions.domainServicesControlAllowed> disabled="disabled"</#if>>
            <div><@form.number name="timeout" maxlength="3"><@i18n.message "Services.label.timeout" /></@>&nbsp;<span><@i18n.message "Services.label.timeoutUnitSec" /></span></div>
            <div><@form.number name="buffer" maxlength="5"><@i18n.message key="Services.label.maxDataBuffer" /></@>&nbsp;<span><@i18n.message key="Services.label.maxDataBufferUnit" /></span></div>
            <div><@form.number name="credit" maxlength="3"><@i18n.message key="Services.label.maxCredit" /></@></div>
            <div><@form.number name="backlog" maxlength="3"><@i18n.message key="Services.label.backlog" /></@></div>
            <div class="checkbox"><@form.checkbox name="fileoverwriting"><@form.select name="fileoverwritingpolicy" items={
                "OVERWRITE": i18n.text("Services.label.fileExistingOwerwrite"),
                "GENERATE_UNIQUE_NAME": i18n.text("Services.label.fileExistingGenerateUnique")
            } />&nbsp;<@i18n.message key="Services.label.fileExistingFound" /></@>
            </div>
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