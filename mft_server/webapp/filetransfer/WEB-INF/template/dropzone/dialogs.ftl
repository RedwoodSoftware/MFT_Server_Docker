<@form.dialog id="d-upload-formselection" title=i18n.text("Upload.Form.title")?html escapeAttrs=false>
    <@form.fields name="uploadformselectionfields" title=i18n.text("Upload.Form.info.short")?html description=i18n.text("Upload.Form.info.long")?html>
    <dl class="group">
        <dt><@form.label for="uploadformtype"><@i18n.message key="Upload.Form.label.form" /></@></dt>
        <dd><@form.select id="uploadformtype" name="uploadform" items=[] required=true/></dd>
        <dt><@i18n.message key="Upload.Form.label.description" /></dt>
        <dd><span aria-label="description"></span></dd>
    </dl>
    </@form.fields>
</@form.dialog>

<@form.dialog id="d-upload-form" title=i18n.text("Upload.Form.title")?html escapeAttrs=false></@form.dialog>
