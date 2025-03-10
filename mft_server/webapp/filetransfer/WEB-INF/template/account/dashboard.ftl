<#ftl strip_whitespace=true>
<#-- @ftlvariable name="model" type="com.jscape.inet.mft.subsystems.web.ui.view.DashboardTemplateModel" -->

<#import "/WEB-INF/tags/form.ftl" as form/>
<#import "/WEB-INF/tags/message.ftl" as i18n/>


<div id="user-settings-pane" class="easyui-layout" data-options="fit:true,border:false">

    <div data-options="region:'center',border:false">
        <div role="tablist">
            <#--Personal Information-->
            <#if model.permission.personalInfoReadingAllowed>
                <div role="tab" title="${i18n.text('PersonalInfo.title')?html}" class="wrapper">
                    <#include "personal-info.ftl" />
                </div>
            </#if>

            <#--Public Key Authentication    -->
            <#if model.permission.publicKeyReadingAllowed>
                <div role="tab" id="account-public-key-auth" title="${i18n.text('PublicKeyAuth.title')?html}" class="wrapper">
                    <#include "public-keys.ftl" />
                    <#include "dialog-public-keys.ftl" />
                </div>
            </#if>

            <#--Open PGP Key Encryption    -->
            <#if model.permission.openPgpKeyReadingAllowed>
                <div role="tab" id="account-pgp-encryption" title="${i18n.text('PgpEncryption.title')?html}" class="wrapper">
                    <#include "open-pgp-keys.ftl" />
                    <#include "dialog-open-pgp-keys.ftl" />
                </div>
            </#if>

            <#--Quotas-->
            <#if model.permission.quotasReadingAllowed>
                <div role="tab" id="account-quotas" title="${i18n.text('Quotas.title')?html}">
                    <div role="tablist">
                        <div role="tab" title="${i18n.text('Quotas.title.bandwidth')?html}"  class="wrapper">
                            <#include "quotas.ftl" />
                        </div>
                        <div role="tab" title="${i18n.text('Quotas.title.directoryMonitors')?html}" class="wrapper">
                            <#include "dir-monitors.ftl" />
                        </div>
                    </div>
                </div>
            </#if>

            <#--Contacts-->
            <#if model.permission.contactsReadingAllowed>
                <div role="tab" id="account-contacts" title="${i18n.text('Contacts.title')?html}" class="wrapper">
                    <#include "contacts.ftl" />
                    <#if model.permission.contactsControlAllowed>
                        <#include "dialog-contacts.ftl" />
                    </#if>
                </div>
            </#if>

            <#--Ad-Hoc Activity-->
            <#if model.permission.adHocActivityReadingAllowed>
                <div role="tab" id="account-adhoc-transfers" title="${i18n.text('AdHocTransfers.title')?html}" class="wrapper">
                    <#include "adhoc-transfers.ftl" />
                    <#include "dialog-adhoc-transfers.ftl" />
                </div>
            </#if>

            <#--Drop Zones-->
            <#if model.permission.dropZoneReadingAllowed>
                <div role="tab" id="account-dropzones" title="${i18n.text('DropZones.title')?html}" class="wrapper">
                    <#include "dropzones-info.ftl" />
                </div>
            </#if>

            <#--Domain Administration-->
            <#if model.permission.domainAdministrationAllowed>
                <div role="tab" id="account-domain-admin" title="${i18n.text('admin.title')?html}">
                    <div role="tablist">
                        <#if model.permission.usersControlAllowed>
                            <div role="tab" title="${i18n.text('Users.title')?html}" class="wrapper">
                                <#include "user/users.ftl" />
                                <#include "user/dialog-users.ftl" />
                                <#include "user/dialog-vfs.ftl" />
                            </div>
                        </#if>
                        <#if model.permission.urlBrandingControlAllowed>
                            <div role="tab" title="${i18n.text('UrlBranding.title')?html}" class="wrapper">
                                <#include "url-branding.ftl" />
                                <#include "dialog-url-branding.ftl" />
                            </div>
                        </#if>
                        <#if model.permission.dropZoneControlAllowed>
                            <div role="tab" title="${i18n.text('DropZones.title')?html}" class="wrapper">
                                <#include "dropzones.ftl" />
                                <#include "dialog-dropzones.ftl" />
                            </div>
                        </#if>
                    </div>
                </div>
            </#if>
        </div>
    </div>
</div>