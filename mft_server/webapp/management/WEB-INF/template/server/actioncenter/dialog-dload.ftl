<@form.dialog id="d-server-dload-update" title=i18n.text("ActionCenter.DownloadUpdateDialog.title") dataOptions="buttons:'#d-actioncenter-dload-update-buttons'">
    <div class="wrap" style="line-height:2">
        <div id="dload-status"><@i18n.message key="ActionCenter.DownloadUpdateDialog.label.downloadProgress" /></div>
        <div id="dload-progress"></div>
        <div id="dload-elapsed" aria-label="${i18n.text("ActionCenter.DownloadUpdateDialog.label.elapsedTime")?js_string}" style="font-size: 90%;display:inline-block;"></div>
        <div id="dload-instruction" aria-label="${i18n.text("ActionCenter.Message.manualUpgradeInfo")}"></div>
    </div>
</@form.dialog>