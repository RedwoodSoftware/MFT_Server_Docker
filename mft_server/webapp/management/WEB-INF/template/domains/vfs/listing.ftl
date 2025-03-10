<div id="vfsfields">
    <div data-options="region:'center',border:false">
        <@form.datagrid name="paths" height="" columns=["path", "mapping", "permission"]; col><@i18n.message key="VirtualFiles.column.${col}" /></@>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar inline">
            <div class="toolbar-selection">
                <@form.button name="moveup"><@i18n.message key="VirtualFiles.button.moveUp" /></@>
                <@form.button name="movedown"><@i18n.message key="VirtualFiles.button.moveDown" /></@>
            </div>
            <div class="toolbar-management">
                <@form.button name="add"><@i18n.message key="VirtualFiles.button.add" /></@>
                <@form.button name="edit"><@i18n.message key="VirtualFiles.button.edit" /></@>
                <@form.button name="delete"><@i18n.message key="VirtualFiles.button.delete" /></@>
            </div>
        </div>
    </div>
</div>