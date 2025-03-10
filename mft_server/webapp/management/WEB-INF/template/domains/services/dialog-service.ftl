<#function domain_transport_services items={}>
    <#local services = {} />
        <#list items?keys as key>
            <#local entry=items[key] />
            <#if !(entry.allowed)!false>
                <#local services = services + {"${key}": {'text': entry.text, 'disabled': true, 'title': i18n.text("Services.Error.serviceNotAllowed")}} />
            <#else>
                <#local services = services + {"${key}" :{'text': entry.text}} />
            </#if>
        </#list>
    <#return services />
</#function>

<@form.dialog id="d-service-add-protocol" title=i18n.text("Services.ProtocolDialog.title")>
    <fieldset name="serviceprotocolfileds" class="content">
        <@form.fields_title title=i18n.text("Services.ProtocolDialog.info.short") description=i18n.text("Services.ProtocolDialog.info.long")/>
        <div><@form.select name="protocol" items=domain_transport_services({
                'AFTP': {'text': i18n.text("Application.protocol.AFTP"), 'allowed': (permissions.domainAftpServiceAllowed)!false},
                'Agent': {'text': i18n.text("Application.protocol.AGENT"), 'allowed': (permissions.domainAgentServiceAllowed)!false},
                'AS2': {'text': i18n.text("Application.protocol.AS2"), 'allowed': (permissions.domainAs2ServiceAllowed)!false},
                'FTP': {'text': i18n.text("Application.protocol.FTP_COMMON"), 'allowed': (permissions.domainFtpServiceAllowed)!false},
                'HTTP': {'text': i18n.text("Application.protocol.HTTP_COMMON"), 'allowed': (permissions.domainHttpServiceAllowed)!false},
                'OFTP': {'text': i18n.text("Application.protocol.OFTP"), 'allowed': (permissions.domainOftpServiceAllowed)!false},
                'SFTP': {'text': i18n.text("Application.protocol.SFTP"), 'allowed': (permissions.domainSftpServiceAllowed)!false},
                'TFTP': {'text': i18n.text("Application.protocol.TFTP"), 'allowed': (permissions.domainTftpServiceAllowed)!false},
                'WEBDAV': {'text': i18n.text("Application.protocol.WEBDAV_COMMON"), 'allowed': (permissions.domainWebDavServiceAllowed)!false}
            })><@i18n.message key="GlobalServices.label.protocol" /></@>
        </div>
    </fieldset>
</@form.dialog>

<#--FTP Service-->
<@form.dialog id="d-services-ftp" title=i18n.text("Services.AddDialog.title", i18n.text("Application.protocol.FTP_COMMON"))>
    <@form.fields name="ftpservicefields" title=i18n.text("Services.AddDialog.info.short", i18n.text("Application.protocol.FTP_COMMON")) description=i18n.text("Services.AddDialog.info.long")>
        <div><@form.select name="host" items={} required=true><@i18n.message key="Services.label.host" /></@></div>
        <div><@form.port name="port"><@i18n.message key="Services.label.port" /></@></div>
        <div><@form.select name="type" items={
                'regular': i18n.text("Application.protocol.FTP.regular"),
                'explicit SSL': i18n.text("Application.protocol.FTP.explicitSsl"),
                'forced explicit SSL': i18n.text("Application.protocol.FTP.forcedExplicitSsl"),
                'implicit SSL': i18n.text("Application.protocol.FTP.implicitSsl")
            }><@i18n.message key="Services.label.type" /></@>
        </div>
        <div><@form.select name="privatekey" items={}><@i18n.message key="Services.label.privateKey" /></@></div>
    </@form.fields>
</@form.dialog>

<#--SFTP Service-->
<@form.dialog id="d-services-sftp" title=i18n.text("Services.AddDialog.title", i18n.text("Application.protocol.SFTP"))>
    <@form.fields name="sftpservicefields" title=i18n.text("Services.AddDialog.info.short", i18n.text("Application.protocol.SFTP")) description=i18n.text("Services.AddDialog.info.long")>
        <div><@form.select name="host" items={} required=true><@i18n.message key="Services.label.host" /></@></div>
        <div><@form.port name="port"><@i18n.message key="Services.label.port" /></@></div>
        <div><@form.select name="privatekey" items={}><@i18n.message key="Services.label.privateKey" /></@></div>
        <div><@form.select name="auth" items={
                'password': i18n.text("Services.auth.password"),
                'publickey': i18n.text("Services.auth.publicKey"),
                'password OR publickey': i18n.text("Services.auth.passwordOrPublicKey"),
                'password AND publickey': i18n.text("Services.auth.passwordAndPublicKey")
            }><@i18n.message key="Services.label.authentication" /></@>
        </div>
    </@form.fields>
</@form.dialog>

<#--AFTP Service-->
<@form.dialog id="d-services-aftp" title=i18n.text("Services.AddDialog.title", i18n.text("Application.protocol.AFTP"))>
    <@form.fields name="aftpservicefields" title=i18n.text("Services.AddDialog.info.short", i18n.text("Application.protocol.AFTP")) description=i18n.text("Services.AddDialog.info.long")>
        <div><@form.select name="host" items={} required=true><@i18n.message key="Services.label.host" /></@></div>
        <div><@form.port name="port"><@i18n.message key="Services.label.port" /></@></div>
        <div><@form.select name="privatekey" items={}><@i18n.message key="Services.label.privateKey" /></@></div>
        <div class="checkbox"><@form.checkbox name="requiresecure"><@i18n.message key="Services.label.securedConnectionRequired" /></@></div>
    </@form.fields>
</@form.dialog>

<#--OFTP Service-->
<@form.dialog id="d-services-oftp" title=i18n.text("Services.AddDialog.title", i18n.text("Application.protocol.OFTP"))>
    <@form.fields name="tftpservicefields" title=i18n.text("Services.AddDialog.info.short", i18n.text("Application.protocol.OFTP")) description=i18n.text("Services.AddDialog.info.long")>
        <div><@form.select name="host" items={} required=true><@i18n.message key="Services.label.host" /></@></div>
        <div><@form.port name="port"><@i18n.message key="Services.label.port" /></@></div>
        <div><@form.dn name="idcode" size="40" maxlength="500" required=true><@i18n.message key="Services.label.identificationCode" /></@></div>
        <div><@form.select name="privatekey" items={}><@i18n.message key="Services.label.privateKey" /></@></div>
        <div class="checkbox"><@form.checkbox name="bindtransfers"><@i18n.message key="Services.label.bindUnauthenticatedTransfer" /></@>&nbsp;<@form.select name="transferuser" items=[]/></div>
        <div class="checkbox"><@form.checkbox name="usessl"><@i18n.message key="Services.label.userSsl" /></@></div>
        <div class="checkbox"><@form.checkbox name="fileencryption"><@i18n.message key="Services.label.fileEncryptionRequired" /></@></div>
        <div class="checkbox"><@form.checkbox name="filesignature"><@i18n.message key="Services.label.fileSignatureRequired" /></@></div>
    </@form.fields>
</@form.dialog>

<#--TFTP Service-->
<@form.dialog id="d-services-tftp" title=i18n.text("Services.AddDialog.title", i18n.text("Application.protocol.TFTP"))>
    <@form.fields name="tftpservicefields" title=i18n.text("Services.AddDialog.info.short", i18n.text("Application.protocol.TFTP")) description=i18n.text("Services.AddDialog.info.long")>
        <div><@form.select name="host" items={} required=true><@i18n.message key="Services.label.host" /></@></div>
        <div><@form.port name="port"><@i18n.message key="Services.label.port" /></@></div>
        <div><@form.select name="username" items={}><@i18n.message key="Services.label.account" /></@></div>
    </@form.fields>
</@form.dialog>

<#--HTTP Service-->
<@form.dialog id="d-services-http" title=i18n.text("Services.AddDialog.title", i18n.text("Application.protocol.HTTP_COMMON"))>
    <@form.fields name="httpservicefields" title=i18n.text("Services.AddDialog.info.short", i18n.text("Application.protocol.HTTP_COMMON")) description=i18n.text("Services.AddDialog.info.long")>
        <div class="checkbox"><@form.checkbox name="plain"><@i18n.message key="Services.label.http" /></@></div>
        <div class="checkbox"><@form.checkbox name="secure"><@i18n.message key="Services.label.https" /></@></div>
    </@form.fields>
</@form.dialog>

<#--WebDAV Service-->
<@form.dialog id="d-services-webdav" title=i18n.text("Services.AddDialog.title", i18n.text("Application.protocol.WEBDAV_COMMON"))>
    <@form.fields name="webdavservicefields" title=i18n.text("Services.AddDialog.info.short", i18n.text("Application.protocol.WEBDAV_COMMON")) description=i18n.text("Services.AddDialog.info.long")>
        <div class="checkbox"><@form.checkbox name="plain"><@i18n.message key="Services.label.http" /></@></div>
        <div class="checkbox"><@form.checkbox name="secure"><@i18n.message key="Services.label.https" /></@></div>
    </@form.fields>
</@form.dialog>

<#--AS Service-->
<@form.dialog id="d-services-as2" title=i18n.text("Services.AddDialog.title", i18n.text("Application.protocol.AS2"))>
    <@form.fields name="as2servicefields" title=i18n.text("Services.AddDialog.info.short", i18n.text("Application.protocol.AS2")) description=i18n.text("Services.AddDialog.info.long")>
        <div class="checkbox"><@form.checkbox name="plain"><@i18n.message key="Services.label.http" /></@></div>
        <div class="checkbox"><@form.checkbox name="secure"><@i18n.message key="Services.label.https" /></@></div>
    </@form.fields>
</@form.dialog>

<#--Agent Service-->
<@form.dialog id="d-services-agent" title=i18n.text("Services.AddDialog.title", i18n.text("Application.protocol.AGENT"))>
    <@form.fields name="agentservicefields" title=i18n.text("Services.AddDialog.info.short", i18n.text("Application.protocol.AGENT")) description=i18n.text("Services.AddDialog.info.long")>
        <div><@form.select name="host" items={} required=true><@i18n.message key="Services.label.host" /></@></div>
        <div><@form.port name="port"><@i18n.message key="Services.label.port" /></@></div>
        <div><@form.select name="key" items={}><@i18n.message key="Services.label.key" /></@></div>
    </@form.fields>
</@form.dialog>