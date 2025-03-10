<@form.dialog id="d-webtheme-add" title=i18n.text("UrlBranding.AddDialog.title") header=i18n.text("UrlBranding.AddDialog.info.short") description=i18n.text("UrlBranding.AddDialog.info.long")>
    <div class="content">
        <div data-options="region:'north',border:false">
            <fieldset class="noborder pane">
                <div><@form.dn name="name" required=true><@i18n.message key="UrlBranding.label.name" /></@></div>
                <div><@form.dn name="logo" required=true><@i18n.message key="UrlBranding.label.logo" /></@></div>
            </fieldset>
        </div>
        <div data-options="region:'center',border:false" style="padding: 0 2em">
            <div aria-label="logopreview"></div>
        </div>
        <div data-options="region:'south',border:false">
            <fieldset class="noborder pane">
                <div><@form.checkbox name="ownedby"><@i18n.message key="UrlBranding.label.owner" /></@><@form.select name="owner" items=[] /></div>
                <div><@form.select name="tags" items=[]><@i18n.message key="UrlBranding.label.tags" /></@></div>
                <div>
                    <label><@i18n.message key="UrlBranding.label.url" /></label><span aria-label="themeuri"></span>
                    <@form.button name="copylink" ariaHaspopup="true" style="margin-left:1em"><@i18n.message key="UrlBranding.button.copyLink" /></@>
                </div>
            </fieldset>
        </div>
    </div>
</@form.dialog>


<@form.dialog id="d-webtheme-edit" title=i18n.text("UrlBranding.EditDialog.title") header=i18n.text("UrlBranding.EditDialog.info.short") description=i18n.text("UrlBranding.EditDialog.info.long")>
    <div class="content">
        <div data-options="region:'north',border:false">
            <fieldset class="noborder pane">
                <div><@form.dn name="logo" required=true><@i18n.message key="UrlBranding.label.logo" /></@></div>
            </fieldset>
        </div>
        <div data-options="region:'center',border:false" style="padding: 0 2em">
            <div aria-label="logopreview"></div>
        </div>
        <div data-options="region:'south',border:false">
            <fieldset class="noborder pane">
                <div><@form.checkbox name="ownedby"><@i18n.message key="UrlBranding.label.owner" /></@><@form.select name="owner" items=[] /></div>
                <div><@form.select name="tags" items=[]><@i18n.message key="UrlBranding.label.tags" /></@></div>
                <div>
                    <label><@i18n.message key="UrlBranding.label.url" /></label><span aria-label="themeuri"></span>
                    <@form.button name="copylink" ariaHaspopup="true" style="margin-left:1em"><@i18n.message key="UrlBranding.button.copyLink" /></@>
                </div>
            </fieldset>
        </div>
    </div>
</@form.dialog>