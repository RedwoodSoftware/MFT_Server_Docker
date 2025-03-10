<@form.dialog id="d-sessions-close" title=i18n.text("Sessions.CloseDialog.title")>
    <@form.fields name="closesessionfields" title=i18n.text("Sessions.CloseDialog.info.short") description=i18n.text("Sessions.CloseDialog.info.long")>
        <div class="radio"><@form.radio name="scope" value="CURRENT_SESSION"><@i18n.message key="Sessions.closeScope.CURRENT_SESSION" /></@></div>
        <div class="radio"><@form.radio name="scope" value="ALL_USER_SESSIONS"><@i18n.message key="Sessions.closeScope.ALL_USER_SESSIONS" /></@></div>
        <div class="radio"><@form.radio name="scope" value="ALL_CLIENT_IP_SESSIONS"><@i18n.message key="Sessions.closeScope.ALL_CLIENT_IP_SESSIONS" /></@></div>
        <div class="radio"><@form.radio name="scope" value="ALL_SERVICE_SESSIONS"><@i18n.message key="Sessions.closeScope.ALL_SERVICE_SESSIONS" /></@></div>
    </@form.fields>
</@form.dialog>