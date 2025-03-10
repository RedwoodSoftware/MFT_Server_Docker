<div id="as2-messages-fields">

    <div data-options="region:'center',border:false">
        <@form.datagrid name="as2messages" height="" columns=["date", "type", "direction", "messageId", "from", "to", "filename", "status", "user", "tradingPartner", "mdn"]; col><@i18n.message key="AS2Messages.column.${col}" /></@>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar inline">
            <#if permissions.as2MessagesSendOperationAllowed>
                <div class="toolbar-selection">
                    <@form.button name="sendfile"><@i18n.message key="AS2Messages.button.sendFile" /></@>
                </div>
            </#if>
            <div class="toolbar-management">
                <@form.button name="view"><@i18n.message key="AS2Messages.button.view" /></@>
                <#if permissions.as2MessagesSendOperationAllowed><@form.button name="resend"><@i18n.message key="AS2Messages.button.resend" /></@></#if>
                <#if permissions.as2MessagesDeleteAllowed><@form.button name="delete"><@i18n.message key="AS2Messages.button.delete" /></@></#if>
            </div>
        </div>
    </div>
</div>