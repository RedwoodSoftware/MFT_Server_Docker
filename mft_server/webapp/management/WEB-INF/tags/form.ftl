<#ftl strip_whitespace=true>
<#assign nextId=0 />

<#macro fields name title="" description="" disabled=false attrs...><fieldset name="${name?html}"<#if disabled> disabled="disabled"</#if><@_attributes?with_args(attrs) />><@fields_title title, description/><#nested /></fieldset></#macro>
<#macro fields_title title description=""><#if description?length != 0><h6>${title}<span>${description}</span></h6><#elseif title?length != 0><legend>${title}</legend></#if></#macro>
<#macro dialog id attrs...>
<div id="${id?html}" role="dialog" class="dialog"<@_attributes?with_args(attrs) excludes=["header","description"]/>>
    <#local header=(attrs["header"])!'' description=(attrs["description"])!'' />
    <#if (header?has_content || description?has_content)>
        <div class="content">
            <div data-options="region:'north',border:false"><h6><#if header?has_content>${header}</#if><#if description?has_content><span>${description}</span></#if></h6></div>
            <div data-options="region:'center',border:false" class="dialog-frame"><#nested /></div>
        </div>
    <#else>
        <#nested />
    </#if>
</div>
</#macro>
<#macro button name disabled=false attrs...><a role="button" name="${name?html}" tabindex="0"<#if disabled> data-options="disabled:true"</#if><@_attributes?with_args(attrs) />><#nested /></a></#macro>
<#macro label for="" required=false attrs...><#local body><#nested /></#local><#if body?has_content><label<#if for?has_content> for="${for?html}"</#if><@_attributes?with_args(attrs) excludes=["for","required"] />>${body}<#if required?string == "true"><em>*</em></#if></label></#if></#macro>

<#macro checkbox name example="" attrs...>
    <#local is_checked=(attrs["checked"]!false)?string?matches("(true|checked)", "i") />
    <@label required=attrs["required"]>
        <@_description?with_args(attrs) example=example; described_by><input type="checkbox" name="${name?html}"<#if is_checked> checked="checked"</#if><#if described_by?has_content> aria-describedby="${described_by?html}"</#if><@_attributes?with_args(attrs) excludes=["type","required","checked","description","example"] />/><#nested /></@_description>
    </@label>
</#macro>

<#macro radio name example="" labelStyle="" attrs...>
    <#local is_checked=(attrs["checked"]!false)?string?matches("(true|checked)", "i") />
    <@label?with_args({"required": (attrs["required"])!false, "style": labelStyle!''})>
        <@_description?with_args(attrs) example=example; described_by><input type="radio" name="${name?html}"<#if is_checked> checked="checked"</#if><#if described_by?has_content> aria-describedby="${described_by?html}"</#if><@_attributes?with_args(attrs) excludes=["type","required","checked","description","example"] />/><#nested /></@_description>
    </@label>
</#macro>

<#macro input name example="" attrs...>
    <#local id=attrs["id"]!_nextId()/>
    <@label for=id required=attrs["required"]><#nested /></@label>
    <@_description?with_args(attrs) example=example; described_by><input type="${(attrs["type"]!"text")?html}" name="${name?html}" id="${id}"<#if described_by?has_content> aria-describedby="${described_by?html}"</#if><@_attributes?with_args(attrs) excludes=["id","type","required","description","example"] />/></@_description>
</#macro>

<#macro select name items example="" attrs...>
    <#local id=attrs["id"]!_nextId()/>
    <#local body><#nested /></#local>
    <#local options><#if items?is_hash_ex><#list items?keys as key><#local item=items[key] /><#if item?is_hash_ex><option value="${(item.value!key)?html}"<@_attributes?with_args(attrs + {'disabled':item.disabled!false,'title':item.title!''}) />>${item.text!key}</option><#else><option value="${key?html}">${item}</option></#if></#list><#else><#list items as item><option value="${item?html}">${item}</option></#list></#if></#local>
    <#if body?has_content><@label for=id required=attrs["required"]>${body}</@label></#if>
    <@_description?with_args(attrs) example=example; described_by><select name="${name?html}" id="${id}"<#if described_by?has_content> aria-describedby="${described_by?html}"</#if><@_attributes?with_args(attrs) excludes=["id","required","description","example"] />>${options}</select></@_description>
</#macro>

<#macro dn name required=true maxlength=255 size="" example="" attrs...>
    <#local id=attrs["id"]!_nextId() />
    <@label for=id required=required><#nested /></@label>
    <@_description?with_args(attrs) example=example; described_by><input type="text" name="${name?html}" id="${id}"<#if described_by?has_content> aria-describedby="${described_by?html}"</#if><@_attributes?with_args(attrs + {'maxlength': maxlength, 'size': size}) excludes=["id","type","description","example"] />/></@_description>
</#macro>

<#macro username name required=false maxlength=50 size="" example="" attrs...>
    <#local id=attrs["id"]!_nextId() />
    <@label for=id required=required><#nested /></@label>
    <@_description?with_args(attrs) example=example; described_by><input type="text" name="${name?html}" id="${id}"<#if described_by?has_content> aria-describedby="${described_by?html}"</#if><@_attributes?with_args(attrs + {'maxlength': maxlength, 'size': (size!)}) excludes=["id","type","description","example"] />/></@_description>
</#macro>

<#macro password name maxlength=255 required=false size="" example="" attrs...>
    <#local id=attrs["id"]!_nextId()/>
    <@label for=id required=required><#nested /></@label>
    <@_description?with_args(attrs) example=example; described_by><input type="password" name="${name?html}" id="${id}" autocomplete="off"<#if described_by?has_content> aria-describedby="${described_by?html}"</#if><@_attributes?with_args(attrs + {'maxlength': maxlength, 'size': (size!)}) excludes=["id","type","autocomplete","description","example"] />/></@_description>
</#macro>

<#macro url name maxlength=2048 required=false size="" example="" attrs...>
    <#local id=attrs["id"]!_nextId() />
    <@label for=id required=required><#nested /></@label>
    <@_description?with_args(attrs) example=example; described_by><input type="url" name="${name?html}" id="${id}"<#if described_by?has_content> aria-describedby="${described_by?html}"</#if><@_attributes?with_args(attrs + {'maxlength': maxlength, 'size': (size!)}) excludes=["id","type","description","example"] />/></@_description>
</#macro>

<#macro path name maxlength=2048 required=false size="" example="" attrs...>
    <#local id=attrs["id"]!_nextId() />
    <@label for=id required=required><#nested /></@label>
    <@_description?with_args(attrs) example=example; described_by><input type="text" name="${name?html}" id="${id}"<#if described_by?has_content> aria-describedby="${described_by?html}"</#if><@_attributes?with_args(attrs + {'maxlength': maxlength, 'size': (size!)}) excludes=["id","type","description","example"] />/></@_description>
</#macro>

<#macro host name maxlength=255 required=false size="" example="" attrs...>
    <#local id=attrs["id"]!_nextId() />
    <@label for=id required=required><#nested /></@label>
    <@_description?with_args(attrs) example=example; described_by><input type="text" name="${name?html}" id="${id}"<#if described_by?has_content> aria-describedby="${described_by?html}"</#if><@_attributes?with_args(attrs + {'maxlength': maxlength, 'size': (size!)}) excludes=["id","type","description","example"] />/></@_description>
</#macro>

<#macro port name maxlength=5 required=false size="10" example="" attrs...>
    <#local id=attrs["id"]!_nextId() />
    <@label for=id required=required><#nested /></@label>
    <@_description?with_args(attrs) example=example; described_by><input type="text" <#--type="number" -->name="${name?html}" id="${id}" min="0" max="65535"<#if described_by?has_content> aria-describedby="${described_by?html}"</#if><@_attributes?with_args(attrs + {'maxlength': maxlength, 'size': (size!)}) excludes=["id","type","min","max","description","example"] />/></@_description>
</#macro>

<#macro email name maxlength=255 required=false size="" example="" attrs...>
    <#local id=attrs["id"]!_nextId() />
    <@label for=id required=required><#nested /></@label>
    <@_description?with_args(attrs) example=example; described_by><input type="text" <#--type="email" -->name="${name?html}" id="${id}"<#if described_by?has_content> aria-describedby="${described_by?html}"</#if><@_attributes?with_args(attrs + {'maxlength': maxlength, 'size': (size!)}) excludes=["id","type","description","example"] />/></@_description>
</#macro>

<#macro number name maxlength=19 required=false size="" example="" attrs...>
    <#local id=attrs["id"]!_nextId() />
    <@label for=id required=required><#nested /></@label>
    <@_description?with_args(attrs) example=example; described_by><input type="text" <#--type="number" -->name="${name?html}" id="${id}"<#if described_by?has_content> aria-describedby="${described_by?html}"</#if><@_attributes?with_args(attrs + {'maxlength': maxlength, 'size': (size!)}) excludes=["id","type","description","example"] />/></@_description>
</#macro>

<#macro text name maxlength=4096 required=false size="" example="" attrs...>
    <#local id=attrs["id"]!_nextId() />
    <@label for=id required=required><#nested /></@label>
    <@_description?with_args(attrs) example=example; described_by><input type="text" name="${name?html}" id="${id}"<#if described_by?has_content> aria-describedby="${described_by?html}"</#if><@_attributes?with_args(attrs + {'maxlength': maxlength, 'size': (size!)}) excludes=["id","type","description","example"] />/></@_description>
</#macro>

<#macro memo name example="" attrs...>
    <#local id=attrs["id"]!_nextId() />
    <@label for=id required=attrs["required"]><#nested /></@label>
    <@_description?with_args(attrs) example=example; described_by><textarea name="${name?html}" id="${id}"<#if described_by?has_content> aria-describedby="${described_by?html}"</#if><@_attributes?with_args(attrs) excludes=["id","required","description","example","value"] />>${attrs["value"]!""}</textarea></@_description>
</#macro>

<#macro datagrid name columns=[] height="310px" attrs...>
    <#if height?has_content><div style="height:${height?html}"></#if>
    <table role="grid" aria-label="${name?html}"<@_attributes?with_args(attrs)/>><#if columns?size != 0><thead><tr><#list columns as column><th><#nested column/></th></#list></tr></thead></#if></table>
    <#if height?has_content></div></#if>
</#macro>

<#macro datalist name items attrs...>
    <#if items?size != 0>
    <ul role="listbox" aria-label="${name?html}" style="height:310px;"<@_attributes?with_args(attrs) excludes=["name"]/>>
        <#if items?is_hash_ex><#list items?keys as key><li value="${items[key]?html}">${key}</li></#list>
        <#else><#list items as item><li value="${item?html}">${item}</li></#list>
        </#if>
    </ul>
    <#else><div role="listbox" aria-label="${name?html}" style="height:310px;"<@_attributes?with_args(attrs) excludes=["name"]/>></div></#if>
</#macro>


<#macro _description example="" attrs...>
    <#local text=attrs["description"]!'' />
    <#local is_described_by=(attrs["ariaDescribedby"]!'')?has_content />
    <#if is_described_by><#local id=_nextId() + "-inf" /><#nested id />&nbsp;<span id="${id?html}" class="info" role="tooltip" aria-labelledby="${attrs["ariaDescribedby"]?html}"></span>
    <#elseif text?has_content><#local id=(attrs["ariaDescribedby"]!_nextId()) + "-inf" />
        <#nested id />&nbsp;
        <#if example?has_content>
            <#local description_id=_nextId() + "-dsc"/>
            <span id="${id?html}" class="info" role="tooltip" aria-describedby="${description_id?html}"></span>
            <div id="${description_id?html}" class="hidden">
                <div class="info-container">
                    <div class="info-content">${text?html}</div>
                    <div class="info-example"><b>Example:</b>&nbsp;${example?html}</div>
                </div>
            </div>
        <#else><span id="${id?html}" class="info" role="tooltip" title="${text?html}"></span>
        </#if>
    <#else><#nested />
    </#if>
</#macro>
<#macro _attributes excludes=[] items...><#list items as key, val><#if !excludes?seq_contains(key) && val?has_content><#if key=="readonly"><#local is_readonly=(val!false)?string?matches("(true|readonly)", "i") /><#if is_readonly> readonly="readonly"</#if><#elseif key=="disabled"><#local is_disabled=(val!false)?string?matches("(true|disabled)", "i") /><#if is_disabled> disabled="disabled"</#if><#else> ${key?replace("([a-z])([A-Z])", "$1-$2", "r")?lower_case}="<#if val?is_number>${val?c}<#else>${val?string?html}</#if>"</#if></#if></#list></#macro>
<#function _nextId><#local id=nextId + 1 /><#assign nextId=id /><#return "_${id?c}" /></#function>
