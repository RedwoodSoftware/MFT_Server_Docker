<div id="domain-pgp-keys-fields">

    <div data-options="region:'center',border:false">
        <@form.datagrid name="pgpkeys" height="" columns=["alias", "algorithm", "expires", "encrypt", "decrypt", "sign", "verify", "fingerprint"]; col><@i18n.message key="PgpKeys.column.${col}" /></@>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar inline">
            <div class="toolbar-selection">
                <#if permissions.domainKeystoreControlAllowed>
                    <@form.button name="generate"><@i18n.message key="PgpKeys.button.generate" /></@>
                </#if>
                <#if permissions.domainKeystoreControlAllowed>
                    <@form.button name="import" class="m-btn m-btn-small"><@i18n.message key="PgpKeys.button.import" /><span class="m-btn-downarrow"></span>
                        <div role="menu" aria-label="import-menu">
                            <div role="menuitem" data-options="id:'menu-key'"><@i18n.message key="KeyManager.menu.importKey" /></div>
                            <div role="menuitem" data-options="id:'menu-json'"><@i18n.message key="KeyManager.menu.importJSON" /></div>
                        </div>
                    </@>
                </#if>
                <@form.button name="export" class="m-btn m-btn-small"><@i18n.message key="PgpKeys.button.export" /><span class="m-btn-downarrow"></span>
                    <div role="menu" aria-label="export-menu" class="hidden">
                        <div role="menuitem" data-options="id:'menu-secret'"><@i18n.message key="KeyManager.menu.exportSecretKey" /></div>
                        <div role="menuitem" data-options="id:'menu-pubkey'"><@i18n.message key="KeyManager.menu.exportPublicKey" /></div>
                    </div>
                </@>
                <#if permissions.domainKeystoreControlAllowed><@form.button name="sign"><@i18n.message key="PgpKeys.button.sign" /></@></#if>
            </div>
            <div class="toolbar-management">
                <@form.button name="signatures"><@i18n.message key="PgpKeys.button.signatures" /></@>
                <#if permissions.domainKeystoreControlAllowed><@form.button name="delete"><@i18n.message key="PgpKeys.button.delete" /></@></#if>
            </div>
        </div>
    </div>
</div>