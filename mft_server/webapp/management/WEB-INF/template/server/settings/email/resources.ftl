<div id="email-resources-fields" class="easyui-layout" data-options="fit:true,doSize:false,border:false">
    <div data-options="region:'center'" style="padding:16px">

        <div class="easyui-layout" data-options="fit:true,doSize:false,border:false">
            <div data-options="region:'center',border:false">
                <@form.datagrid height="" name="resources" />
            </div>

            <div data-options="region:'south',border:false" class="layout-pane-bottom">
                <div class="viewpane-toolbar toolbar-selection inline">
                    <@form.button name="addvariable"><@i18n.message key="EmailResources.button.addVariable" /></@>
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
