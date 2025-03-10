<#import "macro.ftl" as trigger />

<@form.dialog id="d-triggers-add-selecttemplate" title=i18n.text("Triggers.TemplateDialog.title") header=i18n.text("Triggers.TemplateDialog.info.short") description=i18n.text("Triggers.TemplateDialog.info.long")>
    <fieldset class="noborder pane">
        <div><@form.select name="template" dataOptions="prompt:'${i18n.text('Triggers.TemplateDialog.prompt.template')?js_string}'" items={}><@i18n.message key="Triggers.TemplateDialog.label.template" /></@></div>
    </fieldset>
</@form.dialog>

<@form.dialog id="d-triggers-add" title=i18n.text("Triggers.AddDialog.title")>
    <div class="content-tabs wrap">

        <div id="d-triggers-add-parameters-content" title="${i18n.text('Triggers.tab.parameters')?js_string?html}">
            <div class="content">
                <div data-options="region:'north',border:false" class="wrap">
                    <h6><@i18n.message key="Triggers.AddDialog.ParametersStep.info.short" /><span><@i18n.message key="Triggers.AddDialog.ParametersStep.info.long" /></span></h6>
                </div>

                <div data-options="region:'center',border:false">
                    <fieldset class="wrap" style="margin-bottom:2em">
                        <legend><@i18n.message key="Triggers.tab.general" /></legend>

                        <div><@form.dn name="name" required=true><@i18n.message key="Triggers.label.name" /></@></div>
                        <div><@form.select name="eventtype" items={} description=i18n.text("Triggers.label.eventType")><@i18n.message key="Triggers.label.eventType" /></@></div>
                        <div><@form.memo name="description"><@i18n.message key="Triggers.label.description" /></@></div>
                        <div><@form.select name="tags" items=[]><@i18n.message key="Triggers.label.tags" /></@></div>
                        <div class="checkbox"><@form.checkbox name="enabled"><@i18n.message key="Triggers.label.triggerEnabled" /></@></div>
                    </fieldset>
                    <@trigger.parameters_advanced_panel />
                </div>
            </div>
        </div>

        <div id="d-triggers-add-expression-content" title="${i18n.text('Triggers.tab.conditions')?js_string?html}">
            <@trigger.expression_panel>
                <h6><@i18n.message key="Triggers.AddDialog.ExpressionStep.info.short" /><span><@i18n.message key="Triggers.AddDialog.ExpressionStep.info.long" /></span></h6>
            </@>
        </div>

        <div id="d-triggers-add-actions-content" title="${i18n.text('Triggers.tab.actions')?js_string?html}">
            <@trigger.actions_panel>
                <h6><@i18n.message key="Triggers.AddDialog.ActionsStep.info.short" /><span><@i18n.message key="Triggers.AddDialog.ActionsStep.info.long" /></span></h6>
            </@>
        </div>
    </div>
</@form.dialog>