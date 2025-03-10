<#ftl strip_whitespace=true>
<#import "/WEB-INF/tags/fields/macro.ftl" as m />
<@compress single_line=true>
<#-- @ftlvariable name="property" type="com.jscape.util.reflection.PropertyDescriptor" -->
<#-- @ftlvariable name="description" type="java.lang.String" -->
<#-- @ftlvariable name="example" type="java.lang.String" -->
<#assign fieldId=property.propertyName?lower_case?html />
<#assign helpId="${fieldId}-help" />

<div class="checkbox">
    <label>
        <input
                type="checkbox"
                id="${fieldId}"
                name="${fieldId}"
                aria-describedby="${helpId}"
                checked="checked"/>
        ${property.label}
    </label>
    <@m.field_help id=helpId title=property.label description=description example=example />
</div>
</@compress>