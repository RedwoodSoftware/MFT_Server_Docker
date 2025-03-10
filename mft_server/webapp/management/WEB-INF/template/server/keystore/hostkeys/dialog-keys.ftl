<@form.dialog id="d-hostkey-verifycrl" title=i18n.text("HostKeys.VerifyCrlDialog.title")>
    <fieldset name="verifyhostkeycrlfields" class="content">
        <@form.fields_title title=i18n.text("HostKeys.VerifyCrlDialog.info.short") description=i18n.text("HostKeys.VerifyCrlDialog.info.long") />
        <div><@form.input type="file" name="file" required=true><@i18n.message key="HostKeys.VerifyCrlDialog.label.file" /></@></div>
    </fieldset>
</@form.dialog>
