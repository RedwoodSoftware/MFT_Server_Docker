<div id="failover-ip-substitution-fields" class="easyui-layout" data-options="fit:true,doSize:false,border:false">
    <div data-options="region:'center'" style="padding: 16px">

        <div class="easyui-layout" data-options="fit:true,doSize:false,border:false">
            <div data-options="region:'center',border:false">
                <@form.datagrid name="ipsubstitution" height="" columns=["ip", "substitution"]; col><@i18n.message key="IPSubstitution.column.${col}" /></@>
            </div>

            <div data-options="region:'south',border:false" class="layout-pane-bottom">
                <div class="viewpane-toolbar toolbar-management inline">
                <@form.button name="add"><@i18n.message key="IPSubstitution.button.add" /></@>
                <@form.button name="edit"><@i18n.message key="IPSubstitution.button.edit" /></@>
                <@form.button name="delete"><@i18n.message key="IPSubstitution.button.delete" /></@>
                </div>
            </div>
        </div>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar toolbar-management inline">
            <@form.button name="apply"><@i18n.message key="Application.button.apply" /></@>
            <@form.button name="discard"><@i18n.message key="Application.button.discard" /></@>
        </div>
    </div>
</div>

<@form.dialog id="d-failover-addrule" title=i18n.text("IPSubstitution.AddDialog.title")>
    <@form.fields name="failoveripsubstitutionrulefields" title=i18n.text("IPSubstitution.info.short") description=i18n.text("IPSubstitution.info.long")>
        <div><@form.host name="ip" size="40" maxlength="255" required=true><@i18n.message key="IPSubstitution.label.ip" /></@></div>
        <div><@form.text name="substitution" size="40" maxlength="255" required=true><@i18n.message key="IPSubstitution.label.substitution" /></@></div>
    </@form.fields>
</@form.dialog>
<@form.dialog id="d-failover-editrule" title=i18n.text("IPSubstitution.EditDialog.title")>
    <@form.fields name="failoveripsubstitutionrulefields" title=i18n.text("IPSubstitution.info.short") description=i18n.text("IPSubstitution.info.long")>
        <div><@form.host name="ip" size="40" maxlength="255" required=true><@i18n.message key="IPSubstitution.label.ip" /></@></div>
        <div><@form.text name="substitution" size="40" maxlength="255" required=true><@i18n.message key="IPSubstitution.label.substitution" /></@></div>
    </@form.fields>
</@form.dialog>