<#ftl strip_whitespace=true>
<#-- @ftlvariable name="" type="com.jscape.inet.mft.subsystems.web.ui.view.DashboardPageResource" -->

<#import "/WEB-INF/template/decorator.ftl" as decorator/>
<#import "/WEB-INF/template/macro.ftl" as m />

<@m.csp_nonce; csp_nonce_attr>
<#assign resources=["/app.js", "/ui.js", "/operation.js", "/dashboard.js", "/storage/operation.js", "/storage/storage.js", "/storage/upload.js", "/storage/vfs.js", "/account/lang.js", "/account/operation.js", "/account/settings.js"]/>
<#if model.permission.personalInfoReadingAllowed><#assign resources=resources + ["/account/personal-info.js"] /></#if>
<#if model.permission.publicKeyReadingAllowed><#assign resources=resources + ["/account/ssh-keys.js"] /></#if>
<#if model.permission.openPgpKeyReadingAllowed><#assign resources=resources + ["/account/pgp-keys.js"] /></#if>
<#if model.permission.quotasReadingAllowed><#assign resources=resources + ["/account/quotas.js"] /></#if>
<#if model.permission.contactsReadingAllowed><#assign resources=resources + ["/account/contacts.js"] /></#if>
<#if model.permission.adHocActivityReadingAllowed><#assign resources=resources + ["/account/adhoc-transfers.js"] /></#if>
<#if model.permission.dropZoneReadingAllowed><#assign resources=resources + ["/account/dropzones.js"] /></#if>
<#if model.permission.usersControlAllowed><#assign resources=resources + ["/account/users.js"] /></#if>
<#if model.permission.urlBrandingControlAllowed><#assign resources=resources + ["/account/url-branding.js"] /></#if>
<#if model.permission.domainAdministrationAllowed><#assign resources=resources + ["/account/administration.js","/account/vfs.js"] /></#if>
<@decorator.script sources=resources />

<#if model.permission.fileViewingAllowed>
    <script type="text/javascript" src="/assets/docviewer/js/jquery.extensions.min.js"${csp_nonce_attr}></script>
    <!--[if gte IE 10 | !IE ]><!-->
    <script type="text/javascript" src="/assets/docviewer/js/three.min.js"${csp_nonce_attr}></script>
    <!--<![endif]-->
    <script type="text/javascript" src="/assets/docviewer/js/flowpaper.js"${csp_nonce_attr}></script>
    <script type="text/javascript" src="/assets/docviewer/js/FlowPaperViewer.js"${csp_nonce_attr}></script>
    <script type="text/javascript" src="/assets/docviewer/js/pdf.min.js"${csp_nonce_attr}></script>
    <script type="text/javascript" src="/assets/docviewer/js/pdf.worker.min.js"${csp_nonce_attr}></script>
</#if>

<script type="text/javascript"${csp_nonce_attr}>
    $.parser.auto = false;
    window.R = {
        string: $.extend({contains: function (key) { return this.hasOwnProperty(key); }},
        <#include "i18n-js.ftl" />,
        <#include "storage/i18n-js.ftl" />,
        <#include "account/i18n-js.ftl" />
        )
    };

    <#include "i18n-easyui.ftl" />
    (function (fb) {
        fb.labels.FIELD = '${i18n.text("Application.findbar.label.field")?js_string}';
        fb.labels.DATE_START = '${i18n.text("Application.findbar.label.dateStart")?js_string}';
        fb.labels.DATE_END = '${i18n.text("Application.findbar.label.dateEnd")?js_string}';
        fb.labels.MATCH_CASE = '${i18n.text("Application.findbar.label.matchCase")?js_string}';
        fb.labels.REGEXP_LOCAL = '${i18n.text("Application.findbar.label.regexpLocal")?js_string}';
        fb.labels.REGEXP_REMOTE = '${i18n.text("Application.findbar.label.regexpRemote")?js_string}';
        fb.tooltips.REGEXP_REMOTE = '${i18n.text("Application.findbar.title.regexpRemote")?js_string}';
    })(jQuery.fn.findbar.defaults);

    $(function () {
        window.jscape = window.jscape || {};
        window.jscape.API = $.extend(
                new jscape.StorageManagementService({timeout: ${model.connectionTimeout?c}}),
                <#if model.permission.accountControlAllowed>new jscape.AccountManagementService(),</#if>
                <#if model.passwordAboutToExpire
                    || model.permission.quotasReadingAllowed
                    || model.permission.domainAdministrationAllowed>{
                    getUsername: function () {
                        return this._request("GET", "/account/personal-info").matrix({username: true}).options({global: false}).send()
                                .then(function (data) { return data ? data.username : ""; }, function () { return ""; });
                    }
                },
                </#if>
                {<#if model.passwordAboutToExpire>
                    changeUserPassword: function (username, oldPassword, newPassword) {
                        return this._request("POST", "/accounts/{account}/changepassword").uri({account: username}).send({oldPassword: oldPassword, newPassword: newPassword});
                    },
                    testPasswordCompliance: function (username, password) {
                        return this._request("POST", "/compliance/test-pwd").sendSync({account: username, password: password});
                    }
                </#if>}
        );

        var app = new jscape.dashboard.DashboardApplication();
        app.register("user-file-storage", new jscape.storage.FileTransferModule("${(model.currentDirectory!'')?js_string}",
                                                                                ${model.navigateToPath?string},
                                                                                ${model.fileUploadMetadataRequired?string},
                                                                                {allowed: ${model.permission.fileSearchingAllowed?string}, category: "${model.defaultSearchCategory!''}"},
                                                                                ${model.permission.contactsControlAllowed?string},
                                                                                ${model.permission.fileViewingAllowed?string}<#if model.permission.fileViewingAllowed>,{src: "/dashboard/storage/viewer", nonce: "${m.csp_nonce_value()}"}</#if>));
        app.register("user-file-shares", new jscape.storage.FileSharesModule("${(model.fileShareId!'')?html?js_string}"));
        <#if model.permission.personalInfoReadingAllowed>app.register("user-settings", new jscape.account.PersonalInfoModule(new jscape.themes.WebThemeLoader("${(model.themeUriPattern!'')?js_string}", "${(model.themeName!'')?js_string}")));</#if>
        <#if model.permission.publicKeyReadingAllowed>app.register("account-public-key-auth", new jscape.account.PublicKeyAuthenticationModule());</#if>
        <#if model.permission.openPgpKeyReadingAllowed>app.register("account-pgp-encryption", new jscape.account.OpenPgpKeyEncryptionModule());</#if>
        <#if model.permission.quotasReadingAllowed>app.register("account-quotas", new jscape.account.QuotasModule());</#if>
        <#if model.permission.contactsReadingAllowed>app.register("account-contacts", new jscape.account.ContactsModule());</#if>
        <#if model.permission.adHocActivityReadingAllowed>app.register("account-adhoc-transfers", new jscape.account.AdHocActivityModule());</#if>
        <#if model.permission.dropZoneReadingAllowed>app.register("account-dropzones", new jscape.account.DropZonesInfoModule());</#if>
        <#if model.permission.domainAdministrationAllowed>app.register("account-domain-admin", new jscape.account.DomainAdministrationModule(${model.permission.usersControlAllowed?string}, ${model.permission.urlBrandingControlAllowed?string}, ${model.permission.dropZoneControlAllowed?string}));</#if>
        <#if model.passwordAboutToExpire>app.register("password-compliance", new jscape.dashboard.PasswordComplianceModule(), true);</#if>
        <#if model.autoLogoutTimeout??>app.register("account-inactivity", new jscape.InactivityServiceModule(${model.autoLogoutTimeout.value?c},${model.autoLogoutTimeout.cancelTimeout?c}), true);</#if>
        app.start();
    });
</script>
</@m.csp_nonce>