<#ftl strip_whitespace=true>
<#import "/WEB-INF/tags/html.ftl" as html/>
<#import "/WEB-INF/tags/form.ftl" as form/>
<#import "/WEB-INF/tags/message.ftl" as i18n/>
<#import "/WEB-INF/template/macro.ftl" as m/>


<@html.template title=i18n.text("Menu.item.keystore") + " - " + i18n.text("Application.title.text") header_section="/WEB-INF/template/server/keystore/keystore-js.ftl"; csp_nonce_attr>
    <div id="throbber" class="panel-loading"><@i18n.message key="Application.message.loading" /></div>

    <div id="viewpane" style="visibility: hidden">
        <div data-options="region:'north',border:false" style="height:100px;padding:8px">
            <div id="navigation">
                <@m.menubar selected=i18n.text("Menu.item.keystore") />
                <#include "*/user-bar.ftl" />
            </div>
        </div>

        <div data-options="region:'center',border:false" style="padding:1em">
            <div id="key-manager" role="tablist">
                <#if permissions.serverKeysAllowed>
                    <div role="tab" id="server-keys" class="wrap" title="${i18n.text('ServerKeys.title')}">
                        <#include "serverkeys/manage.ftl" />
                        <#include "serverkeys/dialog-keys.ftl" />
                    </div>
                </#if>
                <#if permissions.hostKeysAllowed>
                    <div role="tab" id="host-keys" class="wrap" title="${i18n.text('HostKeys.title')}">
                        <#include "hostkeys/manage.ftl" />
                        <#include "hostkeys/dialog-keys.ftl" />
                    </div>
                </#if>
                <#if permissions.clientKeysAllowed>
                    <div role="tab" id="client-keys" class="wrap" title="${i18n.text('ClientKeys.title')}">
                        <#include "clientkeys/manage.ftl" />
                        <#include "clientkeys/dialog-keys.ftl" />
                    </div>
                </#if>
                <#if permissions.pgpKeysAllowed>
                    <div role="tab" id="pgp-keys" class="wrap" title="${i18n.text('PgpKeys.title')}">
                        <#include "pgpkeys/manage.ftl" />
                        <#include "pgpkeys/dialog-keys.ftl" />
                    </div>
                </#if>
                <div role="tab" id="keys-report" class="wrap" title="${i18n.text('KeyExpiryReport.title')}"><#include "key-expiry-report.ftl" /></div>
            </div>
        </div>
    </div>


    <#if permissions.licenseControlAllowed>
        <#include "../dialog-license.ftl"/>
    </#if>
    <#include "dialog-keystore.ftl" />
    <#include "../domains/dialog-add.ftl">
</@html.template>

