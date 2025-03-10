<@form.dialog id="d-adhoctransfer-extend" title=i18n.text('AdHocTransfers.ExtendDialog.title')>
    <fieldset name="adhoctransferextendfields">
        <legend class="hidden-label"><@i18n.message key="AdHocTransfers.ExtendDialog.title" /></legend>
        <div><@i18n.message key="AdHocTransfers.ExtendDialog.message" /></div><br/>
        <div><@form.text name="date" maxlength=50 required=true><@i18n.message key="AdHocTransfers.label.date" /></@></div>
    </fieldset>
</@form.dialog>

<@form.dialog id="d-adhoctransfer-view" title=i18n.text('AdHocTransfers.ViewDialog.title')>
    <div id="adhoctransferemailfields">
        <div data-options="region:'north',border:false" style="min-height:200px;padding:10px">
            <fieldset class="pane">
                <dl class="group">
                    <dt><@i18n.message key="AdHocTransfers.label.sender" /></dt><dd><span aria-label="sender"></span></dd>
                    <dt><@i18n.message key="AdHocTransfers.label.date" /></dt><dd><span aria-label="date"></span></dd>
                    <dt><@i18n.message key="AdHocTransfers.label.recipient" /></dt><dd><span aria-label="recipient"></span></dd>
                    <dt><@i18n.message key="AdHocTransfers.label.cc" /></dt><dd><span aria-label="cc"></span></dd>
                    <dt><@i18n.message key="AdHocTransfers.label.bcc" /></dt><dd><span aria-label="bcc"></span></dd>
                    <dt><@i18n.message key="AdHocTransfers.label.message" /></dt><dd><span aria-label="message"></span></dd>
                </dl>
            </fieldset>
        </div>

        <div data-options="region:'center',border:false" style="padding:1em">
            <@form.datagrid name="transferobjects" height="" columns=["name", "path", "downloads", "expires", "deleteAfter", "type", "status"];col><@i18n.message key="AdHocTransfers.column.${col}" /></@>
        </div>

        <div data-options="region:'south',border:false" class="layout-pane-bottom" style="padding:0 1em 1em">
            <div class="viewpane-toolbar inline">
                <div class="toolbar-selection">
                    <@form.button name="copylink" ariaHaspopup="true"><@i18n.message key="AdHocTransfers.button.copyLink" /></@>
                </div>
                <div class="toolbar-management">
                    <@form.button name="revoke" ariaHaspopup="true"><@i18n.message key="AdHocTransfers.button.revoke" /></@>
                    <@form.button name="extend" ariaHaspopup="true"><@i18n.message key="AdHocTransfers.button.extend" /></@>
                </div>
            </div>
        </div>
    </div>
</@form.dialog>