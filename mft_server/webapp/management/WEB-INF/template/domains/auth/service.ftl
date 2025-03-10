<#ftl strip_whitespace=true>
<#import "macro.ftl" as auth />

<div id="domain-auth-service-fields" role="group">

    <div data-options="region:'north',border:false" class="layout-pane-top">
        <fieldset class="noborder pane">
            <div><@form.select name="type" dataOptions="disabled:${permissions.authenticationSettingsControlAllowed?string('false','true')}" items={
                'DOMAIN': i18n.text("Authentication.type.DOMAIN"),
                'DB': i18n.text("Authentication.type.DB"),
                'DB_QUERY': i18n.text("Authentication.type.DB_QUERY"),
                'LDAP': i18n.text("Authentication.type.LDAP"),
                'LDAP_QUERY': i18n.text("Authentication.type.LDAP_QUERY"),
                'NTLM': i18n.text("Authentication.type.NTLM"),
                'PAM': i18n.text("Authentication.type.PAM"),
                'RADIUS': i18n.text("Authentication.type.RADIUS"),
                'CUSTOM': i18n.text("Authentication.type.CUSTOM"),
                'MULTIPLE': i18n.text("Authentication.type.MULTIPLE")
            }><@i18n.message "Authentication.label.type" /></@>
            </div>
        </fieldset>
    </div>

    <div data-options="region:'center'" class="wrap">
        <@auth.domain_auth_service_fields />
        <@auth.db_auth_service_fields />
        <@auth.db_query_auth_service_fields />
        <@auth.ldap_auth_service_fields />
        <@auth.ladp_query_auth_service_fields />
        <@auth.ntlm_auth_service_fields />
        <@auth.pam_auth_service_fields />
        <@auth.radius_auth_service_fields />
        <@auth.custom_auth_service_fields />

        <div id="multipleauthfields" class="hidden"<#if !permissions.authenticationSettingsControlAllowed> aria-disabled="true"</#if>>
            <div data-options="region:'center',border:false">
            <@form.datagrid name="multipleauthconfigs" height="" dataOptions="disabled:${permissions.authenticationSettingsControlAllowed?string('false','true')}" columns=["order", "type"]; col><@i18n.message key="Authentication.column.${col}" /></@>
            </div>
            <div data-options="region:'south',border:false">
                <div class="viewpane-toolbar inline">
                    <div class="toolbar-selection">
                        <@form.button name="moveup"><@i18n.message key="Authentication.button.moveUp" /></@>
                        <@form.button name="movedown"><@i18n.message key="Authentication.button.moveDown" /></@>
                    </div>
                    <div class="toolbar-management">
                        <@form.button name="add"><@i18n.message key="Authentication.button.add" /></@>
                        <@form.button name="edit"><@i18n.message key="Authentication.button.edit" /></@>
                        <@form.button name="delete"><@i18n.message key="Authentication.button.delete" /></@>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar toolbar-management inline">
            <@form.button name="apply" disabled=!permissions.authenticationSettingsControlAllowed><@i18n.message key="Application.button.apply" /></@>
            <@form.button name="discard" disabled=!permissions.authenticationSettingsControlAllowed><@i18n.message key="Application.button.discard" /></@>
        </div>
    </div>
</div>