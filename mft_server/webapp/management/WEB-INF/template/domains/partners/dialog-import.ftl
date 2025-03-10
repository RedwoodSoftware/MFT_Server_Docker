<@form.dialog id="d-partners-import" title=i18n.text("TradingPartners.ImportDialog.title") header=i18n.text("TradingPartners.ImportDialog.info.short") description=i18n.text("TradingPartners.ImportDialog.info.long")>
    <fieldset class="noborder pane">
        <div><@form.input type="text" name="file" required=true><@i18n.message key="TradingPartners.ImportDialog.label.file" /></@></div>
        <div class="checkbox"><@form.checkbox name="overwrite"><@i18n.message key="TradingPartners.ImportDialog.label.overwrite" /></@></div>
    </fieldset>
</@form.dialog>