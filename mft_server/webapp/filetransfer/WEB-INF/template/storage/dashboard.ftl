<#ftl strip_whitespace=true>
<#-- @ftlvariable name="" type="com.jscape.inet.mft.subsystems.web.ui.view.storage.DocumentViewerResource" -->

<#import "/WEB-INF/tags/form.ftl" as form/>
<#import "/WEB-INF/tags/message.ftl" as i18n/>


<div id="user-storage-pane">

    <div data-options="region:'north',border:false,minHeight:70,height:'auto'">
        <div id="filetoolbar"><#include "toolbar.ftl" /></div>
    </div>

    <div data-options="region:'center',border:false">
        <@form.datagrid name="filelistinggrid" height="" columns=["name", "path", "size", "date"]; col><@i18n.message key="Storage.column.${col}" /></@>
    </div>

    <#if model.permission.fileSearchingAllowed>
        <div data-options="region:'south',border:false,minHeight:60">
            <div id="tagcloud">
                <h3 style="padding-top:1em;margin-top:0"><@i18n.message key="Storage.TagCloud.title" /></h3>
            </div>
        </div>
    </#if>
</div>
