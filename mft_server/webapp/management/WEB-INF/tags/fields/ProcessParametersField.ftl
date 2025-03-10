<#ftl strip_whitespace=true>
<#import "/WEB-INF/tags/fields/macro.ftl" as m />
<@compress single_line=true>
<#-- @ftlvariable name="property" type="com.jscape.util.reflection.PropertyDescriptor" -->
<#-- @ftlvariable name="field" type="com.jscape.util.reflection.types.PropertySheet" -->
<#-- @ftlvariable name="description" type="java.lang.String" -->
<#-- @ftlvariable name="example" type="java.lang.String" -->
<#assign fieldId=property.propertyName?lower_case?html />
<#assign helpId="${fieldId}-help" />

<div>
    <label for="${fieldId}">${property.label}<#if property.required><em>*</em></#if></label>
    <@m.field_help id=helpId title=property.label description=description example=example />
</div>
<div>
    <table role="grid"
           id="${fieldId}"
           aria-label="${fieldId}"
           aria-describedby="${helpId}"
           data-options="emptyMsg:'Empty parameters list'">
        <thead><tr><th>Variable</th><th>Description</th><th>Value</th></tr></thead>
        <#if field.defaultValue?has_content>
        <tbody>
            <#list field.defaultValue as name, value>
                <tr><td>${name?html}</td><td></td><td>${value!""?html}</td></tr>
            </#list>
        </tbody>
        </#if>
    </table>
</div>
</@compress>