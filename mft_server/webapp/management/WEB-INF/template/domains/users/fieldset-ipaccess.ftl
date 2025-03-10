<div id="useripaccessfields">

    <div data-options="region:'center',border:false">
        <@form.datagrid name="rules" height="" columns=["mask", "access", "reason"]; col><@i18n.message "UserIpAccess.column.${col}" /></@>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar inline">
            <div class="toolbar-selection">
                <@form.button name="moveup"><@i18n.message "UserIpAccess.button.moveUp" /></@>&nbsp;
                <@form.button name="movedown"><@i18n.message "UserIpAccess.button.moveDown" /></@>
            </div>
            <div class="toolbar-management">
                <@form.button name="add"><@i18n.message "UserIpAccess.button.add" /></@>&nbsp;
                <@form.button name="edit"><@i18n.message "UserIpAccess.button.edit" /></@>&nbsp;
                <@form.button name="delete"><@i18n.message "UserIpAccess.button.delete" /></@>
            </div>
        </div>
     </div>
</div>