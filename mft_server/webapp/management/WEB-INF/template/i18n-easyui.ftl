<@compress single_line=true>
(function($) {
    $.fn.datebox.defaults.closeText='${i18n.text("Dialog.button.close")?js_string?html}';
    $.fn.datebox.defaults.okText='${i18n.text("Dialog.button.ok")?js_string?html}';
    $.fn.timepicker.defaults.closeText='${i18n.text("Dialog.button.close")?js_string?html}';
    $.fn.timepicker.defaults.okText='${i18n.text("Dialog.button.ok")?js_string?html}';
    $.messager.defaults.ok='${i18n.text("Dialog.button.ok")?js_string?html}';
    $.messager.defaults.cancel='${i18n.text("Dialog.button.cancel")?js_string?html}';
})(jQuery);
</@compress>