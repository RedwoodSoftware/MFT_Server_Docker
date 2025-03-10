<div id="domain-triggers-history-fields">

    <div data-options="region:'center',border:false">
        <@form.datagrid name="triggershistory" height="" columns=["eventId", "trigger", "status", "starttime", "endtime", "runtime", "action", "file"]; col><@i18n.message key="Triggers.column.${col}" /></@form.datagrid>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar inline">
            <div class="toolbar-selection">
                <@form.button name="purge"><@i18n.message key="Triggers.button.purge" /></@>
                <@form.button name="delete"><@i18n.message key="Triggers.button.delete" /></@>
            </div>
            <div class="toolbar-management">
                <@form.button name="view"><@i18n.message key="Triggers.button.view" /></@>
                <@form.button name="pause"><@i18n.message key="Triggers.button.pause" /></@>
                <@form.button name="resume"><@i18n.message key="Triggers.button.resume" /></@>
                <@form.button name="rerun"><@i18n.message key="Triggers.button.rerun" /></@>
                <@form.button name="kill"><@i18n.message key="Triggers.button.kill" /></@>
                <div role="menu" id="killqueuedmenu">
                    <div role="menuitem" aria-label="menu-kill-queued" data-options="name:'kill-queued'"><@i18n.message key="Triggers.button.killQueued" /></div>
                </div>
            </div>
        </div>
    </div>
</div>