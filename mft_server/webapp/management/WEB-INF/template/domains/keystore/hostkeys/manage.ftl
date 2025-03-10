<div id="domain-host-keys-fields">
    <div data-options="region:'center',border:false">
        <@form.datagrid name="hostkeys" height="" columns=["alias", "algorithm", "size", "serialNumber", "issuer", "subject", "beginDate", "endDate", "revoked"]; col><@i18n.message key="KeyManager.column.${col}" /></@>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar inline">
            <div class="toolbar-selection">
                <#if permissions.domainKeystoreControlAllowed>
                    <@form.button name="import" class="m-btn m-btn-small"><@i18n.message key="KeyManager.button.import" /><span class="m-btn-downarrow"></span>
                        <div role="menu" aria-label="import-menu" class="hidden">
                            <div role="menuitem" data-options="id:'menu-file'"><@i18n.message key="KeyManager.menu.importFile" /></div>
                            <div role="menuitem" data-options="id:'menu-tsl'"><@i18n.message key="KeyManager.menu.importTsl" /></div>
                            <div role="menuitem" data-options="id:'menu-json'"><@i18n.message key="KeyManager.menu.importJSON" /></div>
                        </div>
                    </@>
                </#if>
                <@form.button name="export" class="m-btn m-btn-small"><@i18n.message key="KeyManager.button.export" /><span class="m-btn-downarrow"></span>
                    <div role="menu" aria-label="export-menu" class="hidden">
                        <div role="menuitem" data-options="id:'menu-crt'"><@i18n.message key="KeyManager.menu.exportCertificate" /></div>
                        <div role="menuitem" data-options="id:'menu-pubkey'"><@i18n.message key="KeyManager.menu.exportPublicKey" /></div>
                    </div>
                </@>
            </div>
            <div class="toolbar-management">
                <@form.button name="view"><@i18n.message key="KeyManager.button.view" /></@>
                <@form.button name="verifycrl"><@i18n.message key="KeyManager.button.verifyRevocation" /></@>
                <#if permissions.domainKeystoreControlAllowed>
                    <@form.button name="revoke"><@i18n.message key="KeyManager.button.revoke" /></@>
                    <@form.button name="delete"><@i18n.message key="KeyManager.button.delete" /></@>
                </#if>
            </div>
        </div>
    </div>
</div>

