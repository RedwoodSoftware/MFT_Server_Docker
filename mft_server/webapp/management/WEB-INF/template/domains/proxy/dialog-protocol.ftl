<#function network_storage_protocols items={}>
    <#local services = {} />
        <#list items?keys as key>
            <#local entry=items[key] />
            <#if !(entry.allowed)!false>
                <#local services = services + {"${key}": {'text': entry.text, 'disabled': true, 'title': i18n.text("ReverseProxies.ProtocolDialog.error")}} />
            <#else>
                <#local services = services + {"${key}" :{'text': entry.text}} />
            </#if>
        </#list>
    <#return services />
</#function>

<@form.dialog id="d-proxy-add-protocol" title=i18n.text("ReverseProxies.ProtocolDialog.title")>
    <fieldset name="proxyprotocolfileds" class="content">
        <@form.fields_title title=i18n.text("ReverseProxies.ProtocolDialog.info.short") description=i18n.text("ReverseProxies.ProtocolDialog.info.long")/>
       <div><@form.select name="protocol" items=network_storage_protocols({
        'AFTP': {'text': i18n.text("Application.protocol.AFTP"), 'allowed': true},
		'Agent': {'text': i18n.text("Application.protocol.AGENT"), 'allowed': true},
		'AmazonS3': {'text': i18n.text("Application.protocol.AMAZON_S3"), 'allowed': true},
		'S3 Compatible': {'text': i18n.text("Application.protocol.AMAZON_S3_COMPATIBLE"), 'allowed': true},
		'Box': {'text': i18n.text("Application.protocol.BOX"), 'allowed': true},
		'Dropbox': {'text': i18n.text("Application.protocol.DROPBOX"), 'allowed': true},
		'IbmCloud': {'text': i18n.text("Application.protocol.IBM_CLOUD"),  'allowed': true},
		'Google Cloud Storage': {'text': i18n.text("Application.protocol.GOOGLE_CLOUD_STORAGE"), 'allowed': true},
		'Google Drive': {'text': i18n.text("Application.protocol.GOOGLE_DRIVE"), 'allowed': true},
		'Microsoft Azure File Storage': {'text': i18n.text("Application.protocol.MICROSOFT_AZURE_FILE_STORAGE"), 'allowed': true},
		'Microsoft Azure Blob Storage':  {'text': i18n.text("Application.protocol.MICROSOFT_AZURE_BLOB_STORAGE"), 'allowed': true},
		'Microsoft Azure Data Lake': {'text': i18n.text("Application.protocol.MICROSOFT_AZURE_DATA_LAKE"), 'allowed': true},
		'Microsoft Azure Data Lake Gen2': {'text': i18n.text("Application.protocol.MICROSOFT_AZURE_DATA_LAKE_2"), 'allowed': true},
		'Microsoft OneDrive': {'text': i18n.text("Application.protocol.MICROSOFT_ONE_DRIVE"), 'allowed': true},
		'FTP': {'text': i18n.text("Application.protocol.FTP"), 'allowed': (permissions.ftpNetworkStorageAllowed)!false},
		'REST': {'text': i18n.text("Application.protocol.REST_PARTNER"), 'allowed': true},
		'SFTP': {'text': i18n.text("Application.protocol.SFTP"), 'allowed': true},
		'SMB': {'text': i18n.text("Application.protocol.SMB"), 'allowed': true},
		'TFTP': {'text': i18n.text("Application.protocol.TFTP"), 'allowed': (permissions.tftpNetworkStorageAllowed)!false},
		'WebDAV': {'text': i18n.text("Application.protocol.WEBDAV"), 'allowed': (permissions.webDavNetworkStorageAllowed)!false}
        })><@i18n.message key="GlobalServices.label.protocol" /></@>
       </div>
    </fieldset>
</@form.dialog>