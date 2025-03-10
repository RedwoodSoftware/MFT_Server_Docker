<#ftl strip_whitespace=true>

<div id="account-dropzones-fields">
    <div data-options="region:'center',border:false">
        <@form.datagrid name="dropzonesinfo" height="" columns=["name", "path", "url"]; col><@i18n.message key="DropZones.column.${col}" /></@>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar inline">
            <div class="toolbar-selection">
                <@form.button name="copylink" ariaHaspopup="true"><@i18n.message key="DropZones.button.copyLink" /></@>
            </div>
        </div>
    </div>
</div>