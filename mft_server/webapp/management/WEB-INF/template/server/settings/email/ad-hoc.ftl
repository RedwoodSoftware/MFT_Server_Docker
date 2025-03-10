<div id="adhoc-service-fields" class="easyui-layout" data-options="fit:true,doSize:false,border:false">
    <div data-options="region:'center'" style="padding:16px">

        <div class="easyui-layout" data-options="fit:true,doSize:false,border:false">
            <div data-options="region:'north',border:false" class="layout-pane-top">
                <fieldset class="noborder pane">
                    <div class="checkbox"><@form.checkbox name="enable"><@i18n.message key="AdHocTransfer.label.enable" /></@form.checkbox></div>
                </fieldset>
            </div>

            <div data-options="region:'center',border:false">
                <fieldset class="x-large">
                    <legend><@i18n.message key="AdHocTransfer.title.settings" /></legend>
                    <div><@form.number name="exprangebegin" size="8" maxlength="3"><@i18n.message key="AdHocTransfer.label.expirationRange" /></@>&nbsp;
                        <span><@i18n.message key="AdHocTransfer.label.expirationRange.1" /></span>&nbsp;<input type="text" name="exprangeend" size="8" maxlength="3"/>&nbsp;
                        <span><@i18n.message key="AdHocTransfer.label.expirationRange.2" /></span>&nbsp;<input type="text" name="exprangestep" size="8" maxlength="3"/>&nbsp;
                        <span><@i18n.message key="AdHocTransfer.label.expirationRangeIncrement" /></span>
                    </div>
                    <div><@form.number name="deleterangebegin" size="8" maxlength="3"><@i18n.message key="AdHocTransfer.label.deleteAfterRange" /></@>&nbsp;
                        <span><@i18n.message key="AdHocTransfer.label.deleteAfterRange.1" /></span>&nbsp;<input type="text" name="deleterangeend" size="8" maxlength="3"/>&nbsp;
                        <span><@i18n.message key="AdHocTransfer.label.deleteAfterRange.2" /></span>&nbsp;<input type="text" name="deleterangestep" size="8" maxlength="3"/>&nbsp;
                        <span><@i18n.message key="AdHocTransfer.label.deleteAfterRangeIncrement" /></span>
                    </div>
                    <div><@form.number name="maxdownloads" size="10" maxlength="5"><@i18n.message key="AdHocTransfer.label.maxDownloadsDefault" /></@></div>
                    <div><@form.checkbox name="pwdprotectenabled"><@i18n.message key="AdHocTransfer.label.passwordProtection" /></@>
                        <@form.select name="pwdprotect" items={
                            '1': i18n.text("AdHocTransfer.type.passwordProtection.1"),
                            '2': i18n.text("AdHocTransfer.type.passwordProtection.2")
                        }/>
                    </div>
                </fieldset>

                <fieldset class="x-large">
                    <legend><@i18n.message key="AdHocTransfer.title.allowedSenders" /></legend>
                    <div><@form.text name="senders"><@i18n.message key="AdHocTransfer.label.allowSenders" /></@></div>
                </fieldset>

                <fieldset>
                    <legend><@i18n.message key="AdHocTransfer.title.allowedRecipients" /></legend>
                    <div class="checkbox"><@form.checkbox name="recipientpubcontactallowed"><@i18n.message key="AdHocTransfer.label.allowContactRecipients" /></@></div>
                    <div class="checkbox"><@form.checkbox name="recipienttldallowed"><@i18n.message key="AdHocTransfer.label.allowDomainRecipients" /></@></div>
                    <div><@form.datagrid name="topleveldomains" height="140px" columns=["tld"]; col><@i18n.message key="AdHocTransfer.column.${col}" /></@></div>

                    <div class="viewpane-toolbar toolbar-management inline">
                        <@form.button name="addtld"><@i18n.message key="AdHocTransfer.button.add" /></@>
                        <@form.button name="edittld"><@i18n.message key="AdHocTransfer.button.edit" /></@>
                        <@form.button name="deletetld"><@i18n.message key="AdHocTransfer.button.delete" /></@>
                    </div>
                </fieldset>
            </div>
        </div>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar toolbar-management inline">
            <@form.button name="apply"><@i18n.message key="Application.button.apply" /></@>
            <@form.button name="discard"><@i18n.message key="Application.button.discard" /></@>
        </div>
    </div>
</div>


<@form.dialog id="sseft-dialog-tld">
    <@form.fields name="adhoctldfields" title=i18n.text("AdHocTransfer.TldDialog.info.short") description=i18n.text("AdHocTransfer.TldDialog.info.long")>
        <div><@form.text name="domain" maxlength="255" size="30"><@i18n.message key="AdHocTransfer.label.domain" /></@></div>
    </@form.fields>
</@form.dialog>