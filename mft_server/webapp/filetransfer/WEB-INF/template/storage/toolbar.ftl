<#ftl strip_whitespace=true>
<#-- @ftlvariable name="" type="com.jscape.inet.mft.subsystems.web.ui.view.storage.DocumentViewerResource" -->

<#macro button name text shortcut="">
    <#if shortcut??>
        <@form.button name="${name?html}" accesskey="${shortcut?html}">${text}</@>
    <#else>
        <@form.button name="${name?html}">${text}</@>
    </#if>
</#macro>

<#if model.permission.fileSearchingAllowed>
    <div style="text-align: center">
            <input type="text" name="query" title="${i18n.text("Search.label.text")?replace(":\\s*$", "", "rm")?html}" style="margin:0 .7em;padding: 0 .6em;"/><@button name="search" text=i18n.text("Storage.button.search")?html />
            <div id="advancedsearch" style="display:none;line-height: 2.7;padding: 1em 1.7em" title="${i18n.text("Search.advanced.tooltip")?html}">
                <form action="#" method="post" novalidate="novalidate">
                    <fieldset class="panel xx-large">
                        <legend class="hidden-label"><@i18n.message key="Search.advanced.title" /></legend>
                        <div><@form.text name="filecontent" dataOptions="label:'${i18n.text('Search.label.text')?js_string?html}'"/></div>
                        <div><@form.path name="filename" dataOptions="label:'${i18n.text('Search.label.name')?js_string?html}'"/></div>
                        <div><@form.text name="filetag" dataOptions="label:'${i18n.text('Search.label.tag')?js_string?html}'"/></div>
                        <div style="white-space: nowrap"><@form.select name="filesizepredicate" items={
                            'GREATER': i18n.text("Search.predicate.greaterThan")?html,
                            'LESS': i18n.text("Search.predicate.lessThan")?html,
                            'EQUALS': i18n.text("Search.predicate.equals")?html
                        }  style="height:28px"><@i18n.message key="Search.label.size" /></@>&nbsp;
                            <@form.number name="filesize" id="filesize-predicate" ariaLabel="Size value" maxlength="9" style="height:28px"></@>&nbsp;
                            <span id="filesize-predicate-unit" tabindex="-1"><@form.select name="filesizeunit" items={
                                '${1?c}': i18n.text("Search.size.bytes")?html,
                                '${1024?c}': i18n.text("Search.size.KB")?html,
                                '${(1024*1024)?c}': i18n.text("Search.size.MB")?html
                            } style="height:28px" ariaLabel="File size unit"></@form.select>
                            </span>
                        </div>
                        <div style="white-space: nowrap"><@form.select name="filedatepredicate" items={
                            'GREATER': i18n.text("Search.predicate.greaterThan")?html,
                            'LESS': i18n.text("Search.predicate.lessThan")?html,
                            'EQUALS': i18n.text("Search.predicate.equals")?html
                        }  style="height:28px"><@i18n.message key="Search.label.date" /></@>&nbsp;
                            <@form.text name="filedate" id="filedate-predicate" required=true ariaLabel="File date value" style="height:28px"/>
                        </div>
                        <button type="submit" name="advancedsearch"><@i18n.message key="Storage.button.search" /></button>
                    </fieldset>
                </form>
            </div>
    </div>
</#if>

<div style="font-size: 140%; font-weight: bold; margin: 1em 0 0">
    <div id="breadcrumbs"><a class="easyui-linkbutton" data-options="plain:true">/</a></div>
    <div id="searchresultsbar"><@i18n.message key="Storage.Message.searchResults" />&nbsp;<@form.button name="clearsearch"></@></div>
</div>

<div class="viewpane-toolbar" style="margin:0.7em 0">
    <div class="toolbar-selection">
        <@button name="upload" text=i18n.text("Storage.button.upload")?html />
        <#if model.permission.fileTransferTypeControlAllowed>
            <div id="uploadmodemenu">
                <div><@form.radio name="uploadmode" value="ASCII"><@i18n.message key="Storage.label.ascii" /></@></div>
                <div><@form.radio name="uploadmode" value="BINARY" checked=true><@i18n.message key="Storage.label.binary" /></@></div>
            </div>
        </#if>
        <@button name="mkdir" text=i18n.text("Storage.button.newDirectory")?html />
        <@button name="rename" text=i18n.text("Storage.button.rename")?html />
        <@button name="delete" text=i18n.text("Storage.button.delete")?html />
        <@button name="zipdload" text=i18n.text("Storage.button.zipDownload")?html />
        <@button name="cwd" text=i18n.text("Storage.button.changeDirectory")?html />
        <@button name="refresh" text=i18n.text("Storage.button.refresh")?html />
        <#if model.permission.fileViewingAllowed>
            <@button name="view" text=i18n.text("Storage.button.view")?html />
        </#if>
        <#if model.permission.fileSharingAllowed>
            <@button name="sharefile" text=i18n.text("Storage.button.shareFile")?html />
            <div id="sharefilemenu" role="menu">
                <#if model.permission.fileSharingByEmailAllowed><div role="menuitem" data-options="name:'EXTERNAL'"><@i18n.message key="Storage.button.shareFileEmail" /></div></#if>
                <#if model.permission.fileSharingInternallAllowed><div role="menuitem" data-options="name:'INTERNAL'"><@i18n.message key="Storage.button.shareFileInternal" /></div></#if>
                <#if model.permission.fileSharingCopyLinkAllowed><div role="menuitem" data-options="name:'ANONYMOUS'"><@i18n.message key="Storage.button.shareFileLink" /></div></#if>
            </div>
        </#if>
        <#if model.permission.fileTaggingAllowed>
            <@button name="tags" text=i18n.text("Storage.button.manageTags")?html />
        </#if>
    </div>
</div>