<#ftl strip_whitespace=true>
<#import "/WEB-INF/tags/file.ftl" as fs>
<#-- @ftlvariable name="metrics" type="com.jscape.inet.mft.audit.reporting.metricses.TotalExternalBytesUploads" -->

<div title="${i18n.text("Reports.Metrics.title.totalExternalBytesUploaded")}" data-options="collapsed:false">
    <table role="grid" aria-label="total-external-bytes-uploaded" class="easyui-propertygrid" data-options="columns:[[{field:'name',width:'50%'},{field:'value',width:'50%'}]]">
        <tbody>
            <tr><td></td><td><@i18n.message key="Reports.Metrics.label.externalBytesUploaded" /></td><td><@fs.size value=metrics.value /></td></tr>
        </tbody>
    </table>
</div>