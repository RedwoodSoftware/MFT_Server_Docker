<#ftl strip_whitespace=true>
<#import "/WEB-INF/tags/fields/macro.ftl" as m />
<@compress single_line=true>
<#-- @ftlvariable name="property" type="com.jscape.util.reflection.PropertyDescriptor" -->
<#-- @ftlvariable name="description" type="java.lang.String" -->
<#-- @ftlvariable name="example" type="java.lang.String" -->
<#assign fieldId=property.propertyName?lower_case?html />
<#assign helpId="${fieldId}-help" />

<div class="radio">
    <label><input type="radio" name="disableuser" value="concrete">User<#if property.required><em>*</em></#if></label>&nbsp;
    <select
            id="${fieldId}"
            name="${fieldId}"
            aria-describedby="${helpId}"
            <#if property.required> required="required"</#if>
            ></select>
    <@m.field_help id=helpId title=property.label description=description example=example />
</div>
<div class="radio">
    <label><input type="radio" name="disableuser" value="current" checked="checked">Disable users triggering this event</label>
</div>
</@compress>