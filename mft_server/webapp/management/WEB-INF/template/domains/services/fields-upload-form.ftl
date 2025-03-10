<div><@form.text name="description" size="40" maxlength="255"><@i18n.message key="Services.UploadForms.label.description" /></@></div>
<div class="radio"><span style="width:9em;float:left"><@i18n.message key="Services.UploadForms.label.prompt" /></span>
    <@form.radio name="prompt" value="batch"><@i18n.message key="Services.UploadForms.label.batch" /></@>&nbsp;&nbsp;
    <@form.radio name="prompt" value="file"><@i18n.message key="Services.UploadForms.label.file" /></@>
</div>
<div><@form.checkbox name="grouprequired"><@i18n.message key="Services.UploadForms.label.group" /></@><select name="group"></select></div>
<div class="checkbox"><@form.checkbox name="enabled"><@i18n.message key="Services.UploadForms.label.enabled" /></@></div>

<fieldset>
    <legend><@i18n.message key="Services.UploadForms.legend.elements" /></legend>
    <div><@form.datagrid name="inputs" height="200px" columns=["name", "type", "value", "required"]; col><@i18n.message key="Services.UploadForms.column.${col}" /></@></div>

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
</fieldset>