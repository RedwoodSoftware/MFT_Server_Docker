<@form.dialog id="d-auth-service-type" title=i18n.text("AuthenticationService.ServiceTypeDialog.title")>
    <@form.fields name="authservicetypefields" title=i18n.text("AuthenticationService.ServiceTypeDialog.info.short") description=i18n.text("AuthenticationService.ServiceTypeDialog.info.long")>
        <div><@form.select name="type" items={
            'LOCAL': i18n.text("AuthenticationService.type.LOCAL"),
            'DB': i18n.text("AuthenticationService.type.DB"),
            'DB_QUERY': i18n.text("AuthenticationService.type.DB_QUERY"),
            'LDAP': i18n.text("AuthenticationService.type.LDAP"),
            'LDAP_QUERY': i18n.text("AuthenticationService.type.LDAP_QUERY"),
            'NTLM': i18n.text("AuthenticationService.type.NTLM"),
            'PAM': i18n.text("AuthenticationService.type.PAM"),
            'RADIUS': i18n.text("AuthenticationService.type.RADIUS"),
            'CUSTOM': i18n.text("AuthenticationService.type.CUSTOM")
        }><@i18n.message key="AuthenticationService.label.type" /></@></div>
    </@form.fields>
</@form.dialog>

<@form.dialog id="d-auth-multi-service-add" title=i18n.text("AuthenticationService.AddServiceDialog.title")>
    <div class="content">
        <div data-options="region:'north',border:false">
            <h6><@i18n.message key="AuthenticationService.AddServiceDialog.info.short" /><span><@i18n.message key="AuthenticationService.AddServiceDialog.info.long" /></span></h6>
        </div>
        <div class="wrap" data-options="region:'center',border:false"></div>
    </div>
</@form.dialog>

<@form.dialog id="d-auth-multi-service-edit" title=i18n.text("AuthenticationService.EditServiceDialog.title")>
    <div class="content">
        <div data-options="region:'north',border:false">
            <h6><@i18n.message key="AuthenticationService.EditServiceDialog.info.short" /><span><@i18n.message key="AuthenticationService.EditServiceDialog.info.long" /></span></h6>
        </div>
        <div class="wrap" data-options="region:'center',border:false"></div>
    </div>
</@form.dialog>