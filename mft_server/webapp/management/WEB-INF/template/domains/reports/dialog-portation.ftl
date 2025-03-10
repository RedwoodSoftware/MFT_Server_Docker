<@form.dialog id="d-reports-export" title=i18n.text("Reports.ExportDialog.title")>
    <@form.fields name="exportfields" title=i18n.text("Reports.ExportDialog.info.short") description=i18n.text("Reports.ExportDialog.info.long")>
        <div><@form.dn name="filename" required=true><@i18n.message key="Reports.ExportDialog.label.file" /></@></div>
    </@form.fields>
</@form.dialog>
