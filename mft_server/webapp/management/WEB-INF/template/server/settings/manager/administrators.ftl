<#import "/WEB-INF/template/macro.ftl" as theme />

<div id="system-administrators-fields" class="easyui-layout" data-options="fit:true,doSize:false,border:false">
    <div data-options="region:'center',border:false">
        <@form.datagrid name="systemadministrators" height="" columns=["name", "login", "role", "enabled"]; col><@i18n.message key="Administrators.column.${col}" /></@>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar inline">
            <div class="toolbar-selection">
                <@form.button name="enable"><@i18n.message key="Administrators.button.enable" /></@>
                <@form.button name="disable"><@i18n.message key="Administrators.button.disable" /></@>
            </div>
            <div class="toolbar-management">
                <@form.button name="add"><@i18n.message key="Administrators.button.add" /></@>
                <@form.button name="edit"><@i18n.message key="Administrators.button.edit" /></@>
                <@form.button name="copy"><@i18n.message key="Administrators.button.copy" /></@>
                <@form.button name="delete"><@i18n.message key="Administrators.button.delete" /></@>
            </div>
        </div>
    </div>
</div>


<div id="admin-themes-template" style="display:none">
    <div class="themes-list"><@theme.themes_list customThemeAllowed=true selected=model.themeName!'' themesByGroup=model.managementThemesByGroup!{} /></div>
</div>