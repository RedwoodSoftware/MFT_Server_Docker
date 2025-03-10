<#import "macro.ftl" as trigger />

<@form.dialog id="d-triggertemplates-add" title=i18n.text("TriggerTemplates.AddDialog.title")>
<div class="content-tabs wrap">

    <div id="d-trigger-templates-add-parameters-content" title="${i18n.text('Triggers.tab.parameters')?js_string?html}">
        <div class="content">
            <div data-options="region:'north',border:false" class="wrap">
                <h6><@i18n.message key="TriggerTemplates.AddDialog.ParametersStep.info.short" /><span><@i18n.message key="TriggerTemplates.AddDialog.ParametersStep.info.long" /></span></h6>
            </div>

            <div data-options="region:'center',border:false">
                <fieldset class="wrap" style="margin-bottom:2em">
                    <legend><@i18n.message key="Triggers.tab.general" /></legend>

                    <div><@form.dn name="name" required=true><@i18n.message key="Triggers.label.name" /></@></div>
                    <div><@form.select name="eventtype" items={} description=i18n.text("Triggers.label.eventType")><@i18n.message key="Triggers.label.eventType" /></@></div>
                    <div><@form.memo name="description"><@i18n.message key="Triggers.label.description" /></@></div>
                    <div><@form.select name="tags" items=[]><@i18n.message key="Triggers.label.tags" /></@></div>
                </fieldset>
                <@trigger.parameters_advanced_panel />
            </div>
        </div>
    </div>

    <div id="d-trigger-templates-add-expression-content" title="${i18n.text('Triggers.tab.conditions')?js_string?html}">
        <@trigger.expression_panel>
            <h6><@i18n.message key="TriggerTemplates.AddDialog.ExpressionStep.info.short" /><span><@i18n.message key="TriggerTemplates.AddDialog.ExpressionStep.info.long" /></span></h6>
        </@>
    </div>

    <div id="d-trigger-templates-add-actions-content" title="${i18n.text('Triggers.tab.actions')?js_string?html}">
        <@trigger.actions_panel>
            <h6><@i18n.message key="TriggerTemplates.AddDialog.ActionsStep.info.short" /><span><@i18n.message key="TriggerTemplates.AddDialog.ActionsStep.info.long" /></span></h6>
        </@>
    </div>
</div>
</@form.dialog>