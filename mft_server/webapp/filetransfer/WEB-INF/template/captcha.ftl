<#import "macro.ftl" as m />

<#macro image challenge inputName challengeName>
    <#local challengeValue=challenge!'' />

    <#if challengeValue?has_content>
        <div id="captcha">
            <div id="captcha-img"><img src="${"/captcha/api/image?c=" + challengeValue?url}" width="310" height="60" alt="${i18n.text("Label.CAPTCHA_IMAGE")?html}"/></div>
            <div id="captcha-input">
            <@form.input name="${inputName?html}" required=true maxlength="15" class="easyui-textbox" dataOptions="width:220,height:32" autocomplete="off"><@i18n.message key="Label.CAPTCHA" /></@>
                <a id="captcha-reload-btn" class="button" role="button" href="#" title="${i18n.text("Label.CAPTCHA_RELOAD")?html}" tabindex="-1"><span><@i18n.message key="Label.CAPTCHA_RELOAD" /></span></a>
                <input type="hidden" name="${challengeName?html}" value="${challengeValue?html}" />
            </div>
            <@m.csp_nonce ; csp_nonce_attr>
            <script type="text/javascript"${csp_nonce_attr}>
                (function () {
                    function $(a) {return typeof a == "string" ? document.getElementById(a) : a;}

                    var b = $('captcha-reload-btn'), c = $('captcha-img').getElementsByTagName('img')[0], re = /([?&])_=[^&]*/, rq = /\?/, r = function () {
                        var t = "_=" + (new Date().getTime()), s = c.src;
                        c.src = re.test(s) ? s.replace(re, "$1" + t) : s + (rq.test(s) ? "&" : "?") + t;
                    };
                    b.onclick = function () {
                        r();
                        return false;
                    };
                    b.onkeypress=function(){};
                })();
            </script>
            </@m.csp_nonce>
        </div>
    </#if>
</#macro>