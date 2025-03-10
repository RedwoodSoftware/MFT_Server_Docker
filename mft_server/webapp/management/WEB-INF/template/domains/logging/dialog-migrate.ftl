<@form.dialog id="d-logging-migrate" title=i18n.text("Logging.MigrateDialog.title")>
    <fieldset name="migratelogrecordsfields" class="noborder pane" style="padding:3em">
        <div class="checkbox">
            <@form.checkbox name="enabled"><@i18n.message key="Logging.MigrateDialog.label.migrate.1" /></@>&nbsp;
            <span><@form.select name="period" items={
                  "ALL": i18n.text("Logging.MigrateDialog.data.ALL")?html,
                  "period:30 days": i18n.text("Logging.MigrateDialog.data.30_DAYS")?html,
                  "period:60 days": i18n.text("Logging.MigrateDialog.data.60_DAYS")?html,
                  "period:90 days": i18n.text("Logging.MigrateDialog.data.90_DAYS")?html
            }/></span>&nbsp;<@i18n.message key="Logging.MigrateDialog.label.migrate.2" />
        </div>
    </fieldset>
</@form.dialog>
