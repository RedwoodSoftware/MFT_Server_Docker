<@form.dialog id="d-monitor-triggers" title=i18n.text("DirectoryMonitors.TriggersDialog.title") header=i18n.text("DirectoryMonitors.TriggersDialog.info.short") description=i18n.text("DirectoryMonitors.TriggersDialog.info.long")>
    <div class="content">
        <div data-options="region:'north',border:false" style="padding:.7em 0">
            <@form.input name="search" dataOptions="prompt:'${i18n.text('DirectoryMonitors.TriggersDialog.label.findItem')?js_string}'" />
        </div>

        <div data-options="region:'center',border:false">
            <@form.datalist name="triggers" items=[] dataOptions="emptyMsg:'${i18n.text('DirectoryMonitors.TriggersDialog.Message.noItems')?js_string}'"/>
        </div>
    </div>
</@form.dialog>