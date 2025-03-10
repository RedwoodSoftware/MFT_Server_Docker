<@form.dialog id="d-partner-copy" title=i18n.text("TradingPartners.CopyDialog.title") header=i18n.text("TradingPartners.CopyDialog.info.short") description=i18n.text("TradingPartners.CopyDialog.info.long")>
    <fieldset class="noborder pane">
        <div><@form.username name="name" required=true><@i18n.message "TradingPartners.label.name" /></@></div>
        <div class="checkbox"><@form.checkbox name="editafterdone"><@i18n.message key="TradingPartners.CopyDialog.label.editAfterCopying" /></@></div>
    </fieldset>
</@form.dialog>