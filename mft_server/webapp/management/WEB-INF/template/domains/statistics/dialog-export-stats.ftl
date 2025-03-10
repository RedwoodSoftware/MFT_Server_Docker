<@form.dialog id="d-statistics-export" title=i18n.text("Statistics.ExportDialog.title")>
    <fieldset name="exportstatsfields">
        <h6><span><@i18n.message key="Statistics.ExportDialog.info.short" /></span></h6>
        <div><@form.dn name="filename" required=true dataOptions="missingMessage:'" + i18n.text("Statistics.Error.badFilename")?js_string + "'"><@i18n.message key="Statistics.ExportDialog.label.file" /></@></div>
    </fieldset>
</@form.dialog>