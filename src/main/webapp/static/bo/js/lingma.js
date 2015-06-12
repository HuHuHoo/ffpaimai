function goTo(defaltUrl) {
	window.location = defaltUrl;
}
function jalert(msg) {
	bootbox.alert(msg);
}
function ajaxGet(url) {
	$.ajax({
		type : 'GET',
		url : url,
		success : function(data) {
			try {
				onInvokeAction('lib')
			} catch (e) {
				location.reload();
			}
		},
		error : function() {
			jalert("操作异常！")
		}
	});
}
function deleteAttachmetn(url) {
	$.ajax({
		type : 'GET',
		url : url,
		success : function(data) {
			location.reload();
		},
		error : function() {
			jalert("操作异常！")
		}
	});
}
function idNameResult(idName) {
	return idName.name;
}

function idNameFormatSelection(idName) {
	return idName.name;
}
function idNameFormatSelectionForStock(idName,container) {
	var element=container.parent().parent().parent().parent().children().find("input[name='numbers']");
	element.attr("placeholder","不大于"+idName.quantity);
	element.attr("max",idName.quantity);
	return idName.name;
}
function getSelectComponentId(){
	var ids="";
	$("input[name='componentIds']").each(
		function(){
			if($(this).val()!=""){
				ids=ids+$(this).val()+',';
			}
		});
	return ids;
}
function queryComponentName(selector, ctx) {
	$(selector).select2({
		minimumInputLength : 0,
		allowClear : true,
		ajax : {
			url : ctx + "/component/query",
			dataType : 'json',
			data : function(term, page) {
				return {
					q : term,
					page : page,
					ids:getSelectComponentId()
				};
			},
			results : function(data, page) {
				return {
					results : data
				};
			}
		},
		formatResult : idNameResult,
		formatSelection : idNameFormatSelection,
		dropdownCssClass : "bigdrop",
		escapeMarkup : function(m) {
			return m;
		}
	});
}
function queryComponentStock(selector, ctx) {
	$(selector).select2({
		minimumInputLength : 0,
		allowClear : true,
		ajax : {
			url : ctx + "/component/queryStock",
			dataType : 'json',
			data : function(term, page) {

				return {
					q : term,
					page : page,
					ids:getSelectComponentId()
				};
			},
			results : function(data, page) {
				return {
					results : data
				};
			}
		},
		formatResult : idNameResult,
		formatSelection : idNameFormatSelectionForStock,
		dropdownCssClass : "bigdrop",
		escapeMarkup : function(m) {
			return m;
		}
	});
}