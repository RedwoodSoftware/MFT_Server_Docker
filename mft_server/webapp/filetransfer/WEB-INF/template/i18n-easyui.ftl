<@compress single_line=true>
(function($) {
    $.fn.panel.defaults.loadingMessage = '${i18n.text("Application.Message.loading")?js_string?html}';
    $.fn.pagination.defaults.displayMsg = '${i18n.text("Application.pagination.message", ["{from}", "{to}", "{total}"])?js_string?html}';
    $.fn.pagination.defaults.beforePageText = '${i18n.text("Application.pagination.beforePageText")?js_string?html}';
    $.fn.pagination.defaults.afterPageText = '${i18n.text("Application.pagination.afterPageText", ["{pages}"])?js_string?html}';
    $.fn.datagrid.defaults.loadMsg = '${i18n.text("Application.datagrid.loading")?js_string?html}';
    <#--$.fn.datagrid.defaults.emptyMsg = '${i18n.text("Application.datagrid.empty")?js_string?html}';-->
    $.fn.propertygrid.defaults.columns[0][0].title = '${i18n.text("Application.propertygrid.column.name")?js_string?html}';
    $.fn.propertygrid.defaults.columns[0][1].title = '${i18n.text("Application.propertygrid.column.value")?js_string?html}';
    $.fn.filebox.defaults.buttonText = '${i18n.text("Application.button.chooseFile")?js_string?html}';
    $.fn.datebox.defaults.currentText = '${i18n.text("Application.calendar.today")?js_string?html}';
    $.fn.datebox.defaults.closeText = '${i18n.text("Application.button.close")?js_string?html}';
    $.fn.datebox.defaults.okText = '${i18n.text("Application.button.ok")?js_string?html}';
    $.fn.timepicker.defaults.closeText = '${i18n.text("Application.button.close")?js_string?html}';
    $.fn.timepicker.defaults.okText = '${i18n.text("Application.button.ok")?js_string?html}';
    $.fn.validatebox.defaults.rules.url.message = '${i18n.text("Application.validation.invalidUrl")?js_string?html}';
    $.fn.validatebox.defaults.rules.email.message = '${i18n.text("Application.validation.invalidEmail")?js_string?html}';
    $.fn.validatebox.defaults.rules.length.message = '${i18n.text("Application.validation.invalidRange")?js_string?html}';
    $.fn.validatebox.defaults.rules.remote.message = '${i18n.text("Application.validation.invalidFieldRemote")?js_string?html}';
    $.fn.validatebox.defaults.missingMessage = '${i18n.text("Application.validation.fieldRequired")?js_string?html}';
    $.fn.textbox.defaults.missingMessage = '${i18n.text("Application.validation.fieldRequired")?js_string?html}';
    $.fn.filebox.defaults.missingMessage = '${i18n.text("Application.validation.fieldRequired")?js_string?html}';
    $.fn.switchbutton.defaults.onText = '${i18n.text("Application.button.on")?js_string?html}';
    $.fn.switchbutton.defaults.offText = '${i18n.text("Application.button.off")?js_string?html}';
    $.fn.calendar.defaults.weeks = [<#list i18n.text("Application.calendar.weekDays")?split("[,_-]","r") as entry>'${entry?trim?js_string?html}'<#if entry_has_next>,</#if></#list>];
    $.fn.calendar.defaults.months = [<#list i18n.text("Application.calendar.monthsShort")?split("[,_-]","r") as entry>'${entry?trim?js_string?html}'<#if entry_has_next>,</#if></#list>];
    $.messager.defaults.ok = '${i18n.text("Application.button.ok")?js_string?html}';
    $.messager.defaults.cancel = '${i18n.text("Application.button.cancel")?js_string?html}';
})(jQuery);
</@compress>