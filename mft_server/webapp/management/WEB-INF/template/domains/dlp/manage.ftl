<div id="dlp-rules-fields">
    <div data-options="region:'center',border:false">
        <@form.datagrid name="dlprules" height="" columns=["name", "description", "scope", "expression"]; col><@i18n.message key="DlpRules.column.${col}" /></@>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar toolbar-management inline">
            <@form.button name="add"><@i18n.message key="DlpRules.button.add" /></@>
            <@form.button name="edit"><@i18n.message key="DlpRules.button.edit" /></@>
            <@form.button name="delete"><@i18n.message key="DlpRules.button.delete" /></@>
        </div>
    </div>
</div>

