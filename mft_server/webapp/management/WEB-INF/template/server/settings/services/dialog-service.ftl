<#function global_transport_services items={}>
    <#local services = {} />
    <#list items?keys as key>
        <#local entry=items[key] />
        <#if !(entry.allowed)!false>
            <#local services = services + {"${key}": {'text': entry.text, 'disabled': true, 'title': i18n.text("GlobalServices.Error.serviceNotAllowed")}} />
        <#else>
            <#local services = services + {"${key}" :{'text': entry.text}} />
        </#if>
    </#list>
    <#return services />
</#function>

<#macro algorithms_pane name prompt>
    <div class="content">
        <div data-options="region:'north',border:false" style="padding-bottom:.7em">
            <@form.input name="search${name?html}" dataOptions="prompt:'${prompt?js_string}'" />
        </div>
        <div data-options="region:'center',border:false">
            <@form.datalist name=name?html items=[] dataOptions="emptyMsg:'${i18n.text('GlobalServices.AlgorithmsDialog.message.noItems')?js_string}'"/>
        </div>
    </div>
</#macro>


<@form.dialog id="d-service-add-protocol" title=i18n.text("GlobalServices.ProtocolDialog.title")>
    <fieldset name="serviceprotocolfileds" class="content">
        <@form.fields_title title=i18n.text("GlobalServices.ProtocolDialog.info.short") description=i18n.text("GlobalServices.ProtocolDialog.info.long")/>
        <div><@form.select name="protocol" items=global_transport_services({
                'AFTP': {'text': i18n.text("Application.protocol.AFTP"), 'allowed': (permissions.globalAftpServiceAllowed)!false},
                'FTP': {'text': i18n.text("Application.protocol.FTP"), 'allowed': (permissions.globalFtpServiceAllowed)!false},
                'SFTP': {'text': i18n.text("Application.protocol.SFTP"), 'allowed': (permissions.globalSftpServiceAllowed)!false}
            })><@i18n.message key="GlobalServices.label.protocol" /></@>
        </div>
    </fieldset>
</@form.dialog>

<#--SFTP Service-->
<@form.dialog id="d-services-sftp" title=i18n.text("GlobalServices.AddDialog.title", i18n.text("Application.protocol.SFTP"))>
    <@form.fields name="sftpservicefields" title=i18n.text("GlobalServices.AddDialog.info.short", i18n.text("Application.protocol.SFTP")) description=i18n.text("GlobalServices.AddDialog.info.long")>
        <div><@form.select name="host" items={} required=true><@i18n.message key="GlobalServices.label.host" /></@></div>
        <div><@form.port name="port"><@i18n.message key="GlobalServices.label.port" /></@></div>
        <div><@form.select name="privatekey" items={}><@i18n.message key="GlobalServices.label.privateKey" /></@></div>
        <div><@form.select name="auth" items={
            'password': i18n.text("GlobalServices.auth.password"),
            'publickey': i18n.text("GlobalServices.auth.publicKey"),
            'password OR publickey': i18n.text("GlobalServices.auth.passwordOrPublicKey"),
            'password AND publickey': i18n.text("GlobalServices.auth.passwordAndPublicKey")
        }><@i18n.message key="GlobalServices.label.authentication" /></@></div>
    </@form.fields>
</@form.dialog>

<#-- SFTP Service Algorithms -->
<@form.dialog id="d-services-sftp-algorithms" title=i18n.text("GlobalServices.AlgorithmsDialog.title")>
    <div class="content">
        <div data-options="region:'north',border:false">
            <h6><@i18n.message key="GlobalServices.AlgorithmsDialog.info.short" /><span><@i18n.message key="GlobalServices.AlgorithmsDialog.info.long" /></span></h6>
        </div>
        <div data-options="region:'center',border:false" class="wrap">
            <div role="tablist" class="content-tabs wrap">
                <div role="tab" class="wrap" title="${i18n.text("GlobalServices.AlgorithmsDialog.title.kexes")?html}">
                    <@algorithms_pane name="kexes" prompt=i18n.text("GlobalServices.AlgorithmsDialog.prompt.searchKexes") />
                </div>
                <div role="tab" class="wrap" title="${i18n.text("GlobalServices.AlgorithmsDialog.title.keys")?html}">
                    <@algorithms_pane name="keys" prompt=i18n.text("GlobalServices.AlgorithmsDialog.prompt.searchKeys") />
                </div>
                <div role="tab" class="wrap" title="${i18n.text("GlobalServices.AlgorithmsDialog.title.ciphers")?html}">
                    <@algorithms_pane name="ciphers" prompt=i18n.text("GlobalServices.AlgorithmsDialog.prompt.searchCiphers") />
                </div>
                <div role="tab" class="wrap" title="${i18n.text("GlobalServices.AlgorithmsDialog.title.macs")?html}">
                    <@algorithms_pane name="macs" prompt=i18n.text("GlobalServices.AlgorithmsDialog.prompt.searchMacs") />
                </div>
                <div role="tab" class="wrap" title="${i18n.text("GlobalServices.AlgorithmsDialog.title.compressions")?html}">
                    <@algorithms_pane name="compressions" prompt=i18n.text("GlobalServices.AlgorithmsDialog.prompt.searchCompressions") />
                </div>
            </div>
        </div>
    </div>
</@form.dialog>

<#--FTP Service-->
<@form.dialog id="d-services-ftp" title=i18n.text("GlobalServices.AddDialog.title", i18n.text("Application.protocol.FTP_COMMON"))>
    <@form.fields name="ftpservicefields" title=i18n.text("GlobalServices.AddDialog.info.short", i18n.text("Application.protocol.FTP_COMMON")) description=i18n.text("GlobalServices.AddDialog.info.long")>
    <div><@form.select name="host" items={} required=true><@i18n.message key="GlobalServices.label.host" /></@></div>
    <div><@form.port name="port"><@i18n.message key="GlobalServices.label.port" /></@></div>
    <div><@form.select name="type" items={
        'regular': i18n.text("Application.protocol.FTP.regular"),
        'explicit SSL': i18n.text("Application.protocol.FTP.explicitSsl"),
        'forced explicit SSL': i18n.text("Application.protocol.FTP.forcedExplicitSsl"),
        'implicit SSL': i18n.text("Application.protocol.FTP.implicitSsl")
    }><@i18n.message key="GlobalServices.label.type" /></@></div>
    <div><@form.select name="privatekey" items={}><@i18n.message key="GlobalServices.label.privateKey" /></@></div>
    </@form.fields>
</@form.dialog>

<@form.dialog id="d-settings-services-ciphers" title=i18n.text("GlobalServices.CiphersDialog.title")>
<div class="content">
    <div data-options="region:'north',border:false">
        <h6><@i18n.message key="GlobalServices.CiphersDialog.info.short" /><span><@i18n.message key="GlobalServices.CiphersDialog.info.long" /></span></h6>
    </div>

    <div data-options="region:'center',border:false" style="padding:1em">
        <@form.datagrid name="sslciphers" height="" columns=["ciphers"]/>

        <div class="viewpane-toolbar" style="margin:0">
            <@form.button name="all" dataToggleText=i18n.text("GlobalServices.CiphersDialog.button.deselectAll")><@i18n.message key="GlobalServices.CiphersDialog.button.selectAll" /></@>
            <@form.button name="medium"><@i18n.message key="GlobalServices.CiphersDialog.button.medium" /></@>&nbsp;
            <@form.button name="strong"><@i18n.message key="GlobalServices.CiphersDialog.button.strong" /></@>
        </div>
    </div>
</div>
</@form.dialog>

<#--AFTP Service-->
<@form.dialog id="d-services-aftp" title=i18n.text("GlobalServices.AddDialog.title", i18n.text("Application.protocol.AFTP"))>
    <@form.fields name="aftpservicefields" title=i18n.text("GlobalServices.AddDialog.info.short", i18n.text("Application.protocol.AFTP")) description=i18n.text("GlobalServices.AddDialog.info.long")>
        <div><@form.select name="host" items={} required=true><@i18n.message key="GlobalServices.label.host" /></@></div>
        <div><@form.port name="port"><@i18n.message key="GlobalServices.label.port" /></@></div>
        <div><@form.select name="privatekey" items={}><@i18n.message key="GlobalServices.label.privateKey" /></@></div>
        <div class="checkbox"><@form.checkbox name="requiresecure"><@i18n.message key="GlobalServices.label.securedConnectionRequired" /></@></div>
    </@form.fields>
</@form.dialog>
