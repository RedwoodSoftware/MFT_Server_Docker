<@form.dialog id="d-trigger-state-clear" title=i18n.text("Triggers.ClearStateDialog.title")>
    <fieldset name="cleartriggerstatefields" class="x-large">
        <@form.fields_title title=i18n.text("Triggers.ClearStateDialog.info.short")/>
        <div><span style="color:red"><@i18n.message key="Triggers.ClearStateDialog.warning" /></span></div>
        <div><@form.number name="period" maxlength="8"><@i18n.message key="Triggers.label.recentTriggerExpirationPeriod" /></@>&nbsp;<span><@i18n.message key="Triggers.label.recentTriggerExpirationPeriodUnit" /></span></div>
    </fieldset>
</@form.dialog>

<@form.dialog id="d-trigger-recent" title=i18n.text("Triggers.StateDialog.title")>
    <div id="d-trigger-recent-content">
        <div data-options="region:'north',border:false">
            <h6><@i18n.message key="Triggers.StateDialog.info.short" /><span><@i18n.message key="Triggers.StateDialog.info.long" /></span></h6>
        </div>
        <div data-options="region:'center',border:false" class="wrap">
            <div class="content">
                <div data-options="region:'north',border:false">
                <fieldset class="pane noborder">
                    <dl class="group">
                        <dt><@i18n.message key="Triggers.StateDialog.label.eventId" /></dt><dd><code aria-label="event-id"></code></dd>
                        <dt><@i18n.message key="Triggers.StateDialog.label.eventType" /></dt><dd><code aria-label="event-type"></code></dd>
                        <dt><@i18n.message key="Triggers.StateDialog.label.triggerName" /></dt><dd><code aria-label="trigger-name"></code></dd>
                        <dt><@i18n.message key="Triggers.StateDialog.label.startTime" /></dt><dd><code aria-label="start-time"></code></dd>
                        <dt><@i18n.message key="Triggers.StateDialog.label.endTime" /></dt><dd><code aria-label="end-time"></code></dd>
                        <dt><@i18n.message key="Triggers.StateDialog.label.status" /></dt><dd><code aria-label="status"></code></dd>
                    </dl>
                </fieldset>
                </div>
                <div data-options="region:'center',border:false">
                    <div class="content">
                        <div data-options="region:'north',border:false,minHeight:'40%',collapsible:true,title:'${i18n.text("Triggers.StateDialog.label.actionHistory")?js_string}'" class="wrap">
                            <@form.datagrid name="action-history" columns=["action", "status", "actionMessage", "triggerError", "startTime", "endTime"] height=""; col><@i18n.message key="Triggers.StateDialog.column.${col}" /></@>
                        </div>
                        <div data-options="region:'center',border:false,height:'auto',title:'${i18n.text("Triggers.StateDialog.label.eventVariables")?js_string}'" class="wrap">
                            <@form.datagrid name="event-parameters" columns=[] height="" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</@form.dialog>

<@form.dialog id="d-kill-trigger" title=i18n.text("Triggers.KillQueuedDialog.title")>
    <fieldset name="killtriggerfields" class="x-large">
        <@form.fields_title title=i18n.text("Triggers.KillQueuedDialog.info.short") description=i18n.text("Triggers.KillQueuedDialog.info.long")/>
        <div name="killMessage" class="dialog-message">Warning: Killing queued triggers!</div>
        <label for="confirmation-checkbox"><input type="checkbox" name="confirmation" id="confirmation-checkbox"/> <@i18n.message key="Triggers.KillQueuedDialog.confirmation" /></label>
    </fieldset>
</@form.dialog>

<@form.dialog id="d-no-queued-triggers" title=i18n.text("Triggers.NoQueuedTriggersDialog.title")>
    <fieldset name="noqueuedtriggerfields" class="x-large">
        <div name="noQueuedMessage" class="dialog-message"><@i18n.message key="Triggers.NoQueuedTriggersDialog.message" /></div>
    </fieldset>
</@form.dialog>