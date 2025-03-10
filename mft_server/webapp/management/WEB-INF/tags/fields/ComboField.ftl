<#ftl strip_whitespace=true>
<#import "/WEB-INF/tags/fields/macro.ftl" as m />
<#import "/WEB-INF/tags/message.ftl" as i18n/>
<@compress single_line=true>
<#-- @ftlvariable name="property" type="com.jscape.util.reflection.PropertyDescriptor" -->
<#-- @ftlvariable name="description" type="java.lang.String" -->
<#-- @ftlvariable name="example" type="java.lang.String" -->
<#assign fieldId=property.propertyName?lower_case?html />
<#assign helpId="${fieldId}-help" />

<div>
    <label for="${fieldId}">${property.label}<#if property.required><em>*</em></#if></label>
    <select
            id="${fieldId}"
            name="${fieldId}"
            data-options="minWidth:'200px',width:'50%'"
            aria-describedby="${helpId}"
            <#if property.required> required="required"</#if>
            ></select>
    <div class="combo-panel">
        <ul>
            <#list field.variants![] as item>
                <li value="${item?html}">${item?html}</li>
            </#list>
        </ul>
        <div class="combo-panel-toolbar">
            <button type="button" class="link-btn select-all" data-toggle-text="Clear selection">Select all</button>
        <#--<button type="button" class="link-btn select-all" data-toggle-text="${i18n.text("Application.button.selectAll")?js_string?html}"><@i18n.message key="Application.button.clearSelection" /></button>-->
        </div>
    </div>
    <#if property.postLabel?has_content>&nbsp;${property.postLabel}</#if>
    <@m.field_help id=helpId title=property.label description=description example=example />
</div>
</@compress>