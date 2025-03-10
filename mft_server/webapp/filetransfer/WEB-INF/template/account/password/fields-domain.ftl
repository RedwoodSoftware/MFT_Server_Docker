<#-- @ftlvariable name="" type="com.jscape.inet.mft.subsystems.web.ui.view.account.CredentialsFormTemplateModel" -->
<#if !domainVisible && defaultDomain?has_content><input name="domain" type="hidden" value="${defaultDomain}" /></#if>
<#if domainVisible>
    <#assign selected_domain=(parameters.domain)!(defaultDomain!"")/>
    <#if domainDropdown && domainNames?has_content>
        <div class="row"><@form.select name="domain" class="easyui-combobox" dataOptions="editable:false,width:260,height:32,panelHeight:'auto'" items=domainNames required=true selected=selected_domain><@i18n.message key="Label.DOMAIN" /></@></div>
    <#else>
        <div class="row"><@form.dn name="domain" required=true class="easyui-textbox" dataOptions="width:260,height:32" value=selected_domain><@i18n.message key="Label.DOMAIN" /></@></div>
    </#if>
</#if>