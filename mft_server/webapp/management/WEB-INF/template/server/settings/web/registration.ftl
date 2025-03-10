<div id="self-registration-fields" class="easyui-layout" data-options="fit:true,doSize:false,border:false">
    <div data-options="region:'center'">
        <fieldset class="noborder">
            <legend class="hidden-label"><@i18n.message key="SelfRegistration.title" /></legend>

            <div class="checkbox"><@form.checkbox name="showlink"><@i18n.message key="SelfRegistration.label.showRegistrationLink" /></@></div>
            <div class="checkbox"><@form.checkbox name="emailaslogin"><@i18n.message key="SelfRegistration.label.useEmailAsLogin" /></@></div>
            <div class="checkbox"><@form.checkbox name="requirecaptcha"><@i18n.message key="SelfRegistration.label.requireCaptcha" /></@></div>
            <div class="checkbox"><@form.checkbox name="requirecompanyname"><@i18n.message key="SelfRegistration.label.companyRequired" /></@></div>
        </fieldset>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar toolbar-management inline">
            <@form.button name="apply"><@i18n.message key="Application.button.apply" /></@>
            <@form.button name="discard"><@i18n.message key="Application.button.discard" /></@>
        </div>
    </div>
</div>