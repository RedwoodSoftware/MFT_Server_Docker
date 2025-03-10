<#macro parameters_advanced_panel>
    <fieldset class="wrap">
        <legend><@i18n.message key="Triggers.tab.advanced" /></legend>

        <div class="checkbox"><@form.checkbox name="ignoredomainstate"><@i18n.message key="Triggers.label.ignoreDomainState" /></@>&nbsp;
            <@form.select name="domainstate" items={
                'STOPPED': i18n.text("Triggers.ignoredDomainState.STOPPED"),
                'PAUSED': i18n.text("Triggers.ignoredDomainState.PAUSED"),
                'STOPPED_OR_PAUSED': i18n.text("Triggers.ignoredDomainState.STOPPED_OR_PAUSED")
            }/>
        </div>
        <div class="checkbox">
            <@form.checkbox name="singleinstance"><@i18n.message key="Triggers.label.triggerSingleInstance.1" /></@>&nbsp;
            <@form.select name="singleinstancemode" items={
                'QUEUED': i18n.text("Triggers.singleInstanceMode.QUEUED"),
                'SKIPPED': i18n.text("Triggers.singleInstanceMode.SKIPPED")
            }/>&nbsp;<@i18n.message key="Triggers.label.triggerSingleInstance.2" />
        </div>
        <div class="checkbox"><@form.checkbox name="triggerasync"><@i18n.message key="Triggers.label.triggerAsynchronous" /></@></div>
        <div class="checkbox"><@form.checkbox name="fireerror"><@i18n.message key="Triggers.label.fireError" /></@></div>
    </fieldset>
</#macro>

<#macro expression_panel>
    <div class="content">
        <div data-options="region:'north',border:false" class="wrap">
            <#nested />
        </div>
        <div data-options="region:'center',border:false" class="wrap">
            <div><label><@i18n.message key="Triggers.label.expressionBuilder" /></label><span aria-label="query-builder-warning" class="warning"><span aria-label="warning-message"></span><@i18n.message key="Triggers.Message.expressionOverrideMode" /></span></div>
            <div aria-label="querybuilder"></div>
            <div>
                <label for="d-addtrigger-expr"><@i18n.message key="Triggers.label.expression" /></label>
                <span class="info" role="tooltip" aria-describedby="trigger-expression-help">&nbsp;</span>
                <div id="trigger-expression-help" class="hidden">
                    <div class="info-container">
                        <div class="info-content"><@i18n.message key="Triggers.label.expression.description" /></div>
                        <div class="info-example"><@i18n.message key="Triggers.label.expression.example" /></div>
                    </div>
                </div>
                <br/>
                <@form.memo id="d-addtrigger-expr" name="expression" autocomplete="off" />
            </div>
            <div class="checkbox row"><@form.checkbox name="override"><@i18n.message key="Triggers.label.override" /></@></div>
        </div>
        <div data-options="region:'south',border:false">
            <div class="viewpane-toolbar inline" style="padding: 0 1em 1em">
                <div class="toolbar-selection">
                    <@form.button name="variables"><@i18n.message key="Triggers.button.variables" /></@>
                    <@form.button name="functions"><@i18n.message key="Triggers.button.functions" /></@>
                    <@form.button name="operators"><@i18n.message key="Triggers.button.operators" /></@>
                    <@form.button name="constants"><@i18n.message key="Triggers.button.constants" /></@>
                    <@form.button name="operatorand"><@i18n.message key="Triggers.button.operatorAnd" /></@>
                    <@form.button name="operatoror"><@i18n.message key="Triggers.button.operatorOr" /></@>
                </div>
                <div class="toolbar-management">
                    <@form.button name="timeexpression"><@i18n.message key="Triggers.button.timeExpression" /></@>
                    <@form.button name="testexpression"><@i18n.message key="Triggers.button.testExpression" /></@>
                </div>
            </div>
        </div>
    </div>
</#macro>

<#macro actions_panel>
    <div class="content">
        <div data-options="region:'north',border:false" class="wrap">
            <#nested />
        </div>
        <div data-options="region:'center',border:false" class="wrap">
            <div class="chart-container" data-options="fit:true,border:true">
                <div class="chart" aria-label="actions-workflow"></div>
                <div id="chart-toolbar">
                    <span><span class="select-none l-btn-text"><@i18n.message key="Triggers.label.zoom" />&nbsp;</span></span>
                    <@form.button name="chart-zoom-out" dataOptions="width:32,height:32" class="select-none">&nbsp;-&nbsp;</@>
                    <@form.button name="chart-zoom-scale" dataOptions="width:50,height:32" class="select-none" ariaLabel=i18n.text("Triggers.label.zoomReset") title=i18n.text("Triggers.label.zoomReset")>100%</@>
                    <@form.button name="chart-zoom-in" dataOptions="width:32,height:32" class="select-none">&nbsp;+&nbsp;</@>
                </div>
            </div>
        </div>
        <div data-options="region:'south',border:false">
            <div class="viewpane-toolbar inline" style="padding: 0 1em 1em">
                <div class="toolbar-selection">
                    <@form.button name="copy"><@i18n.message key="Triggers.button.copy" /></@>
                </div>
                <div class="toolbar-management">
                    <@form.button name="add"><@i18n.message key="Triggers.button.add" /></@>
                    <@form.button name="edit"><@i18n.message key="Triggers.button.edit" /></@>
                    <@form.button name="delete"><@i18n.message key="Triggers.button.delete" /></@>
                </div>
            </div>
        </div>
    </div>
</#macro>