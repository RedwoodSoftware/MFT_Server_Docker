<#ftl strip_whitespace=true>
<@compress single_line=true>
<#-- @ftlvariable name="property" type="com.jscape.util.reflection.PropertyDescriptor" -->
<#-- @ftlvariable name="field" type="com.jscape.util.reflection.types.MemoField" -->
<#assign fieldId=property.propertyName?html />

<div>
    <label for="${fieldId}"><#if property.label?has_content>${property.label}<#else>${property.propertyName}</#if><#if property.required><em>*</em></#if></label>
    <textarea
            id="${fieldId}"
            name="${property.propertyName?html}"
            rows="4"
            cols="40"
            <#if property.required> required="required"</#if>
            >${field.defaultValue}</textarea>
</div>
</@compress>