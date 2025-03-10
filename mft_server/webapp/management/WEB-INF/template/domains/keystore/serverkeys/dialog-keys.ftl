<#if permissions.domainKeystoreControlAllowed>
    <@form.dialog id="d-serverkey-generatecrl" title=i18n.text("ServerKeys.GenerateCrlDialog.title")>
        <fieldset name="generateserverkeycrlfields" class="content">
            <@form.fields_title title=i18n.text("ServerKeys.GenerateCrlDialog.info.short") description=i18n.text("ServerKeys.GenerateCrlDialog.info.long") />
            <div><@form.select name="signingkey" items=[] required=true><@i18n.message key="ServerKeys.GenerateCrlDialog.label.signingKey" /></@></div>
            <div><@form.number name="expires" required=true><@i18n.message key="ServerKeys.GenerateCrlDialog.label.expires" /></@>&nbsp;&nbsp;<span><@i18n.message key="ServerKeys.GenerateCrlDialog.label.expiresUnit" /></span></div>
        </fieldset>
    </@form.dialog>
</#if>

<@form.dialog id="d-serverkey-verifycrl" title=i18n.text("ServerKeys.VerifyCrlDialog.title")>
    <fieldset name="verifyserverkeycrlfields" class="content">
        <@form.fields_title title=i18n.text("ServerKeys.VerifyCrlDialog.info.short") description=i18n.text("ServerKeys.VerifyCrlDialog.info.long") />
        <div><@form.input type="text" name="file" required=true><@i18n.message key="ServerKeys.VerifyCrlDialog.file" /></@></div>
    </fieldset>
</@form.dialog>

<#if permissions.domainKeystoreControlAllowed>
    <@form.dialog id="d-serverkey-generate" title=i18n.text("ServerKeys.GenerateDialog.title")>
        <div class="content">
            <div data-options="region:'north',border:false">
                <h6><@i18n.message key="ServerKeys.GenerateDialog.info.short" /><span><@i18n.message key="ServerKeys.GenerateDialog.info.long" /></span></h6>
            </div>
            <div class="wrap" data-options="region:'center',border:false">
                <div role="tablist">
                    <div role="tab" title="${i18n.text("ServerKeys.legend.general")}">
                        <fieldset class="content" style="padding:1.7em 2em;height:16em">
                            <div><@form.dn name="alias" maxlength="255" required=true><@i18n.message "ServerKeys.label.alias" /></@></div>
                            <div><@form.select name="algorithm" items=["RSA", "DSA", "EC", "ED"]><@i18n.message "ServerKeys.label.keyAlgorithm" /></@></div>
                            <div><@form.select name="keylength" items=[1024?c, 2048?c, 4096?c]><@i18n.message "ServerKeys.label.keyLength" /></@></div>
                            <div><@form.select name="keycurve" items=[]><@i18n.message key="ServerKeys.label.keyCurve" /></@></div>
                        </fieldset>
                    </div>
                    <div role="tab" title="${i18n.text("ServerKeys.legend.parameters")}">
                        <fieldset class="content large" style="padding:1.7em 2em">
                            <div><@form.number name="period" maxlength="5"><@i18n.message key="ServerKeys.label.period" /></@>&nbsp;<span><@i18n.message key="ServerKeys.label.periodUnit" /></span></div>
                            <div><@form.dn name="commonname" required=false><@i18n.message key="ServerKeys.label.commonName" /></@></div>
                            <div><@form.dn name="subjectalternative" required=false><@i18n.message key="ServerKeys.label.subjectAlternativeName" /></@></div>
                            <div><@form.dn name="organizationunit" required=false><@i18n.message key="ServerKeys.label.organizationUnit" /></@></div>
                            <div><@form.dn name="organization" required=false><@i18n.message key="ServerKeys.label.organization" /></@></div>
                            <div><@form.dn name="locality" required=false><@i18n.message key="ServerKeys.label.locality" /></@></div>
                            <div><@form.dn name="state" required=false><@i18n.message key="ServerKeys.label.state" /></@></div>
                            <div><@form.dn name="country" required=false><@i18n.message key="ServerKeys.label.country" /></@></div>
                        </fieldset>
                    </div>
                    <div role="tab" title="${i18n.text("ServerKeys.legend.advanced")}">
                        <fieldset class="noborder pane" style="padding:1.7em 2em">
                            <#include "fieldset-advanced.ftl" />
                        </fieldset>
                    </div>
                </div>
            </div>
        </div>
    </@form.dialog>
</#if>

<#if permissions.domainKeystoreControlAllowed>
    <@form.dialog id="d-serverkey-generatecert" title=i18n.text("ServerKeys.GenerateCertificateDialog.title") header=i18n.text("ServerKeys.GenerateCertificateDialog.info.short") description=i18n.text("ServerKeys.GenerateCertificateDialog.info.long")>
        <div role="tablist">
            <div role="tab" title="${i18n.text("ServerKeys.legend.parameters")}">
                <fieldset class="content large" style="padding:1.7em 2em">
                    <div><@form.number name="period" maxlength="5"><@i18n.message key="ServerKeys.label.period" /></@>&nbsp;<span><@i18n.message key="ServerKeys.label.periodUnit" /></span></div>
                    <div><@form.dn name="commonname" required=false><@i18n.message key="ServerKeys.label.commonName" /></@></div>
                    <div><@form.dn name="subjectalternative" required=false><@i18n.message key="ServerKeys.label.subjectAlternativeName" /></@></div>
                    <div><@form.dn name="organizationunit" required=false><@i18n.message key="ServerKeys.label.organizationUnit" /></@></div>
                    <div><@form.dn name="organization" required=false><@i18n.message key="ServerKeys.label.organization" /></@></div>
                    <div><@form.dn name="locality" required=false><@i18n.message key="ServerKeys.label.locality" /></@></div>
                    <div><@form.dn name="state" required=false><@i18n.message key="ServerKeys.label.state" /></@></div>
                    <div><@form.dn name="country" required=false><@i18n.message key="ServerKeys.label.country" /></@></div>
                </fieldset>
            </div>
            <div role="tab" title="${i18n.text("ServerKeys.legend.advanced")}">
                <fieldset class="noborder pane" style="padding:1.7em 2em">
                    <#include "fieldset-advanced.ftl" />
                </fieldset>
            </div>
        </div>
    </@form.dialog>
</#if>

<#if permissions.domainKeystoreControlAllowed>
    <@form.dialog id="d-serverkey-generatecsr" title=i18n.text("ServerKeys.GenerateCsrDialog.title")>
        <@form.fields name="generateserverkeycsrfields" title=i18n.text("ServerKeys.GenerateCsrDialog.info.short") description=i18n.text("ServerKeys.GenerateCsrDialog.info.long")>
            <div><@form.dn name="filename" required=true><@i18n.message key="ServerKeys.label.csrFilename" /></@></div>
        </@form.fields>
    </@form.dialog>
</#if>

<#if permissions.domainKeystoreControlAllowed>
    <@form.dialog id="d-serverkey-import" title=i18n.text("ServerKeys.ImportDialog.title")>
        <fieldset name="importserverkeyfields" class="large">
            <@form.fields_title title=i18n.text("ServerKeys.ImportDialog.info.short") description=i18n.text("ServerKeys.ImportDialog.info.long")/>
            <div><@form.dn name="alias" required=true><@i18n.message key="ServerKeys.label.alias" /></@></div>
            <div><@form.input type="text" name="file" required=true><@i18n.message key="ServerKeys.label.file" /></@></div>
            <div><@form.text name="filepwd" maxlength="255"><@i18n.message key="ServerKeys.label.filePassword" /></@></div>
            <div><@form.text name="keyalias" maxlength="255"><@i18n.message key="ServerKeys.label.keyAlias" /></@></div>
            <div><@form.text name="keypwd" maxlength="255"><@i18n.message key="ServerKeys.label.keyPassword" /></@></div>
            <div><@form.input type="text" name="crtfile"><@i18n.message key="ServerKeys.label.certificateFile" /></@></div>
            <div><@form.text name="crtfilepwd" maxlength="255"><@i18n.message key="ServerKeys.label.certificatePassword" /></@></div>
            <div><@form.text name="crtalias" maxlength="255"><@i18n.message key="ServerKeys.label.certificateAlias" /></@></div>
        </fieldset>
    </@form.dialog>
    <@form.dialog id="d-serverkey-importjson" title=i18n.text("ServerKeys.ImportBatchDialog.title")>
        <@form.fields name="importserverkeyjsonfields" title=i18n.text("ServerKeys.ImportBatchDialog.info.short") description=i18n.text("ServerKeys.ImportBatchDialog.info.long")>
            <div><@form.input type="text" name="file" required=true><@i18n.message key="ServerKeys.ImportBatchDialog.label.file" /></@></div>
            <div class="checkbox"><@form.checkbox name="overwrite"><@i18n.message key="ServerKeys.ImportBatchDialog.label.overwrite" /></@></div>
        </@form.fields>
    </@form.dialog>
    <@form.dialog id="d-serverkey-importcrt" title=i18n.text("ServerKeys.ImportCertificatesDialog.title")>
        <@form.fields name="importserverkeycrtfields" title=i18n.text("ServerKeys.ImportCertificatesDialog.info.short") description=i18n.text("ServerKeys.ImportCertificatesDialog.info.long")>
            <div><@form.input type="text" name="file" required=true><@i18n.message key="ServerKeys.ImportCertificatesDialog.label.file" /></@></div>
            <div><@form.text name="filepwd" maxlength="255"><@i18n.message key="ServerKeys.ImportCertificatesDialog.label.filePassword" /></@></div>
            <div><@form.text name="alias" maxlength="255"><@i18n.message key="ServerKeys.ImportCertificatesDialog.label.certificateAlias" /></@></div>
        </@form.fields>
    </@form.dialog>
</#if>