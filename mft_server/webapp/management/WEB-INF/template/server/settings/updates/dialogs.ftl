<@form.dialog id="d-settings-automatic-history" title=i18n.text("AutomaticUpdates.title")>
    <div class="ui-dialog-layout">
        <div data-options="region:'center',border:false" class="wrap">
            <@form.input name="log" />
        </div>
    </div>
</@form.dialog>


<@form.dialog id="d-settomgs-updates-dload" title=i18n.text("AutomaticUpdates.DownloadDialog.title") dataOptions="buttons:'#d-settings-automatic-updates-buttons'">
    <div class="wrap">
        <div id="dload-status"><@i18n.message key="AutomaticUpdates.DownloadDialog.label.downloadProgress" /></div>
        <div id="dload-progress"></div>
        <div id="dload-elapsed" aria-label="${i18n.text("AutomaticUpdates.DownloadDialog.label.elapsedTime")?js_string}"></div>
    </div>
</@form.dialog>