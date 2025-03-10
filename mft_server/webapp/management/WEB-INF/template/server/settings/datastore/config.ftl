<div id="app-datastore-fields" class="easyui-layout" data-options="fit:true,doSize:false,border:false">
    <div data-options="region:'center'">
        <form>
            <fieldset class="x-large noborder">
                <legend class="hidden-label"><@i18n.message key="ApplicationDatastore.legend.database" /></legend>

                <div><@form.url name="dburl" required=true><@i18n.message key="ApplicationDatastore.label.dburl" /></@></div>
                <div><@form.username name="username" required=false><@i18n.message key="ApplicationDatastore.label.username" /></@></div>
                <div><@form.dn name="password" required=false><@i18n.message key="ApplicationDatastore.label.password" /></@></div>
                <div><@form.number name="poolsize" maxlength="8"><@i18n.message key="ApplicationDatastore.label.poolSize" /></@>&nbsp;<span><@i18n.message key="ApplicationDatastore.label.poolSizeUnit" /></span></div>
                <div><@form.number name="poolttl" maxlength="8"><@i18n.message key="ApplicationDatastore.label.poolTimeout" /></@>&nbsp;<span><@i18n.message key="ApplicationDatastore.label.poolTimeoutUnit" /></span></div>
                <div><@form.checkbox name="syncenabled"><@i18n.message key="ApplicationDatastore.label.syncPeriod" /></@>
                    <@form.number name="syncperiod" maxlength="8"/>&nbsp;
                    <span><@form.select name="syncperiodunit" items={
                        '${1000?c}': i18n.text("Application.period.second"),
                        '${(60*1000)?c}': i18n.text("Application.period.minute"),
                        '${(60*60*1000)?c}': i18n.text("Application.period.hour"),
                        '${(24*60*60*1000)?c}': i18n.text("Application.period.day")} /></span>
                </div>

                <div class="viewpane-toolbar toolbar-management">
                    <@form.button name="test"><@i18n.message key="ApplicationDatastore.button.test" /></@>&nbsp;
                    <@form.button name="createdb"><@i18n.message key="ApplicationDatastore.button.createDb" /></@>
                </div>

                <div class="warning" style="display:none"><@i18n.message key="ApplicationDatastore.Warning.reconnectRequired" /></div>
            </fieldset>
        </form>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar toolbar-management inline">
            <@form.button name="apply"><@i18n.message key="Application.button.apply" /></@>
            <@form.button name="discard"><@i18n.message key="Application.button.discard" /></@>
        </div>
    </div>
</div>