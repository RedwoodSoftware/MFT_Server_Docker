<#ftl strip_whitespace=true>
<#import "/WEB-INF/tags/html.ftl" as html/>
<#import "/WEB-INF/tags/form.ftl" as form/>
<#import "/WEB-INF/tags/message.ftl" as i18n/>
<#import "/WEB-INF/template/macro.ftl" as m/>


<@html.template title=i18n.text("Menu.item.domains") + " - " + i18n.text("Application.title.text") header_section="/WEB-INF/template/server/domains/dashboard-js.ftl"; csp_nonce_attr>
    <div id="throbber" class="panel-loading"><@i18n.message key="Application.message.loading" /></div>

    <div id="viewpane" style="visibility: hidden;">
        <div data-options="region:'north',border:false" style="height:100px;padding:8px">
            <div id="navigation">
                <@m.menubar selected=i18n.text("Menu.item.domains") domainCreationAllowed=true />
                <#include "*/user-bar.ftl" />
            </div>
        </div>

        <div data-options="region:'center',border:false" style="padding:1em">
            <div id="modules" role="tablist">
                <div role="tab" id="server-domains" title="${i18n.text('ServerDomains.title')}">

                    <div id="server-domains-fields">
                        <div data-options="region:'center',border:false" style="padding:1em">
                            <@form.datagrid name="serverdomains" columns=[] height="" />
                        </div>

                        <div data-options="region:'south',border:false" style="padding:1em">
                            <div class="viewpane-toolbar inline">
                                <div class="toolbar-selection">
                                    <@form.button name="start"><@i18n.message key="ServerDomains.button.start" /></@>
                                    <@form.button name="stop"><@i18n.message key="ServerDomains.button.stop" /></@>
                                    <@form.button name="pause"><@i18n.message key="ServerDomains.button.pause" /></@>
                                    <@form.button name="resume"><@i18n.message key="ServerDomains.button.resume" /></@>
                                </div>
                                <div class="toolbar-management">
                                    <@form.button name="add"><@i18n.message key="ServerDomains.button.add" /></@>
                                    <@form.button name="edit"><@i18n.message key="ServerDomains.button.edit" /></@>
                                    <@form.button name="delete"><@i18n.message key="ServerDomains.button.delete" /></@>
                                    <@form.button name="status"><@i18n.message key="ServerDomains.button.status" /></@>
                                    <#if permissions.domainStartupControlAllowed>
                                        <@form.button name="startup"><@i18n.message key="ServerDomains.button.startup" /></@>
                                    </#if>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <#if permissions.licenseControlAllowed>
        <#include "../dialog-license.ftl"/>
    </#if>
    <#include "dialog-add.ftl" />

    <@form.dialog id="d-domain-status" title=i18n.text("ServerDomains.StatusDialog.title") style="padding:1em">
        <div id="domain-status-fields">

            <div data-options="region:'center',border:false">
                <div role="tablist">
                    <div role="tab" class="wrap" title="${i18n.text('Statistics.title')}">
                        <#include "/WEB-INF/template/domains/statistics/stats.ftl" />
                        <#if permissions.domainStatisticsAllowed>
                            <#include "/WEB-INF/template/domains/statistics/dialog-export-stats.ftl" />
                        </#if>
                        <#if permissions.domainSessionsControlAllowed>
                            <#include "/WEB-INF/template/domains/statistics/dialog-close-session.ftl" />
                        </#if>
                    </div>
                    <div role="tab" class="wrap" title="${i18n.text('Sessions.title')}">
                        <#include "/WEB-INF/template/domains/statistics/sessions.ftl" />
                    </div>
                    <div role="tab" class="wrap" title="${i18n.text('Logging.titleEvents')}">
                        <#include "/WEB-INF/template/domains/logging/logs.ftl" />
                    </div>
                </div>
            </div>

            <div data-options="region:'south',border:false" class="layout-pane-bottom">
                <div class="viewpane-toolbar toolbar-management inline">
                    <@form.button name="startdomain"><@i18n.message key="ServerDomains.button.start" /></@>
                    <@form.button name="stopdomain"><@i18n.message key="ServerDomains.button.stop" /></@>
                    <@form.button name="pausedomain"><@i18n.message key="ServerDomains.button.pause" /></@>
                    <@form.button name="resumedomain"><@i18n.message key="ServerDomains.button.resume" /></@>
                </div>
            </div>
        </div>
    </@form.dialog>

    <#include "/WEB-INF/template/domains/logging/dialog-export.ftl" />
</@html.template>