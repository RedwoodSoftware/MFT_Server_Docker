/* Copyright © 2009-2024. Redwood Software Inc. All rights reserved. */
(function($){function contains(target,value){var opts=$.data(target,"combobox").options;var data=$.data(target,"combobox").data;for(var i=0;i<data.length;++i){if(data[i][opts.valueField]===value){return true;}}
return false;}
var selectMethod=$.fn.combobox.methods.select;$.fn.combobox.methods.select=function(jq,value){return jq.each(function(){var opts=$(this).combobox("options");if(opts.multiple){value=value!=null&&typeof value==="object"&&value.hasOwnProperty(opts.valueField)?value[opts.valueField]:value;selectMethod.call($.fn.combobox.methods,$(this),value);}else{if(opts.editable&&!opts.limitToList){$(this).combobox("reset").combobox("setValue",value);}else{value=value!=null&&typeof value==="object"&&value.hasOwnProperty(opts.valueField)?value[opts.valueField]:value;if(contains(this,value)){$(this).combobox("reset");selectMethod.call($.fn.combobox.methods,$(this),value);}}}});};$.fn.combobox.defaults=$.extend({},$.fn.combobox.defaults,{panelMaxHeight:"45%",loadFilter:function(data){if(data&&data.length){if(typeof data[0]==="string"||typeof data[0]==="number"){data=$.map(data,function(value){return{text:value,value:value};});var opts=$(this).combobox("options");if(!!opts.autoSelectFirst){var values=$(this).combobox("getValues");if(values.length==0||!values[0]){data[0]["selected"]=true;}}}}
return data;},onLoadSuccess:function(data){var opts=$(this).combobox("options");if(data.length&&!$(this).combobox("getValue")){var selectedItems=$.grep(data,function(item){return typeof item==="object"&&!!item.selected;});if(selectedItems.length==0&&!!opts.autoSelectFirst){var value=(typeof data[0]==="string"||typeof data[0]==="number")?data[0]:data[0][opts.valueField];$(this).combobox("select",value).combobox("panel").panel("body").css("max-height","16em").panel("resize",{width:"auto",height:"auto"});}}}});$.extend($.fn.combobox.defaults,{autoSelectFirst:true});$.extend($.fn.combobox.methods,{"autocomplete":function(jq,enable){var opts=jq.combobox("options");var comboOpts=jq.combo("options");var boxOpts=jq.combobox("textbox").validatebox("options");if(enable===false){comboOpts.editable=opts.oldOptions.editable;opts.filter=opts.oldOptions.filter;opts.onLoadSuccess=opts.oldOptions.onLoadSuccess;boxOpts.validType=opts.oldOptions.validType;boxOpts.validParams=opts.oldOptions.validParams;opts.oldOptions=null;jq.combobox("readonly",false);jq.combobox("textbox").off(".autocomplete");}else{opts.oldOptions={editable:opts.editable,filter:opts.filter,onLoadSuccess:opts.onLoadSuccess,validType:boxOpts.validType,validParams:boxOpts.validParams};comboOpts.editable=true;jq.combobox("readonly",false);jq.combobox("textbox").on("focus.autocomplete",function(){$(this).select();});opts.filter=function(query,row){var value=row[$(this).combobox("options").textField];return value.toLowerCase().indexOf(query.toLowerCase())!=-1;};var onLoadSuccess=opts.onLoadSuccess;opts.onLoadSuccess=function(data){var t=$(this);var textField=t.combobox("options").textField;t.combobox("textbox").validatebox("options").validParams=$.map(data,function(row){return typeof row==="object"?row[textField]:row;});t.combobox("getValue")&&t.combobox("isValid");onLoadSuccess&&onLoadSuccess.apply(this,arguments);};boxOpts.validParams=$.map(jq.combobox("getData"),function(row){return row[opts.textField];});boxOpts.validType=$.isArray(boxOpts.validType)?["in_array"].concat(boxOpts.validType):(typeof boxOpts.validType==="string"?[boxOpts.validType,"in_array"]:"in_array");}
return jq;}});})(jQuery);(function($){function _setDisabled(target,disabled){var opts=$.data(target,"progressbar").options;opts.disabled=!!disabled;if(!opts.disabled){$(target).removeClass("l-btn-disabled l-btn-plain-disabled");}else{$(target).addClass("l-btn-disabled l-btn-plain-disabled");}}
$.extend($.fn.progressbar.defaults,{disabled:false});$.extend($.fn.progressbar.methods,{enable:function(jq){return jq.each(function(){_setDisabled(this,false);});},disable:function(jq){return jq.each(function(){_setDisabled(this,true);});}});})(jQuery);(function($){function _hasUnitBox(jq){var t=$(jq).numberbox("options").unitbox;return t&&t.length&&$.data(t[0],"combobox");}
function _unitFactorFor(jq,value){var factor=1;if(_hasUnitBox(jq)){var opts=$(jq).numberbox("options");if($.isNumeric(opts.min)&&value<opts.min){return-1;}
var valueField=opts.unitbox.combobox("options").valueField;var units=$.map(opts.unitbox.combobox("getData"),function(entry){return parseInt(entry[valueField]);});units.sort(function(a,b){return a-b;});while(units.length){factor=units.pop();if(value%factor==0){break;}}}
return factor;}
var spinMethod=$.fn.numberspinner.defaults.spin;$.extend($.fn.numberspinner.defaults,{spin:function(down){if(_hasUnitBox(this)){var opts=$(this).numberspinner("options");var value=parseFloat($(this).numberspinner("getText"))+opts.increment*(down?-1:1);if($.isNumeric(opts.min)&&value<opts.min){value=opts.min;}
if($.isNumeric(opts.max)&&value>opts.max){value=opts.max;}
var factor=parseInt($(this).numberbox("options").unitbox.combobox("getValue"));$(this).numberspinner("setValue",value*factor);}else{spinMethod.apply(this,arguments);}}});var fixMethod=$.fn.numberbox.methods.fix;var setValueMethod=$.fn.numberbox.methods.setValue;$.extend($.fn.numberbox.methods,{getValue:function(jq){var value=$(jq).textbox("getValue");return _hasUnitBox(jq)?parseFloat(value)*parseInt($(jq).numberbox("options").unitbox.combobox("getValue")):$.isNumeric(value)?parseFloat(value):value;},setValue:function(jq,value){value=parseFloat(value);return jq.each(function(){if(!isNaN(value)&&_hasUnitBox(this)){var unitbox=$(this).numberbox("options").unitbox;var factor=_unitFactorFor($(this),value);if(factor==-1){$(this).numberbox("setText",value);unitbox.combobox("reset");}else{setValueMethod.call(this,jq,value/factor);unitbox.combobox("select",factor+"");}}else{setValueMethod.call(this,jq,value);}});},fix:function(jq){return jq.each(function(){var opts=$(this).numberbox("options");if(_hasUnitBox(this)&&typeof opts.max=="number"){var max=opts.max;try{opts.max=null;opts.value=null;var value=parseFloat(opts.parser.call(this,$(this).numberbox("getText")));}finally{opts.max=max;}
value*=parseInt(opts.unitbox.combobox("getValue"));$(this).numberbox("setValue",value);}else{fixMethod.call(this,jq);}});}});$.fn.numberbox.defaults.unitbox=null;})(jQuery);(function($){var keydownHandler=$.fn.tagbox.defaults.inputEvents.keydown;var blurHandler=$.fn.tagbox.defaults.inputEvents.blur;var enterHandler=$.fn.tagbox.defaults.keyHandler.enter;var queryHander=$.fn.tagbox.defaults.keyHandler.query;$.fn.tagbox.defaults=$.extend({},$.fn.tagbox.defaults,{loadFilter:function(data){if(data&&data.length&&(typeof data[0]==="string"||typeof data[0]==="number")){return $.map(data,function(value){return{text:value,value:value};});}
return data;},keyHandler:$.extend({},$.fn.tagbox.defaults.keyHandler,{query:function(){var opts=$(this).tagbox("options");if(opts.editable&&!opts.limitToList){$.fn.combobox.defaults.keyHandler.query.apply(this,arguments);}else{queryHander.apply(this,arguments);}},enter:function(e){var t=$(this);var opts=t.tagbox("options");if(opts.editable&&!opts.limitToList){var item=t.tagbox("panel").children("div.combobox-item-hover");if(item.length){item.removeClass("combobox-item-hover");var row=opts.finder.getRow(this,item);t.tagbox(item.hasClass("combobox-item-selected")?"unselect":"select",row[opts.valueField]);}else{enterHandler.call(this,e);}}else{enterHandler.call(this,e);}}}),inputEvents:$.extend({},$.fn.tagbox.defaults.inputEvents,{blur:function(e){var t=e.data.target;var opts=$(t).tagbox("options");if(opts.editable&&!opts.limitToList){opts.keyHandler.enter.call(t,e);}else{blurHandler.call(this,e);}},keydown:function(e){if(e.keyCode==8){var t=$(e.data.target);if(t.tagbox("options").editable&&t.combobox("getText").length==0){t.next().find(".tagbox-remove").last().click();return false;}}else{keydownHandler.apply(this,arguments);}}})});})(jQuery);(function($){var emailRule=$.fn.validatebox.defaults.rules.email;var urlRule=$.fn.validatebox.defaults.rules.url;$.extend($.fn.validatebox.defaults.rules,{"email":{validator:function(value){value=/^(.+)?[ \t]*<(.+)>[ \t]*$/.test(value)?RegExp.$2:value;return emailRule.validator.call(this,value);},message:emailRule.message},"pattern":{validator:function(value,params){var pattern=params&&params.length?params[0]:"";var flags=params&&params.length>1?params[1]:"";try{return new RegExp(pattern,flags).test(value);}catch(e){return false}},message:$.fn.validatebox.defaults.missingMessage||""},"variable":{validator:function(value){return/^%[^%]+%$/.test(value.trim());},message:$.fn.validatebox.defaults.missingMessage||""},"in_array":{validator:function(value,params){return $.inArray(value,params||[])!=-1;},message:$.fn.validatebox.defaults.missingMessage||""},"in_range":{validator:function(value,params){var lowerBound=params&&params.length?parseInt(params[0],10):NaN;var upperBound=params&&params.length>1?parseInt(params[1],10):NaN;value=parseInt(value,10);return!isNaN(lowerBound)&&!isNaN(upperBound)&&!isNaN(value)&&isFinite(value)?lowerBound<=value&&value<=upperBound:true;},message:"Please enter a value between {0} and {1}."},"multi_value":{validator:function(value,params){var validType,opts=$(this).validatebox("options");if(params&&params.length&&(validType=params[0])){var rule;$.each(opts.rules,function(key,val){if(key==validType){rule=val['validator'];return false;}
if(validType.startsWith(key+"[")){rule=function(value){var oldValidType=opts.validType;var oldVal=opts.val;try{opts.validType=validType;opts.val=function(){return value;};return $(this).validatebox("isValid");}finally{opts.validType=oldValidType;opts.val=oldVal;}};return false;}});var separator=params.length>1?params[1]:" ";var values=value.split(separator);for(var i=0;i<values.length;i++){var str=values[i].trim();if(str.length&&rule&&!rule.call(this,str)){return false;}}}
return true;},message:""},"any":{validator:function(value,params){var opts=$(this).validatebox("options");var validType=opts.validType;try{for(var i=0;i<params.length;++i){opts.validType=params[i];if($(this).validatebox("isValid")){return true;}}
return false;}finally{opts.validType=validType;}},message:""},"non_empty":{validator:function(value){return value&&value.trim().length!=0;},message:""},"url":{validator:function(value){var re=/^(https?|ftp):\/\/(localhost)(:\d*)?(\/\S*)?/i;return re.test(value)||urlRule.validator.call(this,value);},message:urlRule.message}});})(jQuery);(function($){function escapeXml(value){var entities={"<":"&lt;",">":"&gt;","&":"&amp;",'"':"&quot;"};return value.replace(/[<>&"]/g,function(entry){return entities[entry]});}
function xssFilter(value){return typeof value==="string"?escapeXml(value):value;}
var getColumnOptionMethod=$.fn.datagrid.methods.getColumnOption;$.fn.datagrid.methods.getColumnOption=function(jq,field){var col=getColumnOptionMethod.call(this,jq,field);if(col&&!$.isFunction(col.formatter)){col.formatter=xssFilter;}
return col;};var treeFormatter=$.fn.tree.defaults.formatter;$.fn.tree.defaults.formatter=function(){return xssFilter(treeFormatter.apply(this,arguments));};var comboFormatter=$.fn.combobox.defaults.formatter;$.fn.combobox.defaults.formatter=function(){return xssFilter(comboFormatter.apply(this,arguments));};var tagboxFormatter=$.fn.tagbox.defaults.formatter;var tagboxTagFormatter=$.fn.tagbox.defaults.tagFormatter;$.fn.tagbox.defaults.formatter=function(){return xssFilter(tagboxFormatter.apply(this,arguments));};$.fn.tagbox.defaults.tagFormatter=function(){return xssFilter(tagboxTagFormatter.apply(this,arguments));};var setTitleMethod=$.fn.panel.methods.setTitle;$.fn.panel.methods.setTitle=function(jq,value){return setTitleMethod.call(this,jq,xssFilter(value));};$.each($.messager,function(key){var fn=$.messager[key];if($.isFunction(fn)){$.messager[key]=function(){function filter(data,force){if(typeof data==="string"){return force?xssFilter(data):data;}else if($.isArray(data)){for(var i=0;i<data.length;++i){data[i]=filter(data[i],!!force);}}else if(typeof data=="object"){var escape=force||(data.hasOwnProperty("escapeXml")&&data["escapeXml"]!==false);for(key in data){if(data.hasOwnProperty(key)){data[key]=filter(data[key],escape);}}}
return data;}
return fn.apply(this,filter(arguments,false));}}});})(jQuery);(function($){function pageFilter(data){var total=$.isArray(data)?data.length:data.total;var rows=$.isArray(data)?data:data.rows;var opts=$.data(this,"datagrid").options;var pl=pageList(opts.pageList,total);opts.pageSize=pageSize(opts.pageSize||$(this).datagrid("getPager").pagination("options").pageSize,pl);opts.pageNumber=Math.max(1,opts.pageNumber);var startIndex=(opts.pageNumber-1)*opts.pageSize;rows=startIndex<rows.length?rows.slice(startIndex,startIndex+opts.pageSize):rows.splice(0,opts.pageSize);var dg=$(this);$(this).datagrid("getPager").pagination({pageNumber:opts.pageNumber,pageSize:opts.pageSize,pageList:pl,total:total,buttons:pageButtons(dg),onSelectPage:function(pageNumber,pageSize){opts.pageNumber=pageNumber;opts.pageSize=pageSize;$(this).pagination("refresh",{pageNumber:pageNumber,pageSize:pageSize});if(opts.remoteSort){dg.datagrid("reload");}else{dg.datagrid("loadData",dg.datagrid("getData"));}},onBeforeRefresh:function(){dg.datagrid("reload");return false;}});return{total:total,rows:rows};}
function pageList(list,total){list=(total>0?[total]:[]).concat(list).sort(function(a,b){return a-b;});var index=total>0?$.inArray(total,list):-1;return index==0?list.splice(1,1):index>0?list.slice(0,index+1):list;}
function pageSize(value,values){var candidate=values.length?values[0]:value;for(var i=0;i<values.length;++i){if(Math.abs(value-values[i])<Math.abs(value-candidate)){candidate=values[i];}}
return candidate;}
function pageButtons(jq){var opts=jq.datagrid("options");return opts.search?[{iconCls:"icon-search",handler:function(){jq.datagrid("getFindbar").findbar("show");}}]:[];}
var loadFilter=$.fn.datagrid.defaults.loadFilter;var onBeforeSortColumn=$.fn.datagrid.defaults.onBeforeSortColumn;var onSortColumn=$.fn.datagrid.defaults.onSortColumn;$.extend($.fn.datagrid.defaults,{pageList:[50,100],loadFilter:function(data){data=loadFilter.call(this,data);var options=$.data(this,"datagrid").options;return options.pagination?pageFilter.call(this,data):data;},onBeforeSortColumn:function(){var ret=onBeforeSortColumn.apply(this,arguments);if(ret!=false){$.data(this,"datagrid").sorting=true;}
return ret;},onSortColumn:function(){onSortColumn.apply(this,arguments);$.data(this,"datagrid").sorting=false;}});var getData=$.fn.datagrid.methods.getData;var loadData=$.fn.datagrid.methods.loadData;$.extend($.fn.datagrid.methods,{getData:function(jq){var data=$.data(jq[0],"datagrid").originalData;return data||getData.apply(this,arguments);},loadData:function(jq,data){var state=$.data(jq[0],"datagrid");if(!state.sorting){state.originalData=data;}
return loadData.apply(this,arguments);}});var reloadMethod=$.fn.datagrid.methods.reload;$.extend($.fn.datagrid.methods,{reload:function(jq,callback){var opts=$(jq).datagrid("options");if(opts.pagination&&opts.pageSize===$(jq).datagrid("getData").total){opts.pageSize=undefined;}
if($.isFunction(callback)){var loadSuccess=opts.onLoadSuccess;var loadError=opts.onLoadError;opts.onLoadSuccess=function(){opts.onLoadSuccess=loadSuccess;opts.onLoadError=loadError;opts.onLoadSuccess.apply(this,arguments);callback();opts=loadSuccess=loadError=null;};opts.onLoadError=function(){opts.onLoadSuccess=loadSuccess;opts.onLoadError=loadError;opts.onLoadError.apply(this,arguments);opts=loadSuccess=loadError=null;};return reloadMethod.call(this,jq);}
return reloadMethod.apply(this,arguments);}});})(jQuery);(function($){$.extend($.fn.datagrid.methods,{cellOverflowTooltip:function(jq,rows,minLength,maxLength){minLength=parseInt(minLength)||3;maxLength=parseInt(maxLength)||200;rows.find("div.datagrid-cell").each(function(){var c=$(this);var t=c.text();if(t.length>minLength){c.css("text-overflow","ellipsis");c.parent("td").attr("title",t.length>maxLength?t.substring(0,maxLength):t);}});}});var onAfterRender=$.fn.datagrid.defaults.view.onAfterRender;var insertRow=$.fn.datagrid.defaults.view.insertRow;var updateRow=$.fn.datagrid.defaults.view.updateRow;$.extend($.fn.datagrid.defaults.view,{MAX_TOOLTIP_LENGTH:200,onAfterRender:function(jq){onAfterRender.apply(this,arguments);$(jq).datagrid("cellOverflowTooltip",$.data(jq,"datagrid").options.finder.getTr(jq,"","allbody"));},insertRow:function(jq,rowIndex){insertRow.apply(this,arguments);$(jq).datagrid("cellOverflowTooltip",$.data(jq,"datagrid").options.finder.getTr(jq,rowIndex,"body"));},updateRow:function(jq,rowIndex){updateRow.apply(this,arguments);$(jq).datagrid("cellOverflowTooltip",$.data(jq,"datagrid").options.finder.getTr(jq,rowIndex,"body"));}});})(jQuery);(function($){function _init(target){var state=$.data(target,"passwordbox2");var opts=state.options;var icons=$.extend(true,[],opts.icons);icons.push({iconCls:"passwordbox-open",handler:function(e){var target=e.data.target;var opts=$(target).passwordbox2("options");opts.revealed=!opts.revealed;_update(target);}});$(target).addClass("passwordbox-f").textbox($.extend({},opts,{icons:icons}));_update(target);}
function _update(target){var t=$(target);var opts=t.passwordbox2("options");t.passwordbox2("textbox").attr("type",opts.revealed?"text":"password");var icon=t.next().find(".passwordbox-open");opts.revealed?icon.addClass("passwordbox-close"):icon.removeClass("passwordbox-close");}
$.fn.passwordbox2=function(options,param){if(typeof options=="string"){var method=$.fn.passwordbox2.methods[options];return method?method(this,param):this.textbox(options,param);}
options=options||{};return this.each(function(){var state=$.data(this,"passwordbox2");if(state){$.extend(state.options,options);}else{$.data(this,"passwordbox2",{options:$.extend(true,{},$.fn.passwordbox2.defaults,$.fn.passwordbox2.parseOptions(this),options)});}
_init(this);});};$.fn.passwordbox2.methods={options:function(jq,deep){return deep===true?jq.textbox("textbox").validatebox("options"):jq.textbox("options");},destroy:function(jq){return jq.each(function(){$(this).textbox("destroy");});},showPassword:function(jq){return jq.each(function(){$(this).passwordbox2("options").revealed=true;_update(this);});},hidePassword:function(jq){return jq.each(function(){$(this).passwordbox2("options").revealed=false;_update(this);});},isSatisfied:function(jq,value){var tb=jq.passwordbox2("textbox");var opts=$.data(tb[0],"validatebox").options;var m=/([a-zA-Z_]+)(.*)/.exec(opts.validType);var rule=!!m&&m.length>0?$.fn.validatebox.defaults.rules[m[1]]:null;if(!rule||typeof rule.validator!=="function"){return true;}
var args=[value||""].concat(opts.validParams);if(!rule.validator.apply(rule.validator,args)){opts.message=rule.message||opts.invalidMessage;opts.err(tb[0],opts.message,"show");!opts.required&&(opts.missingMessage=opts.message);!opts.invalidMessage&&(opts.invalidMessage=opts.message);return false;}
return true;}};$.fn.passwordbox2.parseOptions=function(target){return $.extend({},$.fn.textbox.parseOptions(target),$.parser.parseOptions(target,[{revealed:"boolean"}]));};$.fn.passwordbox2.defaults=$.extend({},$.fn.textbox.defaults,{revealed:false,validateOnCreate:false,validateOnBlur:true});})(jQuery);(function($){$(function(){var styleId="easyui-colorpicker-style";if(!$("#"+styleId).length){$('head').append('<style id="'+styleId+'">'
+'.colorbox-cell{ display:inline-block; float:left; cursor:pointer; border:1px solid #fff; }'
+'.colorbox-cell:hover{ border:1px solid #000; }'
+'.colorbox-btn{ opacity:1; background: #FFF; color: inherit; border-style: solid}'
+'</style>');}});function init(target){var state=$.data(target,"colorbox");var opts=state.options;var colors=["0,0,0","68,68,68","102,102,102","153,153,153","204,204,204","238,238,238","243,243,243","255,255,255","244,204,204","252,229,205","255,242,204","217,234,211","208,224,227","207,226,243","217,210,233","234,209,220","234,153,153","249,203,156","255,229,153","182,215,168","162,196,201","159,197,232","180,167,214","213,166,189","224,102,102","246,178,107","255,217,102","147,196,125","118,165,175","111,168,220","142,124,195","194,123,160","204,0,0","230,145,56","241,194,50","106,168,79","69,129,142","61,133,198","103,78,167","166,77,121","153,0,0","180,95,6","191,144,0","56,118,29","19,79,92","11,83,148","53,28,117","116,27,71","102,0,0","120,63,4","127,96,0","39,78,19","12,52,61","7,55,99","32,18,77","76,17,48"];$(target).combo($.extend({},opts,{panelWidth:opts.cellWidth*8+2,panelHeight:opts.cellHeight*7+2,onShowPanel:function(){var p=$(this).combo("panel");if(p.is(":empty")){for(var i=0;i<colors.length;++i){var a=$('<a class="colorbox-cell"></a>').appendTo(p);a.css("backgroundColor","rgb("+colors[i]+")");}
var cells=p.find(".colorbox-cell");cells._outerWidth(opts.cellWidth)._outerHeight(opts.cellHeight);cells.off(".colorbox").on("click.colorbox",function(){$(target).colorbox("setValue",$(this).css("backgroundColor"));$(target).combo("hidePanel");});state.mask=$("<div class=\"window-mask\"></div>").insertBefore(p.parent());state.mask.css($.extend({zIndex:$.fn.window.defaults.zIndex++,opacity:0},$.fn.window.getMaskSize())).off(".colorbox").on("click.colorbox",function(){$(target).colorbox("hidePanel")});}},onHidePanel:function(){var p=$(this).combo("panel");p&&p.empty();state.mask&&state.mask.remove();}}));$(target).combo("textbox").css("textTransform","uppercase");if(opts.value){$(target).colorbox("initValue",opts.value);}}
function _hexColorOf(value){function _hex(x){return("0"+parseInt(x).toString(16)).slice(-2);}
if(value.indexOf("rgb")==-1){return value;}
var match=value.match(/^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/);return"#"+_hex(match[1])+_hex(match[2])+_hex(match[3]);}
$.fn.colorbox=function(options,param){if(typeof options=="string"){var method=$.fn.colorbox.methods[options];return method?method(this,param):this.combo(options,param);}
options=options||{};return this.each(function(){var state=$.data(this,"colorbox");if(state){$.extend(state.options,options);}else{state=$.data(this,"colorbox",{options:$.extend({},$.fn.colorbox.defaults,$.fn.colorbox.parseOptions(this),options)});}
init(this);});};$.fn.colorbox.methods={options:function(jq){return jq.data("colorbox").options;},initValue:function(jq,value){return jq.each(function(){value=$(this).combo("getIcon",0).css("backgroundColor",value).css("backgroundColor");$(this).combo("initValue",_hexColorOf(value));})},setValue:function(jq,value){return jq.each(function(){value=$(this).combo("getIcon",0).css("backgroundColor",value).css("backgroundColor");value=_hexColorOf(value);$(this).combo("setValue",value).combo("setText",value);});},clear:function(jq){return jq.each(function(){$(this).combo("clear");$(this).combo("textbox").css("backgroundColor","");});}};$.fn.colorbox.parseOptions=function(target){return $.extend({},$.fn.combo.parseOptions(target),{});};$.fn.colorbox.defaults=$.extend({},$.fn.combo.defaults,{editable:true,value:"#FFFFFF",multivalue:false,icons:[{iconCls:"colorbox-btn textbox-button-left",handler:function(e){$(e.data.target).colorbox("showPanel");}}],required:false,novalidate:true,validType:"pattern['^#?[0-9a-fA-F]{3,6}$']",iconAlign:"left",hasDownArrow:false,iconWidth:28,cellWidth:20,cellHeight:20,width:110});$.parser.plugins.push("colorbox");})(jQuery);