<div id="client-keys-fields">
    <div data-options="region:'center',border:false">
        <@form.datagrid name="clientkeys" height="" columns=["alias", "algorithm", "size", "serialNumber", "issuer", "subject", "subjectAlternative", "beginDate", "endDate", "revoked"]; col><@i18n.message key="KeyManager.column.${col}" /></@>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar inline">
            <div class="toolbar-selection">
                <@form.button name="generate"><@i18n.message key="KeyManager.button.generate" /></@>
                <@form.button name="import" class="m-btn m-btn-small"><@i18n.message key="KeyManager.button.import" /><span class="m-btn-downarrow"></span>
                    <div role="menu" aria-label="import-menu">
                        <div role="menuitem" data-options="id:'menu-file'"><@i18n.message key="KeyManager.menu.importFile" /></div>
                        <div role="menuitem" data-options="id:'menu-tsl'"><@i18n.message key="KeyManager.menu.importTsl" /></div>
                        <div role="menuitem" data-options="id:'menu-json'"><@i18n.message key="KeyManager.menu.importJSON" /></div>
                    </div>
                </@>
                <@form.button name="export" class="m-btn m-btn-small"><@i18n.message key="KeyManager.button.export" /><span class="m-btn-downarrow"></span>
                    <div role="menu" aria-label="export-menu">
                        <div role="menuitem" data-options="id:'menu-crt'"><@i18n.message key="KeyManager.menu.exportCertificate" /></div>
                        <div role="menuitem" data-options="id:'menu-pubkey'"><@i18n.message key="KeyManager.menu.exportPublicKey" /></div>
                    </div>
                </@>
            </div>
            <div class="toolbar-management">
                <@form.button name="view"><@i18n.message key="KeyManager.button.view" /></@form.button>
                <@form.button name="verifycrl"><@i18n.message key="KeyManager.button.verifyRevocation" /></@form.button>
                <@form.button name="revoke"><@i18n.message key="KeyManager.button.revoke" /></@>
                <@form.button name="delete"><@i18n.message key="KeyManager.button.delete" /></@>
            </div>
        </div>
    </div>
</div>