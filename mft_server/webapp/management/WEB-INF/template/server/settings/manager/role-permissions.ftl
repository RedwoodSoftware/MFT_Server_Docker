<fieldset name="serverpermissions" style="margin-bottom:2em">
    <legend><@i18n.message key="Roles.legend.serverPermissions" /></legend>

    <div class="checkbox"><@form.button name="grantallpermissions">&nbsp;<@i18n.message key="Roles.button.grantAllPermissions" /></@></div>

    <div><@m.role_permission name="managersettings" items={
        'MANAGEMENT_SETTINGS_READ': i18n.text("Roles.permissions.READ"),
        'MANAGEMENT_SETTINGS_WRITE': i18n.text("Roles.permissions.WRITE")
    }><@i18n.message key="Roles.label.managerService" /></@></div>
    <div><@m.role_permission name="datastoresettings" items={
        'SERVER_DATABASE_CONFIGURATION_READ': i18n.text("Roles.permissions.READ"),
        'SERVER_DATABASE_CONFIGURATION_WRITE': i18n.text("Roles.permissions.WRITE")
    }><@i18n.message key="Roles.label.datastore" /></@></div>
    <div><@m.role_permission name="globalservices" items={
        'GLOBAL_SERVICES_READ': i18n.text("Roles.permissions.READ"),
        'GLOBAL_SERVICES_WRITE': i18n.text("Roles.permissions.WRITE")
    }><@i18n.message key="Roles.label.globalServices" /></@></div>
    <div><@m.role_permission name="websettings" items={
        'WEB_SETTINGS_READ': i18n.text("Roles.permissions.READ"),
        'WEB_SETTINGS_WRITE': i18n.text("Roles.permissions.WRITE")
    }><@i18n.message key="Roles.label.web" /></@></div>
    <div><@m.role_permission name="emailsettings" items={
        'EMAIL_SETTINGS_READ': i18n.text("Roles.permissions.READ"),
        'EMAIL_SETTINGS_WRITE': i18n.text("Roles.permissions.WRITE")
    }><@i18n.message key="Roles.label.email" /></@></div>
    <div><@m.role_permission name="failoversettings" items={
        'FAILOVER_SETTINGS_READ': i18n.text("Roles.permissions.READ"),
        'FAILOVER_SETTINGS_WRITE': i18n.text("Roles.permissions.WRITE")
    }><@i18n.message key="Roles.label.failover" /></@></div>
    <div><@m.role_permission name="searchingsettings" items={
        'SEARCHING_SETTINGS_READ': i18n.text("Roles.permissions.READ"),
        'SEARCHING_SETTINGS_WRITE': i18n.text("Roles.permissions.WRITE")
    }><@i18n.message key="Roles.label.searching" /></@></div>
    <div><@m.role_permission name="jmxsettings" items={
        'JMX_SETTINGS_READ': i18n.text("Roles.permissions.READ"),
        'JMX_SETTINGS_WRITE': i18n.text("Roles.permissions.WRITE")
    }><@i18n.message key="Roles.label.jmx" /></@></div>
    <div><@m.role_permission name="updatessettings" items={
        'APPLICATION_UPDATES_READ': i18n.text("Roles.permissions.READ"),
        'APPLICATION_UPDATES_WRITE': i18n.text("Roles.permissions.WRITE")
    }><@i18n.message key="Roles.label.updates" /></@></div>
    <div><@m.role_permission name="keystoresttings" items={
        'SERVER_KEYS_READ': i18n.text("Roles.permissions.SERVER_KEYS_READ"),
        'SERVER_KEYS_WRITE': i18n.text("Roles.permissions.SERVER_KEYS_WRITE"),
        'HOST_KEYS_READ': i18n.text("Roles.permissions.HOST_KEYS_READ"),
        'HOST_KEYS_WRITE': i18n.text("Roles.permissions.HOST_KEYS_WRITE"),
        'CLIENT_KEYS_READ': i18n.text("Roles.permissions.CLIENT_KEYS_READ"),
        'CLIENT_KEYS_WRITE': i18n.text("Roles.permissions.CLIENT_KEYS_WRITE"),
        'PGP_KEYS_READ': i18n.text("Roles.permissions.PGP_KEYS_READ"),
        'PGP_KEYS_WRITE': i18n.text("Roles.permissions.PGP_KEYS_WRITE")
    }><@i18n.message key="Roles.label.keystore" /></@></div>
    <div><@m.role_permission name="serverstatistics" items={
        'STATISTICS_READ': i18n.text("Roles.permissions.READ")
    }><@i18n.message key="Roles.label.serverStatistics" /></@></div>
    <div><@m.role_permission name="actioncenter" items={
        'ACTION_CENTER_READ': i18n.text("Roles.permissions.READ"),
        'ACTION_CENTER_WRITE': i18n.text("Roles.permissions.WRITE")
    }><@i18n.message key="Roles.label.actionCenter" /></@></div>
    <div><@m.role_permission name="serverlicense" items={
        'LICENSE_READ': i18n.text("Roles.permissions.READ"),
        'LICENSE_WRITE': i18n.text("Roles.permissions.WRITE")
    }><@i18n.message key="Roles.label.license" /></@></div>

    <div class="inline"><@form.path name="restrictdir"><@i18n.message key="Roles.label.restrictDir" /></@></div>
</fieldset>

<fieldset name="domainpermissions">
    <legend><@i18n.message key="Roles.legend.domainPermissions" /></legend>
    <div><@form.datagrid name="domainspermissions" height="230px" columns=["domainName", "accessible", "tags"]; col><@i18n.message key="Roles.column.${col}" /></@></div>

    <div class="viewpane-toolbar inline">
        <div class="toolbar-selection">
            <@form.button name="permissions"><@i18n.message key="Roles.button.permissions" /></@>
        </div>
        <div class="toolbar-management">
            <@form.button name="add"><@i18n.message key="Roles.button.add" /></@>
            <@form.button name="delete"><@i18n.message key="Roles.button.delete" /></@>
        </div>
    </div>
</fieldset>