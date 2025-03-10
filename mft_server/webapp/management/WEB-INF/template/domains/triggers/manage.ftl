<div id="domain-triggers-fields">

    <div data-options="region:'center',border:false">
        <#--disabled=!permissions.triggersControlAllowed-->
        <@form.datagrid name="triggers" height="" columns=["name", "event", "enabled", "condition", "actions", "lastRunDate", "tags"]; col><@i18n.message key="Triggers.column.${col}" /></@>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar inline">
            <div class="toolbar-selection">
                <@form.button name="history"><@i18n.message key="Triggers.button.history" /></@>
                <@form.button name="order"><@i18n.message key="Triggers.button.order" /></@>
                <@form.button name="import"><@i18n.message key="Triggers.button.import" /></@>
                <@form.button name="export"><@i18n.message key="Triggers.button.export" /></@>
                <@form.button name="promote"><@i18n.message key="Triggers.button.promote" /></@>
            </div>
            <div class="toolbar-management">
                <@form.button name="add"><@i18n.message key="Triggers.button.add" /></@>
                <@form.button name="edit"><@i18n.message key="Triggers.button.edit" /></@>
                <@form.button name="copy"><@i18n.message key="Triggers.button.copy" /></@>
                <@form.button name="run"><@i18n.message key="Triggers.button.run" /></@>
                <@form.button name="delete"><@i18n.message key="Triggers.button.delete" /></@>
                <div role="menu" id="runtriggermenu">
                    <div role="menuitem" aria-label="menu-run-data" data-options="name:'run-data'"><@i18n.message key="Triggers.button.runWithData" /></div>
                </div>
            </div>
        </div>
    </div>
</div>
