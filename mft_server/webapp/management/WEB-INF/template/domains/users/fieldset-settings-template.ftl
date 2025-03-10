<fieldset>
    <legend><@i18n.message "UserInfo.legend.settings" /></legend>

    <div class="checkbox"><@form.checkbox name="enabled"><@i18n.message "UserInfo.label.enabled" /></@></div>
    <div class="checkbox">
        <@form.checkbox name="adhocallowed"><@i18n.message "UserInfo.label.allowAdHocTransfers" /></@>&nbsp;
        <@form.button name="adhocsettings"><@i18n.message key="UserInfo.button.settings" /></@>
    </div>
    <div><@form.checkbox name="ownedby"><@i18n.message "UserInfo.label.owner" /></@><select name="owners"></select></div>
    <div><@form.checkbox name="expires"><@i18n.message "UserInfo.label.expires" /></@><input type="text" name="expirationdate"/></div>
    <div>
        <@form.checkbox name="expiresafter"><@i18n.message "UserInfo.label.expiresAfter" /></@>
        <span><@form.number name="expiresafterperiod" /></span>&nbsp;
        <span><@form.select name="expiresafterunit" items={
            "${(60 * 1000)?c}": i18n.text("Application.period.minute"),
            "${(60 * 60 * 1000)?c}": i18n.text("Application.period.hour"),
            "${(24 * 60 * 60 * 1000)?c}": i18n.text("Application.period.day")
        } /></span>
    </div>
</fieldset>