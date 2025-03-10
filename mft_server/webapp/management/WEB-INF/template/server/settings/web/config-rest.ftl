<#-- @ftlvariable name="model" type="com.jscape.inet.mft.subsystems.management.web.rest.PageTemplateModel" -->

<#import "/WEB-INF/template/macro.ftl" as m />

<div id="rest-config-fields">
    <div data-options="region:'center'">
        <fieldset>
            <legend><@i18n.message key="WebRestConfiguration.legend.server" /></legend>

            <dl class="group">
                <dt class="checkbox"><@form.checkbox name="bindplain"><@i18n.message key="WebRestConfiguration.label.http" /></@></dt>
                <dd><select name="plainhost"></select>&nbsp;&nbsp;<@form.port name="plainport" disabled=!permissions.restSettingsHttpPortAllowed readonly=!permissions.restSettingsHttpPortAllowed><@i18n.message key="WebRestConfiguration.label.httpPort" /> &nbsp;</@></dd>
                <dt class="checkbox"><@form.checkbox name="bindsecure"><@i18n.message key="WebRestConfiguration.label.https" /></@></dt>
                <dd><select name="securehost"></select> &nbsp;<@form.port name="secureport" disabled=!permissions.restSettingsHttpPortAllowed readonly=!permissions.restSettingsHttpPortAllowed><@i18n.message key="WebRestConfiguration.label.httpsPort" /> &nbsp;</@></dd>
            </dl>
        </fieldset>

        <fieldset>
            <legend><@i18n.message key="WebRestConfiguration.legend.ssl" /></legend>

            <div><@form.select name="privatekey" items={}><@i18n.message key="WebRestConfiguration.label.httpsKey" /></@></div>
            <div><@form.dn name="theme" readonly="readonly"><@i18n.message key="WebRestConfiguration.label.theme" /></@>&nbsp;<@form.button name="changetheme"><@i18n.message key="WebRestConfiguration.button.changeTheme" /></@></div>
            <div class="themes-list"><@m.themes_list selected=model.themeName!'' themesByGroup=model.managementThemesByGroup!{} /></div>
            <div class="checkbox"><@form.checkbox name="certrequired"><@i18n.message key="WebRestConfiguration.label.clientCertificateRequired" /></@></div>
            <div class="checkbox"><@form.checkbox name="renegotiationallowed"><@i18n.message key="WebRestConfiguration.label.sslRenegotiation" /></@></div>
            <div class="checkbox"><@form.checkbox name="fipsrequired"><@i18n.message key="WebRestConfiguration.label.fipsRequired" /></@></div>

            <div class="viewpane-toolbar inline">
                <div class="toolbar-selection">
                    <@form.button name="sslciphers"><@i18n.message key="WebRestConfiguration.button.sslCiphers" /></@>
                </div>
            </div>
        </fieldset>

        <fieldset>
            <legend><@i18n.message key="WebRestConfiguration.legend.connections" /></legend>

            <div><@form.dn name="servername" dataOptions="required:${((permissions.webSettingsServerNameRequired)!false)?string}" required=(permissions.webSettingsServerNameRequired)!false><@i18n.message key="WebRestConfiguration.label.serverName" /></@></div>
            <div><@form.number name="ttl"><@i18n.message key="WebRestConfiguration.label.ttl" /></@>&nbsp;<@i18n.message key="WebRestConfiguration.label.ttlUnit" /></div>
            <div class="checkbox"><@form.checkbox name="includeserverport"><@i18n.message key="WebRestConfiguration.label.includeServerPort" /></@></div>
            <div class="checkbox">
            <@form.checkbox name="enablehsts"><@i18n.message key="WebRestConfiguration.label.enableHSTS" /></@>&nbsp;&nbsp;
                <span><@form.button name="hstssettings"><@i18n.message key="WebRestConfiguration.button.hstsSettings" /></@></span>
            </div>
        </fieldset>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar inline">
            <div class="toolbar-selection"><span class="warning"></span></div>
            <div class="toolbar-management">
                <@form.button name="apply"><@i18n.message key="Application.button.apply" /></@>
                <@form.button name="discard"><@i18n.message key="Application.button.discard" /></@>
            </div>
        </div>
    </div>
</div>
