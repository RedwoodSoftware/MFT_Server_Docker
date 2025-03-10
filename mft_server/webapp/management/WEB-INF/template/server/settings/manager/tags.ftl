<div id="acl-tags-fields" class="easyui-layout" data-options="fit:true,doSize:false,border:false">
    <div data-options="region:'center',border:false">
        <@form.datagrid name="tags" height="" columns=["name"]; col><@i18n.message key="Tags.column.${col}" /></@>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar toolbar-management inline">
            <@form.button name="add"><@i18n.message key="Tags.button.add" /></@>
            <@form.button name="delete"><@i18n.message key="Tags.button.delete" /></@>
        </div>
    </div>
</div>


<@form.dialog id="d-setting-acl-addtag" title=i18n.text("Tags.AddDialog.title") header=i18n.text("Tags.AddDialog.info.short") description=i18n.text("Tags.AddDialog.info.long")>
    <fieldset class="noborder pane">
        <div><@form.dn name="name" required=true><@i18n.message key="Tags.label.name" /></@></div>
    </fieldset>
</@form.dialog>