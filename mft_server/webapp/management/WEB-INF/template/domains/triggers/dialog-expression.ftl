<@form.dialog id="d-triggers-expressiontest" title=i18n.text("Triggers.ExpressionTestDialog.title")>
    <@form.fields name="triggerexpressiontestfields" title=i18n.text("Triggers.ExpressionTestDialog.info.short") description=i18n.text("Triggers.ExpressionTestDialog.info.long")>
        <div><@form.memo name="expression" cols="65" rows="4"><@i18n.message key="Triggers.ExpressionTestDialog.label.expression" /></@></div>
        <fieldset name="expressionparametersfields" class="x-large panel" style="height:300px;overflow:auto"></fieldset>
    </@form.fields>
</@form.dialog>

<@form.dialog id="d-triggers-timexpression" title=i18n.text("Triggers.TimeExpressionDialog.title")>
    <@form.fields name="timeexpressionfields" title=i18n.text("Triggers.TimeExpressionDialog.info.short") description=i18n.text("Triggers.TimeExpressionDialog.info.long")>
        <div><@form.number name="hour" ariaDescribedby="timeexpression-hour-help"><@i18n.message key="Triggers.TimeExpressionDialog.label.hour" /></@></div>
        <div><@form.number name="minute" ariaDescribedby="timeexpression-minute-help"><@i18n.message key="Triggers.TimeExpressionDialog.label.minute" /></@></div>
        <div><@form.number name="dayofweek" ariaDescribedby="timeexpression-dayofweek-help"><@i18n.message key="Triggers.TimeExpressionDialog.label.dayOfWeek" /></@></div>
        <div><@form.number name="dayofmonth" ariaDescribedby="timeexpression-dayofmonth-help"><@i18n.message key="Triggers.TimeExpressionDialog.label.dayOfMonth" /></@></div>
        <div><@form.number name="dayofyear" ariaDescribedby="timeexpression-dayofyear-help"><@i18n.message key="Triggers.TimeExpressionDialog.label.dayOfYear" /></@></div>
        <div><@form.number name="weekofmonth" ariaDescribedby="timeexpression-weekofmonth-help"><@i18n.message key="Triggers.TimeExpressionDialog.label.weekOfMonth" /></@></div>
        <div><@form.number name="weekofyear" ariaDescribedby="timeexpression-weekofyear-help"><@i18n.message key="Triggers.TimeExpressionDialog.label.weekOfYear" /></@></div>
        <div><@form.number name="month" ariaDescribedby="timeexpression-month-help"><@i18n.message key="Triggers.TimeExpressionDialog.label.month" /></@></div>
        <div><@form.number name="year" ariaDescribedby="timeexpression-year-help"><@i18n.message key="Triggers.TimeExpressionDialog.label.year" /></@></div>
    </@form.fields>
</@form.dialog>

<@form.dialog id="d-triggers-constant" title=i18n.text("Triggers.ConstantsDialog.title")>
    <fieldset name="triggerexpressionconstantsfields" class="large">
        <@form.fields_title title=i18n.text("Triggers.ConstantsDialog.info.short")/>
        <dl class="group large">
            <dt class="radio"><@form.radio name="type" value="string"><@i18n.message key="Triggers.ConstantsDialog.label.string" /></@></dt>
            <dd><input type="text" name="string" size="30" maxlength="50" /></dd>
            <dt class="radio"><@form.radio name="type" value="number"><@i18n.message key="Triggers.ConstantsDialog.label.integer" /></@></dt>
            <dd><input type="text" name="number" maxlength="50" /></dd>
            <dt class="radio"><@form.radio name="type" value="boolean"><@i18n.message key="Triggers.ConstantsDialog.label.boolean" /></@></dt>
            <dd><@form.radio name="boolean" value="true" checked="checked"><@i18n.message key="Triggers.ConstantsDialog.label.true" /></@>&nbsp;&nbsp;<@form.radio name="boolean" value="false"><@i18n.message key="Triggers.ConstantsDialog.label.false" /></@></dd>
        </dl>
    </fieldset>
</@form.dialog>