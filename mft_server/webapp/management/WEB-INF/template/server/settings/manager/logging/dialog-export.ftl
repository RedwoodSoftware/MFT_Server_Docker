<@form.dialog id="d-managerlogs-export" title=i18n.text("ManagerLogs.ExportDialog.title")>
    <@form.fields name="exportfields" title=i18n.text("ManagerLogs.ExportDialog.info.short") description=i18n.text("ManagerLogs.ExportDialog.info.long")>
        <div><@form.dn name="filename" required=true><@i18n.message key="ManagerLogs.label.filename" /></@></div>
    </@form.fields>
</@form.dialog>