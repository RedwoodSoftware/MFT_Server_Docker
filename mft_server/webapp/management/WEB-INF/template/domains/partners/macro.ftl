<#macro add_dialog id protocol test_allowed=true>
    <@form.dialog id=id title=i18n.text("TradingPartners.AddDialog.title", protocol) header=i18n.text("TradingPartners.AddDialog.info.short", protocol) description=i18n.text("TradingPartners.AddDialog.info.long")>
        <div class="content">
            <div data-options="region:'center',border:false">
                <fieldset>
                    <legend><@i18n.message key="TradingPartners.legend.basic" /></legend>
                    <div><@form.dn name="name" required=true description=i18n.text("TradingPartners.label.name.description") example=i18n.text("TradingPartners.label.name.example")><@i18n.message key="TradingPartners.label.name" /></@></div>
                    <div><@form.text name="company" maxlength=100 description=i18n.text("TradingPartners.label.company.description") example=i18n.text("TradingPartners.label.company.example")><@i18n.message key="TradingPartners.label.company" /></@></div>
                    <div><@form.email name="email" description=i18n.text("TradingPartners.label.email.description") example=i18n.text("TradingPartners.label.email.example")><@i18n.message key="TradingPartners.label.email" /></@></div>
                </fieldset>
                <#nested />
                <fieldset>
                    <legend><@i18n.message key="TradingPartners.legend.tags" /></legend>
                    <div><@form.select name="tags" items=[] description=i18n.text("TradingPartners.label.tags.description") example=i18n.text("TradingPartners.label.tags.example")><@i18n.message key="TradingPartners.label.tags" /></@></div>
                </fieldset>
            </div>
            <div data-options="region:'south',border:false">
                <div class="viewpane-toolbar inline" style="padding: 0 1em 1em">
                    <div class="toolbar-selection">
                        <@form.button name="addfunction"><@i18n.message "TradingPartners.button.addFunction" /></@>
                    </div>
                    <#if test_allowed>
                        <div class="toolbar-management">
                            <@form.button name="test"><@i18n.message "TradingPartners.button.testServer" /></@>
                        </div>
                    </#if>
                </div>
            </div>
        </div>
    </@form.dialog>
</#macro>


<#macro edit_dialog id test_allowed=true>
    <@form.dialog id=id title=i18n.text("TradingPartners.EditDialog.title") header=i18n.text("TradingPartners.EditDialog.info.short") description=i18n.text("TradingPartners.EditDialog.info.long")>
        <div class="content">
            <div data-options="region:'center',border:false">
                <fieldset>
                    <legend><@i18n.message key="TradingPartners.legend.basic" /></legend>
                    <div><@form.text name="company" maxlength=100 description=i18n.text("TradingPartners.label.company.description") example=i18n.text("TradingPartners.label.company.example")><@i18n.message key="TradingPartners.label.company" /></@></div>
                    <div><@form.email name="email" description=i18n.text("TradingPartners.label.email.description") example=i18n.text("TradingPartners.label.email.example")><@i18n.message key="TradingPartners.label.email" /></@></div>
                </fieldset>
                <#nested />
                <fieldset>
                    <legend><@i18n.message key="TradingPartners.legend.tags" /></legend>
                    <div><@form.select name="tags" items=[] description=i18n.text("TradingPartners.label.tags.description") example=i18n.text("TradingPartners.label.tags.example")><@i18n.message key="TradingPartners.label.tags" /></@></div>
                </fieldset>
            </div>
            <div data-options="region:'south',border:false">
                <div class="viewpane-toolbar inline" style="padding: 0 1em 1em">
                    <div class="toolbar-selection">
                        <@form.button name="addfunction"><@i18n.message "TradingPartners.button.addFunction" /></@>
                    </div>
                    <#if test_allowed>
                        <div class="toolbar-management">
                            <@form.button name="test"><@i18n.message "TradingPartners.button.testServer" /></@>
                        </div>
                    </#if>
                </div>
            </div>
        </div>
    </@form.dialog>
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

<#macro connection types=["PLAIN"] port_example="">
    <#local type_resources={
        'PLAIN': i18n.text("Application.connectionType.PLAIN"),
        'SSL': i18n.text("Application.connectionType.SSL"),
        'START-TLS': i18n.text("Application.connectionType.START_TLS")
     }/>
    <#local type_items={} />
    <#list types as type><#local type_items = type_items + {type: type_resources[type]?html} /></#list>

    <div><@form.host name="host" required=true description=i18n.text("TradingPartners.label.host.description") example=i18n.text("TradingPartners.label.host.example")><@i18n.message key="TradingPartners.label.host" /></@></div>
    <div><@form.port name="port" description=i18n.text("TradingPartners.label.port.description") example=port_example!''><@i18n.message key="TradingPartners.label.port" /></@></div>
    <div><@form.number name="timeout" maxlength=2 description=i18n.text("TradingPartners.label.timeout.description") example=i18n.text("TradingPartners.label.timeout.example")><@i18n.message key="TradingPartners.label.timeout" /></@>&nbsp;<@i18n.message key="TradingPartners.label.timeout.unit" /></div>
    <div><@form.select name="connectiontype" items=type_items description=i18n.text("TradingPartners.label.connectionType.description") example=i18n.text("TradingPartners.label.connectionType.example")><@i18n.message key="TradingPartners.label.connectionType" /></@></div>
</#macro>

<#macro authentication types=["BASIC"]>
    <#local type_resources={
        'BASIC': i18n.text("Application.authenticationType.BASIC")?html,
        'CRAM_MD5': i18n.text("Application.authenticationType.CRAM_MD5")?html,
        'XOAUTH2': i18n.text("Application.authenticationType.XOAUTH2")?html,
        'APOP': i18n.text("Application.authenticationType.APOP")?html
    }/>
    <#local type_items={} />
    <#list types as type><#local type_items = type_items + {type: type_resources[type]?html} /></#list>

    <div><@form.username name="username" description=i18n.text("TradingPartners.label.username.description") example=i18n.text("TradingPartners.label.username.example")><@i18n.message key="TradingPartners.label.username" /></@></div>
    <div><@form.password name="password" description=i18n.text("TradingPartners.label.passwordMailAccess.description") example=i18n.text("TradingPartners.label.passwordMailAccess.example")><@i18n.message key="TradingPartners.label.passwordMailAccess" /></@></div>
    <div><@form.select name="authtype" items=type_items description=i18n.text("TradingPartners.label.authenticationType.description") example=i18n.text("TradingPartners.label.authenticationType.example")><@i18n.message key="TradingPartners.label.authenticationType" /></@></div>
</#macro>

<#macro oauth_credentials>
    <div><@form.url name="tokenendpointurl" description=i18n.text("TradingPartners.label.tokenEndpointUrl.description") example=i18n.text("TradingPartners.label.tokenEndpointUrl.example")><@i18n.message key="TradingPartners.label.tokenEndpointUrl" /></@></div>
    <div><@form.username name="clientid" description=i18n.text("TradingPartners.label.clientId.description") example=i18n.text("TradingPartners.label.clientId.example")><@i18n.message key="TradingPartners.label.clientId" /></@></div>
    <div><@form.dn name="clientsecret" required=false description=i18n.text("TradingPartners.label.clientSecret.description") example=i18n.text("TradingPartners.label.clientSecret.example")><@i18n.message key="TradingPartners.label.clientSecret" /></@></div>
    <div><@form.url name="redirecturl" description=i18n.text("TradingPartners.label.redirectUrl.description") example=i18n.text("TradingPartners.label.redirectUrl.example")><@i18n.message key="TradingPartners.label.redirectUrl" /></@></div>
</#macro>

<#macro json_credentials name="privatekey">
    <div class="radio"><@form.radio name="use${name?html}" value="file" labelStyle="width:21em;display:inline-block;"><@i18n.message key="TradingPartners.label.privateKeyFile" /></@>&nbsp;<@form.path name="${name?html}file" required=true description=i18n.text("TradingPartners.label.privateKeyFile.description") example=i18n.text("TradingPartners.label.privateKeyFile.example") /></div>
    <div class="radio"><@form.radio name="use${name?html}" value="data" labelStyle="vertical-align:top;width:21em;display:inline-block;"><@i18n.message key="TradingPartners.label.privateKeyData" /></@>&nbsp;<@form.memo name="${name?html}data" required=true description=i18n.text("TradingPartners.label.privateKeyData.description") example=i18n.text("TradingPartners.label.privateKeyData.example") /></div>
</#macro>

<#macro amazon_region name="region">
    <@form.select name=name items={
        'us-gov-west-1': i18n.text("TradingPartners.amazon.region.US_GOV_WEST_1"),
        'us-east-1': i18n.text("TradingPartners.amazon.region.US_EAST_1"),
        'us-east-2': i18n.text("TradingPartners.amazon.region.US_EAST_2"),
        'us-west-1': i18n.text("TradingPartners.amazon.region.US_WEST_1"),
        'us-west-2': i18n.text("TradingPartners.amazon.region.US_WEST_2"),
        'eu-west-1': i18n.text("TradingPartners.amazon.region.EU_WEST_1"),
        'eu-west-2': i18n.text("TradingPartners.amazon.region.EU_WEST_2"),
        'eu-west-3': i18n.text("TradingPartners.amazon.region.EU_WEST_3"),
        'eu-central-1': i18n.text("TradingPartners.amazon.region.EU_CENTRAL_1"),
        'ap-south-1': i18n.text("TradingPartners.amazon.region.AP_SOUTH_1"),
        'ap-southeast-1': i18n.text("TradingPartners.amazon.region.AP_SOUTHEAST_1"),
        'ap-southeast-2': i18n.text("TradingPartners.amazon.region.AP_SOUTHEAST_2"),
        'ap-northeast-1': i18n.text("TradingPartners.amazon.region.AP_NORTHEAST_1"),
        'ap-northeast-2': i18n.text("TradingPartners.amazon.region.AP_NORTHEAST_2"),
        'sa-east-1': i18n.text("TradingPartners.amazon.region.SA_EAST_1"),
        'cn-north-1': i18n.text("TradingPartners.amazon.region.CN_NORTH_1"),
        'cn-northwest-1': i18n.text("TradingPartners.amazon.region.CN_NORTHWEST_1"),
        'ca-central-1': i18n.text("TradingPartners.amazon.region.CA_CENTRAL_1")
    } description=i18n.text("TradingPartners.Amazon.label.region.description") example=i18n.text("TradingPartners.Amazon.label.region.example")><@i18n.message key="TradingPartners.Amazon.label.region" />
    </@form.select>
</#macro>

<#macro use_host_key name="hostkey">
    <div class="checkbox">
        <@form.checkbox name="use${name}"><@i18n.message key="TradingPartners.label.hostKey" /></@>&nbsp;
        <@form.select name=name items=[] description=i18n.text("TradingPartners.label.hostKey.description") example=i18n.text("TradingPartners.label.hostKey.example") />
    </div>
</#macro>

<#macro use_client_key name="selectclientkey" description="">
    <#local body><#nested /></#local>
    <#local tooltip><#if description?has_content>${description}<#else>${i18n.text("TradingPartners.button.clientKey.description")}</#if></#local>
    <div><@form.button name=name><#if body?has_content>${body}<#else><@i18n.message key="TradingPartners.button.clientKey" /></#if></@>&nbsp;<span role="tooltip" class="info hidden" title="${tooltip?html}"></span></div>
</#macro>