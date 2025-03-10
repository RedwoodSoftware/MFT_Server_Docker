<@form.dialog id="d-clientkey-verifycrl" title=i18n.text("ClientKeys.VerifyCrlDialog.title")>
    <fieldset name="verifyclientkeycrlfields" class="content">
        <@form.fields_title title=i18n.text("ClientKeys.VerifyCrlDialog.info.short") description=i18n.text("ClientKeys.VerifyCrlDialog.info.long") />
        <div><@form.input type="file" name="file" required=true><@i18n.message key="ClientKeys.VerifyCrlDialog.label.file" /></@></div>
    </fieldset>
</@form.dialog>

<#if permissions.domainKeystoreControlAllowed>
    <@form.dialog id="d-clientkey-generate" title=i18n.text("ClientKeys.GenerateDialog.title")>
        <div class="content">
            <div data-options="region:'north',border:false">
                <h6><@i18n.message key="ClientKeys.GenerateDialog.info.short" /><span><@i18n.message key="ClientKeys.GenerateDialog.info.long" /></span></h6>
            </div>
            <div class="wrap" data-options="region:'center',border:false">
                <div role="tablist">
                    <div role="tab" title="${i18n.text("ClientKeys.GenerateDialog.legend.general")}">
                        <fieldset class="content" style="padding:1.7em 2em;height:16em">
                            <div><@form.dn name="alias" maxlength="255" required=true><@i18n.message "ClientKeys.GenerateDialog.label.alias" /></@></div>
                            <div><@form.select name="algorithm" items=["RSA", "DSA", "EC", "ED"]><@i18n.message "ClientKeys.GenerateDialog.label.keyAlgorithm" /></@></div>
                            <div><@form.select name="keylength" items=[1024?c, 2048?c, 4096?c]><@i18n.message "ClientKeys.GenerateDialog.label.keyLength" /></@></div>
                            <div><@form.select name="keycurve" items=[]><@i18n.message key="ClientKeys.GenerateDialog.label.keyCurve" /></@></div>
                        </fieldset>
                    </div>
                    <div role="tab" title="${i18n.text("ClientKeys.GenerateDialog.legend.parameters")}">
                        <fieldset class="large content" style="padding:1.7em 2em">
                            <div><@form.number name="period" maxlength="5"><@i18n.message key="ClientKeys.GenerateDialog.label.period" /></@>&nbsp;<span><@i18n.message key="ClientKeys.GenerateDialog.label.periodUnit" /></span></div>
                            <div><@form.dn name="cn" required=true><@i18n.message key="ClientKeys.GenerateDialog.label.commonName" /></@></div>
                            <div><@form.dn name="sa" required=false><@i18n.message key="ClientKeys.GenerateDialog.label.subjectAlternative" /></@></div>
                            <div><@form.dn name="ou" required=false><@i18n.message key="ClientKeys.GenerateDialog.label.organizationUnit" /></@></div>
                            <div><@form.dn name="o" required=false><@i18n.message key="ClientKeys.GenerateDialog.label.organization" /></@></div>
                            <div><@form.dn name="l" required=false><@i18n.message key="ClientKeys.GenerateDialog.label.locality" /></@></div>
                            <div><@form.dn name="s" required=false><@i18n.message key="ClientKeys.GenerateDialog.label.state" /></@></div>
                            <div><@form.dn name="c" required=false><@i18n.message key="ClientKeys.GenerateDialog.label.country" /></@></div>
                        </fieldset>
                    </div>
                </div>
            </div>
        </div>
    </@form.dialog>
</#if>