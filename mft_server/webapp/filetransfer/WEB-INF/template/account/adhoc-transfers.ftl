<#ftl strip_whitespace=true>

<div id="account-adhoc-transfers-fields">

    <div data-options="region:'center',border:false">
        <@form.datagrid name="adhoctransfers" height="" columns=["date", "subject", "recipient", "files", "downloads", "type", "status"]; col><@i18n.message key="AdHocTransfers.column.${col}" /></@>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar">
            <div class="toolbar-selection">
                <@form.button name="copylink" ariaHaspopup="true"><@i18n.message key="AdHocTransfers.button.copyLink" /></@>
            </div>
            <div class="toolbar-management">
                <@form.button name="revoke" ariaHaspopup="true"><@i18n.message key="AdHocTransfers.button.revoke" /></@>
                <@form.button name="extend" ariaHaspopup="true"><@i18n.message key="AdHocTransfers.button.extend" /></@>
                <@form.button name="view" ariaHaspopup="true"><@i18n.message key="AdHocTransfers.button.view" /></@>
            </div>
        </div>
    </div>

</div>