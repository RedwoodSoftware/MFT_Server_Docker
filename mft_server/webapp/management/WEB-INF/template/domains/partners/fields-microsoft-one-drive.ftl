<fieldset>
    <legend><@i18n.message key="TradingPartners.legend.authentication" /></legend>
    <div><@form.dn name="dir" description=i18n.text("TradingPartners.OneDrive.label.directoryId.description") example=i18n.text("TradingPartners.OneDrive.label.directoryId.example")><@i18n.message key="TradingPartners.OneDrive.label.directoryId" /></@></div>
    <div><@form.dn name="client" description=i18n.text("TradingPartners.OneDrive.label.clientId.description") example=i18n.text("TradingPartners.OneDrive.label.clientId.example")><@i18n.message key="TradingPartners.OneDrive.label.clientId" /></@></div>
    <div><@form.dn name="secret" description=i18n.text("TradingPartners.OneDrive.label.clientSecret.description") example=i18n.text("TradingPartners.OneDrive.label.clientSecret.example")><@i18n.message key="TradingPartners.OneDrive.label.clientSecret" /></@></div>
    <div><@form.dn name="user" required=false description=i18n.text("TradingPartners.label.username.description") example=i18n.text("TradingPartners.label.username.example")><@i18n.message key="TradingPartners.label.username" /></@></div>
    <div class="checkbox"><@form.checkbox name="rootaccess" description=i18n.text("TradingPartners.label.rootAccess.description") example=i18n.text("TradingPartners.label.rootAccess.example")><@i18n.message key="TradingPartners.label.rootAccess" /></@></div>
</fieldset>