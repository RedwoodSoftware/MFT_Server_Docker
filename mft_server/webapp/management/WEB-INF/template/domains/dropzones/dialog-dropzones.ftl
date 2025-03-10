<#macro dropzone_fields name>
    <fieldset name="${name?html}">
        <#nested />
        <div><@form.path name="path" required=true><@i18n.message key="DropZones.label.path" /></@></div>
        <div><label><@i18n.message key="DropZones.label.user" /></label><select name="account"></select></div>
        <div><@form.password name="password" required=false><@i18n.message key="DropZones.label.password" /></@></div>
        <div><@form.password name="confirmpwd" required=false><@i18n.message key="DropZones.label.confirmPassword" /></@></div>
        <div><@form.checkbox name="ownedby"><@i18n.message key="DropZones.label.owner" /></@><select name="owner"></select></div>
        <div><@form.checkbox name="brandedby"><@i18n.message key="DropZones.label.urlBranding" /></@><select name="webtheme"></select></div>
        <div><@form.select name="tags" items=[]><@i18n.message key="DropZones.label.tags" /></@></div>
        <div class="checkbox"><@form.checkbox name="createpath"><@i18n.message key="DropZones.label.createPathIfNotExists" /></@></div>
        <div class="checkbox"><@form.checkbox name="overwrite"><@i18n.message key="DropZones.label.overwriteFileIfExists" /></@></div>
    </fieldset>
</#macro>


<@form.dialog id="d-dropzone-add" title=i18n.text("DropZones.AddDialog.title")>
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


<@form.dialog id="d-dropzone-edit" title=i18n.text("DropZones.EditDialog.title")>
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
                    <label><@i18n.message key="DropZones.label.url" /></label><span aria-label="zoneuri"></span>
                    <@form.button name="copylink" ariaHaspopup="true" style="margin-left:1em"><@i18n.message key="DropZones.button.copyLink" /></@>
                </div>
            </fieldset>
        </div>
    </div>
</@form.dialog>