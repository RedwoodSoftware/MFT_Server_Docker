<@form.dialog id="d-services-uploadforms" title=i18n.text("Services.FormsDialog.title")>
    <@form.fields name="uploadformsfields" title=i18n.text("Services.FormsDialog.info.short") description=i18n.text("Services.FormsDialog.info.long") disabled=!permissions.domainServicesControlAllowed>
        <div><@form.datagrid name="uploadforms" columns=["name", "enabled"]; col><@i18n.message key="Services.FormsDialog.column.${col}" /></@></div>

        <div class="viewpane-toolbar">
            <div class="toolbar-selection">
                <@form.button name="moveup"><@i18n.message key="Application.button.up" /></@>
                <@form.button name="movedown"><@i18n.message key="Application.button.down" /></@>
            </div>
            <div class="toolbar-management">
                <@form.button name="add"><@i18n.message key="Services.button.add" /></@>
                <@form.button name="edit"><@i18n.message key="Services.button.edit" /></@>
                <@form.button name="delete"><@i18n.message key="Services.button.delete" /></@>
            </div>
        </div>
    </@form.fields>
</@form.dialog>

<@form.dialog id="d-uploadforms-add" title=i18n.text("Services.UploadForms.AddDialog.title")>
    <@form.fields name="uploadformfields" title=i18n.text("Services.UploadForms.AddDialog.info.short") description=i18n.text("Services.UploadForms.AddDialog.info.long")>
        <div><@form.dn name="name" size="40" required=true><@i18n.message key="Services.UploadForms.label.name" /></@></div>
        <#include "fields-upload-form.ftl" />
    </@form.fields>
</@form.dialog>

<@form.dialog id="d-uploadforms-edit" title=i18n.text("Services.UploadForms.EditDialog.title")>
    <@form.fields name="uploadformfields" title=i18n.text("Services.UploadForms.EditDialog.info.short") description=i18n.text("Services.UploadForms.EditDialog.info.long")>
        <#include "fields-upload-form.ftl" />
    </@form.fields>
</@form.dialog>

<@form.dialog id="d-uploadforms-addfield" title=i18n.text("Services.UploadForms.AddFieldDialog.title")>
    <@form.fields name="uploadforminputfields" title=i18n.text("Services.UploadForms.AddFieldDialog.info.short") description=i18n.text("Services.UploadForms.AddFieldDialog.info.long")>
        <div><@form.dn name="name" size="30" required=true><@i18n.message key="Services.UploadForms.label.name" /></@></div>
        <div><@form.text name="label" size="30" maxlength=255><@i18n.message key="Services.UploadForms.label.label" /></@></div>
        <div><@form.select name="type" items={
                'TEXT': i18n.text("Services.UploadForms.type.TEXT"),
                'MEMO': i18n.text("Services.UploadForms.type.MEMO"),
                'DROPDOWN': i18n.text("Services.UploadForms.type.DROPDOWN"),
                'MULTISELECT': i18n.text("Services.UploadForms.type.MULTISELECT"),
                'RADIO': i18n.text("Services.UploadForms.type.RADIO")
            }><@i18n.message key="Services.UploadForms.label.type" /></@>
        </div>
        <div><@form.text name="value" size="30" maxlength="255"><@i18n.message key="Services.UploadForms.label.value" /></@></div>
        <div class="checkbox"><@form.checkbox name="required"><@i18n.message key="Services.UploadForms.label.required" /></@></div>
    </@form.fields>
</@form.dialog>

<@form.dialog id="d-uploadforms-editfield" title=i18n.text("Services.UploadForms.EditFieldDialog.title")>
    <@form.fields name="uploadforminputfields" title=i18n.text("Services.UploadForms.EditFieldDialog.info.short") description=i18n.text("Services.UploadForms.EditFieldDialog.info.long")>
        <div><@form.text name="label" size="30" maxlength=255><@i18n.message key="Services.UploadForms.label.label" /></@></div>
        <div><@form.select name="type" items={
                'TEXT': i18n.text("Services.UploadForms.type.TEXT"),
                'MEMO': i18n.text("Services.UploadForms.type.MEMO"),
                'DROPDOWN': i18n.text("Services.UploadForms.type.DROPDOWN"),
                'MULTISELECT': i18n.text("Services.UploadForms.type.MULTISELECT"),
                'RADIO': i18n.text("Services.UploadForms.type.RADIO")
            }><@i18n.message key="Services.UploadForms.label.type" /></@>
        </div>
        <div><@form.text name="value" size="30" maxlength="255"><@i18n.message key="Services.UploadForms.label.value" /></@></div>
        <div class="checkbox"><@form.checkbox name="required"><@i18n.message key="Services.UploadForms.label.required" /></@></div>
    </@form.fields>
</@form.dialog>