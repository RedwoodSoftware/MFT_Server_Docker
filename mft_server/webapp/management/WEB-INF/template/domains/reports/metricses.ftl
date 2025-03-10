<div style="height:160px">
    <table role="grid" aria-label="metrics">
        <thead><tr><th><@i18n.message key="Reports.label.metrics" /></th></tr></thead>
        <tbody><#list page.reportMetricses as metrics><tr><td>${metrics.class.simpleName?html}</td></tr></#list></tbody>
    </table>
</div>

