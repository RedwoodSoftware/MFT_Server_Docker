<div id="web-resources-fields" class="easyui-layout" data-options="fit:true,doSize:false,border:false">
    <div data-options="region:'center'" style="padding:16px">

        <div class="easyui-layout" data-options="fit:true,doSize:false,border:false">
            <div data-options="region:'north',border:false">
                <div style="display:flex;flex-direction:row;padding:1em">
                    <div><label for="webresorceslogo"><span style="display: inline-block;min-width: 9em;"><@i18n.message "WebResources.label.logo" /></span></label></div>
                    <div class="logo-preview"><img /></div>
                    <div style="padding-left:.7em"><@form.button name="changelogo"><@i18n.message "WebResources.button.changeLogo" /></@><input type="file" name="logo"/></div>
                </div>
            </div>

            <div data-options="region:'center',border:false">
                <div class="easyui-layout" data-options="fit:true,doSize:false,border:false">
                     <div data-options="region:'north',border:false" class="layout-pane-top">
                         <div style="white-space: nowrap; padding: 1em">
                             <@form.select name="language" items={}><span style="display: inline-block;min-width: 9em;"><@i18n.message key="WebResources.label.language" /></span></@>&nbsp;
                             <@form.button name="add"><@i18n.message key="WebResources.button.add" /></@>&nbsp;
                             <@form.button name="reset"><@i18n.message key="WebResources.button.reset" /></@>
                         </div>
                     </div>

                     <div data-options="region:'center',border:false">
                        <@form.datagrid height="" name="resources"/>
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

<#assign resource_languages={}/><#list page.availableLanguages?keys as key><#assign  resource_languages=resource_languages + {key: page.availableLanguages[key]} /></#list>
<@form.dialog id="d-sswres-add" title=i18n.text("WebResources.AddDialog.title") >
    <@form.fields name="addwebresourcefields" title=i18n.text("WebResources.AddDialog.info.short") description=i18n.text("WebResources.AddDialog.info.long")>
        <div><@form.select name="language" items=resource_languages><@i18n.message key="WebResources.label.language" /></@></div>
    </@form.fields>
</@form.dialog>