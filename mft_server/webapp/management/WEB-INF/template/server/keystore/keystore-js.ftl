<#import "*/macro.ftl" as m/>

<@m.csp_nonce; csp_nonce_attr>
<#assign resources = ["/lang.js", "/crypto-js.js", "/management.js", "/application.js", "/domain/add-domain.js", "/keystore/keymanager.js"]>
<#if permissions.serverKeysAllowed><#assign resources=resources + ["/keystore/server-keys.js"] /></#if>
<#if permissions.hostKeysAllowed><#assign resources=resources + ["/keystore/host-keys.js"] /></#if>
<#if permissions.clientKeysAllowed><#assign resources=resources + ["/keystore/client-keys.js"] /></#if>
<#if permissions.pgpKeysAllowed><#assign resources=resources + ["/keystore/pgp-keys.js"] /></#if>
<#if permissions.licenseControlAllowed><#assign resources=resources + ["/server/license.js"] /></#if>
<@html.script sources=resources />


<script type="text/javascript"${csp_nonce_attr}>
    $.parser.auto = false;
    window.R = {
        string: $.extend({contains: function (key) { return this.hasOwnProperty(key); }},
        <#include "/WEB-INF/template/dialog-js.ftl" />,
        <#include "/WEB-INF/template/server/errors-js.ftl" />,
        <#include "i18n-js.ftl" />)
    };
    <#include "/WEB-INF/template/i18n-easyui.ftl" />
    <#include "/WEB-INF/template/i18n-findbar.ftl" />
    $(function () {
        window.jscape = window.jscape || {};
        jscape.API = new jscape.management.ManagementService();
        var app = new jscape.keystore.KeystoreApplication();
        <#if permissions.serverKeysAllowed>app.register('server-keys', new jscape.keystore.ServerKeysModule());</#if>
        <#if permissions.hostKeysAllowed>app.register('host-keys', new jscape.keystore.HostKeysModule());</#if>
        <#if permissions.clientKeysAllowed>app.register('client-keys', new jscape.keystore.ClientKeysModule());</#if>
        <#if permissions.pgpKeysAllowed>app.register('pgp-keys', new jscape.keystore.PgpKeysModule());</#if>
        app.register('keys-report', new jscape.keystore.KeysReportModule());
        <#if permissions.licenseControlAllowed>app.register('server-license', new jscape.server.LicenseModule(), true);</#if>
        app.register('domains-create', new jscape.domain.CreateDomainModule(), true);
        app.start();
    });
</script>
</@m.csp_nonce>