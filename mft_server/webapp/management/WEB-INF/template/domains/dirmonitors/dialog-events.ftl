<@form.dialog id="d-dirmonitors-events-clear" title=i18n.text("DirectoryMonitors.PurgeEventsDialog.title") header=i18n.text("DirectoryMonitors.PurgeEventsDialog.info.short")>
    <fieldset class="xx-large noborder">
        <div><@form.number name="period"><@i18n.message key="DirectoryMonitors.label.eventsExpirationPeriod" /></@>&nbsp;<span><@i18n.message key="DirectoryMonitors.label.eventsExpirationPeriodUnit" /></span></div>
    </fieldset>
</@form.dialog>


<@form.dialog id="d-dirmonitors-events-reraise" title=i18n.text("DirectoryMonitors.ReRaiseEventDialog.title") header=i18n.text("DirectoryMonitors.ReRaiseEventDialog.info.short")>
    <fieldset class="noborder pane">
        <div><span role="alert"><@i18n.message key="DirectoryMonitors.ReRaiseEventDialog.message" /></span></div>
        <div class="checkbox"><@form.checkbox name="maintaindata"><@i18n.message key="DirectoryMonitors.ReRaiseEventDialog.label.maintainData" /></@></div>
    </fieldset>
</@form.dialog>


<@form.dialog id="d-dirmonitors-events-raise" title=i18n.text("DirectoryMonitors.RaiseEventDialog.title") header=i18n.text("DirectoryMonitors.RaiseEventDialog.info.short") description=i18n.text("DirectoryMonitors.RaiseEventDialog.info.long")>
    <fieldset class="large noborder">
        <div><@form.select name="dirmonitor" required=true items={}><@i18n.message key="DirectoryMonitors.column.monitorName" /></@></div>
        <div><@form.path name="path" required=true><@i18n.message key="DirectoryMonitors.label.eventPath" /></@></div>
        <div><@form.select name="event" items={
                'FILE': i18n.text("DirectoryMonitors.events.template", i18n.text("DirectoryMonitors.events.FILE")),
                'FILE_ADDED': i18n.text("DirectoryMonitors.events.template", i18n.text("DirectoryMonitors.events.FILE_ADDED")),
                'FILE_AGED': i18n.text("DirectoryMonitors.events.template", i18n.text("DirectoryMonitors.events.FILE_AGED")),
                'FILE_CHANGED': i18n.text("DirectoryMonitors.events.template", i18n.text("DirectoryMonitors.events.FILE_CHANGED")),
                'FILE_DELETED': i18n.text("DirectoryMonitors.events.template", i18n.text("DirectoryMonitors.events.FILE_DELETED")),
                'QUOTA_EXCEEDED': i18n.text("DirectoryMonitors.events.template", i18n.text("DirectoryMonitors.events.QUOTA_EXCEEDED"))
            }><@i18n.message key="DirectoryMonitors.column.eventType" /></@>
        </div>
        <div><@form.select name="fileevent" items={
                'FILE_ADDED': i18n.text("DirectoryMonitors.events.FILE_ADDED"),
                'FILE_AGED': i18n.text("DirectoryMonitors.events.FILE_AGED"),
                'FILE_CHANGED': i18n.text("DirectoryMonitors.events.FILE_CHANGED"),
                'FILE_DELETED': i18n.text("DirectoryMonitors.events.FILE_DELETED")
            }><@i18n.message key="DirectoryMonitors.column.fileEventType" /></@>
        </div>
    </fieldset>
</@form.dialog>