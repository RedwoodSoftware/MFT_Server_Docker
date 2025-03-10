<fieldset>
    <legend><@i18n.message "UserInfo.legend.protocols" /></legend>

    <#assign user_protocols={
    'AFTP': i18n.text("Application.protocol.AFTP"),
    'AGENT': i18n.text("Application.protocol.AGENT"),
    'AS2': i18n.text("Application.protocol.AS2"),
    'HTTP': i18n.text("Application.protocol.HTTP_COMMON"),
    'FTP': i18n.text("Application.protocol.FTP_COMMON"),
    'OFTP': i18n.text("Application.protocol.OFTP"),
    'SFTP': i18n.text("Application.protocol.SFTP"),
    'TFTP': i18n.text("Application.protocol.TFTP"),
    'WEBDAV': i18n.text("Application.protocol.WEBDAV_COMMON")
    } />

    <div class="checkbox">
        <@form.label for="restrictprotocol"><@i18n.message "UserInfo.label.restrictProtocols" />&nbsp;&nbsp;
        <@form.input type="checkbox" id="restrictprotocol" name="restrictprotocol"/></@>
    </div>
    <#list user_protocols?keys as protocol>
        <div class="row"><@form.checkbox name="protocol" value="${protocol}">${user_protocols[protocol]}</@></div>
    </#list>
</fieldset>