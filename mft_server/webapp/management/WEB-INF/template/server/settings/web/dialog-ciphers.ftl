<@form.dialog id="d-settings-web-ciphers" title=i18n.text("CiphersDialog.title")>
    <div class="content">
        <div data-options="region:'north',border:false">
            <h6><@i18n.message key="CiphersDialog.info.short" /><span><@i18n.message key="CiphersDialog.info.long" /></span></h6>
        </div>

        <div data-options="region:'center',border:false" style="padding:1em">
            <@form.datagrid name="sslciphers" height="" columns=["ciphers"]/>

            <div class="viewpane-toolbar" style="margin:0">
                <@form.button name="all" dataToggleText=i18n.text("CiphersDialog.button.deselectAll")><@i18n.message key="CiphersDialog.button.selectAll" /></@>
                <@form.button name="medium"><@i18n.message key="CiphersDialog.button.selectMedium" /></@>&nbsp;
                <@form.button name="strong"><@i18n.message key="CiphersDialog.button.selectStrong" /></@>
            </div>
        </div>
    </div>
</@form.dialog>