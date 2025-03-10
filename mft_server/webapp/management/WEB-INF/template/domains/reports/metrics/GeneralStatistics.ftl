<#ftl strip_whitespace=true>
<#import "/WEB-INF/tags/file.ftl" as fs>
<#-- @ftlvariable name="metrics" type="com.jscape.inet.mft.audit.reporting.metricses.GeneralStatistics" -->


<div title="${i18n.text("Reports.Metrics.title.generalStatistics")}" data-options="collapsed:false">
    <table role="grid" aria-label="general-statistics" class="easyui-propertygrid" data-options="columns:[[{field:'name',width:'50%',sortable:true},{field:'value',width:'50%'}]]" style="height:310px">
        <tbody>
            <tr><td></td><td><@i18n.message key="Reports.Metrics.label.sessions" /></td><td>${metrics.totalSessions}</td></tr>
            <tr><td></td><td><@i18n.message key="Reports.Metrics.label.uniqueIP" /></td><td>${metrics.totalUniqueIps}</td></tr>
            <tr><td></td><td><@i18n.message key="Reports.Metrics.label.uploads" /></td><td>${metrics.totalUploads}</td></tr>
            <tr><td></td><td><@i18n.message key="Reports.Metrics.label.downloads" /></td><td>${metrics.totalDownloads}</td></tr>
            <tr><td></td><td><@i18n.message key="Reports.Metrics.label.bytesUploaded" /></td><td><@fs.size value=metrics.totalBytesUploaded /></td></tr>
            <tr><td></td><td><@i18n.message key="Reports.Metrics.label.bytesDownloaded" /></td><td><@fs.size value=metrics.totalBytesDownloaded /></td></tr>
            <tr><td></td><td><@i18n.message key="Reports.Metrics.label.attachmentsSent" /></td><td>${metrics.totalAttachmentsSent}</td></tr>
            <tr><td></td><td><@i18n.message key="Reports.Metrics.label.attachmentsReceived" /></td><td>${metrics.totalAttachmentsReceived}</td></tr>
            <tr><td></td><td><@i18n.message key="Reports.Metrics.label.attachmentBytesSent" /></td><td><@fs.size value=metrics.totalBytesAttachmentSent /></td></tr>
            <tr><td></td><td><@i18n.message key="Reports.Metrics.label.attachmentBytesReceived" /></td><td><@fs.size value=metrics.totalBytesAttachmentReceived /></td></tr>
            <tr><td></td><td><@i18n.message key="Reports.Metrics.label.externalUploads" /></td><td>${metrics.totalExternalUploads}</td></tr>
            <tr><td></td><td><@i18n.message key="Reports.Metrics.label.externalDownloads" /></td><td>${metrics.totalExternalDownloads}</td></tr>
            <tr><td></td><td><@i18n.message key="Reports.Metrics.label.externalBytesUploaded" /></td><td><@fs.size value=metrics.totalExternalBytesUploaded /></td></tr>
            <tr><td></td><td><@i18n.message key="Reports.Metrics.label.externalBytesDownloaded" /></td><td><@fs.size value=metrics.totalExternalBytesDownloaded /></td></tr>
        </tbody>
    </table>
</div>