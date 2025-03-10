<@form.dialog id="d-triggers-actiontype" title=i18n.text("Triggers.ActionTypeDialog.title")>
    <@form.fields name="triggeractiontypefields" title=i18n.text("Triggers.ActionTypeDialog.info.short") description=i18n.text("Triggers.ActionTypeDialog.info.long")>
        <div><@form.select name="action" items={} description=i18n.text("Triggers.label.actionType")><@i18n.message key="Triggers.label.actionType" /></@></div>
    </@form.fields>
</@form.dialog>

<@form.dialog id="d-triggers-addaction" title=i18n.text("Triggers.AddActionDialog.title")>
    <div id="triggeractionfields">
        <div data-options="region:'north',border:false">
            <h6 style="margin-bottom:1em">
                <@i18n.message key="Triggers.AddActionDialog.info.short" />
                <span><@i18n.message key="Triggers.AddActionDialog.info.long" /></span>
            </h6>
        </div>

        <div data-options="region:'center',border:false" style="padding:1em">
            <div role="tablist">
                <div role="tab" title="${i18n.text("Triggers.tab.parameters")}">
                    <fieldset name="parametersfields" class="content large"></fieldset>
                </div>
                <div role="tab" title="${i18n.text("Triggers.tab.advanced")}">
                    <fieldset name="advancedparametersfields" class="content large"></fieldset>
                </div>
            </div>
        </div>

        <div data-options="region:'south',border:false">
            <div class="viewpane-toolbar toolbar-selection" style="margin:1em">
                <@form.button name="addvariable"><@i18n.message key="Triggers.button.addVariable" /></@>
                <@form.button name="addfunction"><@i18n.message key="Triggers.button.addFunction" /></@>
                <@form.button name="linkaction"><@i18n.message key="Triggers.button.linkAction" /></@>
            </div>
        </div>
    </div>
</@form.dialog>

<@form.dialog id="d-triggers-editaction" title=i18n.text("Triggers.EditActionDialog.title")>
    <div id="triggeractionfields">
        <div data-options="region:'north',border:false">
            <h6 style="margin-bottom:1em">
                <@i18n.message key="Triggers.EditActionDialog.info.short" />
                <span><@i18n.message key="Triggers.EditActionDialog.info.long" /></span>
            </h6>
        </div>

        <div data-options="region:'center',border:false" style="padding:1em">
            <div role="tablist">
                <div role="tab" title="${i18n.text("Triggers.tab.parameters")}">
                    <fieldset name="parametersfields" class="content large"></fieldset>
                </div>
                <div role="tab" title="${i18n.text("Triggers.tab.advanced")}">
                    <fieldset name="advancedparametersfields" class="content large"></fieldset>
                </div>
            </div>
        </div>

        <div data-options="region:'south',border:false">
            <div class="viewpane-toolbar toolbar-selection" style="margin:1em">
                <@form.button name="addvariable"><@i18n.message key="Triggers.button.addVariable" /></@>
                <@form.button name="addfunction"><@i18n.message key="Triggers.button.addFunction" /></@>
                <@form.button name="linkaction"><@i18n.message key="Triggers.button.linkAction" /></@>
            </div>
        </div>
    </div>
</@form.dialog>