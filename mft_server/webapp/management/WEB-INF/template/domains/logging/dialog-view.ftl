<@form.dialog id="d-logging-view" title=i18n.text("Logging.ViewDialog.title")>
    <fieldset name="logviewfields">
        <h6>
            <div aria-label="search-results-truncated" style="font-weight:bold;color:red"><@i18n.message key="Logging.ViewDialog.label.truncated" /></div>
            <div><@i18n.message key="Logging.ViewDialog.info.short" /></div>
        </h6>
        <div><@form.memo name="result"/></div>
        <div class="viewpane-toolbar toolbar-selection">
            <@form.button name="export"><@i18n.message key="Logging.button.export" /></@>
        </div>
    </fieldset>
</@form.dialog>