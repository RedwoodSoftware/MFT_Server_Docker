<@form.dialog id="d-auth-service-type" title=i18n.text("Authentication.ServiceTypeDialog.title")>
    <@form.fields name="authservicetypefields" title=i18n.text("Authentication.ServiceTypeDialog.info.short") description=i18n.text("Authentication.ServiceTypeDialog.info.long")>
        <div><@form.select name="type" items={
            'DOMAIN': i18n.text("Authentication.type.DOMAIN"),
            'DB': i18n.text("Authentication.type.DB"),
            'DB_QUERY': i18n.text("Authentication.type.DB_QUERY"),
            'LDAP': i18n.text("Authentication.type.LDAP"),
            'LDAP_QUERY': i18n.text("Authentication.type.LDAP_QUERY"),
            'NTLM': i18n.text("Authentication.type.NTLM"),
            'PAM': i18n.text("Authentication.type.PAM"),
            'RADIUS': i18n.text("Authentication.type.RADIUS"),
            'CUSTOM': i18n.text("Authentication.type.CUSTOM")
        }><@i18n.message key="Authentication.label.type" /></@></div>
    </@form.fields>
</@form.dialog>

<@form.dialog id="d-auth-multi-service-add" title=i18n.text("Authentication.AddServiceDialog.title")>
    <div class="content">
        <div data-options="region:'north',border:false">
            <h6><@i18n.message key="Authentication.AddServiceDialog.info.short" /><span><@i18n.message key="Authentication.AddServiceDialog.info.long" /></span></h6>
        </div>
        <div class="wrap" data-options="region:'center',border:false"></div>
    </div>
</@form.dialog>

<@form.dialog id="d-auth-multi-service-edit" title=i18n.text("Authentication.EditServiceDialog.title")>
    <div class="content">
        <div data-options="region:'north',border:false">
            <h6><@i18n.message key="Authentication.EditServiceDialog.info.short" /><span><@i18n.message key="Authentication.EditServiceDialog.info.long" /></span></h6>
        </div>
        <div class="wrap" data-options="region:'center',border:false"></div>
    </div>
</@form.dialog>