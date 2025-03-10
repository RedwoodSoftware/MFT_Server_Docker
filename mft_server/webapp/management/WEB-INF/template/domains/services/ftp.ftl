<#assign charsets={}/><#list page.availableCharsets as charset><#if page.defaultCharset == charset><#assign charsets=charsets + {charset: charset + '*'}/><#else><#assign charsets=charsets + {charset: charset}/></#if></#list>

<div id="service-ftp-config-fields">
    <div data-options="region:'center'">

        <fieldset class="x-large"<#if !permissions.domainServicesControlAllowed> disabled="disabled"</#if>>
            <legend><@i18n.message key="Services.legend.connections" /></legend>
            <div><@form.memo name="banner" rows="3" style="width:35em"><@i18n.message "Services.label.banner" /></@></div>
            <div><@form.number name="cmdtimeout" maxlength="3"><@i18n.message "Services.label.commandTimeout" /></@>&nbsp;<span><@i18n.message "Services.label.commandTimeoutUnit" /></span></div>
            <div><@form.number name="datatimeout" maxlength="3"><@i18n.message "Services.label.dataTimeout" /></@>&nbsp;<span><@i18n.message "Services.label.dataTimeoutUnit" /></span></div>
            <div><@form.host name="passiveip"><@i18n.message "Services.label.passiveIp" /></@></div>
            <div><@form.checkbox name="passiveportrange"><@i18n.message key="Services.label.passivePortRange" /></@><input type="text" name="passiveportpstart" maxlength="5"/><span>&nbsp;<@i18n.message key="Services.label.passivePortRangeTo" />&nbsp;</span><input type="text" name="passiveportpend" maxlength="5"/></div>
            <div><@form.checkbox name="usesendbuffer"><@i18n.message key="Services.label.dataSendBuffer" /></@><input type="text" name="sendbuffer" maxlength="4"/>&nbsp;<span><@i18n.message key="Services.label.dataSendBufferUnit" /></span></div>
            <div><@form.checkbox name="usereceivebuffer"><@i18n.message key="Services.label.dataReceiveBuffer" /></@><input type="text" name="receivebuffer" maxlength="4"/>&nbsp;<span><@i18n.message key="Services.label.dataReceiveBufferUnit" /></span></div>
            <div><@form.checkbox name="tcpnodelay"><@i18n.message key="Services.label.tcpNoDelay" /></@></div>
            <div><@form.number name="backlog" maxlength="3"><@i18n.message key="Services.label.backlog" /></@></div>
            <dl class="group radio">
                <dt><@i18n.message key="Services.label.transferMode" /></dt>
                <dd><@form.radio name="transfermode" value="ASCII" checked="checked"><@i18n.message key="Services.label.transferModeASCII" /></@>&nbsp;&nbsp;<@form.radio name="transfermode" value="IMAGE"><@i18n.message key="Services.label.transferModeImage" /></@></dd>
            </dl>
            <dl class="group radio">
                <dt><@i18n.message key="Services.label.dataConnectionMode" /></dt>
                <dd><@form.radio name="dataconnectionmode" value="ACTIVE"><@i18n.message "Services.label.dataConnectionMode.ACTIVE" /></@>&nbsp;&nbsp;<@form.radio name="dataconnectionmode" value="PASSIVE"><@i18n.message "Services.label.dataConnectionMode.PASSIVE" /></@>&nbsp;&nbsp;<@form.radio name="dataconnectionmode" value="ALL" checked="checked"><@i18n.message "Services.label.dataConnectionMode.ALL" /></@></dd>
            </dl>
        </fieldset>

        <fieldset <#if !permissions.domainServicesControlAllowed> disabled="disabled"</#if>>
            <legend><@i18n.message key="Services.legend.security" /></legend>

            <div class="checkbox"><@form.checkbox name="forcedataencryption"><@i18n.message key="Services.label.forceDataChannelEncryption" /></@></div>
            <div class="checkbox"><@form.checkbox name="cmdrequireclientcrt"><@i18n.message key="Services.label.needClientAuth" /></@></div>
            <div class="checkbox"><@form.checkbox name="datarequireclientcrt"><@i18n.message key="Services.label.needClientAuthData" /></@></div>
            <div class="checkbox"><@form.checkbox name="shutdowncmdssl"><@i18n.message key="Services.label.shutdownSsl" /></@></div>
            <div class="checkbox"><@form.checkbox name="shutdowndatassl"><@i18n.message key="Services.label.shutdownDataSsl" /></@></div>
            <div class="checkbox"><@form.checkbox name="blockbounce"><@i18n.message key="Services.label.blockBounce" /></@></div>
            <div class="checkbox"><@form.checkbox name="blockpasv"><@i18n.message key="Services.label.blockPasv" /></@></div>
        </fieldset>

        <fieldset <#if !permissions.domainServicesControlAllowed> disabled="disabled"</#if>>
            <legend><@i18n.message key="Services.legend.asciiTransfers" /></legend>

            <div><@form.select name="networkcharset" items=charsets><@i18n.message key="Services.label.networkCharset" /></@></div>
            <div class="checkbox"><@form.checkbox name="asciiasimage"><@i18n.message key="Services.label.threatAsciiAsImage" /></@></div>
            <div><@form.select name="filecharset" items=charsets><@i18n.message key="Services.label.fileCharset" /></@></div>
        </fieldset>

        <div class="viewpane-toolbar inline" style="padding: 0 1em 1em">
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