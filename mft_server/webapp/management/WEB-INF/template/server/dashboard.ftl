<#ftl strip_whitespace=true>
<#import "/WEB-INF/tags/html.ftl" as html/>
<#import "/WEB-INF/tags/form.ftl" as form/>
<#import "/WEB-INF/tags/message.ftl" as i18n/>
<#import "/WEB-INF/template/macro.ftl" as m/>


<@html.template title=i18n.text("Menu.item.status") + " - " + i18n.text("Application.title.text") header_section="/WEB-INF/template/server/dashboard-js.ftl"; csp_nonce_attr>

<div id="throbber" class="panel-loading"><@i18n.message key="Application.message.loading" /></div>

    <div id="viewpane" style="visibility: hidden;">
        <div data-options="region:'north',border:false" style="height:100px;padding:8px">
            <div id="navigation">
                <@m.menubar selected=i18n.text("Menu.item.status") />
                <#include "*/user-bar.ftl" />
            </div>
        </div>

        <div data-options="region:'center',border:false" style="padding:1em;">
            <div id="modules" role="tablist">
                <#if permissions.serverStatisticsAllowed>
                <#--Dashboard-->
                <div role="tab" class="wrap" id="server-dashboard" title="${i18n.text('Dashboard.title')}">
                    <div id="server-plot" style="margin-bottom: 2em"></div>
                    <h2><@i18n.message key="Dashboard.legend.connections" /></h2><div id="connections-plot"></div>
                    <h2><@i18n.message key="Dashboard.legend.uploads" /></h2><div id="uploads-plot"></div>
                    <h2><@i18n.message key="Dashboard.legend.downloads" /></h2><div id="downloads-plot"></div>
                    <h2><@i18n.message key="Dashboard.legend.externalUploads" /></h2><div id="external-uploads-plot"></div>
                    <h2><@i18n.message key="Dashboard.legend.externalDownloads" /></h2><div id="external-downloads-plot"></div>
                    <h2><@i18n.message key="Dashboard.legend.logins" /></h2><div id="logins-plot"></div>
                    <h2><@i18n.message key="Dashboard.legend.triggers" /></h2><div id="triggers-plot"></div>
                </div>
                </#if>

                <#--Action Center-->
                <#if permissions.actionCenterAllowed>
                    <div role="tab" class="wrap" id="action-center" title="${i18n.text('ActionCenter.title')}">
                        <div id="action-center-fields">
                            <div class="wrap" data-options="region:'north',border:false" style="min-height:2em">
                                <@i18n.message key="ActionCenter.info" />
                            </div>
                           <div data-options="region:'center',border:false">
                                <@form.datagrid name="ksflist" columns=["maturity", "category", "section", "date"] height="" dataOptions="emptyMsg:'${i18n.text('ActionCenter.Message.noData')?js_string?html}'" ; col>
                                    <@i18n.message key="ActionCenter.column.${col}" />
                                </@>
                            </div>

                            <div data-options="region:'south',border:false">
                                <div class="viewpane-toolbar inline">
                                    <div class="toolbar-selection">
                                        <@form.button name="refresh"><@i18n.message key="ActionCenter.button.refresh" /></@>
                                    </div>
                                    <div class="toolbar-management">
                                        <@form.button name="view"><@i18n.message key="ActionCenter.button.view" /></@>
                                        <#if permissions.actionCenterControlAllowed><@form.button name="resolve"><@i18n.message key="ActionCenter.button.resolve" /></@></#if>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </#if>

                <#--Server Statistics-->
                <div role="tab" class="wrap" id="server-statistics" title="${i18n.text('ServerStatistics.title')}">
                    <div id="server-statistics-fields">
                        <div class="wrap" data-options="region:'center',border:false">
                            <@form.datagrid name="statistics" height=""/>
                        </div>
                        <#if permissions.serverRestartAllowed>
                            <div data-options="region:'south',border:false">
                                <div class="viewpane-toolbar inline">
                                    <div class="toolbar-management">
                                        <@form.button name="restart"><@i18n.message key="ServerStatistics.button.restartApplication" /></@>
                                    </div>
                                </div>
                            </div>
                        </#if>
                    </div>
                </div>

                <#--Server Interfaces-->
                <div role="tab" class="wrap" id="server-interfaces" title="${i18n.text('ServerInterfaces.title')}">
                    <div id="server-interfaces-fields" class="easyui-panel" data-options="fit:true,border:false">
                        <@form.datagrid name="interfaces" columns=["interface", "name", "addresses"] height=""; col>
                            <@i18n.message key="ServerInterfaces.column.${col}" />
                        </@>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <#if permissions.licenseControlAllowed>
        <#include "dialog-license.ftl"/>
    </#if>
    <#include "domains/dialog-add.ftl" />

    <#if permissions.actionCenterAllowed>
        <#include "actioncenter/dialog-view.ftl">
        <#include "actioncenter/dialog-dload.ftl">
    </#if>
</@html.template>