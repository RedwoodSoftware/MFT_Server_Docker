<#import "macro.ftl" as m />

<div id="manager-access-fields" class="easyui-layout" data-options="fit:true,doSize:false,border:false">
    <div data-options="region:'center'" style="padding: 16px">

        <div class="easyui-layout" data-options="fit:true,doSize:false,border:false">
            <div data-options="region:'north',border:false" style="min-height:90px;height:20%">
                <fieldset class="noborder pane">
                    <div class="checkbox">
                        <@form.checkbox name="timeoutenabled"><@i18n.message key="ManagerAccess.label.timeout" /></@>
                        <input type="text" name="timeout" maxlength="2">&nbsp;&nbsp;<span><@i18n.message key="ManagerAccess.label.timeoutSec" /></span>
                    </div>
                    <div class="checkbox">
                        <@form.checkbox name="disableip"><@i18n.message key="ManagerAccess.label.disableIp" /></@>&nbsp;
                        <span><input type="text" name="disableipattempts" maxlength="4"/>&nbsp;<@i18n.message "ManagerAccess.label.disableIp.attempts" /></span>&nbsp;
                        <span><input type="text" name="disableiptimeout" maxlength="4"/>&nbsp;<@i18n.message "ManagerAccess.label.disableIp.unit" /></span>&nbsp;
                        <span><@i18n.message "ManagerAccess.label.disableIp.period" />&nbsp;<input name="restoringtimeout" maxlength="4"/>&nbsp;<@i18n.message "ManagerAccess.label.disableIp.unit" /></span>
                    </div>
                </fieldset>
            </div>

            <div data-options="region:'center',border:false" style="height:70%">
                <@form.datagrid name="accessrules" height="" columns=["mask", "access", "reason"]; col><@i18n.message key="ManagerAccess.column.${col}" /></@>
            </div>

            <div data-options="region:'south',border:false" class="layout-pane-bottom">
                <div class="viewpane-toolbar inline">
                    <div class="toolbar-selection">
                        <@form.button name="moveup"><@i18n.message key="ManagerAccess.button.up" /></@>
                        <@form.button name="movedown"><@i18n.message key="ManagerAccess.button.down" /></@>
                    </div>
                    <div class="toolbar-management">
                        <@form.button name="add"><@i18n.message key="ManagerAccess.button.add" /></@>
                        <@form.button name="edit"><@i18n.message key="ManagerAccess.button.edit" /></@>
                        <@form.button name="delete"><@i18n.message key="ManagerAccess.button.delete" /></@>
                    </div>
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


<@form.dialog id="ssma-dialog-ipaccess">
    <@form.fields name="manageripaccessfields" title=i18n.text("ManagerAccess.IpAccessDialog.info.short") description=i18n.text("ManagerAccess.IpAccessDialog.info.long")>
        <div><@form.text name="mask"><@i18n.message key="ManagerAccess.IpAccessDialog.label.mask" /></@></div>
        <div><@form.text name="reason"><@i18n.message key="ManagerAccess.IpAccessDialog.label.reason" /></@></div>
        <div class="radio">
            <@form.radio name="access" value="allowed"><@i18n.message key="ManagerAccess.IpAccessDialog.button.allowed" /></@><br/>
            <@form.radio name="access" value="denied"><@i18n.message key="ManagerAccess.IpAccessDialog.button.denied" /></@>
        </div>
    </@form.fields>
</@form.dialog>