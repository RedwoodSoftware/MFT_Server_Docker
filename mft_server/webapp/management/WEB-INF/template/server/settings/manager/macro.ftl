<#macro role_permission name items>
    <@form.select name=name items=[]><#nested /></@>
    <div class="combo-panel">
        <ul>
            <#list items?keys as key>
                <li value="${key?html}">${items[key]?html}</li>
            </#list>
        </ul>
        <div class="combo-panel-toolbar">
            <button type="button" class="link-btn select-all" data-toggle-text="${i18n.text("Roles.button.clear")?js_string?html}"><@i18n.message key="Roles.button.selectAll" /></button>
        </div>
    </div>
</#macro>