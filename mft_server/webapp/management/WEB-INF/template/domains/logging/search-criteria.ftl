<#macro search_operator name type="number">
    <#if type == "string">
        <@form.select name="${name}" items={
            '=': i18n.text("Logging.operator.equals"),
            '!=': i18n.text("Logging.operator.notEqual"),
            '#': i18n.text("Logging.operator.contains"),
            '!#': i18n.text("Logging.operator.notContain"),
            '~': i18n.text("Logging.operator.matches"),
            '!~': i18n.text("Logging.operator.notMatch")
        } />
    <#else>
        <@form.select name="${name}" items={'=': '=', '!=': '!=', '>': '>', '>=': '>=', '<': '<', '<=': '<='} />
    </#if>
</#macro>
<#macro criteria_size_unit name>
    <@form.select name="${name}" items={
        '${1?c}': i18n.text("Application.size.bytes"),
        '${1024?c}': i18n.text("Application.size.kilobyte"),
        '${(1024*1024)?c}': i18n.text("Application.size.megabyte")
    } />
</#macro>


<div id="domain-search-criteria-fields">

    <div data-options="region:'center'">
        <fieldset class="large noborder"<#if !permissions.logSearchingControlAllowed> disabled="disabled"</#if>>
            <div><@form.dn name="name" maxlength="150" required=true><@i18n.message key="Logging.label.searchName" /></@></div>
            <div><@form.number name="maxrecords"><@i18n.message key="Logging.label.searchRecords" /></@><span>&nbsp;<@i18n.message key="Logging.label.searchRecordsUnit" /></span></div>
        </fieldset>

        <fieldset class="large"<#if !permissions.logSearchingControlAllowed> disabled="disabled"</#if>>
            <legend><@i18n.message key="Logging.legend.searchCriteria" /></legend>

            <div class="row"><@form.checkbox name="daterange" value="Date"><@i18n.message key="Logging.label.dateRange" /></@><input type="text" name="datebegin" />&nbsp;&nbsp;<span><@i18n.message key="Logging.label.dateTo" /></span>&nbsp;&nbsp;<input type="text" name="dateend" /></div>
            <div class="row"><@form.checkbox name="byappinstanceid" value="ApplicationInstanceId"><@i18n.message key="Logging.label.appInstanceId" /></@><@search_operator name="appinstanceidoperator" type="string"/><@form.select name="appinstanceid" maxlength="255" items=[] /></div>
            <div class="row"><@form.checkbox name="bysessionid" value="SessionId"><@i18n.message key="Logging.label.sessionId" /></@><@search_operator name="sessionidoperator" type="string"/><input type="text" name="sessionid" maxlength="150" /></div>
            <div class="row"><@form.checkbox name="byclientip" value="ClientIP"><@i18n.message key="Logging.label.clientIp" /></@><@search_operator name="clientipoperator" type="string"/><input type="text" name="clientip" maxlength="150"/></div>
            <div class="row"><@form.checkbox name="byclientport" value="ClientPort"><@i18n.message key="Logging.label.clientPort" /></@><@search_operator name="clientportoperator" /><input type="text" name="clientport" maxlength="5"/></div>
            <div class="row"><@form.checkbox name="byserverip" value="ServerIP"><@i18n.message key="Logging.label.serverIp" /></@><@search_operator name="serveripoperator" type="string"/><input type="text" name="serverip" maxlength="150"/></div>
            <div class="row"><@form.checkbox name="byserverport" value="ServerPort"><@i18n.message key="Logging.label.serverPort" /></@><@search_operator name="serverportoperator" /><input type="text" name="serverport" maxlength="5"/></div>
            <div class="row"><@form.checkbox name="byusername" value="Username"><@i18n.message key="Logging.label.username" /></@><@search_operator name="usernameoperator" type="string"/><@form.select name="username" maxlength="150" items=[] /></div>
            <div class="row"><@form.checkbox name="byclientrequest" value="ClientRequest"><@i18n.message key="Logging.label.clientRequest" /></@><@search_operator name="clientrequestoperator" type="string"/><input type="text" name="clientrequest" maxlength="255"/></div>
            <div class="row"><@form.checkbox name="byclientmessage" value="ClientMessage"><@i18n.message key="Logging.label.clientMessage" /></@><@search_operator name="clientmessageoperator" type="string"/><input type="text" name="clientmessage" maxlength="255"/></div>
            <div class="row"><@form.checkbox name="byserverstatus" value="ServerStatus"><@i18n.message key="Logging.label.serverStatus" /></@><@search_operator name="serverstatusoperator" type="string"/><@form.select name="serverstatus" items=[] /></div>
            <div class="row"><@form.checkbox name="byservermessage" value="ServerMessage"><@i18n.message key="Logging.label.serverMessage" /></@><@search_operator name="servermessageoperator" type="string"/><@form.select name="servermessage" items=[] /></div>
            <div class="row"><@form.checkbox name="byinbound" value="InboundBytes"><@i18n.message key="Logging.label.inboundBytes" /></@><@search_operator name="inboundoperator"/><input type="text" name="inbound" maxlength="20"/><@criteria_size_unit name="inboundfactor"  /></div>
            <div class="row"><@form.checkbox name="byoutbound" value="OutboundBytes"><@i18n.message key="Logging.label.outboundBytes" /></@><@search_operator name="outboundoperator"/><input type="text" name="outbound" maxlength="20"/><@criteria_size_unit name="outboundfactor"  /></div>
        </fieldset>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar toolbar-management inline">
            <@form.button name="search" disabled=!permissions.logSearchingControlAllowed><@i18n.message key="Logging.button.search" /></@>
        </div>
    </div>
</div>