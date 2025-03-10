<@form.dialog id="d-group-add" title=i18n.text("Groups.AddDialog.title")>
    <div id="d-group-fields" class="content">
        <div data-options="region:'north',border:false">
            <h6><@i18n.message key="Groups.AddDialog.info.short" /><span><@i18n.message key="Groups.AddDialog.info.long" /></span></h6>
        </div>

        <div data-options="region:'center',border:false" class="wrap">
            <div class="content">
                <div data-options="region:'north',border:false">
                    <fieldset>
                        <legend><@i18n.message key="Groups.legend.basic" /></legend>
                        <div><@form.dn name="name" required=true><@i18n.message key="Groups.label.name" /></@></div>
                        <div class="checkbox"><@form.checkbox name="useinadhoc"><@i18n.message key="Groups.label.adHocAllowed" /></@></div>
                    </fieldset>
                </div>

                <div data-options="region:'center',border:false">
                    <fieldset>
                        <legend><@i18n.message key="Groups.legend.paths" /></legend>

                        <div><@form.datagrid name="paths" height="" columns=["path", "mapping", "permission"]; col><@i18n.message key="VirtualFiles.column.${col}" /></@></div>

                        <div class="viewpane-toolbar inline">
                            <div class="toolbar-selection">
                                <@form.button name="moveup"><@i18n.message key="VirtualFiles.button.moveUp" /></@>
                                <@form.button name="movedown"><@i18n.message key="VirtualFiles.button.moveDown" /></@>
                            </div>
                            <div class="toolbar-management">
                                <@form.button name="add"><@i18n.message key="VirtualFiles.button.add" /></@>
                                <@form.button name="edit"><@i18n.message key="VirtualFiles.button.edit" /></@>
                                <@form.button name="delete"><@i18n.message key="VirtualFiles.button.delete" /></@>
                            </div>
                        </div>
                    </fieldset>
                </div>

                <div data-options="region:'south',border:false">
                    <fieldset>
                        <legend><@i18n.message key="Groups.legend.tags" /></legend>
                        <div><@form.select name="tags" items=[]><@i18n.message key="Groups.label.tags" /></@></div>
                    </fieldset>
                </div>
            </div>
        </div>
    </div>
</@form.dialog>


<@form.dialog id="d-group-edit" title=i18n.text("Groups.EditDialog.title")>
    <div id="d-group-fields" class="content">
        <div data-options="region:'north',border:false">
            <h6><@i18n.message key="Groups.EditDialog.info.short" /><span><@i18n.message key="Groups.EditDialog.info.long" /></span></h6>
        </div>

        <div data-options="region:'center',border:false" class="wrap">
            <div class="content">
                <div data-options="region:'north',border:false">
                    <fieldset>
                        <legend><@i18n.message key="Groups.legend.basic" /></legend>
                        <div class="checkbox"><@form.checkbox name="useinadhoc"><@i18n.message key="Groups.label.adHocAllowed" /></@></div>
                    </fieldset>
                </div>

                <div data-options="region:'center',border:false">
                    <fieldset>
                        <legend><@i18n.message key="Groups.legend.paths" /></legend>

                        <div><@form.datagrid name="paths" height="" columns=["path", "mapping", "permission"]; col><@i18n.message key="VirtualFiles.column.${col}" /></@></div>

                        <div class="viewpane-toolbar inline">
                            <div class="toolbar-selection">
                                <@form.button name="moveup"><@i18n.message key="VirtualFiles.button.moveUp" /></@>
                                <@form.button name="movedown"><@i18n.message key="VirtualFiles.button.moveDown" /></@>
                            </div>
                            <div class="toolbar-management">
                                <@form.button name="add"><@i18n.message key="VirtualFiles.button.add" /></@>
                                <@form.button name="edit"><@i18n.message key="VirtualFiles.button.edit" /></@>
                                <@form.button name="delete"><@i18n.message key="VirtualFiles.button.delete" /></@>
                            </div>
                        </div>
                    </fieldset>
                </div>

                <div data-options="region:'south',border:false">
                    <fieldset>
                        <legend><@i18n.message key="Groups.legend.tags" /></legend>
                        <div><@form.select name="tags" items=[]><@i18n.message key="Groups.label.tags" /></@></div>
                    </fieldset>
                </div>
            </div>
        </div>
    </div>
</@form.dialog>


<@form.dialog id="d-group-copy" title=i18n.text("Groups.CopyDialog.title")>
    <fieldset name="copygroupfields" class="content">
        <@form.fields_title title=i18n.text("Groups.CopyDialog.info.short") description=i18n.text("Groups.CopyDialog.info.long") />
        <div><@form.dn name="name" required=true size="40" tabindex="0"><@i18n.message key="Groups.label.name" /></@></div>
    </fieldset>
</@form.dialog>


<@form.dialog id="d-group-users" title=i18n.text("Groups.UsersDialog.title")>
    <fieldset name="groupusersfields" class="content">
        <@form.fields_title title=i18n.text("Groups.UsersDialog.info.short") description=i18n.text("Groups.UsersDialog.info.long")/>
        <div><@form.datagrid name="users" height="300px" columns=[]/></div>
    </fieldset>
</@form.dialog>

<@form.dialog id="d-group-email" title=i18n.text("Groups.EmailDialog.title")>
    <fieldset class="content" style="padding:1.7em 2em">
        <div><@form.text name="subject" required=true><@i18n.message "Groups.EmailDialog.label.subject" /></@></div>
        <div><@form.memo name="message" required=true><@i18n.message "Groups.EmailDialog.label.message" /></@></div>
    </fieldset>
</@form.dialog>