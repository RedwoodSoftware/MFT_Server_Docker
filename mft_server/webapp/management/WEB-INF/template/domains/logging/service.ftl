<#import "/WEB-INF/tags/json.ftl" as json>

<div id="domain-log-service-fields">

    <div data-options="region:'north',border:false" class="layout-pane-top">
        <fieldset class="noborder pane">
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
        </fieldset>
    </div>

    <div data-options="region:'center'">
        <fieldset id="domain-file-log-service-fields" class="noborder hidden" ${(!(fileLoggingAllowed!false))?string('disabled="disabled"','')}>
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

        <fieldset id="domain-db-log-service-fields" class="noborder hidden">
            <div><@form.url name="dburl" required=true><@i18n.message key="Logging.label.dbUrl" /></@></div>
            <div><@form.username name="username" required=false><@i18n.message key="Logging.label.dbUser" /></@></div>
            <div><@form.password name="password" required=false><@i18n.message key="Logging.label.dbPassword" /></@></div>
            <div><@form.number name="poolsize" maxlength="3"><@i18n.message key="Logging.label.poolSize" /></@>&nbsp;<span><@i18n.message key="Logging.label.poolSizeUnit" /></span></div>
            <div><@form.number name="idlettl" maxlength="3"><@i18n.message key="Logging.label.dbIdleTtl" /></@>&nbsp;<span><@i18n.message key="Logging.label.dbIdleTtlUnit" /></span></div>
            <div class="checkbox"><@form.checkbox name="clearrecords"><@i18n.message key="Logging.label.clearRecords" /></@>&nbsp;<input type="text" name="expirationperiod" maxlength="5"/><span>&nbsp;<@i18n.message key="Logging.label.clearRecordsUnit" /></span></div>

            <div class="viewpane-toolbar toolbar-management">
                <@form.button name="testdb"><@i18n.message key="Logging.button.testParameters" /></@>&nbsp;
                <@form.button name="createdb"><@i18n.message key="Logging.button.createDb" /></@>
            </div>
        </fieldset>

        <fieldset id="domain-db-system-log-service-fields" class="noborder hidden" ${(!(systemDatabaseLoggingAllowed!false))?string('disabled="disabled"','')}>
            <div class="checkbox"><@form.checkbox name="clearrecordsenabled"><@i18n.message key="Logging.label.clearRecords" /></@>&nbsp;<input type="text" name="expirationperiod" maxlength="5"/><span>&nbsp;<@i18n.message key="Logging.label.clearRecordsUnit" /></span></div>
        </fieldset>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar toolbar-management inline">
            <@form.button name="apply" disabled=!permissions.logSettingsControlAllowed><@i18n.message key="Application.button.apply" /></@>
            <@form.button name="discard" disabled=!permissions.logSettingsControlAllowed><@i18n.message key="Application.button.discard" /></@>
        </div>
    </div>
</div>