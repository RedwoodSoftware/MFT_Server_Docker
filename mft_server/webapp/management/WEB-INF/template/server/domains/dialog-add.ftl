<#import "/WEB-INF/tags/json.ftl" as json>

<#function add_domain_transport_services items={}>
    <#local services = {} />
    <#list items?keys as key>
        <#local entry=items[key] />
        <#if !(entry.allowed)!false>
            <#local services = services + {"${key}": {'text': entry.text, 'disabled': true, 'title': i18n.text("AddDomainDialog.Error.serviceNotAllowed")}} />
        <#else>
            <#local services = services + {"${key}" :{'text': entry.text}} />
        </#if>
    </#list>
    <#return services />
</#function>

<div id="domain-add-wizard" title="${i18n.text('AddDomainDialog.title')}" class="dialog">
    <div id="createdomainfields">
        <div data-options="region:'center',border:false" style="padding: 1em 1.7em">
            <#--Step 1 - Domain Name-->
            <fieldset name="domainparametersfields" class="pane hidden">
                <@form.fields_title title=i18n.text("AddDomainDialog.title.domainName") description=i18n.text("AddDomainDialog.info.domainName")></@>
                <div><@form.dn name="name" required=true><@i18n.message key="AddDomainDialog.label.domainName" /></@></div>
                <div><@form.memo name="description"><@i18n.message key="AddDomainDialog.label.domainDescription" /></@></div>
            </fieldset>

            <#--Step 2 - Domain Service-->
            <fieldset name="domainservicefields" class="pane hidden" style="overflow:auto">
                <@form.fields_title title=i18n.text("AddDomainDialog.title.domainService") description=i18n.text("AddDomainDialog.info.domainService")></@>
                <div class="checkbox"><@form.checkbox name="addservice"><@i18n.message key="AddDomainDialog.label.addService" /></@></div>
                <div><@form.select name="protocol" items=add_domain_transport_services({
                        'AFTP': {'text': i18n.text("Application.protocol.AFTP"), 'allowed': (permissions.domainAftpServiceAllowed)!false},
                        'AS2': {'text': i18n.text("Application.protocol.AS2"), 'allowed': (permissions.domainAs2ServiceAllowed)!false},
                        'FTP': {'text': i18n.text("Application.protocol.FTP_COMMON"), 'allowed': (permissions.domainFtpServiceAllowed)!false},
                        'HTTP': {'text': i18n.text("Application.protocol.HTTP_COMMON"), 'allowed': (permissions.domainHttpServiceAllowed)!false},
                        'OFTP': {'text': i18n.text("Application.protocol.OFTP"), 'allowed': (permissions.domainOftpServiceAllowed)!false},
                        'SFTP': {'text': i18n.text("Application.protocol.SFTP"), 'allowed': (permissions.domainSftpServiceAllowed)!false},
                        'WEBDAV': {'text': i18n.text("Application.protocol.WEBDAV_COMMON"), 'allowed': (permissions.domainWebDavServiceAllowed)!false}
                    })><@i18n.message key="Services.label.protocol" /></@>
                </div>
                <fieldset name="ftpservicefields" class="hidden">
                    <div><@form.select name="host" items={} required=true><@i18n.message key="Services.label.host" /></@></div>
                    <div><@form.port name="port"><@i18n.message key="Services.label.port" /></@></div>
                    <div><@form.select name="type" items={
                        'regular': i18n.text("Application.protocol.FTP.regular"),
                        'explicit SSL': i18n.text("Application.protocol.FTP.explicitSsl"),
                        'forced explicit SSL': i18n.text("Application.protocol.FTP.forcedExplicitSsl"),
                        'implicit SSL': i18n.text("Application.protocol.FTP.implicitSsl")
                    }><@i18n.message key="Services.label.type" /></@></div>
                    <div><@form.select name="privatekey" items={}><@i18n.message key="Services.label.privateKey" /></@></div>
                </fieldset>
                <fieldset name="sftpservicefields" class="hidden">
                    <div><@form.select name="host" items={} required=true><@i18n.message key="Services.label.host" /></@></div>
                    <div><@form.port name="port"><@i18n.message key="Services.label.port" /></@></div>
                    <div><@form.select name="privatekey" items={}><@i18n.message key="Services.label.privateKey" /></@></div>
                    <div><@form.select name="auth" items={
                        'password': i18n.text("Services.auth.password"),
                        'publickey': i18n.text("Services.auth.publicKey"),
                        'password OR publickey': i18n.text("Services.auth.passwordOrPublicKey"),
                        'password AND publickey': i18n.text("Services.auth.passwordAndPublicKey")
                    }><@i18n.message key="Services.label.authentication" /></@></div>
                </fieldset>
                <fieldset name="aftpservicefields" class="hidden">
                    <div><@form.select name="host" items={} required=true><@i18n.message key="Services.label.host" /></@></div>
                    <div><@form.port name="port"><@i18n.message key="Services.label.port" /></@></div>
                    <div><@form.select name="privatekey" items={}><@i18n.message key="Services.label.privateKey" /></@></div>
                    <div class="checkbox"><@form.checkbox name="requiresecure"><@i18n.message key="Services.label.securedConnectionRequired" /></@></div>
                </fieldset>
                <fieldset name="oftpservicefields" class="hidden">
                    <div><@form.select name="host" items={} required=true><@i18n.message key="Services.label.host" /></@></div>
                    <div><@form.port name="port"><@i18n.message key="Services.label.port" /></@></div>
                    <div><@form.dn name="idcode" maxlength="500" required=true><@i18n.message key="Services.label.identificationCode" /></@></div>
                    <div><@form.select name="privatekey" items={}><@i18n.message key="Services.label.privateKey" /></@></div>
                    <div class="checkbox"><@form.checkbox name="usessl"><@i18n.message key="Services.label.userSsl" /></@></div>
                    <div class="checkbox"><@form.checkbox name="fileencryption"><@i18n.message key="Services.label.fileEncryptionRequired" /></@></div>
                    <div class="checkbox"><@form.checkbox name="filesignature"><@i18n.message key="Services.label.fileSignatureRequired" /></@></div>
                </fieldset>
                <fieldset name="httpservicefields" class="hidden">
                    <div class="checkbox"><@form.checkbox name="plain"><@i18n.message key="Services.label.http" /></@></div>
                    <div class="checkbox"><@form.checkbox name="secure"><@i18n.message key="Services.label.https" /></@></div>
                </fieldset>
                <fieldset name="webdavservicefields" class="hidden">
                    <div class="checkbox"><@form.checkbox name="plain"><@i18n.message key="Services.label.http" /></@></div>
                    <div class="checkbox"><@form.checkbox name="secure"><@i18n.message key="Services.label.https" /></@></div>
                </fieldset>
                <fieldset name="as2servicefields" class="hidden">
                    <div class="checkbox"><@form.checkbox name="plain"><@i18n.message key="Services.label.http" /></@></div>
                    <div class="checkbox"><@form.checkbox name="secure"><@i18n.message key="Services.label.https" /></@></div>
                </fieldset>
            </fieldset>

            <#--Step 3 - Log Service -->
            <fieldset name="logservicefields" class="pane hidden">
                <@form.fields_title title=i18n.text("AddDomainDialog.title.logService") description=i18n.text("AddDomainDialog.info.logService")></@>
                <div>
                    <#if (fileLoggingAllowed!false) && (systemDatabaseLoggingAllowed!false)>
                        <@form.select name="type" items={
                            'FILE': i18n.text("Logging.type.FILE"),
                            'DB': i18n.text("Logging.type.DATABASE"),
                            'DB_SYSTEM': i18n.text("Logging.type.DOMAIN")
                        }><@i18n.message key="Logging.label.type" /></@form.select>
                    <#else>
                        <#assign log_service_types>
                            <@json.stringify [
                                {"value": "FILE", "text":"${i18n.text('Logging.type.FILE')}", "disabled": !(fileLoggingAllowed!false), "title": "${i18n.text('Logging.Error.serviceTypeNotAllowed')}"},
                                {"value": "DB", "text":"${i18n.text('Logging.type.DATABASE')}"},
                                {"value": "DB_SYSTEM", "text":"${i18n.text('Logging.type.DOMAIN')}", "disabled": !(systemDatabaseLoggingAllowed!false), "title": "${i18n.text('Logging.Error.serviceTypeNotAllowed')}"}
                            ] />
                        </#assign>
                        <@form.select name="type" items={} dataOptions="data:${log_service_types}"><@i18n.message key="Logging.label.type" /></@form.select>
                    </#if>
                </div>

                <fieldset name="filelogservicefields" class="hidden" ${(!(fileLoggingAllowed!false))?string('disabled="disabled"','')}>
                    <div><@form.path name="directory" required=true><@i18n.message key="Logging.label.directory" /></@></div>
                    <dl class="group">
                        <dt><@i18n.message key="Logging.label.fileStrategy" /></dt>
                        <dd class="radio"><@form.radio name="strategy" value="Daily" checked="checked"><@i18n.message key="Logging.fileStrategy.daily" /></@></dd>
                        <dd class="radio"><@form.radio name="strategy" value="Weekly"><@i18n.message key="Logging.fileStrategy.weekly" /></@></dd>
                        <dd class="radio"><@form.radio name="strategy" value="Monthly"><@i18n.message key="Logging.fileStrategy.monthly" /></@></dd>
                        <dd class="radio"><@form.radio name="strategy" value="FileSize"><@i18n.message key="Logging.fileStrategy.fileSize" />&nbsp;<input type="text" name="filesize" maxlength="3" /><span>&nbsp;<@i18n.message key="Logging.fileStrategy.fileSizeUnit" /></span></@></dd>
                    </dl>

                    <div class="viewpane-toolbar toolbar-selection">
                        <@form.button name="addvar"><@i18n.message key="Logging.button.addVariable" /></@>
                    </div>
                </fieldset>

                <fieldset name="dblogservicefields" class="hidden">
                    <div><@form.url name="dburl" required=true><@i18n.message key="Logging.label.dbUrl" /></@></div>
                    <div><@form.username name="username" required=true><@i18n.message key="Logging.label.dbUser" /></@></div>
                    <div><@form.password name="password"><@i18n.message key="Logging.label.dbPassword" /></@></div>
                    <div><@form.number name="poolsize" maxlength="3"><@i18n.message key="Logging.label.poolSize" /></@>&nbsp;<span><@i18n.message key="Logging.label.poolSizeUnit" /></span></div>
                    <div><@form.number name="idlettl" maxlength="3"><@i18n.message key="Logging.label.dbIdleTtl" /></@>&nbsp;<span><@i18n.message key="Logging.label.dbIdleTtlUnit" /></span></div>
                    <div class="checkbox"><@form.checkbox name="clearrecords"><@i18n.message key="Logging.label.clearRecords" /></@>&nbsp;<input type="text" name="expirationperiod" maxlength="5"/><span>&nbsp;<@i18n.message key="Logging.label.clearRecordsUnit" /></span></div>

                    <div class="viewpane-toolbar toolbar-management">
                        <@form.button name="testdb"><@i18n.message key="Logging.button.testParameters" /></@>
                        <@form.button name="createdb"><@i18n.message key="Logging.button.createDb" /></@>
                    </div>
                </fieldset>

                <fieldset name="domainlogservicefields" class="hidden" ${(!(systemDatabaseLoggingAllowed!false))?string('disabled="disabled"','')}>
                    <div class="checkbox"><@form.checkbox name="clearrecordsenabled"><@i18n.message key="Logging.label.clearRecords" /></@>&nbsp;<input type="text" name="expirationperiod" maxlength="5"/><span>&nbsp;<@i18n.message key="Logging.label.clearRecordsUnit" /></span></div>
                </fieldset>
            </fieldset>
        </div>

        <div data-options="region:'south',border:false" style="padding: 1em 2em">
            <div class="row"><@form.checkbox name="editafterdone"><@i18n.message key="AddDomainDialog.label.editAfterDone" /></@></div>
        </div>
    </div>
</div>