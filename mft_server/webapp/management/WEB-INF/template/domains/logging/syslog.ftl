<#assign syslog_facilities={}/><#list 0..23 as code><#assign syslog_facilities=syslog_facilities + {code: i18n.text("Logging.facility.${code}")} /></#list>

<div id="domain-syslog-fields">

    <div data-options="region:'center'">
        <fieldset class="noborder">
            <div><@form.checkbox name="enabled"><@i18n.message key="Logging.label.enableSyslog" /></@></div>
        </fieldset>

        <fieldset <#if !permissions.logSettingsControlAllowed> disabled="disabled"</#if>>
            <legend><@i18n.message key="Logging.legend.syslogServer" /></legend>
            <div><@form.host name="host" required=true><@i18n.message key="Logging.label.host" /></@></div>
            <div><@form.port name="port"><@i18n.message key="Logging.label.port" /></@></div>
            <div><@form.checkbox name="enableTcp"><@i18n.message key="Logging.label.enableTcp" /></@></div>
            <div><@form.select name="hostkey" items=[] description=i18n.text("Logging.label.enableTcp.description")> <@i18n.message key="Logging.label.enableTcp.clientKey" /></@></div>
        </fieldset>

        <fieldset <#if !permissions.logSettingsControlAllowed> disabled="disabled"</#if>>
            <legend><@i18n.message key="Logging.legend.syslogMessage" /></legend>
            <div><@form.select name="facility" items=syslog_facilities><@i18n.message key="Logging.label.facility" /></@></div>
            <div><@form.text name="processname" maxlength="32"><@i18n.message key="Logging.label.processName" /></@></div>
            <div><@form.select name="format" items={
                'LEGACY': i18n.text("Logging.format.LEGACY")?html,
                'RAW': i18n.text("Logging.format.RAW")?html
            }><@i18n.message key="Logging.label.format" /></@></div>
        </fieldset>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar toolbar-management inline">
            <@form.button name="apply" disabled=!permissions.logSettingsControlAllowed><@i18n.message key="Application.button.apply" /></@>
            <@form.button name="discard" disabled=!permissions.logSettingsControlAllowed><@i18n.message key="Application.button.discard" /></@>
        </div>
    </div>
</div>