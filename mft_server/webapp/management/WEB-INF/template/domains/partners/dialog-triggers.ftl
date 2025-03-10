<@form.dialog id="d-partner-triggers" title=i18n.text("TradingPartners.TriggersDialog.title")>
    <div class="content">
        <div data-options="region:'north',border:false">
            <h6><@i18n.message key="TradingPartners.TriggersDialog.info.short" /><span><@i18n.message key="TradingPartners.TriggersDialog.info.long" /></span></h6>
        </div>
        <div data-options="region:'center',border:false" style="padding: 12px 18px 18px">
            <div class="content">
                <div data-options="region:'north',border:false" style="padding:.7em 0">
                    <@form.input name="search" dataOptions="prompt:'${i18n.text('TradingPartners.TriggersDialog.label.findItem')?js_string}'" />
                </div>
                <div data-options="region:'center',border:false">
                    <@form.datalist name="triggers" items=[] dataOptions="emptyMsg:'${i18n.text('TradingPartners.TriggersDialog.Message.noItems')?js_string}'"/>
                </div>
            </div>
        </div>
    </div>
</@form.dialog>