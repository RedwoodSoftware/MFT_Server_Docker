<@form.dialog id="d-dirmonitors-add" title=i18n.text("DirectoryMonitors.AddDialog.title") header=i18n.text("DirectoryMonitors.AddDialog.info.short") description=i18n.text("DirectoryMonitors.AddDialog.info.long")>
    <div class="content">
        <div data-options="region:'center',border:false" class="wrap">
            <fieldset class="large">
                <legend><@i18n.message key="DirectoryMonitors.legend.basic" /></legend>

                <div><@form.dn name="name" required=true><@i18n.message key="DirectoryMonitors.label.name" /></@></div>
                <div><@form.checkbox name="usepartner"><@i18n.message key="DirectoryMonitors.label.partner" /></@><select name="partner"></select></div>
                <div><@form.path name="path" required=true><@i18n.message key="DirectoryMonitors.label.path" /></@></div>
                <div class="checkbox"><@form.checkbox name="recursive"><@i18n.message key="DirectoryMonitors.label.recursively" /></@></div>
            </fieldset>

            <fieldset>
                <legend><@i18n.message key="DirectoryMonitors.legend.settings" /></legend>

                <div>
                    <@form.checkbox name="timeoutenabled"><@i18n.message key="DirectoryMonitors.label.timeout" /></@>
                    <input type="text" name="timeout" maxlength="4"/><span>&nbsp;<@i18n.message key="DirectoryMonitors.label.timeoutUnit" /></span>
                </div>
                <div>
                    <@form.checkbox name="latencyenabled"><@i18n.message key="DirectoryMonitors.label.latency" /></@>
                    <input type="text" name="latency" maxlength="4"/><span>&nbsp;<@i18n.message key="DirectoryMonitors.label.latencyUnit" /></span>
                </div>
                <div><@form.checkbox name="ownedby"><@i18n.message key="DirectoryMonitors.label.owner" /></@><select name="owner"></select></div>
                <div class="checkbox">
                    <@form.checkbox name="quotaenabled"><@i18n.message key="DirectoryMonitors.label.enableQuota.1" />&nbsp;</@>
                    <span><@form.select name="quotatype" items={
                        "SOFT": i18n.text("DirectoryMonitors.quota.SOFT"),
                        "HARD": i18n.text("DirectoryMonitors.quota.HARD")
                    }/></span>
                    <@form.number name="quota" maxlength="7">&nbsp;<@i18n.message key="DirectoryMonitors.label.enableQuota.2" />&nbsp;</@>
                    <span><@form.select name="quotaunit" items={
                        "${(1024*1024)?c}": i18n.text("Application.size.megabyte"),
                        "${(1024*1024*1024)?c}": i18n.text("Application.size.gigabyte")
                    } /></span>
                </div>
            </fieldset>

            <fieldset>
                <legend><@i18n.message key="DirectoryMonitors.legend.events" /></legend>

                <div class="checkbox"><@form.checkbox name="monitoradd"><@i18n.message key="DirectoryMonitors.label.monitorAdding" /></@></div>
                <div class="checkbox"><@form.checkbox name="monitorchange"><@i18n.message key="DirectoryMonitors.label.monitorChanging" /></@></div>
                <div class="checkbox"><@form.checkbox name="monitordelete"><@i18n.message key="DirectoryMonitors.label.monitorDeleting" /></@></div>
                <div class="checkbox"><@form.checkbox name="monitorfailure"><@i18n.message key="DirectoryMonitors.label.monitorFailure" /></@></div>
                <div class="checkbox">
                    <@form.checkbox name="usemaxfileage"><@i18n.message key="DirectoryMonitors.label.maxFileAge" /></@>&nbsp;
                    <input type="text" name="maxfileage" maxlength="5"/>
                    <span>&nbsp;<@form.select name="maxfileageunit" items={
                        '${(60*1000)?c}': i18n.text("Application.period.minute")?html,
                        '${(60*60*1000)?c}': i18n.text("Application.period.hour")?html,
                        '${(24*60*60*1000)?c}': i18n.text("Application.period.day")?html} /></span>
                    </div>
                    <div class="checkbox">
                        <@form.checkbox name="useidletimeout"><@i18n.message key="DirectoryMonitors.label.idleTimeout" /></@>&nbsp;
                        <input type="text" name="idletimeout" maxlength="5"/>
                    <span>&nbsp;<@form.select name="idletimeoutunit" items={
                        '${(60*1000)?c}': i18n.text("Application.period.minute")?html,
                        '${(60*60*1000)?c}': i18n.text("Application.period.hour")?html,
                        '${(24*60*60*1000)?c}': i18n.text("Application.period.day")?html} /></span>
                    </div>
                    <div><@i18n.message key="DirectoryMonitors.label.raiseEvents.1" />&nbsp;<@form.select name="raiseevents" items={
                        "FIRST": i18n.text("DirectoryMonitors.raiseEventsInstance.first"),
                        "ALL": i18n.text("DirectoryMonitors.raiseEventsInstance.all")
                        }/>&nbsp;<span><@i18n.message key="DirectoryMonitors.label.raiseEvents.2" /></span>
                    </div>
            </fieldset>

            <fieldset>
                <legend><@i18n.message key="DirectoryMonitors.legend.tags" /></legend>
                <div><@form.select name="tags" items=[]><@i18n.message key="DirectoryMonitors.label.tags" /></@></div>
            </fieldset>
        </div>
    </div>
</@form.dialog>


<@form.dialog id="d-dirmonitors-edit" title=i18n.text("DirectoryMonitors.EditDialog.title") header=i18n.text("DirectoryMonitors.EditDialog.info.short") description=i18n.text("DirectoryMonitors.EditDialog.info.long")>
    <div class="content">
        <div data-options="region:'center',border:false" class="wrap">
            <fieldset class="large">
                <legend><@i18n.message key="DirectoryMonitors.legend.basic" /></legend>
                <div><@form.checkbox name="usepartner"><@i18n.message key="DirectoryMonitors.label.partner" /></@><select name="partner"></select></div>
                <div><@form.path name="path" required=true><@i18n.message key="DirectoryMonitors.label.path" /></@></div>
                <div class="checkbox"><@form.checkbox name="recursive"><@i18n.message key="DirectoryMonitors.label.recursively" /></@></div>
            </fieldset>

            <fieldset>
                <legend><@i18n.message key="DirectoryMonitors.legend.settings" /></legend>
                <div>
                    <@form.checkbox name="timeoutenabled"><@i18n.message key="DirectoryMonitors.label.timeout" /></@>
                    <input type="text" name="timeout" maxlength="4"/><span>&nbsp;<@i18n.message key="DirectoryMonitors.label.timeoutUnit" /></span>
                </div>
                <div>
                    <@form.checkbox name="latencyenabled"><@i18n.message key="DirectoryMonitors.label.latency" /></@>
                    <input type="text" name="latency" maxlength="4"/><span>&nbsp;<@i18n.message key="DirectoryMonitors.label.latencyUnit" /></span>
                </div>
                <div><@form.checkbox name="ownedby"><@i18n.message key="DirectoryMonitors.label.owner" /></@><select name="owner"></select></div>
                <div class="checkbox">
                    <@form.checkbox name="quotaenabled"><@i18n.message key="DirectoryMonitors.label.enableQuota.1" />&nbsp;</@>
                    <span><@form.select name="quotatype" items={
                        "SOFT": i18n.text("DirectoryMonitors.quota.SOFT"),
                        "HARD": i18n.text("DirectoryMonitors.quota.HARD")
                    }/></span>
                    <@form.number name="quota" maxlength="7">&nbsp;<@i18n.message key="DirectoryMonitors.label.enableQuota.2" />&nbsp;</@>
                    <span><@form.select name="quotaunit" items={
                        "${(1024*1024)?c}": i18n.text("Application.size.megabyte"),
                        "${(1024*1024*1024)?c}": i18n.text("Application.size.gigabyte")
                    } /></span>
                </div>
            </fieldset>

            <fieldset>
                <legend><@i18n.message key="DirectoryMonitors.legend.events" /></legend>
                <div class="checkbox"><@form.checkbox name="monitoradd"><@i18n.message key="DirectoryMonitors.label.monitorAdding" /></@></div>
                <div class="checkbox"><@form.checkbox name="monitorchange"><@i18n.message key="DirectoryMonitors.label.monitorChanging" /></@></div>
                <div class="checkbox"><@form.checkbox name="monitordelete"><@i18n.message key="DirectoryMonitors.label.monitorDeleting" /></@></div>
                <div class="checkbox"><@form.checkbox name="monitorfailure"><@i18n.message key="DirectoryMonitors.label.monitorFailure" /></@></div>
                <div class="checkbox">
                    <@form.checkbox name="usemaxfileage"><@i18n.message key="DirectoryMonitors.label.maxFileAge" /></@>&nbsp;
                    <input type="text" name="maxfileage" maxlength="5" />
                    <span>&nbsp;<@form.select name="maxfileageunit" items={
                    '${(60*1000)?c}': i18n.text("Application.period.minute")?html,
                    '${(60*60*1000)?c}': i18n.text("Application.period.hour")?html,
                    '${(24*60*60*1000)?c}': i18n.text("Application.period.day")?html} /></span>
                </div>
                <div class="checkbox">
                    <@form.checkbox name="useidletimeout"><@i18n.message key="DirectoryMonitors.label.idleTimeout" /></@>&nbsp;
                    <input type="text" name="idletimeout" maxlength="5" />
                    <span>&nbsp;<@form.select name="idletimeoutunit" items={
                    '${(60*1000)?c}': i18n.text("Application.period.minute")?html,
                    '${(60*60*1000)?c}': i18n.text("Application.period.hour")?html,
                    '${(24*60*60*1000)?c}': i18n.text("Application.period.day")?html} /></span>
                </div>
                <div><@i18n.message key="DirectoryMonitors.label.raiseEvents.1" />&nbsp;<@form.select name="raiseevents" items={
                    "FIRST": i18n.text("DirectoryMonitors.raiseEventsInstance.first"),
                    "ALL": i18n.text("DirectoryMonitors.raiseEventsInstance.all")
                }/>&nbsp;<span><@i18n.message key="DirectoryMonitors.label.raiseEvents.2" /></span></div>
            </fieldset>

            <fieldset>
                <legend><@i18n.message key="DirectoryMonitors.legend.tags" /></legend>
                <div><@form.select name="tags" items=[]><@i18n.message key="DirectoryMonitors.label.tags" /></@></div>
            </fieldset>
        </div>
    </div>
</@form.dialog>
