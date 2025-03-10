<@form.dialog id="d-storage-cwd" title=i18n.text("Storage.ChangeDirDialog.title")?html escapeAttrs=false>
    <fieldset name="cwdfields" class="content">
        <legend class="hidden-label"><@i18n.message key="Storage.ChangeDirDialog.title" /></legend>
        <div class="row"><@form.path name="path"><@i18n.message key="Storage.ChangeDirDialog.label.path" /></@></div>
    </fieldset>
</@form.dialog>

<@form.dialog id="d-storage-mkdir" title=i18n.text("Storage.MakeDirDialog.title")?html escapeAttrs=false>
    <fieldset name="mkdirfields" class="content">
        <legend class="hidden-label"><@i18n.message key="Storage.MakeDirDialog.title" /></legend>
        <div class="row"><@form.path name="name"><@i18n.message key="Storage.MakeDirDialog.label.name" /></@></div>
    </fieldset>
</@form.dialog>

<@form.dialog id="d-storage-tagfile" title=i18n.text("Storage.TagDialog.title")?html escapeAttrs=false>
    <fieldset name="tagfilefields">
        <legend class="hidden-label"><@i18n.message key="Storage.TagDialog.title" /></legend>
        <div><@form.path name="file"><@i18n.message key="Storage.TagDialog.label.document" /></@></div>
        <div><@form.text name="keywords"><@i18n.message key="Storage.TagDialog.label.keywords" /></@></div>
        <div class="row"><span class="desc"><@i18n.message key="Storage.TagDialog.desciption.keywords" /></span></div>
    </fieldset>
</@form.dialog>

<@form.dialog id="d-storage-tagfilebatch" title=i18n.text("Storage.TagBatchDialog.title")?html escapeAttrs=false>
    <fieldset name="tagfilefields">
        <legend class="hidden-label"><@i18n.message key="Storage.TagBatchDialog.title" /></legend>
        <div><@form.path name="files" style="height:100px"><@i18n.message key="Storage.TagBatchDialog.label.documents" /></@></div>
        <div><@form.text name="keywords"><@i18n.message key="Storage.TagBatchDialog.label.keywords" /></@></div>
        <div class="row"><span class="desc"><@i18n.message key="Storage.TagDialog.desciption.keywords" /></span></div>
    </fieldset>
</@form.dialog>

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
