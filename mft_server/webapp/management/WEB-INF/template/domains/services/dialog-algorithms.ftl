<#macro algorithms_pane name prompt>
    <div class="content">
        <div data-options="region:'north',border:false" style="padding-bottom:.7em">
            <@form.input name="search${name?html}" dataOptions="prompt:'${prompt?js_string}'" />
        </div>
        <div data-options="region:'center',border:false">
            <@form.datalist name=name?html items=[] dataOptions="emptyMsg:'${i18n.text('Services.AlgorithmsDialog.message.noItems')?js_string}'"/>
        </div>
    </div>
</#macro>

<@form.dialog id="d-services-sftp-algorithms" title=i18n.text("Services.AlgorithmsDialog.title")>
    <div class="content">
        <div data-options="region:'north',border:false">
            <h6><@i18n.message key="Services.AlgorithmsDialog.info.short" /><span><@i18n.message key="Services.AlgorithmsDialog.info.long" /></span></h6>
        </div>
        <div data-options="region:'center',border:false" class="wrap">
            <div role="tablist" class="content-tabs wrap">
                <div role="tab" class="wrap" title="${i18n.text("Services.AlgorithmsDialog.title.kexes")?html}">
                    <@algorithms_pane name="kexes" prompt=i18n.text("Services.AlgorithmsDialog.prompt.searchKexes") />
                </div>
                <div role="tab" class="wrap" title="${i18n.text("Services.AlgorithmsDialog.title.keys")?html}">
                    <@algorithms_pane name="keys" prompt=i18n.text("Services.AlgorithmsDialog.prompt.searchKeys") />
                </div>
                <div role="tab" class="wrap" title="${i18n.text("Services.AlgorithmsDialog.title.ciphers")?html}">
                    <@algorithms_pane name="ciphers" prompt=i18n.text("Services.AlgorithmsDialog.prompt.searchCiphers") />
                </div>
                <div role="tab" class="wrap" title="${i18n.text("Services.AlgorithmsDialog.title.macs")?html}">
                    <@algorithms_pane name="macs" prompt=i18n.text("Services.AlgorithmsDialog.prompt.searchMacs") />
                </div>
                <div role="tab" class="wrap" title="${i18n.text("Services.AlgorithmsDialog.title.compressions")?html}">
                    <@algorithms_pane name="compressions" prompt=i18n.text("Services.AlgorithmsDialog.prompt.searchCompressions") />
                </div>
            </div>
        </div>
    </div>
</@form.dialog>