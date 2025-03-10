<#macro dropzone_fields name>
    <fieldset name="${name?html}">
        <#nested />
        <div><@form.select name="account" items=[] required="true"><@i18n.message key="DropZones.label.account" /></@></div>
        <div><@form.input name="path" required="true"><@i18n.message key="DropZones.label.path" /></@></div>
        <div><@form.password name="password" required=false><@i18n.message key="DropZones.label.password" /></@></div>
        <div><@form.password name="confirmpwd" required=false><@i18n.message key="DropZones.label.confirmPassword" /></@></div>
        <div class="row"><@form.checkbox name="createpath"><@i18n.message key="DropZones.label.createPathIfNotExists" /></@></div>
        <div class="row"><@form.checkbox name="overwritefile"><@i18n.message key="DropZones.label.overwriteFileIfExists" /></@></div>
        <div class="row"><@form.checkbox name="brandedby"><@i18n.message key="DropZones.label.urlBranding" /></@>&nbsp;<@form.select name="theme" items=[] title=i18n.text("DropZones.label.urlBranding")?html/></div>
    </fieldset>
</#macro>

<@form.dialog id="d-dropzone-add" title=i18n.text('DropZones.AddDialog.title')?html escapeAttrs=false>
    <div class="content">
        <div data-options="region:'north',border:false">
            <h6><@i18n.message key="DropZones.AddDialog.info.short" /><span><@i18n.message key="DropZones.AddDialog.info.long" /></span></h6>
        </div>
        <div data-options="region:'center',border:false">
            <@dropzone_fields name="dropzonefields">
                <div><@form.dn name="name" required=true><@i18n.message key="DropZones.label.name" /></@></div>
            </@>
        </div>
    </div>
</@form.dialog>

<@form.dialog id="d-dropzone-edit" title=i18n.text('DropZones.EditDialog.title')?html escapeAttrs=false>
    <div class="content">
        <div data-options="region:'north',border:false">
            <h6><@i18n.message key="DropZones.EditDialog.info.short" /><span><@i18n.message key="DropZones.EditDialog.info.long" /></span></h6>
        </div>
        <div data-options="region:'center',border:false">
            <@dropzone_fields name="dropzonefields" />
        </div>
        <div data-options="region:'south',border:false">
            <fieldset class="noborder">
                <div>
                    <span style="display:inline-block;width:9em;"><@i18n.message "DropZones.label.url" /></span>
                    <span aria-label="zoneuri" aria-readonly="true"></span><@form.button name="copylink" ariaHaspopup="true" style="margin-left:1em"><@i18n.message key="DropZones.button.copyLink" /></@>
                </div>
            </fieldset>
        </div>
    </div>
</@form.dialog>