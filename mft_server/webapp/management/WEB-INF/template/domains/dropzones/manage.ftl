<div id="dropzone-list-fields">
    <div data-options="region:'center',border:false">
    <@form.datagrid name="dropzones" height="" columns=["name", "user", "path", "url", "owner", "theme", "tags"]; col><@i18n.message key="DropZones.column.${col}" /></@>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar inline">
            <div class="toolbar-selection">
                <@form.button name="copylink" ariaHaspopup="true"><@i18n.message key="DropZones.button.copyLink" /></@>
            </div>
            <div class="toolbar-management">
                <@form.button name="add"><@i18n.message key="DropZones.button.add" /></@>
                <@form.button name="edit"><@i18n.message key="DropZones.button.edit" /></@>
                <@form.button name="purge"><@i18n.message key="DropZones.button.purge" /></@>
                <@form.button name="delete"><@i18n.message key="DropZones.button.delete" /></@>
            </div>
        </div>
    </div>
</div>