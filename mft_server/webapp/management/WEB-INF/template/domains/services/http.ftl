<#-- @ftlvariable name="model" type="com.jscape.inet.mft.subsystems.management.web.rest.PageTemplateModel" -->

<#import "/WEB-INF/template/macro.ftl" as m />

<div id="service-http-config-fields">
    <div data-options="region:'center'">

        <fieldset <#if !permissions.domainServicesControlAllowed> disabled="disabled"</#if>>
            <legend><@i18n.message key="Services.legend.userInterface" /></legend>

            <div class="row">
                <label><@i18n.message "Services.label.logo" /></label>
                <span class="logo-preview"><input name="logo" type="file" /></span>
                <@form.button name="changelogo" disabled=!permissions.domainServicesControlAllowed><@i18n.message "Services.button.changeLogo" /></@>
            </div>
            <div><@form.dn name="theme" readonly="readonly" required=false><@i18n.message key="Services.label.theme" /></@>&nbsp;<@form.button name="changetheme"><@i18n.message key="Services.button.changeTheme" /></@></div>
            <div class="themes-list"><@m.themes_list selected=model.themeName!'' themesByGroup=model.userThemesByGroup!{} /></div>
            <div class="checkbox"><@form.checkbox name="showlogin"><@i18n.message "Services.label.showLogin" /></@></div>
            <div class="checkbox"><@form.checkbox name="showsearch"><@i18n.message "Services.label.showSearch" /></@></div>
            <div class="row"><@form.select name="searchcategory" items={
                    'NAME': i18n.text("Services.searchCategory.NAME"),
                    'CONTENT': i18n.text("Services.searchCategory.CONTENT")
                }><@i18n.message "Services.label.searchCategory" /></@>
            </div>
            <div class="checkbox"><@form.checkbox name="showtransfermode"><@i18n.message "Services.label.showTransportType" /></@></div>
            <div class="checkbox"><@form.checkbox name="showaccount"><@i18n.message "Services.label.showAccountLink" /></@></div>
            <div><@form.button name="resources"><@i18n.message "Services.button.resources" /></@></div>
        </fieldset>

        <fieldset class="large" <#if !permissions.domainServicesControlAllowed> disabled="disabled"</#if>>
            <legend><@i18n.message key="Services.legend.miscellaneous" /></legend>
            <div><@form.number name="timeout" maxlength="3"><@i18n.message "Services.label.connectionTimeout" /></@>&nbsp;<span><@i18n.message "Services.label.connectionTimeoutUnits" /></span></div>
            <div><@form.url name="logouturl"><@i18n.message "Services.label.logoutUrl" /></@></div>
            <div class="checkbox"><@form.checkbox name="autologout"><@i18n.message "Services.label.autoLogout" /></@>&nbsp;
                <input type="text" name="autologouttimeout" maxlength="3" />&nbsp;<span><@i18n.message "Services.label.gracePeriod" /></span>&nbsp;
                <input type="text" name="autologoutgraceperiod" />&nbsp;<span><@i18n.message "Services.label.gracePeriodUnit" /></span>
            </div>
            <div class="checkbox"><@form.checkbox name="signupallowed"><@i18n.message "Services.label.enableSelfRegistration" /></@>&nbsp;<select name="signuptemplate"></select></div>
            <div class="checkbox"><@form.checkbox name="docviewerallowed"><@i18n.message "Services.label.enableDocViewer" /></@></div>
            <div class="checkbox"><@form.checkbox name="adhoctransferallowed"><@i18n.message "Services.label.enableAdHocTransfer" /></@></div>
        </fieldset>

        <fieldset <#if !permissions.domainServicesControlAllowed> disabled="disabled"</#if>>
            <legend><@i18n.message key="Services.legend.uploadForms" /></legend>
            <div class="checkbox"><@form.checkbox name="uploadformrequired"><@i18n.message key="Services.label.uploadFormRequired" /></@></div>
            <div><@form.button name="uploadforms"><@i18n.message "Services.button.forms" /></@></div>
        </fieldset>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar toolbar-management inline">
            <@form.button name="apply" disabled=!permissions.domainServicesControlAllowed><@i18n.message "Application.button.apply" /></@>
            <@form.button name="discard" disabled=!permissions.domainServicesControlAllowed><@i18n.message "Application.button.discard" /></@>
        </div>
    </div>
</div>