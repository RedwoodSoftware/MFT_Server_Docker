<#ftl strip_whitespace=true>
<#import "macro.ftl" as manager />

<div id="manager-auth-service-fields" role="group">

    <div data-options="region:'north',border:false" class="layout-pane-top">
        <fieldset class="noborder pane">
            <div><@form.select id="manager-auth-service-type" name="type" items={
                'LOCAL': i18n.text("AuthenticationService.type.LOCAL"),
                'DB': i18n.text("AuthenticationService.type.DB"),
                'DB_QUERY': i18n.text("AuthenticationService.type.DB_QUERY"),
                'LDAP': i18n.text("AuthenticationService.type.LDAP"),
                'LDAP_QUERY': i18n.text("AuthenticationService.type.LDAP_QUERY"),
                'NTLM': i18n.text("AuthenticationService.type.NTLM"),
                'PAM': i18n.text("AuthenticationService.type.PAM"),
                'RADIUS': i18n.text("AuthenticationService.type.RADIUS"),
                'CUSTOM': i18n.text("AuthenticationService.type.CUSTOM"),
                'MULTIPLE': i18n.text("AuthenticationService.type.MULTIPLE")
            }><@i18n.message "AuthenticationService.label.type" /></@>
            </div>
        </fieldset>
    </div>

    <div data-options="region:'center'" class="wrap">
        <@manager.local_auth_service_fields />
        <@manager.db_auth_service_fields />
        <@manager.db_query_auth_service_fields />
        <@manager.ldap_auth_service_fields />
        <@manager.ldap_query_auth_service_fields />
        <@manager.ntlm_auth_service_fields />
        <@manager.pam_auth_service_fields />
        <@manager.radius_auth_service_fields />
        <@manager.custom_auth_service_fields />

        <div id="multipleauthfields" class="hidden">
            <div data-options="region:'center',border:false">
                <@form.datagrid name="multipleauthconfigs" height="" columns=["order", "type"]; col><@i18n.message key="AuthenticationService.column.${col}" /></@>
            </div>
            <div data-options="region:'south',border:false">
                <div class="viewpane-toolbar inline">
                    <div class="toolbar-selection">
                        <@form.button name="moveup"><@i18n.message key="AuthenticationService.button.moveUp" /></@>
                        <@form.button name="movedown"><@i18n.message key="AuthenticationService.button.moveDown" /></@>
                    </div>
                    <div class="toolbar-management">
                        <@form.button name="add"><@i18n.message key="AuthenticationService.button.add" /></@>
                        <@form.button name="edit"><@i18n.message key="AuthenticationService.button.edit" /></@>
                        <@form.button name="delete"><@i18n.message key="AuthenticationService.button.delete" /></@>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar toolbar-management inline">
            <@form.button name="apply"><@i18n.message key="Application.button.apply" /></@>
            <@form.button name="discard"><@i18n.message key="Application.button.discard" /></@>
        </div>
    </div>
</div>