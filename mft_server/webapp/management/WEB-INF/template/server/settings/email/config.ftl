<div id="email-settings-fields" class="easyui-layout" data-options="fit:true,doSize:false,border:false">
    <div data-options="region:'center'" style="padding:16px">

        <div class="easyui-layout" data-options="fit:true,doSize:false,border:false">
            <div data-options="region:'north',border:false" class="layout-pane-top">
                <fieldset class="noborder pane">
                    <div class="checkbox"><@form.checkbox name="enabled"><@i18n.message key="Email.label.enable" /></@></div>
                </fieldset>
            </div>

            <div data-options="region:'center',border:false">
                <fieldset class="large">
                    <legend><@i18n.message key="Email.legend.server" /></legend>
                    <div><@form.host name="host" size="50" required=true><@i18n.message key="Email.label.host" /></@></div>
                    <div><@form.port name="port"><@i18n.message key="Email.label.port" /></@></div>
                    <div><@form.select name="conntype" items={
                            "PLAIN": i18n.text("Email.connection.type.PLAIN"),
                            "SSL": i18n.text("Email.connection.type.SSL"),
                            "START-TLS": i18n.text("Email.connection.type.START-TLS")
                        }><@i18n.message key="Email.label.connectionType" /></@>
                    </div>
                    <div><@form.username name="username" size="35"><@i18n.message key="Email.label.username" /></@></div>
                    <div><@form.password name="password" size="35"><@i18n.message key="Email.label.password" /></@></div>
                    <div><@form.select name="authtype" items={
                            "BASIC": i18n.text("Application.authenticationType.BASIC"),
                            <#--"CRAM_MD5": i18n.text("Application.authenticationType.CRAM_MD5"),-->
                            "XOAUTH2": i18n.text("Application.authenticationType.XOAUTH2")
                        }><@i18n.message key="Email.label.authenticationType" /></@>
                    </div>
                    <fieldset>
                        <legend><@i18n.message key="Email.legend.oauth" /></legend>
                        <div><@form.url name="tokenendpointurl"><@i18n.message key="Email.label.tokenEndpointUrl" /></@></div>
                        <div><@form.username name="clientid"><@i18n.message key="Email.label.clientId" /></@></div>
                        <div><@form.dn name="clientsecret" required=false><@i18n.message key="Email.label.clientSecret" /></@></div>
                        <div><@form.url name="redirecturl"><@i18n.message key="Email.label.redirectUrl" /></@></div>
                    </fieldset>

                    <div><@form.path name="debugfile" size="50"><@i18n.message key="Email.label.debug" /></@>&nbsp;<@form.button name="browsefile"><@i18n.message "Email.button.browse" /></@></div>
                </fieldset>

                <fieldset class="x-large">
                    <legend><@i18n.message key="Email.legend.message" /></legend>
                    <div><@form.text name="from" size="50" maxlength="50" required=true><@i18n.message key="Email.label.from" /></@></div>
                    <div><@form.text name="replyto" size="50" maxlength="50"><@i18n.message key="Email.label.replyTo" /></@></div>
                </fieldset>

                <fieldset class="x-large">
                    <legend><@i18n.message key="Email.legend.encryption" /></legend>
                    <dl class="group">
                        <dt class="checkbox"><@form.checkbox name="useencryption"><@i18n.message key="Email.label.encryptionKey" /></@></dt>
                        <dd><@form.select name="encryptkey" items=[]/></dd>
                        <dt><@form.label for="email-settings-encryptalgorithm"><@i18n.message key="Email.label.encryptionAlgorithm" /></@></dt>
                        <dd><@form.select name="encryptalgorithm" id="email-settings-encryptalgorithm" items=pgpEncryptionAlgorithms/></dd>
                        <dt class="checkbox"><@form.checkbox name="usesigning"><@i18n.message key="Email.label.signingKey" /></@></dt>
                        <dd><@form.select name="signkey" items=[]/></dd>
                        <dt><@form.label for="email-settings-signalgorithm"><@i18n.message key="Email.label.signingAlgorithm" /></@></dt>
                        <dd><@form.select name="signalgorithm" id="email-settings-signalgorithm" items=pgpSigningAlgorithms/></dd>
                    </dl>
                </fieldset>
            </div>

            <div data-options="region:'south',border:false" class="layout-pane-bottom">
                <div class="viewpane-toolbar toolbar-management inline">
                    <@form.button name="test"><@i18n.message key="Email.button.test" /></@>
                </div>
            </div>
        </div>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar toolbar-management inline">
            <@form.button name="apply"><@i18n.message key="Application.button.apply" /></@>
            <@form.button name="discard"><@i18n.message key="Application.button.discard" /></@>
        </div>
    </div>
</div>

<@form.dialog id="sses-dialog-test" title=i18n.text("Email.TestDialog.title")>
    <fieldset name="emailsettingstestfields" class="small">
        <@form.fields_title title=i18n.text("Email.TestDialog.info.short") description=i18n.text("Email.TestDialog.info.long") />
        <div><@form.text name="recipient" size="35" required=true><@i18n.message key="Email.TestDialog.label.to" /></@></div>
    </fieldset>
</@form.dialog>