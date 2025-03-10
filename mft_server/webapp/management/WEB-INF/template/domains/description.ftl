<div id="domain-description-fields">
    <div data-options="region:'center'">
        <fieldset class="noborder"<#if !permissions.domainDescriptionControlAllowed> disabled="disabled"</#if>>
            <div><label for="d-m-desc"><@i18n.message key="Description.label.desc" /></label>
                <#if permissions.domainDescriptionControlAllowed><textarea id="d-m-desc" name="description" rows="10" cols="80" wrap="soft"></textarea>
                <#else><textarea id="d-m-desc" name="description" rows="10" cols="80" readonly="readonly"></textarea>
                </#if>
            </div>
        </fieldset>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <#if permissions.domainDescriptionControlAllowed>
            <div class="viewpane-toolbar toolbar-management inline">
                <@form.button name="apply"><@i18n.message "Application.button.apply" /></@>
                <@form.button name="discard"><@i18n.message "Application.button.discard" /></@>
            </div>
        </#if>
    </div>
</div>

