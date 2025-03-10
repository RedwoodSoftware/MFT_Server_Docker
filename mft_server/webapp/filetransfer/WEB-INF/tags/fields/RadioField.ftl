<#ftl strip_whitespace=true>
<@compress single_line=true>
<#-- @ftlvariable name="property" type="com.jscape.util.reflection.PropertyDescriptor" -->
<#-- @ftlvariable name="field" type="com.jscape.util.reflection.types.ChoiceField" -->
<#assign fieldId=property.propertyName?html />

<div>
    <dl class="group">
        <dt><label><#if property.label?has_content>${property.label}<#else>${property.propertyName}</#if><#if property.required><em>*</em></#if></label></dt>
        <#list field.variants![] as value>
            <dd><label><input
                    type="radio"
                    name="${property.propertyName?html}"
                    value="${value}"
                    <#if value_index = 0> checked="checked"</#if>
                    />${value}</label>
            </dd>
        </#list>
        <#if property.postLabel?has_content>&nbsp;${property.postLabel}</#if>
    </dl>
</div>
</@compress>