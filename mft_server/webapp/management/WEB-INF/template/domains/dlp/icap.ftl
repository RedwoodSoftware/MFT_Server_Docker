<div id="dlp-icap-fields">
    <div data-options="region:'center'">
        <fieldset class="large"<#if !permissions.dlpRulesControlAllowed> disabled="disabled"</#if>>
            <legend><@i18n.message key="DlpIcap.legend.server" /></legend>

            <div>
                <@form.host name="host" required=true><@i18n.message key="DlpIcap.label.host" /></@>&nbsp;&nbsp;
                <span style="margin-right:.7em"><@i18n.message key="DlpIcap.label.port" /></span><@form.port id="dlpicapport" name="port" required=true/>&nbsp;&nbsp;
                <@form.button name="test"><@i18n.message key="DlpIcap.button.test" /></@>
            </div>
            <div><@form.number name="timeout"><@i18n.message key="DlpIcap.label.timeout" /></@>&nbsp;<span><@i18n.message key="DlpIcap.label.timeoutUnit" /></span></div>
            <div><@form.path name="path" required=true><@i18n.message key="DlpIcap.label.path" /></@></div>
            <div><@form.select name="method" items={
                'REQUEST_MODIFICATION': i18n.text("DlpIcap.mode.REQUEST_MODIFICATION"),
                'RESPONSE_MODIFICATION': i18n.text("DlpIcap.mode.RESPONSE_MODIFICATION")
            }><@i18n.message key="DlpIcap.label.method" /></@></div>
            <div><@form.path name="headersfile"><@i18n.message key="DlpIcap.label.headersFile" /></@>&nbsp;&nbsp;<@form.button name="browseheadersfile"><@i18n.message "DlpIcap.button.browse" /></@></div>
            <div><@form.path name="debugfile"><@i18n.message key="DlpIcap.label.debugFile" /></@>&nbsp;&nbsp;<@form.button name="browsedebugfile"><@i18n.message "DlpIcap.button.browse" /></@></div>
        </fieldset>

        <fieldset class="x-large"<#if !permissions.dlpRulesControlAllowed> disabled="disabled"</#if>>
            <legend><@i18n.message key="DlpIcap.legend.violations" /></legend>
            <h6><span><@i18n.message key="DlpIcap.info.violations" /></span></h6>

            <div><@form.text name="statusregexp" required=true><@i18n.message key="DlpIcap.label.statusRegexp" /></@></div>
            <div><@form.memo name="headersregexp"><@i18n.message key="DlpIcap.label.headersRegexp" /></@></div>
            <div><@form.memo name="bodyregexp"><@i18n.message key="DlpIcap.label.bodyRegexp" /></@></div>
        </fieldset>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar toolbar-management inline">
            <@form.button name="apply"><@i18n.message key="Application.button.apply" /></@>
            <@form.button name="discard"><@i18n.message key="Application.button.discard" /></@>
        </div>
    </div>
</div>