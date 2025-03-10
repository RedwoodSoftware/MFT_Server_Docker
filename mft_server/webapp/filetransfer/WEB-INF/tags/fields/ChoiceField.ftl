<#ftl strip_whitespace=true>
<@compress single_line=true>
<#-- @ftlvariable name="property" type="com.jscape.util.reflection.PropertyDescriptor" -->
<#-- @ftlvariable name="field" type="com.jscape.util.reflection.types.ChoiceField" -->
<#assign fieldId=property.propertyName?html />

<#if field.optional!false>
    <div class="row">
        <label><input type="checkbox" name="use${fieldId}"/><#if property.label?has_content>${property.label}<#else>${property.propertyName}</#if><#if property.required><em>*</em></#if></label>
        <select
                id="${fieldId}"
                name="${property.propertyName?html}"
                data-options="editable:false,width:200<#if field.multiple>,multiple:true</#if>"
                <#if property.required> required="required"</#if>
                <#if field.multiple> multiple="multiple"</#if>
                >
            <#list field.variants![] as item><option value="${item?html}">${item}</option></#list>
        </select>
        <#if property.postLabel?has_content>&nbsp;${property.postLabel}</#if>
    </div>
<#else>
    <div>
        <label for="${fieldId}"><#if property.label?has_content>${property.label}<#else>${property.propertyName}</#if><#if property.required><em>*</em></#if></label>
        <select
                id="${fieldId}"
                name="${property.propertyName?html}"
                data-options="editable:true,width:200<#if field.multiple>,multiple:true</#if>"
                <#if property.required> required="required"</#if>
                <#if field.multiple> multiple="multiple"</#if>
                >
            <#list field.variants![] as item><option value="${item?html}">${item}</option></#list>
        </select>
        <#if property.postLabel?has_content>&nbsp;${property.postLabel}</#if>
    </div>
</#if>
</@compress>