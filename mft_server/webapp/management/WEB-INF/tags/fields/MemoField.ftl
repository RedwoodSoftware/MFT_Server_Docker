<#ftl strip_whitespace=true>
<#import "/WEB-INF/tags/fields/macro.ftl" as m />
<@compress single_line=true>
<#-- @ftlvariable name="property" type="com.jscape.util.reflection.PropertyDescriptor" -->
<#-- @ftlvariable name="field" type="com.jscape.util.reflection.types.MemoField" -->
<#-- @ftlvariable name="description" type="java.lang.String" -->
<#-- @ftlvariable name="example" type="java.lang.String" -->
<#assign fieldId=property.propertyName?lower_case?html />
<#assign helpId="${fieldId}-help" />

<div>
    <label for="${fieldId}">${property.label}<#if property.required><em>*</em></#if></label>
    <textarea
            id="${fieldId}"
            name="${fieldId}"
            aria-describedby="${helpId}"
            rows="4"
            cols="42"
            <#if property.required> required="required"</#if>
            >${field.defaultValue}</textarea>
    <@m.field_help id=helpId title=property.label description=description example=example />
</div>
</@compress>