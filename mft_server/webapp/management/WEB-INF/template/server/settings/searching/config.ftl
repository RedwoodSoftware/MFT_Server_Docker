<div id="searching-service-fields" class="easyui-layout" data-options="fit:true,doSize:false,border:false">
    <div data-options="region:'center'">
        <fieldset class="noborder">
            <div class="checkbox"><@form.checkbox name="reindex"><@i18n.message key="SearchService.label.indexingPeriod" /></@>&nbsp;&nbsp;<input type="text" name="indexperiod" maxlength="4">&nbsp;&nbsp;<span><@i18n.message key="SearchService.label.indexingPeriodUnits" /></span></div>
            <div class="checkbox"><@form.checkbox name="fileupload"><@i18n.message key="SearchService.label.updateFileIndexUponUpload" /></@></div>
            <div class="checkbox"><@form.checkbox name="filerename"><@i18n.message key="SearchService.label.updateFileIndexUponRename" /></@></div>
            <div class="checkbox"><@form.checkbox name="accountupdate"><@i18n.message key="SearchService.label.updateAccountIndexUponUpdate" /></@></div>
            <div class="checkbox"><@form.checkbox name="groupupdate"><@i18n.message key="SearchService.label.updateGroupIndexUponUpdate" /></@></div>

            <div class="viewpane-toolbar toolbar-management">
                <@form.button name="rebuild" dataToggleText=i18n.text("SearchService.button.fileIndexingProgress")><@i18n.message key="SearchService.button.startFileIndexing" /></@>
            </div>
        </fieldset>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar toolbar-management inline">
            <@form.button name="apply"><@i18n.message key="Application.button.apply" /></@>
            <@form.button name="discard"><@i18n.message key="Application.button.discard" /></@>
        </div>
    </div>
</div>