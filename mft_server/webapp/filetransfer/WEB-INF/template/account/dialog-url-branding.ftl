<@form.dialog id="d-urlbranding-add" title=i18n.text('UrlBranding.AddDialog.title')?html escapeAttrs=false>
    <@form.fields name="urlbrandingfields" title=i18n.text('UrlBranding.AddDialog.info.short')?html description=i18n.text('UrlBranding.AddDialog.info.long')?html>
        <div><@form.dn name="name" required="true" size="35" maxlength="75"><@i18n.message key="UrlBranding.label.name" /></@></div>
        <div><@form.input name="logo" required="true"><@i18n.message key="UrlBranding.label.logo" /></@><div aria-label="logopreview" style="margin-left:9em"><img alt=""/></div></div>
        <div><span style="display:inline-block;width:9em;"><@i18n.message key="UrlBranding.label.url" /></span><span aria-label="themeuri"></span></div>
    </@form.fields>
</@form.dialog>

<@form.dialog id="d-urlbranding-edit" title=i18n.text('UrlBranding.EditDialog.title')?html escapeAttrs=false>
    <@form.fields name="urlbrandingfields" title=i18n.text('UrlBranding.EditDialog.info.short')?html description=i18n.text('UrlBranding.EditDialog.info.long')?html>
        <div><@form.input name="logo" required="true"><@i18n.message key="UrlBranding.label.logo" /></@><div aria-label="logopreview" style="margin-left:9em"><img alt=""/></div></div>
        <div><span style="display:inline-block;width:9em;"><@i18n.message key="UrlBranding.label.url" /></span><span aria-label="themeuri"></span></div>
    </@form.fields>
</@form.dialog>