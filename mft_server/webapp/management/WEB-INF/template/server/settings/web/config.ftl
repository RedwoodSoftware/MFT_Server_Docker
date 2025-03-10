<#-- @ftlvariable name="model" type="com.jscape.inet.mft.subsystems.management.web.rest.PageTemplateModel" -->

<#import "/WEB-INF/template/macro.ftl" as m />

<div id="web-config-fields">
    <div data-options="region:'center'">
        <fieldset>
            <legend><@i18n.message key="WebConfiguration.legend.server" /></legend>
            <dl class="group">
                <dt class="checkbox"><@form.checkbox name="bindplain"><@i18n.message key="WebConfiguration.label.http" /></@></dt>
                <dd><select name="plainhost"></select>&nbsp;&nbsp;<@form.port name="plainport" disabled=!permissions.webSettingsHttpPortAllowed readonly=!permissions.webSettingsHttpPortAllowed><@i18n.message key="WebConfiguration.label.httpPort" /> &nbsp;</@></dd>
                <dt class="checkbox"><@form.checkbox name="bindsecure"><@i18n.message key="WebConfiguration.label.https" /></@></dt>
                <dd><select name="securehost"></select>&nbsp;&nbsp;<@form.port name="secureport" disabled=!permissions.webSettingsHttpPortAllowed readonly=!permissions.webSettingsHttpPortAllowed><@i18n.message key="WebConfiguration.label.httpsPort" /> &nbsp;</@></dd>
            </dl>
        </fieldset>

        <fieldset>
            <legend><@i18n.message key="WebConfiguration.legend.ssl" /></legend>

            <div><@form.select name="privatekey" items={}><@i18n.message key="WebConfiguration.label.httpsKey" /></@></div>
            <div><@form.dn name="theme" readonly="readonly"><@i18n.message key="WebConfiguration.label.theme" /></@>&nbsp;<@form.button name="changetheme"><@i18n.message key="WebConfiguration.button.changeTheme" /></@></div>
            <div class="themes-list"><@m.themes_list selected=(model.themeName)!'' themesByGroup=(model.userThemesByGroup)!{} /></div>
            <div class="checkbox"><@form.checkbox name="certrequired"><@i18n.message key="WebConfiguration.label.clientCertificateRequired" /></@></div>
            <div class="checkbox"><@form.checkbox name="renegotiationallowed"><@i18n.message key="WebConfiguration.label.sslRenegotiation" /></@></div>
            <div class="checkbox"><@form.checkbox name="fipsrequired"><@i18n.message key="WebConfiguration.label.fipsRequired" /></@></div>

            <div class="viewpane-toolbar inline">
                <div class="toolbar-selection">
                <@form.button name="sslciphers"><@i18n.message key="WebConfiguration.button.sslCiphers" /></@>
                </div>
            </div>
        </fieldset>

        <fieldset>
            <legend><@i18n.message key="WebConfiguration.legend.connections" /></legend>

            <div><@form.dn name="servername" dataOptions="required:${((permissions.webSettingsServerNameRequired)!false)?string}" required=(permissions.webSettingsServerNameRequired)!false><@i18n.message key="WebConfiguration.label.serverName" /></@></div>
            <div><@form.number name="sessionttl" maxlength="3"><@i18n.message key="WebConfiguration.label.sessionTtl" /></@>&nbsp;<span><@i18n.message key="WebConfiguration.label.sessionTtlUnit" /></span></div>
            <div><@form.number name="backlog" maxlength="3"><@i18n.message key="WebConfiguration.label.backlog" /></@></div>
            <div class="checkbox">
                <#if (permissions.webSettingsRedirectHttpAllowed)!true>
                    <@form.checkbox name="redirecthttp"><@i18n.message key="WebConfiguration.label.redirectHttp" /></@>
                <#else>
                    <@form.checkbox name="redirecthttp" disabled=true><span title="${i18n.text('WebConfiguration.tooltip.redirectHttpNotAllowed')?html}" class="easyui-tooltip"><@i18n.message key="WebConfiguration.label.redirectHttp" /></span></@>
                </#if>
            </div>
            <div class="checkbox"><@form.checkbox name="includeserverport"><@i18n.message key="WebConfiguration.label.includeServerPort" /></@></div>
            <div class="checkbox">
            <@form.checkbox name="enablehsts"><@i18n.message key="WebConfiguration.label.enableHSTS" /></@>&nbsp;&nbsp;
                <span><@form.button name="hstssettings"><@i18n.message key="WebConfiguration.button.hstsSettings" /></@></span>
            </div>
        </fieldset>

        <fieldset>
            <legend><@i18n.message key="WebConfiguration.legend.userInterface" /></legend>

            <div><@form.dn name="defaultdomain" required=false><@i18n.message key="WebConfiguration.label.defaultDomain" /></@></div>
            <div class="checkbox"><@form.checkbox name="hidedomain"><@i18n.message key="WebConfiguration.label.hideDomain" /></@></div>
            <div class="checkbox"><@form.checkbox name="selectdomain"><@i18n.message key="WebConfiguration.label.showDomainDropdown" /></@></div>
            <div class="checkbox"><@form.checkbox name="showlostpwdlink"><@i18n.message key="WebConfiguration.label.showLostPasswordLink" /></@></div>
            <div class="checkbox"><@form.checkbox name="logincaptcha"><@i18n.message key="WebConfiguration.label.captchaOnLogin" /></@></div>
            <div class="checkbox"><@form.checkbox name="autologin"><@i18n.message key="WebConfiguration.label.autoLoginAllowed" /></@></div>
        </fieldset>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar toolbar-management inline">
            <@form.button name="apply"><@i18n.message key="Application.button.apply" /></@>
            <@form.button name="discard"><@i18n.message key="Application.button.discard" /></@>
        </div>
    </div>
</div>