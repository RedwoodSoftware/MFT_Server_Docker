<div id="server-updates-fields" class="easyui-layout" data-options="fit:true,doSize:false,border:false">
    <div data-options="region:'center'">
        <fieldset class="noborder">
            <div class="checkbox" style="white-space: nowrap">
                <@form.checkbox name="enable"><@i18n.message "AutomaticUpdates.label.enable" /></@>&nbsp;
                <@form.select name="weekday" items=[] /><span style="padding: 0 1em;"><@i18n.message "AutomaticUpdates.label.enable.at" /></span><@form.number name="time" />
            </div>
        </fieldset>

        <fieldset>
            <legend><@i18n.message key="AutomaticUpdates.legend.backup" /></legend>

            <div class="row"><@form.url name="dburl" required=true><@i18n.message "AutomaticUpdates.label.jdbcUrl" /></@></div>
            <div class="row"><@form.username name="dbuser" required=true><@i18n.message "AutomaticUpdates.label.username" /></@></div>
            <div class="row"><@form.password name="dbpwd"><@i18n.message "AutomaticUpdates.label.password" /></@></div>

            <div class="viewpane-toolbar toolbar-management inline">
                <@form.button name="test"><@i18n.message key="AutomaticUpdates.button.test" /></@>
            </div>
        </fieldset>

        <fieldset class="noborder">
            <div id="update-status">
                <div style="width:300px">
                    <span aria-label="status" style="font-size: 90%;display: inline-block"><@i18n.message "AutomaticUpdates.label.lastUpdate"/></span>
                    <button name="history" type="button" style="float:right"><@i18n.message key="AutomaticUpdates.button.history" /></button>
                    <button name="cancel" type="button" style="float:right"><@i18n.message key="AutomaticUpdates.button.cancelDownload" /></button>
                </div>
            </div>
            <div><@form.button name="check"><@i18n.message key="AutomaticUpdates.button.check" /></@></div>
        </fieldset>
    </div>

<#if permissions.applicationUpdatesControlAllowed>
    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar toolbar-management inline">
            <@form.button name="apply"><@i18n.message key="Application.button.apply" /></@>
            <@form.button name="discard"><@i18n.message key="Application.button.discard" /></@>
        </div>
    </div>
</#if>
</div>