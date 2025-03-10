<@form.dialog id="d-partners-export" disabled=!permissions.tradingPartnersControllAllowed title=i18n.text("TradingPartners.ExportDialog.title") header=i18n.text("TradingPartners.ExportDialog.info.short") description=i18n.text("TradingPartners.ExportDialog.info.long")>
    <fieldset class="noborder pane">
        <div><@form.dn name="filename" required=true><@i18n.message key="TradingPartners.ExportDialog.label.file" /></@></div>
        <div class="checkbox"><@form.checkbox name="excludepwd"><@i18n.message key="TradingPartners.ExportDialog.label.excludePassword" /></@></div>
    </fieldset>
</@form.dialog>