<#ftl strip_whitespace=true>
<#import "/WEB-INF/tags/fields/macro.ftl" as m />
<@compress single_line=true>
<#-- @ftlvariable name="property" type="com.jscape.util.reflection.PropertyDescriptor" -->
<#-- @ftlvariable name="field" type="com.jscape.util.reflection.types.PasswordField" -->
<#-- @ftlvariable name="description" type="java.lang.String" -->
<#-- @ftlvariable name="example" type="java.lang.String" -->
<#assign fieldId=property.propertyName?lower_case?html />
<#assign helpId="${fieldId}-help" />

<div>
    <label for="${fieldId}">${property.label}<#if property.required><em>*</em></#if></label>
    <input
            type="password"
            id="${fieldId}"
            name="${fieldId}"
            value="${field.defaultValue}"
            aria-describedby="${helpId}"
            size="40" maxlength="255"
            <#if property.required> required="required"</#if>
            />
    <#if property.postLabel?has_content>&nbsp;${property.postLabel}</#if>
    <@m.field_help id=helpId title=property.label description=description example=example />
</div>
</@compress>