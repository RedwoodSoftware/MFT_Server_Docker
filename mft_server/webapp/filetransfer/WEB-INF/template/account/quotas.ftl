<#ftl strip_whitespace=true>

<div id="account-quotas-fields">

    <div data-options="region:'center',border:false">
        <fieldset name="quotasusagefields" role="presentation">
            <dl class="group">
                <dt><@i18n.message key="Quotas.label.uploads" /></dt><dd><span aria-label="uploadsusage"></span></dd>
                <dt><@i18n.message key="Quotas.label.downloads" /></dt><dd><span aria-label="downloadsusage"></span></dd>
                <dt><@i18n.message key="Quotas.label.transfers" /></dt><dd><span aria-label="transfersusage"></span></dd>
            </dl>
        </fieldset>
    </div>

    <div data-options="region:'south',border:false" class="layout-pane-bottom">
        <div class="viewpane-toolbar">
            <@form.button name="refresh"><@i18n.message key="Application.button.refresh" /></@form.button>
        </div>
    </div>

</div>