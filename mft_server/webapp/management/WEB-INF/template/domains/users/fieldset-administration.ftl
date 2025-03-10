<div id="administrationfields">

    <div data-options="region:'north',border:false" class="layout-pane-top">
        <div class="wrap"><@form.checkbox name="domainadminallowed"><@i18n.message "DomainAdministration.label.allowed" /></@></div>
    </div>

    <div data-options="region:'center',border:false">
        <fieldset>
            <legend><@i18n.message "DomainAdministration.title.general" /></legend>

            <div class="checkbox"><@form.checkbox name="managenonowned"><@i18n.message "DomainAdministration.label.manageNonOwned" /></@></div>
            <div class="checkbox"><@form.checkbox name="maxowned"><@i18n.message "DomainAdministration.label.maxOwned" /></@>&nbsp;<input type="text" name="maxownedcount" value="1" maxlength="4"/></div>
            <div class="checkbox"><@form.checkbox name="systempgpkeysavailable"><@i18n.message "DomainAdministration.label.systemPgpKeysAllowed" /></@></div>
            <div class="checkbox"><@form.checkbox name="managepubliccontacts"><@i18n.message "DomainAdministration.label.managePublicContacts" /></@></div>
            <div class="checkbox"><@form.checkbox name="shareqoutas"><@i18n.message "DomainAdministration.label.shareQuotas" /></@></div>
            <div><@form.datagrid name="templates" title="${i18n.text('DomainAdministration.label.templates')?html}" height="auto" columns=["templates"]; col><@i18n.message "DomainAdministration.label.${col}" /></@form.datagrid></div>
        </fieldset>

        <fieldset>
            <legend><@i18n.message "DomainAdministration.title.userLimitations" /></legend>

            <div class="checkbox"><@form.checkbox name="restrictpath"><@i18n.message "DomainAdministration.label.restrictPath" /></@>&nbsp;<input type="text" name="restrictpathto" maxlength="255"/>&nbsp;<@form.button name="browse"><@i18n.message "DomainAdministration.button.browse" /></@></div>
            <div class="checkbox"><@form.checkbox name="passwordchangingallowed"><@i18n.message "DomainAdministration.label.passwordChangingAllowed" /></@></div>
            <div class="checkbox"><@form.checkbox name="groupassignmentallowed"><@i18n.message "DomainAdministration.label.groupAssignmentAllowed" /></@></div>
            <div class="checkbox"><@form.checkbox name="proxymappingallowed"><@i18n.message "DomainAdministration.label.proxyMappingAllowed" /></@></div>
            <div class="checkbox"><@form.checkbox name="setmultifactorauthallowed"><@i18n.message "DomainAdministration.label.setMultiFactorAuthAllowed" /></@></div>
        </fieldset>

        <fieldset>
            <legend><@i18n.message "DomainAdministration.title.dropZone" />/<@i18n.message "DomainAdministration.title.urlBranding" /></legend>

            <div class="checkbox"><@form.checkbox name="dropzoneallowed"><@i18n.message "DomainAdministration.label.dropZoneManagementAllowed" /></@></div>
            <div class="checkbox"><@form.checkbox name="maxdropzones"><@i18n.message "DomainAdministration.label.maxDropZones" /></@>&nbsp;<input type="text" name="maxdropzonescount" value="1" maxlength="4"/></div>
            <div class="checkbox"><@form.checkbox name="urlbrandingallowed"><@i18n.message "DomainAdministration.label.urlBrandingManagementAllowed" /></@></div>
            <div class="checkbox"><@form.checkbox name="maxurlbrandings"><@i18n.message "DomainAdministration.label.maxUrlBranding" /></@>&nbsp;<input type="text" name="maxurlbrandingscount" maxlength="4"/></div>
        </fieldset>
    </div>
</div>

