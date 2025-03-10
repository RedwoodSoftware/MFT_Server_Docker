<@form.dialog id="d-vfs-dlpsettings" title=i18n.text("VirtualFiles.DlpSettingsDialog.title") header=i18n.text("VirtualFiles.DlpSettingsDialog.title")>
    <fieldset class="noborder pane">
        <dl class="group wrap">
            <dt><@form.radio name="type" value="rules" checked=""><@i18n.message key="VirtualFiles.DlpSettingsDialog.label.useRules" /></@></dt>
            <dd><@form.button name="dlprules"><@i18n.message key="VirtualFiles.DlpSettingsDialog.button.rules" /></@></dd>

            <dt><@form.radio name="type" value="icap"><@i18n.message key="VirtualFiles.DlpSettingsDialog.label.useIcap" /></@></dt>
            <dd><@form.select name="icapaccess" items={
                    'ALLOW_ALL': i18n.text("VirtualFiles.DlpSettingsDialog.access.ALLOW_ALL"),
                    'DENY_ALL': i18n.text("VirtualFiles.DlpSettingsDialog.access.DENY_ALL"),
                    'DENY_AD_HOC': i18n.text("VirtualFiles.DlpSettingsDialog.access.DENY_AD_HOC")
                }/>
            </dd>
        </dl>
    </fieldset>
</@form.dialog>


<@form.dialog id="d-vfs-dlprules" title=i18n.text("VirtualFiles.DlpRulesDialog.title") header=i18n.text("VirtualFiles.DlpRulesDialog.info.short") description=i18n.text("VirtualFiles.DlpRulesDialog.info.long")>
    <div class="content">
        <div data-options="region:'center',border:false">
            <@form.datagrid name="entries" height="" columns=["rule", "enabled", "access"]; col><@i18n.message key="VirtualFiles.DlpRulesDialog.column.${col}" /></@>
        </div>

        <div data-options="region:'south',border:false">
            <div class="viewpane-toolbar inline">
                <div class="toolbar-selection">
                    <@form.button name="moveup"><@i18n.message key="VirtualFiles.DlpRulesDialog.button.moveUp" /></@>&nbsp;
                    <@form.button name="movedown"><@i18n.message key="VirtualFiles.DlpRulesDialog.button.moveDown" /></@>
                </div>
                <div class="toolbar-management">
                    <@form.button name="add"><@i18n.message key="VirtualFiles.DlpRulesDialog.button.add" /></@>&nbsp;
                    <@form.button name="edit"><@i18n.message key="VirtualFiles.DlpRulesDialog.button.edit" /></@>&nbsp;
                    <@form.button name="delete"><@i18n.message key="VirtualFiles.DlpRulesDialog.button.delete" /></@>
                </div>
            </div>
        </div>
    </div>
</@form.dialog>


<@form.dialog id="d-vfs-dlp-rule" header=i18n.text("VirtualFiles.DlpEntryDialog.info.short") description=i18n.text("VirtualFiles.DlpEntryDialog.info.long")>
    <fieldset class="noborder pane">
        <div>
            <label for="d-vfs-dlp-r"><@i18n.message key="VirtualFiles.DlpEntryDialog.label.rule" /></label>
            <select name="rule" id="d-vfs-dlp-r"></select>
        </div>
        <div>
            <label for="d-vfs-dlp-a"><@i18n.message key="VirtualFiles.DlpEntryDialog.label.access" /></label>
            <select name="access" id="d-vfs-dlp-a">
                <option value="ALLOW_ALL"><@i18n.message key="VirtualFiles.DlpEntryDialog.access.ALLOW_ALL" /></option>
                <option value="DENY_ALL"><@i18n.message key="VirtualFiles.DlpEntryDialog.access.DENY_ALL" /></option>
                <option value="DENY_AD_HOC"><@i18n.message key="VirtualFiles.DlpEntryDialog.access.DENY_AD_HOC" /></option>
            </select>
        </div>
        <div><@form.checkbox name="enabled"><@i18n.message key="VirtualFiles.DlpEntryDialog.label.enabled" /></@></div>
    </fieldset>
</@form.dialog>