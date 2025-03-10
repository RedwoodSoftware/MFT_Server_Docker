<#-- @ftlvariable name="theme" type="com.jscape.inet.mft.UiTheme" -->

<#macro themes_list customThemeAllowed=false customThemeName="custom" selected="" themesByGroup={}>

<#if customThemeAllowed>
<fieldset name="custom-theme-fields">
    <legend class="themes-head"><@i18n.message key="Application.themes.CUSTOM" /></legend>

    <div class="theme-color-picker"><@form.input name="activeitemtext" ariaLabel=i18n.text('Application.themes.label.activeItemText')></@></div>
    <div class="theme-color-picker"><@form.input name="activeitembg" ariaLabel=i18n.text('Application.themes.label.activeItemBackground') /></div>
    <div class="theme-color-picker"><@form.input name="itemhover" ariaLabel=i18n.text('Application.themes.label.itemHover') /></div>
    <div class="theme-color-picker"><@form.input name="itembghover" ariaLabel=i18n.text('Application.themes.label.itemBackgroundHover') /></div>
    <div class="theme-color-picker"><@form.input name="paneltext" ariaLabel=i18n.text('Application.themes.label.panelText') /></div>
    <div class="theme-color-picker"><@form.input name="panelbg" ariaLabel=i18n.text('Application.themes.label.panelBackground') /></div>
    <div class="theme-color-picker"><@form.input name="panelborder" ariaLabel=i18n.text('Application.themes.label.panelBorder') /></div>
    <div class="theme-color-picker"><@form.input name="buttontext" ariaLabel=i18n.text('Application.themes.label.buttonText') /></div>
    <div class="theme-color-picker"><@form.input name="buttontexthover" ariaLabel=i18n.text('Application.themes.label.buttonTextHover') /></div>
    <div class="theme-color-picker"><@form.input name="buttonbg" ariaLabel=i18n.text('Application.themes.label.buttonBackground') /></div>
    <div class="theme-color-picker"><@form.input name="buttonbghover" ariaLabel=i18n.text('Application.themes.label.buttonBackgroundHover') /></div>
    <div class="theme-color-picker"><@form.input name="buttonborder" ariaLabel=i18n.text('Application.themes.label.buttonBorder') /></div>
    <div class="theme-color-picker"><@form.input name="buttonborderhover" ariaLabel=i18n.text('Application.themes.label.buttonBorderHover') /></div>
    <div><#list (themesByGroup!{})?keys as groupName>
        <#list themesByGroup[groupName]![] as theme>
            <#local colors=[
                theme.activeItemTextColor!'',
                theme.activeItemBgColor!'',
                theme.itemHoverColor!'',
                theme.itemBgHoverColor!'',
                theme.panelTextColor!'',
                theme.panelBgColor!'',
                theme.panelBorderColor!'',
                theme.buttonTextColor!'',
                theme.buttonTextHoverColor!'',
                theme.buttonBgColor!'',
                theme.buttonBgHoverColor!'',
                theme.buttonBorderColor!'',
                theme.buttonBorderHoverColor!''
            ] />
            <input type="hidden" name="theme-${theme.name?html}-colors" value="${colors?join(',','')?html}" />
        </#list>
    </#list></div>
    <div class="viewpane-toolbar inline">
        <div class="toolbar-management">
            <@form.button name="applycustom"><@i18n.message key="Application.themes.button.applyCustom" /></@>
        </div>
    </div>
</fieldset>
</#if>

<div class="themes-wrap">
    <#list (themesByGroup!{})?keys as groupName>
        <fieldset>
            <legend class="themes-head">${i18n.text("Application.themes.${(groupName!'')?upper_case}")?html}</legend>
            <div class="themes-preview">
                <#list (themesByGroup[groupName]![])?filter(t -> t.name != customThemeName) as theme>
                    <div class="theme-preview-box">
                        <label>
                            <div class="theme-preview-header"<#if theme.panelBgColor??> style="background-color: ${theme.panelBgColor?html};</#if><#if theme.panelBorderColor??>border-bottom: 1px solid ${theme.panelBorderColor?html}"</#if>></div>
                            <div class="theme-preview-content" style="
                                <#if theme.panelBgColor??>background-color: ${theme.panelBgColor?html};</#if>
                                <#if theme.panelTextColor??>color: ${theme.panelTextColor};</#if>
                                <#if theme.panelBorderColor??>border-bottom: 1px solid ${theme.panelBorderColor?html};</#if>
                                <#if theme.activeItemBgColor??>border-left: 30px solid ${theme.activeItemBgColor?html};</#if>">
                                <div class="theme-preview-row" style="<#if theme.activeItemBgColor??> background-color: ${theme.activeItemBgColor?html};</#if><#if theme.activeItemTextColor??>color: ${theme.activeItemTextColor};</#if>"><div class="theme-preview-placeholder"></div></div>
                                <div class="theme-preview-row"<#if theme.itemBgHoverColor??> style="background-color: ${theme.itemBgHoverColor?html};"</#if>><div class="theme-preview-placeholder" style="opacity:.5;<#if theme.itemHoverColor??>color: ${theme.itemHoverColor};</#if>"></div></div>
                                <div class="theme-preview-row" style="<#if theme.activeItemBgColor??> background-color: ${theme.activeItemBgColor?html};</#if><#if theme.activeItemTextColor??>color: ${theme.activeItemTextColor};</#if>"><div class="theme-preview-placeholder"></div></div>
                                <#if theme.buttonBgColor??><div class="theme-preview-row">
                                    <div class="theme-preview-btn" style="background-color:${theme.buttonBgColor?html} "></div>
                                    <div class="theme-preview-btn" style="background-color:${theme.buttonBgColor?html} "></div>
                                </div></#if>
                            </div>

                            <div class="theme-preview-radio">
                                <input type="radio" name="themepreview" value="${theme.name?html}"<#if (theme.name == selected!'')> checked="checked"</#if>/>
                                <div class="theme-preview-radio-text">${theme.name?html}</div>
                            </div>
                        </label>
                    </div>
                </#list>
            </div>
        </fieldset>
    </#list>
</div>
</#macro>

<#function csp_nonce_value><#if cspNonce?? && cspNonce?has_content><#return cspNonce/><#elseif (model.cspNonce)?? && model.cspNonce?has_content><#return model.cspNonce /><#else><#return ""/></#if></#function>
<#function csp_nonce_attr><#local nonce_value=csp_nonce_value() /><#if nonce_value?has_content><#return " nonce=\"${nonce_value?html}\"" /></#if></#function>
<#macro csp_nonce><#nested csp_nonce_attr() /></#macro>

<#macro heap_analytics appId="" options={}>
    <#if appId?has_content>
    <script type="text/javascript"${csp_nonce_attr()}>
        window.heap=window.heap||[],heap.load=function(e,t){window.heap.appid=e,window.heap.config=t=t||{};var r=document.createElement("script");r.type="text/javascript",r.async=!0,r.src="https://cdn.heapanalytics.com/js/heap-"+e+".js";var a=document.getElementsByTagName("script")[0];a.parentNode.insertBefore(r,a);for(var n=function(e){return function(){heap.push([e].concat(Array.prototype.slice.call(arguments,0)))}},p=["addEventProperties","addUserProperties","clearEventProperties","identify","resetIdentity","removeEventProperty","setEventProperties","track","unsetEventProperty"],o=0;o<p.length;o++)heap[p[o]]=n(p[o])};
        heap.load("${appId?js_string}"<#if options?has_content>,{<#list options?keys as key>${key?js_string}:${options[key]?c}</#list>}</#if>);
    </script>
    </#if>
</#macro>