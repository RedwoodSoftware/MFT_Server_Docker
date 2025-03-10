<#ftl strip_whitespace=true>
<#-- @ftlvariable name="model" type="com.jscape.inet.mft.subsystems.web.ui.view.UserPageResource" -->
<#-- @ftlvariable name="permission" type="com.jscape.inet.mft.subsystems.web.ui.view.PageAccessPermission" -->

<#import "/WEB-INF/tags/form.ftl" as form/>
<#import "/WEB-INF/tags/message.ftl" as i18n/>


<div id="user-file-shares-pane">

    <div data-options="region:'center',border:false">
        <@form.datagrid name="filesharesgrid" height="" columns=["date", "subject", "sender", "files", "downloads", "status"]; col>
            <@i18n.message key="Storage.column.${col}" />
        </@>
    </div>

    <div data-options="region:'south',border:false">
        <div class="viewpane-toolbar">
            <div class="toolbar-selection">
                <@form.button name="refresh"><@i18n.message key="Storage.button.refresh" /></@>
            </div>
            <div class="toolbar-management">
                <@form.button name="dload"><@i18n.message key="Storage.button.download" /></@>
                <@form.button name="view"><@i18n.message key="Storage.button.view" /></@>
            </div>
        </div>
    </div>
</div>