<#macro dayOfWeekAccess name label>
    <@form.checkbox name="${name?html}">${label}</@>
    <@i18n.message key="TimeAccess.label.from" />&nbsp;<input type="text" name="${name}from" maxlength="5"/>&nbsp;&nbsp;
    <@i18n.message key="TimeAccess.label.to" />&nbsp;<input type="text" name="${name}to" maxlength="5"/>
</#macro>

<div id="time-access-fields">
    <div data-options="region:'center'" style="padding:16px">

        <div class="content">
            <div data-options="region:'north',border:false" class="layout-pane-top">
                <fieldset class="noborder pane"<#if !permissions.timeAccessSettingsControlAllowed> disabled="disabled"</#if>>
                    <div class="checkbox"><@form.checkbox name="enable"><@i18n.message key="TimeAccess.label.enable" /></@></div>
                </fieldset>
            </div>

            <div data-options="region:'center',border:false">
                <fieldset<#if !permissions.timeAccessSettingsControlAllowed> disabled="disabled"</#if>>
                    <legend><@i18n.message key="TimeAccess.legend" /></legend>

                    <div><@dayOfWeekAccess name="monday" label=i18n.text("TimeAccess.label.monday")/></div>
                    <div><@dayOfWeekAccess name="tuesday" label=i18n.text("TimeAccess.label.tuesday")/></div>
                    <div><@dayOfWeekAccess name="wednesday" label=i18n.text("TimeAccess.label.wednesday")/></div>
                    <div><@dayOfWeekAccess name="thursday" label=i18n.text("TimeAccess.label.thursday")/></div>
                    <div><@dayOfWeekAccess name="friday" label=i18n.text("TimeAccess.label.friday")/></div>
                    <div><@dayOfWeekAccess name="saturday" label=i18n.text("TimeAccess.label.saturday")/></div>
                    <div><@dayOfWeekAccess name="sunday" label=i18n.text("TimeAccess.label.sunday")/></div>
                </fieldset>
            </div>
        </div>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar toolbar-management inline">
            <@form.button name="apply" disabled=!permissions.timeAccessSettingsControlAllowed><@i18n.message key="Application.button.apply" /></@>
            <@form.button name="discard" disabled=!permissions.timeAccessSettingsControlAllowed><@i18n.message key="Application.button.discard" /></@>
        </div>
    </div>
</div>