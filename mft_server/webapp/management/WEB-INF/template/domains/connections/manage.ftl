<#macro restriction name limit="" resettable=false unit="">
    <@form.checkbox name="${name}enabled"><#nested /></@>&nbsp;
    <#if limit=="connection">
        <input type="text" name="${name}" maxlength="3" />
        <span><@i18n.message "Connections.label.concurrentConnections" /></span>
        <span><@i18n.message "Connections.label.restoreFor" />&nbsp;<input name="${name}restore" size="3" maxlength="4" /></span>&nbsp;
        <span><@i18n.message "Connections.unit.timeout" /></span>&nbsp;
    <#elseif limit="attempts">
        <input type="text" name="${name}" maxlength="3" />
        <span><@i18n.message "Connections.label.passwordAttempts" />&nbsp;<input type="text" name="${name}timeout" size="4" maxlength="4" />&nbsp;<@i18n.message "Connections.unit.timeout" /></span>&nbsp;
        <span><@i18n.message "Connections.label.restoreFor" />&nbsp;<input name="${name}restore" size="3" maxlength="4" /></span>&nbsp;
        <span><@i18n.message "Connections.unit.timeout" /></span>&nbsp;
    <#elseif resettable>
        <@form.number name="${name}" maxlength="4"></@>&nbsp;<span><@restriction_unit name="${name}unit" /></span>&nbsp;
        <span><@i18n.message "Connections.label.resetEvery" /></span>&nbsp;<@form.number name="${name}period" maxlength="4"></@>&nbsp;<span><@i18n.message "Connections.unit.period" /></span>
    <#else>
        <@form.number name="${name}" maxlength="4"></@><#if unit??>&nbsp;<span><@restriction_unit name="${name}unit" type=unit /></span></#if>
    </#if>
</#macro>

<#macro restriction_unit name type="size">
    <#if type=="size">
        <@form.select name="${name}" items={
            '${1?c}': i18n.text("Application.size.bytes"),
            '${1024?c}': i18n.text("Application.size.kilobyte"),
            '${(1024*1024)?c}': i18n.text("Application.size.megabyte"),
            '${(1024*1024*1024)?c}': i18n.text("Application.size.gigabyte")} />
    <#elseif type=="bitrate">
        <@form.select name="${name}" items={
            '${1024?c}': i18n.text("Application.bitrate.kilobyte"),
            '${(1024*1024)?c}': i18n.text("Application.bitrate.megabyte"),
            '${(1024*1024*1024)?c}': i18n.text("Application.bitrate.gigabyte")} />
    </#if>
</#macro>

<div id="connections-fields">
    <div data-options="region:'center'">
        <fieldset class="noborder pane x-large"<#if !permissions.connectionSettingsControlAllowed> disabled="disabled"</#if>>
            <div><@restriction name="maxconcurcon"><@i18n.message "Connections.label.maxConcurrentConnections" /></@></div>
            <div><@restriction name="maxipcon"><@i18n.message "Connections.label.maxIpConnections" /></@></div>
            <div><@restriction name="maxusercon"><@i18n.message "Connections.label.maxUserConnections" /></@></div>
            <div><@restriction name="maxsessiondloads"><@i18n.message "Connections.label.maxSessionDownloads" /></@></div>
            <div><@restriction name="maxsessionuploads"><@i18n.message "Connections.label.maxSessionUploads" /></@></div>
            <div><@restriction name="maxfiledloadsize" unit="size"><@i18n.message "Connections.label.maxFileDownloadSize" /></@></div>
            <div><@restriction name="maxfileuploadsize" unit="size"><@i18n.message "Connections.label.maxFileUploadSize" /></@></div>
            <div><@restriction name="maxdloads" resettable=true><@i18n.message "Connections.label.maxDownloads" /></@></div>
            <div><@restriction name="maxuploads" resettable=true><@i18n.message "Connections.label.maxUploads" /></@></div>
            <div><@restriction name="maxtransfers" resettable=true><@i18n.message "Connections.label.maxTransfers" /></@></div>
            <div><@restriction name="maxtransferrate" unit="bitrate"><@i18n.message "Connections.label.maxTransferRate" /></@></div>
            <div><@restriction name="disableaccount" limit="attempts"><@i18n.message "Connections.label.disableAccount" /></@></div>
            <div><@restriction name="ipblockingattempt" limit="attempts"><@i18n.message "Connections.label.disableIp" /></@></div>
            <div><@restriction name="ipflaggingattempt" limit="attempts"><@i18n.message "Connections.label.flagIp" /></@></div>
            <div><@restriction name="ipblockingconnection" limit="connection"><@i18n.message "Connections.label.disableIp" /></@></div>
            <div><@restriction name="ipflaggingconnection" limit="connection"><@i18n.message "Connections.label.flagIp" /></@></div>
            <div><@form.checkbox name="maxinvalidauthenabled"><@i18n.message "Connections.label.maxInvalidAuthentications.1" /></@>&nbsp;<span>&nbsp;<@form.number name="maxinvalidauth" maxlength="4"/>&nbsp;<@i18n.message key="Connections.label.maxInvalidAuthentications.2" /></span></div>
        </fieldset>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar toolbar-management inline">
            <@form.button name="apply" disabled=!permissions.connectionSettingsControlAllowed><@i18n.message "Application.button.apply" /></@>
            <@form.button name="discard" disabled=!permissions.connectionSettingsControlAllowed><@i18n.message "Application.button.discard" /></@>
        </div>
    </div>
</div>