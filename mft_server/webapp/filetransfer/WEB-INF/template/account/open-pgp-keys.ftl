<#ftl strip_whitespace=true>

<div id="account-pgp-encryption-fields">

    <div data-options="region:'center',border:false">
        <fieldset role="presentation" class="pane">
            <legend class="hidden-label"><@i18n.message key="PgpEncryption.title" /></legend>
            <p><@i18n.message key="PgpEncryption.description" escapeXml=false/></p>
        </fieldset>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar">
            <div class="toolbar-management">
                <@form.button name="generate" ariaHaspopup="true"><@i18n.message key="PgpEncryption.button.generate" /></@>
                <@form.button name="import" ariaHaspopup="true"><@i18n.message key="PgpEncryption.button.import" /></@>
                <@form.button name="delete" ariaHaspopup="true"><@i18n.message key="PgpEncryption.button.delete" /></@>
            </div>
        </div>
    </div>
</div>




