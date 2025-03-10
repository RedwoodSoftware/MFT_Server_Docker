<div id="oftp-messages-fields">

    <div data-options="region:'center',border:false">
        <@form.datagrid name="oftpmessages" height="" columns=["date", "user", "tradingPartner", "type", "direction", "id", "dataset", "originator", "destination", "status"]; col><@i18n.message key="OftpMessages.column.${col}" /></@>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar inline">
            <#if permissions.oftpMessagesSendOperationAllowed>
                <div class="toolbar-selection">
                    <@form.button name="sendfile"><@i18n.message key="OftpMessages.button.sendFile" /></@>
                    <@form.button name="sendCertificate"><@i18n.message key="OftpMessages.button.sendCertificate" /></@>
                </div>
            </#if>
            <div class="toolbar-management">
                <@form.button name="view"><@i18n.message key="OftpMessages.button.view" /></@>
                <#if permissions.oftpMessagesSendOperationAllowed><@form.button name="resend"><@i18n.message key="OftpMessages.button.resend" /></@></#if>
                <#if permissions.oftpMessagesSendOperationAllowed><@form.button name="sendreceipt"><@i18n.message key="OftpMessages.button.sendReceipt" /></@></#if>
                <#if permissions.oftpMessagesDeleteAllowed><@form.button name="delete"><@i18n.message key="OftpMessages.button.delete" /></@></#if>
            </div>
        </div>
    </div>
</div>