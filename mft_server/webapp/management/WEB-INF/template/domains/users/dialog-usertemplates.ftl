<@form.dialog id="d-usertemplate-add" title=i18n.text("UserTemplates.AddDialog.title") header=i18n.text("UserTemplates.AddDialog.info.short") description=i18n.text("UserTemplates.AddDialog.info.long")>
    <div class="content">
        <div data-options="region:'center',border:false">
            <div role="tablist" class="wrap">
                <div role="tab" class="wrap" title="${i18n.text('UserInfo.title')}"><#include "fieldset-info-addtemplate.ftl" /></div>
                <div role="tab" class="wrap" title="${i18n.text('VirtualFiles.title')}"><#include "../vfs/listing.ftl" /></div>
                <div role="tab" class="wrap" title="${i18n.text('UserQuotas.title')}"><#include "fieldset-quotas.ftl" /></div>
                <div role="tab" class="wrap" title="${i18n.text('UserIpAccess.title')}"><#include "fieldset-ipaccess.ftl" /></div>
                <div role="tab" class="wrap" title="${i18n.text('DomainAdministration.title')}"><#include "fieldset-administration.ftl" /></div>
                <div role="tab" class="wrap" title="${i18n.text('WebOptions.title')}"><#include "fieldset-web.ftl" /></div>
            </div>
        </div>
        <div data-options="region:'south',border:false">
            <div class="viewpane-toolbar inline" style="padding: 0 1em 1em">
                <div class="toolbar-selection">
                    <@form.button name="addvar"><@i18n.message "UserTemplates.button.addVariable" /></@>
                </div>
            </div>
        </div>
    </div>
</@form.dialog>

<@form.dialog id="d-usertemplate-edit" title=i18n.text("UserTemplates.EditDialog.title") header=i18n.text("UserTemplates.EditDialog.info.short") description=i18n.text("UserTemplates.EditDialog.info.long")>
    <div class="content">
        <div data-options="region:'center',border:false">
            <div role="tablist" class="wrap">
                <div role="tab" class="wrap" title="${i18n.text('UserInfo.title')}"><#include "fieldset-info-edittemplate.ftl" /></div>
                <div role="tab" class="wrap" title="${i18n.text('VirtualFiles.title')}"><#include "../vfs/listing.ftl" /></div>
                <div role="tab" class="wrap" title="${i18n.text('UserQuotas.title')}"><#include "fieldset-quotas.ftl" /></div>
                <div role="tab" class="wrap" title="${i18n.text('UserIpAccess.title')}"><#include "fieldset-ipaccess.ftl" /></div>
                <div role="tab" class="wrap" title="${i18n.text('DomainAdministration.title')}"><#include "fieldset-administration.ftl" /></div>
                <div role="tab" class="wrap" title="${i18n.text('WebOptions.title')}"><#include "fieldset-web.ftl" /></div>
            </div>
        </div>
        <div data-options="region:'south',border:false">
            <div class="viewpane-toolbar inline" style="padding: 0 1em 1em">
                <div class="toolbar-selection">
                    <@form.button name="addvar"><@i18n.message "UserTemplates.button.addVariable" /></@>
                </div>
            </div>
        </div>
    </div>
</@form.dialog>