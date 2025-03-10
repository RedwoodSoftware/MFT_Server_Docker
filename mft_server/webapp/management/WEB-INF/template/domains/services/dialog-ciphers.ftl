<@form.dialog id="d-services-ciphers" title=i18n.text("Services.CiphersDialog.title") disabled=!permissions.domainServicesControlAllowed>
    <div class="content">
        <div data-options="region:'north',border:false">
            <h6><@i18n.message key="Services.CiphersDialog.info.short" /><span><@i18n.message key="Services.CiphersDialog.info.long" /></span></h6>
        </div>

        <div data-options="region:'center',border:false" style="padding:1em">
            <@form.datagrid name="sslciphers" height="" columns=["ciphers"]/>

            <div class="viewpane-toolbar" style="margin:0">
                <@form.button name="all" dataToggleText=i18n.text("Services.CiphersDialog.button.deselectAll") disabled=!permissions.domainServicesControlAllowed><@i18n.message key="Services.CiphersDialog.button.selectAll" /></@>
                <@form.button name="medium" disabled=!permissions.domainServicesControlAllowed><@i18n.message key="Services.CiphersDialog.button.medium" /></@>&nbsp;
                <@form.button name="strong" disabled=!permissions.domainServicesControlAllowed><@i18n.message key="Services.CiphersDialog.button.strong" /></@>
            </div>
        </div>
    </div>
</@form.dialog>