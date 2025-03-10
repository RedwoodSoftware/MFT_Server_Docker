<#macro adhoc_delete_after_period range name="deleteafter">
    <div class="row"><@form.checkbox name="use${name}"><@i18n.message key="Storage.ShareFileDialog.label.deleteAfterPeriod" /></@>
        <select name="${name}" aria-label="${i18n.text("Storage.ShareFileDialog.label.deleteAfterPeriod")?html}">
            <#list range.lowerBound..range.upperBound as deleteAfterDays>
                <#if deleteAfterDays % range.step == 0>
                    <option>${deleteAfterDays?html}</option>
                </#if>
            </#list>
        </select>
        <span><@i18n.message key="Storage.ShareFileDialog.label.deleteAfterPeriodUnit" /></span>
    </div>
</#macro>

<@form.dialog id="d-storage-adhoc-external" title=i18n.text("Storage.ShareFileDialog.title.email")?html escapeAttrs=false>
    <fieldset name="adhoctransferfields" class="large">
        <legend class="hidden-label"><@i18n.message key="Storage.ShareFileDialog.title.email" /></legend>

        <div style="white-space: nowrap"><@form.email name="to" required=true><@i18n.message key="Storage.ShareFileDialog.label.recipient" /></@>
            <span><@form.button name="addcc" title="${i18n.text('Storage.ShareFileDialog.tooltip.cc')?html}"><@i18n.message key="Storage.ShareFileDialog.label.cc" /></@></span>
            <span><@form.button name="addbcc"title="${i18n.text('Storage.ShareFileDialog.tooltip.bcc')?html}"><@i18n.message key="Storage.ShareFileDialog.label.bcc" /></@></span>
        </div>
        <div class="row"><@form.email name="cc"><@i18n.message key="Storage.ShareFileDialog.label.cc" /></@></div>
        <div class="row"><@form.email name="bcc"><@i18n.message key="Storage.ShareFileDialog.label.bcc" /></@></div>
        <div class="row" style="white-space: nowrap"><@form.email name="from" required=true><@i18n.message key="Storage.ShareFileDialog.label.sender" /></@>&nbsp;
            <span><@form.button name="addreplyto" title="${i18n.text('Storage.ShareFileDialog.tooltip.replyTo')?html}"><@i18n.message key="Storage.ShareFileDialog.label.replyTo" /></@></span>
        </div>
        <div class="row"><@form.email name="replyto"><@i18n.message key="Storage.ShareFileDialog.label.replyTo" /></@></div>
        <div><@form.dn name="subject" required=true><@i18n.message key="Storage.ShareFileDialog.label.subject" /></@></div>
        <div><@form.memo name="message"><@i18n.message key="Storage.ShareFileDialog.label.message" /></@></div>
        <div><@form.memo name="filelist"><@i18n.message key="Storage.ShareFileDialog.label.files" /></@></div>
        <#if model.requestAdHocTransferPasswordFromUser>
        <div><@form.select name="protectwith" items={
            'CUSTOM': i18n.text("Storage.ShareFileDialog.passwordProtection.CUSTOM")?html,
            'RANDOM': i18n.text("Storage.ShareFileDialog.passwordProtection.RANDOM")?html
        }><@i18n.message key="Storage.ShareFileDialog.label.passwordProtection" /></@>&nbsp;<input type="text" name="custompwd" /></div>
        </#if>
        <div class="row"><@form.checkbox name="useexpires"><@i18n.message key="Storage.ShareFileDialog.label.expiresPeriod" /></@>
            <select name="expires" aria-label="${i18n.text("Storage.ShareFileDialog.label.expiresPeriod")?html}">
                <#list model.linkExpirationRange.lowerBound..model.linkExpirationRange.upperBound as expires>
                    <#if expires % model.linkExpirationRange.step == 0>
                        <option>${expires?html}</option>
                    </#if>
                </#list>
            </select>
            <span><@i18n.message key="Storage.ShareFileDialog.label.expiresPeriodUnit" /></span>
        </div>
        <div class="row"><@form.checkbox name="usemaxdloads"><@i18n.message key="Storage.ShareFileDialog.label.maxDownloads" /></@><input type="text" name="maxdownloads" value="${model.maxDownloadsDefault}" aria-label="${i18n.text("Storage.ShareFileDialog.label.maxDownloads")?html}"/></div>
        <div class="row"><@form.checkbox name="deleteaftermaxdownloads"><@i18n.message key="Storage.ShareFileDialog.label.deleteAfterMaxDownloads" /></@></div>
        <div class="row"><@adhoc_delete_after_period name="deleteafter" range=model.deleteAfterRange /></div>
    </fieldset>
</@form.dialog>


<@form.dialog id="d-storage-adhoc-internal" title=i18n.text("Storage.ShareFileDialog.title.internal")?html escapeAttrs=false>
    <fieldset name="adhoctransferfields" class="large">
        <legend class="hidden-label"><@i18n.message key="Storage.ShareFileDialog.title.internal" /></legend>

        <div style="white-space: nowrap"><@form.email name="to" required=true><@i18n.message key="Storage.ShareFileDialog.label.recipient" /></@>
            <span><@form.button name="addcc" title="${i18n.text('Storage.ShareFileDialog.tooltip.cc')?html}"><@i18n.message key="Storage.ShareFileDialog.label.cc" /></@></span>
            <span><@form.button name="addbcc"title="${i18n.text('Storage.ShareFileDialog.tooltip.bcc')?html}"><@i18n.message key="Storage.ShareFileDialog.label.bcc" /></@></span>
        </div>
        <div class="row"><@form.email name="cc"><@i18n.message key="Storage.ShareFileDialog.label.cc" /></@></div>
        <div class="row"><@form.email name="bcc"><@i18n.message key="Storage.ShareFileDialog.label.bcc" /></@></div>
        <div class="row" style="white-space: nowrap"><@form.email name="from"><@i18n.message key="Storage.ShareFileDialog.label.sender" /></@>&nbsp;
            <span><@form.button name="addreplyto" title="${i18n.text('Storage.ShareFileDialog.tooltip.replyTo')?html}"><@i18n.message key="Storage.ShareFileDialog.label.replyTo" /></@></span>
        </div>
        <div class="row"><@form.email name="replyto"><@i18n.message key="Storage.ShareFileDialog.label.replyTo" /></@></div>
        <div><@form.dn name="subject" required=true><@i18n.message key="Storage.ShareFileDialog.label.subject" /></@></div>
        <div><@form.memo name="message"><@i18n.message key="Storage.ShareFileDialog.label.message" /></@></div>
        <div><@form.memo name="filelist"><@i18n.message key="Storage.ShareFileDialog.label.files" /></@></div>
        <div class="row"><@form.checkbox name="useexpires"><@i18n.message key="Storage.ShareFileDialog.label.expiresPeriod" /></@>
            <select name="expires" aria-label="${i18n.text("Storage.ShareFileDialog.label.expiresPeriod")?html}">
                <#list model.linkExpirationRange.lowerBound..model.linkExpirationRange.upperBound as expires>
                    <#if expires % model.linkExpirationRange.step == 0>
                        <option>${expires?html}</option>
                    </#if>
                </#list>
            </select>
            <span><@i18n.message key="Storage.ShareFileDialog.label.expiresPeriodUnit" /></span>
        </div>
        <div class="row"><@form.checkbox name="usemaxdloads"><@i18n.message key="Storage.ShareFileDialog.label.maxDownloads" /></@><input type="text" name="maxdownloads" value="${model.maxDownloadsDefault}" aria-label="${i18n.text("Storage.ShareFileDialog.label.maxDownloads")?html}"/></div>
        <div class="row"><@form.checkbox name="deleteaftermaxdownloads"><@i18n.message key="Storage.ShareFileDialog.label.deleteAfterMaxDownloads" /></@></div>
        <div class="row"><@adhoc_delete_after_period name="deleteafter" range=model.deleteAfterRange /></div>
    </fieldset>
</@form.dialog>


<@form.dialog id="d-storage-adhoc-anonymous" title=i18n.text("Storage.ShareFileDialog.title.copyLink")?html escapeAttrs=false>
    <fieldset name="adhoctransferfields" class="large">
        <legend class="hidden-label"><@i18n.message key="Storage.ShareFileDialog.title.copyLink" /></legend>

        <div><@form.dn name="subject" required=true><@i18n.message key="Storage.ShareFileDialog.label.subject" /></@></div>
        <div><@form.memo name="filelist"><@i18n.message key="Storage.ShareFileDialog.label.files" /></@></div>
        <div class="row"><@form.checkbox name="useexpires"><@i18n.message key="Storage.ShareFileDialog.label.expiresPeriod" /></@>
            <select name="expires" aria-label="${i18n.text("Storage.ShareFileDialog.label.expiresPeriod")?html}">
                <#list model.linkExpirationRange.lowerBound..model.linkExpirationRange.upperBound as expires>
                    <#if expires % model.linkExpirationRange.step == 0>
                        <option>${expires?html}</option>
                    </#if>
                </#list>
            </select>
            <span><@i18n.message key="Storage.ShareFileDialog.label.expiresPeriodUnit" /></span>
        </div>
        <div class="row"><@form.checkbox name="usemaxdloads"><@i18n.message key="Storage.ShareFileDialog.label.maxDownloads" /></@><input type="text" name="maxdownloads" value="${model.maxDownloadsDefault}" aria-label="${i18n.text("Storage.ShareFileDialog.label.maxDownloads")?html}"/></div>
        <div class="row"><@form.checkbox name="deleteaftermaxdownloads"><@i18n.message key="Storage.ShareFileDialog.label.deleteAfterMaxDownloads" /></@></div>
        <div class="row"><@adhoc_delete_after_period name="deleteafter" range=model.deleteAfterRange /></div>
    </fieldset>
</@form.dialog>

<@form.dialog id="d-storage-adhoc-view" title=i18n.text('Storage.ViewFileShareDialog.title')>
    <div id="adhoctransferfields">
        <div data-options="region:'north',border:false" class="layout-pane-top" style="min-height:150px;padding:10px">
            <fieldset class="pane">
                <dl class="group">
                    <dt><@i18n.message key="AdHocTransfers.label.sender" /></dt><dd><span aria-label="sender"></span></dd>
                    <dt><@i18n.message key="AdHocTransfers.label.subject" /></dt><dd><span aria-label="subject"></span></dd>
                    <dt><@i18n.message key="AdHocTransfers.label.date" /></dt><dd><span aria-label="date"></span></dd>
                </dl>
            </fieldset>
        </div>

        <div data-options="region:'center',border:false" style="padding:1em">
            <@form.datagrid name="entries" height="" columns=["name", "downloads", "expires", "status"];col><@i18n.message key="AdHocTransfers.column.${col}" /></@>
        </div>
    </div>
</@form.dialog>


