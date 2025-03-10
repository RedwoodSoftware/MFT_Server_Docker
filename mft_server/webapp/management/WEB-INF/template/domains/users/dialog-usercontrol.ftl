<@form.dialog id="d-user-add" title=i18n.text("Users.AddDialog.title") header=i18n.text("Users.AddDialog.info.short") description=i18n.text("Users.AddDialog.info.long")>
    <div role="tablist">
        <div role="tab" class="wrap" title="${i18n.text('UserInfo.title')}"><#include "fieldset-info-adduser.ftl" /></div>
        <div role="tab" class="wrap" title="${i18n.text('VirtualFiles.title')}"><#include "../vfs/listing.ftl" /></div>
        <div role="tab" class="wrap" title="${i18n.text('UserQuotas.title')}"><#include "fieldset-quotas.ftl" /></div>
        <div role="tab" class="wrap" title="${i18n.text('UserIpAccess.title')}"><#include "fieldset-ipaccess.ftl" /></div>
        <div role="tab" class="wrap" title="${i18n.text('DomainAdministration.title')}"><#include "fieldset-administration.ftl" /></div>
        <div role="tab" class="wrap" title="${i18n.text('WebOptions.title')}"><#include "fieldset-web.ftl" /></div>
    </div>
</@form.dialog>

<@form.dialog id="d-user-edit" title=i18n.text("Users.EditDialog.title") header=i18n.text("Users.EditDialog.info.short") description=i18n.text("Users.EditDialog.info.long")>
    <div role="tablist">
        <div role="tab" class="wrap" title="${i18n.text('UserInfo.title')}"><#include "fieldset-info-edituser.ftl" /></div>
        <div role="tab" class="wrap" title="${i18n.text('VirtualFiles.title')}"><#include "../vfs/listing.ftl" /></div>
        <div role="tab" class="wrap" title="${i18n.text('UserQuotas.title')}"><#include "fieldset-quotas.ftl" /></div>
        <div role="tab" class="wrap" title="${i18n.text('UserIpAccess.title')}"><#include "fieldset-ipaccess.ftl" /></div>
        <div role="tab" class="wrap" title="${i18n.text('DomainAdministration.title')}"><#include "fieldset-administration.ftl" /></div>
        <div role="tab" class="wrap" title="${i18n.text('WebOptions.title')}"><#include "fieldset-web.ftl" /></div>
    </div>
</@form.dialog>

<@form.dialog id="d-user-add-usertemplate" title=i18n.text("Users.TemplateDialog.title") header=i18n.text("Users.TemplateDialog.info.short") description=i18n.text("Users.TemplateDialog.info.long")>
    <fieldset class="noborder pane">
        <div><@form.select name="template" items={}><@i18n.message key="Users.TemplateDialog.label.template" /></@></div>
    </fieldset>
</@form.dialog>

<@form.dialog id="d-user-copy" title=i18n.text("Users.CopyDialog.title") header=i18n.text("Users.CopyDialog.info.short") description=i18n.text("Users.CopyDialog.info.long")>
    <fieldset class="noborder pane">
        <div><@form.username name="login" tabindex="0" required=true><@i18n.message "Users.CopyDialog.label.login" /></@></div>
        <div class="checkbox"><@form.checkbox name="editafterdone"><@i18n.message key="Users.CopyDialog.label.editAfterCopying" /></@></div>
    </fieldset>
</@form.dialog>

<@form.dialog id="d-user-changepwd" title=i18n.text("Users.PasswordDialog.title") header=i18n.text("Users.PasswordDialog.info.short") description=i18n.text("Users.PasswordDialog.info.long")>
    <fieldset class="noborder pane">
        <div><@form.dn name="password"><@i18n.message "Users.PasswordDialog.label.password" /></@></div>
        <div><@form.dn name="confirmpwd"><@i18n.message "Users.PasswordDialog.label.confirmationPassword" /></@></div>
        <div class="checkbox"><@form.checkbox name="resetrequired"><@i18n.message key="Users.PasswordDialog.label.resetRequired" /></@></div>
    </fieldset>
</@form.dialog>