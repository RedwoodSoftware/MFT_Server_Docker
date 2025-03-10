<#ftl strip_whitespace=true>
<#-- @ftlvariable name="model" type="com.jscape.inet.mft.subsystems.web.ui.view.account.UserTemplateModel" -->

<#import "/WEB-INF/template/macro.ftl" as m />

<div id="account-personal-info-fields">

    <div data-options="region:'center',border:false">
        <form action="#" autocomplete="off">
            <fieldset class="pane large">
                <legend class="hidden-label"><@i18n.message key="PersonalInfo.legend" /></legend>

                <div><@form.username name="name" maxlength="150"><@i18n.message key="PersonalInfo.label.name" /></@></div>
                <div>
                    <@form.text name="login" disabled="disabled" readonly="readonly"><@i18n.message key="PersonalInfo.label.login" /></@>&nbsp;
                    <#if model.permission.passwordChangingAllowed>
                        <@form.button name="changepwd"><@i18n.message key="PersonalInfo.button.changePassword" /></@>
                    <#else>
                        <span class="easyui-tooltip" title="${i18n.text('PersonalInfo.Error.passwordChangeNotAllowed')?html}">
                            <@form.button name="changepwd" disabled="disabled"><@i18n.message key="PersonalInfo.button.changePassword" /></@>
                        </span>
                    </#if>
                </div>
                <div><@form.email name="email" autocomplete="off"><@i18n.message key="PersonalInfo.label.email" /></@></div>
                <div><@form.text name="company" maxlength="150"><@i18n.message key="PersonalInfo.label.company" /></@></div>
                <div>
                    <label><@i18n.message "PersonalInfo.label.phone" /></label>
                    <input type="tel" name="phonecode" aria-label="${i18n.text("PersonalInfo.label.phoneCode")?html}" data-options="prompt:'${i18n.text("PersonalInfo.label.phoneCode")?js_string?html}'" />&nbsp;
                    <input type="tel" name="phonenum" aria-label="${i18n.text("PersonalInfo.label.phoneNumber")?html}" data-options="prompt:'${i18n.text("PersonalInfo.label.phoneNumber")?js_string?html}'" />&nbsp;x&nbsp;
                    <input type="tel" name="phoneext" aria-label="${i18n.text("PersonalInfo.label.phoneExtension")?html}" data-options="prompt:'${i18n.text("PersonalInfo.label.phoneExtension")?js_string?html}'" />&nbsp;
                </div>
                <div><@form.checkbox name="usetheme">&nbsp;<@i18n.message key="PersonalInfo.label.theme" /></@><@form.dn name="theme" readonly="readonly" required=false />&nbsp;<@form.button name="changetheme"><@i18n.message key="PersonalInfo.button.changeTheme" /></@></div>
                <div id="user-themes">
                    <div class="themes-list"><@m.themes_list customThemeAllowed=true selected=themeName!'' themesByGroup=model.themesByGroup!{} /></div>
                </div>
            </fieldset>
        </form>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar">
            <div class="toolbar-management">
                <@form.button name="apply"><@i18n.message "Application.button.apply" /></@>
                <@form.button name="discard"><@i18n.message "Application.button.discard" /></@>
            </div>
        </div>
    </div>
</div>