<#assign syslog_facilities={}/><#list 0..23 as code><#assign syslog_facilities=syslog_facilities + {code: i18n.text("ManagerLogs.facility.${code}")} /></#list>

<div id="manager-syslog-fields" class="easyui-layout" data-options="fit:true,doSize:false,border:false">
    <div data-options="region:'center'">
        <fieldset class="noborder">
            <div><@form.checkbox name="enabled"><@i18n.message key="ManagerLogs.label.enableSyslog" /></@></div>
        </fieldset>

        <fieldset>
            <legend><@i18n.message key="ManagerLogs.legend.syslogServer" /></legend>
            <div><@form.host name="host" required=true><@i18n.message key="ManagerLogs.label.host" /></@></div>
            <div><@form.port name="port"><@i18n.message key="ManagerLogs.label.port" /></@></div>
            <div><@form.checkbox name="enableTcp"><@i18n.message key="ManagerLogs.label.enableTcp" /></@></div>
    	    <div><@form.select name="hostkey" items=[] description=i18n.text("ManagerLogs.label.enableTcp.description")> <@i18n.message key="ManagerLogs.label.enableTcp.clientKey" /></@></div>
        </fieldset>

        <fieldset>
            <legend><@i18n.message key="ManagerLogs.legend.syslogMessage" /></legend>
            <div><@form.select name="facility" items=syslog_facilities><@i18n.message key="ManagerLogs.label.facility" /></@></div>
            <div><@form.text name="processname" maxlength="32"><@i18n.message key="ManagerLogs.label.processName" /></@></div>
        </fieldset>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar toolbar-management inline">
        <@form.button name="apply"><@i18n.message key="Application.button.apply" /></@>
            <@form.button name="discard"><@i18n.message key="Application.button.discard" /></@>
        </div>
    </div>
</div>