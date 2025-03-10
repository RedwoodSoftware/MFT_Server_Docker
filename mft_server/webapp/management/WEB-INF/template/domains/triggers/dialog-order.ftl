<@form.dialog id="d-triggers-eventtype" title=i18n.text("Triggers.EventTypeDialog.title") header=i18n.text("Triggers.EventTypeDialog.info.short") description=i18n.text("Triggers.EventTypeDialog.info.long")>
    <fieldset class="noborder pane">
        <div><@form.select name="event" items={} description=i18n.text("Triggers.label.eventType")><@i18n.message key="Triggers.label.eventType" /></@></div>
    </fieldset>
</@form.dialog>

<@form.dialog id="d-triggers-order" disabled=!permissions.triggersControlAllowed title=i18n.text("Triggers.OrderDialog.title") header=i18n.text("Triggers.OrderDialog.info.short") description=i18n.text("Triggers.OrderDialog.info.long")>
    <div class="content">
        <div data-options="region:'north',border:false">
            <div class="wrap"><@form.dn name="eventtype" required=false><@i18n.message key="Triggers.OrderDialog.label.eventType" /></@></div>
        </div>

        <div data-options="region:'center',border:false">
            <div><@form.datagrid name="triggersorder" columns=['name']; col><@i18n.message key="Triggers.column.${col}" /></@></div>
        </div>

        <div data-options="region:'south',border:false">
            <div class="viewpane-toolbar inline">
                <div class="toolbar-selection">
                    <@form.button name="moveup"><@i18n.message key="Application.button.up" /></@>
                    <@form.button name="movedown"><@i18n.message key="Application.button.down" /></@>
                </div>
            </div>
        </div>
    </div>
</@form.dialog>