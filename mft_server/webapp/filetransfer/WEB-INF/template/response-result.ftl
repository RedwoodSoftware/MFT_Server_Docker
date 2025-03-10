<#macro response_result result={}>
<#-- @ftlvariable name="result" type="com.jscape.inet.mft.subsystems.web.ui.core.ResponseResult" -->
<#if result?? && result?has_content>
    <div id="messagebar">
        <#local escaped_message_args=[]>
        <#list result.messageArguments as entry>
            <#if entry?is_enumerable>
                <#local merged_arg><#list entry as item>${i18n.text(item)?html}<#if item_has_next>, </#if></#list></#local>
                <#local escaped_message_args=escaped_message_args + [merged_arg] />
            <#else>
                <#local escaped_message_args=escaped_message_args + [entry?html] />
            </#if>
        </#list>
        <#if result.isSuccess()>
            <div class="alertbox">
                <h3>${i18n.text(result.messageKey, escaped_message_args)}</h3>
            </div>
        <#else>
            <div class="alertbox error">
                <h3><@i18n.message key="Error.MESSAGE_TITLE" /></h3>
                <p>${i18n.text(result.messageKey, escaped_message_args)}</p>
            </div>
        </#if>
    </div>
</#if>
</#macro>
