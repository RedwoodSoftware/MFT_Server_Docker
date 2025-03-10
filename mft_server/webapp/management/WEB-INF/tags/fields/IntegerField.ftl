<#ftl strip_whitespace=true>
<#import "/WEB-INF/tags/fields/macro.ftl" as m />
<@compress single_line=true>
<#-- @ftlvariable name="property" type="com.jscape.util.reflection.PropertyDescriptor" -->
<#-- @ftlvariable name="field" type="com.jscape.util.reflection.types.IntegerField" -->
<#-- @ftlvariable name="description" type="java.lang.String" -->
<#-- @ftlvariable name="example" type="java.lang.String" -->
<#assign fieldId=property.propertyName?lower_case?html />
<#assign helpId="${fieldId}-help" />

<div>
    <label for="${fieldId}">${property.label}<#if property.required><em>*</em></#if></label>
    <input
        type="text"
        id="${fieldId}"
        name="${fieldId}"
        maxlength="${(field.maxValue?string.computer)?length}"
        data-options="min:${field.minValue?string.computer},max:${field.maxValue?string.computer},increment:${field.stepValue?string.computer}"
        value="${field.defaultValue?string.computer}"
        aria-describedby="${helpId}"
        <#if property.required> required="required"</#if>
    />
    <#if property.postLabel?has_content>&nbsp;${property.postLabel}</#if>
    <@m.field_help id=helpId title=property.label description=description example=example />
</div>
</@compress>