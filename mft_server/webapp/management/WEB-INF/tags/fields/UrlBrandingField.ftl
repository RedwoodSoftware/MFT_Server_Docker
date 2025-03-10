<#ftl strip_whitespace=true>
<#import "/WEB-INF/tags/fields/macro.ftl" as m />
<@compress single_line=true>
<#-- @ftlvariable name="property" type="com.jscape.util.reflection.PropertyDescriptor" -->
<#-- @ftlvariable name="description" type="java.lang.String" -->
<#-- @ftlvariable name="example" type="java.lang.String" -->
<#assign fieldId=property.propertyName?lower_case?html />
<#assign helpId="${fieldId}-help" />

<div>
    <label><input type="checkbox" name="use${fieldId}"/>URL Branding<#if property.required><em>*</em></#if></label>
    <select
            id="${fieldId}"
            name="${fieldId}"
            data-options="editable:false,width:250"
            aria-describedby="${helpId}"
            <#if property.required> required="required"</#if>
            ></select>
    <#if property.postLabel?has_content>&nbsp;${property.postLabel}</#if>
    <@m.field_help id=helpId title=property.label description=description example=example />
</div>
</@compress>