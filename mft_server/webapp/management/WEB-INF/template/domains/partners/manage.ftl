<div id="trading-partners-fields">
    <div data-options="region:'center',border:false">
        <@form.datagrid name="tradingpartners" height="" columns=["name", "company", "protocol", "server", "tags"]; col><@i18n.message key="TradingPartners.column.${col}" /></@>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar inline">
        <#if permissions.tradingPartnersControllAllowed>
            <div class="toolbar-selection">
                <@form.button name="email"><@i18n.message key="TradingPartners.button.sendEmail" /></@>
                <@form.button name="emailspec"><@i18n.message key="TradingPartners.button.sendEmailSpec" /></@>
                <#if permissions.tradingPartnerTriggersAllowed>
                    <@form.button name="reportusage"><@i18n.message key="TradingPartners.button.reportUsage" /></@>
                </#if>
                <@form.button name="import"><@i18n.message key="TradingPartners.button.import" /></@>
                <@form.button name="export"><@i18n.message key="TradingPartners.button.export" /></@>
            </div>
            <div class="toolbar-management">
                <@form.button name="add"><@i18n.message key="TradingPartners.button.add" /></@>
                <@form.button name="edit"><@i18n.message key="TradingPartners.button.edit" /></@>
                <@form.button name="copy"><@i18n.message key="TradingPartners.button.copy" /></@>
                <@form.button name="test"><@i18n.message key="TradingPartners.button.test" /></@>
                <@form.button name="delete"><@i18n.message key="TradingPartners.button.delete" /></@>
            </div>
        <#else>
            <div class="toolbar-selection">
                <@form.button name="email"><@i18n.message key="TradingPartners.button.sendEmail" /></@>
                <@form.button name="emailspec"><@i18n.message key="TradingPartners.button.sendEmailSpec" /></@>
                <#if permissions.tradingPartnerTriggersAllowed>
                    <@form.button name="reportusage"><@i18n.message key="TradingPartners.button.reportUsage" /></@>
                </#if>
            </div>
            <div class="toolbar-management">
                <@form.button name="test"><@i18n.message key="TradingPartners.button.test" /></@>
            </div>
        </#if>
        </div>
    </div>
</div>