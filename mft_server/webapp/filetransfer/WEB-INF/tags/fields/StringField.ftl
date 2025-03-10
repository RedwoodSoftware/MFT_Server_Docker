<#ftl strip_whitespace=true>
<@compress single_line=true>
<#-- @ftlvariable name="property" type="com.jscape.util.reflection.PropertyDescriptor" -->
<#-- @ftlvariable name="field" type="com.jscape.util.reflection.StringField" -->
<#assign fieldId=property.propertyName?html />

<div style="min-width: 50%">
    <label for="${fieldId}"><#if property.label?has_content>${property.label}<#else>${property.propertyName}</#if><#if property.required><em>*</em></#if></label>
    <input
            type="text"
            id="${fieldId}"
            name="${property.propertyName}"
            value="${field.defaultValue}"
            <#if field.pattern??>pattern="${field.pattern}" </#if>
            size="40" maxlength="4096"
            <#if property.required> required="required"</#if>
            />
    <#if property.postLabel?has_content>&nbsp;${property.postLabel}</#if>
</div>
</@compress>