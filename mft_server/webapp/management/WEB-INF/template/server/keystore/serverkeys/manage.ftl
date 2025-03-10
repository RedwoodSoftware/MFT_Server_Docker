<div id="server-keys-fields">
    <div data-options="region:'center',border:false">
        <@form.datagrid name="serverkeys" height="" columns=["alias", "algorithm", "size", "serialNumber", "issuer", "subject", "subjectAlternative", "beginDate", "endDate", "revoked", "domains"]; col><@i18n.message key="KeyManager.column.${col}" /></@>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar inline">
            <div class="toolbar-selection">
                <@form.button name="generate" class="m-btn m-btn-small"><@i18n.message key="KeyManager.button.generate" /><span class="m-btn-downarrow"></span>
                    <div role="menu" aria-label="generate-menu">
                        <div role="menuitem" data-options="id:'menu-key'"><@i18n.message key="KeyManager.menu.generateKey" /></div>
                        <div role="menuitem" data-options="id:'menu-crt'"><@i18n.message key="KeyManager.menu.generateCertificate" /></div>
                        <div role="menuitem" data-options="id:'menu-csr'"><@i18n.message key="KeyManager.menu.generateCertificateSigningRequest" /></div>
                    </div>
                </@>
                <@form.button name="import" class="m-btn m-btn-small"><@i18n.message key="KeyManager.button.import" /><span class="m-btn-downarrow"></span>
                    <div role="menu" aria-label="import-menu">
                        <div role="menuitem" data-options="id:'menu-key'"><@i18n.message key="KeyManager.menu.importKey" /></div>
                        <div role="menuitem" data-options="id:'menu-crt'"><@i18n.message key="KeyManager.menu.importCertificates" /></div>
                        <div role="menuitem" data-options="id:'menu-json'"><@i18n.message key="KeyManager.menu.importJSON" /></div>
                    </div>
                </@>
                <@form.button name="export" class="m-btn m-btn-small"><@i18n.message key="KeyManager.button.export" /><span class="m-btn-downarrow"></span>
                    <div role="menu" aria-label="export-menu">
                        <div role="menuitem" data-options="id:'menu-crt'"><@i18n.message key="KeyManager.menu.exportCertificate" /></div>
                        <div role="menuitem" data-options="id:'menu-pubkey'"><@i18n.message key="KeyManager.menu.exportPublicKey" /></div>
                        <div role="menuitem" data-options="id:'menu-prvkey'"><@i18n.message key="KeyManager.menu.exportPrivateKey" /></div>
                    </div>
                </@>
            </div>
            <div class="toolbar-management">
                <@form.button name="view"><@i18n.message key="KeyManager.button.view" /></@>
                <@form.button name="crl" class="m-btn m-btn-small"><@i18n.message key="KeyManager.button.revocationList" /><span class="m-btn-downarrow"></span>
                    <div role="menu" aria-label="crl-menu">
                        <div role="menuitem" data-options="id:'menu-crl-generate'"><@i18n.message key="KeyManager.menu.generateCrl" /></div>
                        <div role="menuitem" data-options="id:'menu-crl-verify'"><@i18n.message key="KeyManager.menu.verifyCrl" /></div>
                    </div>
                </@>
                <@form.button name="revoke"><@i18n.message key="KeyManager.button.revoke" /></@>
                <@form.button name="delete"><@i18n.message key="KeyManager.button.delete" /></@>
            </div>
        </div>
    </div>
</div>

