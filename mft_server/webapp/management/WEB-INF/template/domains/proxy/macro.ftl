<#macro add_dialog id protocol test_allowed=true>
    <@form.dialog id=id title=i18n.text("ReverseProxies.AddDialog.title", protocol)>
    <div id="d-networkstorage-content">
        <div data-options="region:'north',border:false">
            <h6><@i18n.message key="ReverseProxies.AddDialog.info.short" args=protocol/><span><@i18n.message key="ReverseProxies.AddDialog.info.long" /></span></h6>
        </div>
        <div data-options="region:'center',border:false" style="padding:2em">
            <fieldset>
                <legend><@i18n.message key="ReverseProxies.legend.basic" /></legend>
                <div><@form.dn name="name" description=i18n.text("ReverseProxies.label.name.description") example=i18n.text("ReverseProxies.label.name.example")><@i18n.message key="ReverseProxies.label.name" /></@></div>
            </fieldset>
            <#nested />
            <fieldset>
                <legend><@i18n.message key="ReverseProxies.legend.tags" /></legend>
                <div><@form.select name="tags" items=[] description=i18n.text("ReverseProxies.label.tags.description") example=i18n.text("ReverseProxies.label.tags.example")><@i18n.message key="ReverseProxies.label.tags" /></@></div>
            </fieldset>
        </div>
        <div data-options="region:'south',border:false">
            <div class="viewpane-toolbar inline" style="padding: 0 1em 1em">
                <div class="viewpane-toolbar">
                    <div class="toolbar-selection">
                        <@form.button name="addvar"><@i18n.message "ReverseProxies.button.addVariable" /></@>
                        <@form.button name="addfunction"><@i18n.message "ReverseProxies.button.addFunction" /></@>
                    </div>
                    <#if test_allowed>
                        <div class="toolbar-management"><@form.button name="test"><@i18n.message "ReverseProxies.button.testServer" /></@></div>
                    </#if>
                </div>
            </div>
        </div>
    </div>
    </@form.dialog>
</#macro>


<#macro edit_dialog id protocol test_allowed=true>
    <@form.dialog id=id title=i18n.text("ReverseProxies.EditDialog.title")>
    <div id="d-networkstorage-content">
        <div data-options="region:'north',border:false">
            <h6><@i18n.message key="ReverseProxies.EditDialog.info.short" args=protocol/><span><@i18n.message key="ReverseProxies.EditDialog.info.long" /></span></h6>
        </div>
        <div data-options="region:'center',border:false" style="padding:2em">
            <#nested />
            <fieldset>
                <legend><@i18n.message key="ReverseProxies.legend.tags" /></legend>
                <div><@form.select name="tags" items=[] description=i18n.text("ReverseProxies.label.tags.description")  example=i18n.text("ReverseProxies.label.tags.example")><@i18n.message key="ReverseProxies.label.tags" /></@></div>
            </fieldset>
        </div>
        <div data-options="region:'south',border:false">
            <div class="viewpane-toolbar inline" style="padding: 0 1em 1em">
                <div class="viewpane-toolbar">
                    <div class="toolbar-selection">
                        <@form.button name="addvar"><@i18n.message "ReverseProxies.button.addVariable" /></@>
                        <@form.button name="addfunction"><@i18n.message "ReverseProxies.button.addFunction" /></@>
                    </div>
                    <#if test_allowed>
                        <div class="toolbar-management"><@form.button name="test"><@i18n.message "ReverseProxies.button.testServer" /></@></div>
                    </#if>
                </div>
            </div>
        </div>
    </div>
    </@form.dialog>
</#macro>


<#macro amazon_region name>
    <@form.select name=name items={
        'us-gov-west-1': i18n.text("ReverseProxies.Amazon.region.US_GOV_WEST_1"),
        'us-east-1': i18n.text("ReverseProxies.Amazon.region.US_EAST_1"),
        'us-east-2': i18n.text("ReverseProxies.Amazon.region.US_EAST_2"),
        'us-west-1': i18n.text("ReverseProxies.Amazon.region.US_WEST_1"),
        'us-west-2': i18n.text("ReverseProxies.Amazon.region.US_WEST_2"),
        'eu-west-1': i18n.text("ReverseProxies.Amazon.region.EU_WEST_1"),
        'eu-west-2': i18n.text("ReverseProxies.Amazon.region.EU_WEST_2"),
        'eu-west-3': i18n.text("ReverseProxies.Amazon.region.EU_WEST_3"),
        'eu-central-1': i18n.text("ReverseProxies.Amazon.region.EU_CENTRAL_1"),
        'ap-south-1': i18n.text("ReverseProxies.Amazon.region.AP_SOUTH_1"),
        'ap-southeast-1': i18n.text("ReverseProxies.Amazon.region.AP_SOUTHEAST_1"),
        'ap-southeast-2': i18n.text("ReverseProxies.Amazon.region.AP_SOUTHEAST_2"),
        'ap-northeast-1': i18n.text("ReverseProxies.Amazon.region.AP_NORTHEAST_1"),
        'ap-northeast-2': i18n.text("ReverseProxies.Amazon.region.AP_NORTHEAST_2"),
        'sa-east-1': i18n.text("ReverseProxies.Amazon.region.SA_EAST_1"),
        'cn-north-1': i18n.text("ReverseProxies.Amazon.region.CN_NORTH_1"),
        'cn-northwest-1': i18n.text("ReverseProxies.Amazon.region.CN_NORTHWEST_1"),
        'ca-central-1': i18n.text("ReverseProxies.Amazon.region.CA_CENTRAL_1")
        } description=i18n.text("ReverseProxies.Amazon.label.region.description") example=i18n.text("ReverseProxies.Amazon.label.region.example")><@i18n.message key="ReverseProxies.Amazon.label.region" />
    </@form.select>
</#macro>

<#macro json_credentials name="privatekey">
    <div class="radio"><@form.radio name="use${name?html}" value="file" labelStyle="width:21em;display:inline-block;"><@i18n.message key="ReverseProxies.label.privateKeyFile" /></@>&nbsp;<@form.path name="${name?html}file" required=true description=i18n.text("ReverseProxies.label.privateKeyFile.description") example=i18n.text("ReverseProxies.label.privateKeyFile.example") /></div>
    <div class="radio"><@form.radio name="use${name?html}" value="data" labelStyle="vertical-align:top;width:21em;display:inline-block;"><@i18n.message key="ReverseProxies.label.privateKeyData" /></@>&nbsp;<@form.memo name="${name?html}data" required=true description=i18n.text("ReverseProxies.label.privateKeyData.description") example=i18n.text("ReverseProxies.label.privateKeyData.example") /></div>
</#macro>

<#macro remote_directory>
    <div><@form.radio name="remotedirectory" value="remote"><@i18n.message key="ReverseProxies.label.remoteDirectory" /></@>&nbsp;<@form.path name="remotepath" description=i18n.text("ReverseProxies.label.remoteDirectory.description") example=i18n.text("ReverseProxies.label.remoteDirectory.example") /></div>
    <div class="radio"><@form.radio name="remotedirectory" value="local" description=i18n.text("ReverseProxies.label.mapLocalDirectoryToRemote.description") example=i18n.text("ReverseProxies.label.mapLocalDirectoryToRemote.example")><@i18n.message key="ReverseProxies.label.mapLocalDirectoryToRemote" /></@></div>
</#macro>

<#macro debug_directory>
    <div><@form.checkbox name="debuglog"><@i18n.message key="ReverseProxies.label.debugPath" /></@><@form.input name="debugdir" description=i18n.text("ReverseProxies.label.debugPath.description") example=i18n.text("ReverseProxies.label.debugPath.example") />&nbsp;<@form.button name="debugdirbrowse"><@i18n.message key="ReverseProxies.button.browse" /></@></div>
</#macro>

<#macro max_age>
    <div><@form.checkbox name="maxage"><@i18n.message key="ReverseProxies.label.maxAge" /></@><@form.input name="ttl" description=i18n.text("ReverseProxies.label.maxAge.description") example=i18n.text("ReverseProxies.label.maxAge.example")/>&nbsp;<span><@i18n.message key="ReverseProxies.label.maxAge.unit" /></span></div>
</#macro>

<#macro use_host_key name="hostkey">
    <div class="checkbox">
        <@form.checkbox name="use${name}"><@i18n.message key="ReverseProxies.label.hostKey" /></@>&nbsp;
        <@form.select name=name items=[] description=i18n.text("ReverseProxies.label.hostKey.description") example=i18n.text("ReverseProxies.label.hostKey.example") />
    </div>
</#macro>

<#macro use_client_key name="selectclientkey" description="">
    <#local body><#nested /></#local>
    <#local tooltip><#if description?has_content>${description}<#else>${i18n.text("ReverseProxies.button.selectClientKey.description")}</#if></#local>
<div><@form.button name=name><#if body?has_content>${body}<#else><@i18n.message key="ReverseProxies.button.selectClientKey" /></#if></@>&nbsp;<span role="tooltip" class="info hidden" title="${tooltip?html}"></span></div>
</#macro>

<#macro proxy types=["HTTP", "SOCKS4", "SOCKS5"] auth=true>
    <#local type_items={'NONE': i18n.text("Application.proxyType.NONE")?html}/>
    <#list types as type><#local type_items = type_items + {type: i18n.text("Application.proxyType.${type}")?html} /></#list>

    <div><@form.select name="proxytype" items=type_items description=i18n.text("TradingPartners.label.proxyType.description") example=i18n.text("TradingPartners.label.proxyType.example")><@i18n.message key="TradingPartners.label.proxyType" /></@></div>
    <div><@form.host name="proxyhost" description=i18n.text("TradingPartners.label.proxyHost.description") example=i18n.text("TradingPartners.label.proxyHost.example")><@i18n.message key="TradingPartners.label.proxyHost" /></@></div>
    <div><@form.port name="proxyport" description=i18n.text("TradingPartners.label.proxyPort.description") example=i18n.text("TradingPartners.label.proxyPort.example")><@i18n.message key="TradingPartners.label.proxyPort" /></@></div>
    <#if auth>
        <div><@form.username name="proxyuser" description=i18n.text("TradingPartners.label.username.description") example=i18n.text("TradingPartners.label.username.example")><@i18n.message key="TradingPartners.label.username" /></@></div>
        <div><@form.password name="proxypwd" description=i18n.text("TradingPartners.label.password.description") example=i18n.text("TradingPartners.label.password.example")><@i18n.message key="TradingPartners.label.password" /></@></div>
    </#if>
</#macro>