<#ftl strip_whitespace=true>

<div id="account-public-key-auth-fields">

    <div data-options="region:'center',border:false">
        <fieldset role="presentation" class="pane">
            <legend class="hidden-label"><@i18n.message key="PublicKeyAuth.title" /></legend>
            <p><@i18n.message key="PublicKeyAuth.description" escapeXml=false/></p>
        </fieldset>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar">
            <div class="toolbar-management">
                <@form.button name="generate" ariaHaspopup="true"><@i18n.message key="PublicKeyAuth.button.generate" /></@>
                <@form.button name="import" ariaHaspopup="true"><@i18n.message key="PublicKeyAuth.button.import" /></@>
                <@form.button name="delete" ariaHaspopup="true"><@i18n.message key="PublicKeyAuth.button.delete" /></@>
            </div>
        </div>
    </div>
</div>




