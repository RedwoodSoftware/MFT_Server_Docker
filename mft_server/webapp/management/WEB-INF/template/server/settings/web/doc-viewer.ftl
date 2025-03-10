<div id="docviewer-settings-fields">
    <div data-options="region:'center',border:true" style="padding:16px">

        <div class="content">
            <div data-options="region:'north',border:false" class="layout-pane-top">
                <fieldset class="noborder pane">
                    <div class="checkbox"><@form.checkbox name="enabled"><@i18n.message key="WebDocumentViewer.label.enable" /></@></div>
                </fieldset>
            </div>

            <div data-options="region:'center',border:false">
                <fieldset>
                    <legend><@i18n.message key="WebDocumentViewer.title.settings" /></legend>

                    <div><@form.path name="officedir" required=true><@i18n.message key="WebDocumentViewer.label.officeDirectory" /></@></div>
                    <div><@form.path name="swftooldir"><@i18n.message key="WebDocumentViewer.label.swfToolDirectory" /></@></div>
                    <div><@form.path name="outdir" required=true><@i18n.message key="WebDocumentViewer.label.outputDirectory" /></@></div>
                    <div><@form.number name="threads" maxlength="3" required=true><@i18n.message key="WebDocumentViewer.label.threads" /></@></div>
                </fieldset>
            </div>

            <div data-options="region:'south',border:false" class="layout-pane-bottom">
                <div class="viewpane-toolbar toolbar-management inline">
                    <@form.button name="test"><@i18n.message key="WebDocumentViewer.button.test" /></@>
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