<div id="domain-trigger-templates-fields">

    <div data-options="region:'center',border:false">
        <#--disabled=!permissions.triggersControlAllowed-->
        <@form.datagrid name="templates" height="" columns=["name", "event", "type", "condition", "actions", "tags"]; col><@i18n.message key="Triggers.column.${col}" /></@>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar inline">
            <div class="toolbar-selection">
                <@form.button name="import"><@i18n.message key="Triggers.button.import" /></@>
                <@form.button name="export"><@i18n.message key="Triggers.button.export" /></@>
                <@form.button name="promote"><@i18n.message key="Triggers.button.promote" /></@>
            </div>
            <div class="toolbar-management">
                <@form.button name="add"><@i18n.message key="Triggers.button.add" /></@>
                <@form.button name="edit"><@i18n.message key="Triggers.button.edit" /></@>
                <@form.button name="copy"><@i18n.message key="Triggers.button.copy" /></@>
                <@form.button name="delete"><@i18n.message key="Triggers.button.delete" /></@>
            </div>
        </div>
    </div>
</div>

