<@form.dialog id="d-services-webresources" disabled=!permissions.domainServicesControlAllowed title=i18n.text("Services.ResourcesDialog.title") header=i18n.text("Services.ResourcesDialog.info.short") description=i18n.text("Services.ResourcesDialog.info.long")>
    <div class="content">
        <div data-options="region:'center',border:false">
            <div class="content">
                <div data-options="region:'center',split:true,width:'40%',split:true,border:false">
                    <div class="content">
                        <div data-options="region:'north',border:false">
                            <@form.input name="search" dataOptions="prompt:'${i18n.text('Services.ResourcesDialog.prompt.filterKeys')?js_string}',width:'100%'" />
                        </div>
                        <div data-options="region:'center',border:true">
                            <@form.datalist name="resourcekeys" items=[] />
                        </div>
                    </div>
                </div>
                <div data-options="region:'east',width:'60%',split:true,border:false">
                    <@form.datagrid height="" name="resourcevalues" title=i18n.text("Services.ResourcesDialog.label.language") dataOptions="border:true"/>
                </div>
            </div>
        </div>

        <div data-options="region:'south',border:false">
            <div class="viewpane-toolbar toolbar-selection inline">
                <div class="toolbar-management">
                    <@form.button name="add"><@i18n.message key="Services.ResourcesDialog.button.add" /></@>
                    <@form.button name="reset"><@i18n.message key="Services.ResourcesDialog.button.reset" /></@>
                </div>
            </div>
        </div>
    </div>
</@form.dialog>

<@form.dialog id="d-services-addwebresource" title=i18n.text("Services.AddLanguageDialog.title") header=i18n.text("Services.AddLanguageDialog.info.short") description=i18n.text("Services.AddLanguageDialog.info.long")>
    <fieldset class="noborder pane">
        <#assign resource_languages={}/>
        <#list page.availableLanguages?keys as key><#assign resource_languages=resource_languages + {key: page.availableLanguages[key]} /></#list>
        <div><@form.select name="language" items=resource_languages><@i18n.message key="Services.AddLanguageDialog.label.language" /></@></div>
    </fieldset>
</@form.dialog>
