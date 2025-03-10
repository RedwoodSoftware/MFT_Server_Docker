<#if permissions.as2MessagesSendOperationAllowed>
    <@form.dialog id="d-as2-sendfile" title=i18n.text("AS2Messages.SendFileDialog.title")>
        <fieldset name="as2sendfilefields" class="content">
            <@form.fields_title title=i18n.text("AS2Messages.SendFileDialog.info.short") description=i18n.text("AS2Messages.SendFileDialog.info.long")/>
            <div><@form.select name="partner" items={}><@i18n.message key="AS2Messages.label.partner" /></@></div>
            <div><@form.path name="file" required=true><@i18n.message key="AS2Messages.label.file" /></@>&nbsp;<@form.button name="browsefile"><@i18n.message "AS2Messages.button.browse" /></@></div>
            <div><@form.path name="debugfile"><@i18n.message key="AS2Messages.label.debugFile" /></@>&nbsp;<@form.button name="browsedebugfile"><@i18n.message "AS2Messages.button.browse" /></@></div>
        </fieldset>
    </@form.dialog>
</#if>

<@form.dialog id="as2-viewrecord" title=i18n.text("AS2Messages.ViewDialog.title")>
    <div id="as2-view-record-accordion">
        <div role="region" title="${i18n.text('AS2Messages.ViewDialog.titleRequest')?html}" data-options="id:'as2-message-request'" style="padding:0">
            <table aria-label="requestview" role="grid"></table>
            <div aria-label="requestrawview" style="padding:0 1em;overflow:auto;height:100%"></div>
        </div>
        <div role="region" title="${i18n.text('AS2Messages.ViewDialog.titleReceipt')?html}" data-options="id:'as2-message-receipt'" style="padding:0;">
            <table aria-label="receiptview" role="grid"></table>
            <div aria-label="receiptrawview" style="padding:0 1em;overflow:auto;height:100%"></div>
        </div>
    </div>
</@form.dialog>