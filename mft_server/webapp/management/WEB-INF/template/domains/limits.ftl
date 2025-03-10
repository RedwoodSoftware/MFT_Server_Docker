<div id="domain-limits-fields">
    <div data-options="region:'center'">
        <fieldset class="noborder x-large">
            <div>
                <@form.checkbox name="maxpartnersenable" disabled=!permissions.domainLimitsControlAllowed><@i18n.message key="Limits.label.maxTradingPartners" /></@>
                <input type="text" name="maxpartners" maxlength="5"<#if !permissions.domainLimitsControlAllowed> readonly="readonly"</#if> />
            </div>
            <div>
                <@form.checkbox name="maxusersenable" disabled=!permissions.domainLimitsControlAllowed><@i18n.message key="Limits.label.maxUsers" /></@>
                <input type="text" name="maxusers" maxlength="5"<#if !permissions.domainLimitsControlAllowed> readonly="readonly"</#if> />
            </div>
        </fieldset>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <#if permissions.domainLimitsControlAllowed>
            <div class="viewpane-toolbar toolbar-management inline">
                <@form.button name="apply"><@i18n.message "Application.button.apply" /></@>
                <@form.button name="discard"><@i18n.message "Application.button.discard" /></@>
            </div>
        </#if>
    </div>
</div>