<@form.dialog id="d-triggers-actiontype" title=i18n.text("Triggers.ActionTypeDialog.title")>
    <@form.fields name="triggeractiontypefields" title=i18n.text("Triggers.ActionTypeDialog.info.short") description=i18n.text("Triggers.ActionTypeDialog.info.long")>
        <div><@form.select name="action" items={} ariaDescribedby="trigger-action-help"><@i18n.message key="Triggers.label.actionType" /></@>&nbsp;<span id="trigger-action-help" class="info" role="tooltip"></span></div>
    </@form.fields>
</@form.dialog>

<@form.dialog id="d-triggers-addaction" title=i18n.text("Triggers.AddActionDialog.title")>
    <fieldset name="triggeractionfields" class="panel large">
        <@form.fields_title title=i18n.text("Triggers.AddActionDialog.info.short") description=i18n.text("Triggers.AddActionDialog.info.long")/>
        <div role="tablist">
            <div role="tab" title="${i18n.text("Triggers.tab.parameters")}">
                <fieldset name="parametersfields" class="content large"></fieldset>
            </div>
            <div role="tab" title="${i18n.text("Triggers.tab.advanced")}">
                <fieldset name="advancedparametersfields" class="content large"></fieldset>
            </div>
        </div>
        <div class="viewpane-toolbar toolbar-selection">
            <@form.button name="addvariable"><@i18n.message key="Triggers.button.addVariable" /></@>&nbsp;
            <@form.button name="addfunction"><@i18n.message key="Triggers.button.addFunction" /></@>
        </div>
    </fieldset>
</@form.dialog>

<@form.dialog id="d-triggers-editaction" title=i18n.text("Triggers.EditActionDialog.title")>
    <fieldset name="triggeractionfields" class="panel large">
    <@form.fields_title title=i18n.text("Triggers.EditActionDialog.info.short") description=i18n.text("Triggers.EditActionDialog.info.long")/>
        <div role="tablist">
            <div role="tab" title="${i18n.text("Triggers.tab.parameters")}">
                <fieldset name="parametersfields" class="content large"></fieldset>
            </div>
            <div role="tab" title="${i18n.text("Triggers.tab.advanced")}">
                <fieldset name="advancedparametersfields" class="content large"></fieldset>
            </div>
        </div>
        <div class="viewpane-toolbar toolbar-selection">
            <@form.button name="addvariable"><@i18n.message key="Triggers.button.addVariable" /></@>
            <@form.button name="addfunction"><@i18n.message key="Triggers.button.addFunction" /></@>
        </div>
    </fieldset>
</@form.dialog>