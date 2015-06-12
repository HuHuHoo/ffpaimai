<#ftl encoding="utf-8"/>
<!DOCTYPE html>
<html>
	<head>
	    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	    <title>${title} 厦门市方分拍卖有限公司</title>
		<script type="text/javascript" src="${ctx}/static/bo/jquery/jquery-1.9.1.js"></script>
		<script type="text/javascript" src="${ctx}/static/bo/jquery/jquery.form.js"></script>
		<link href="${ctx}/static/bo/css/lingma.css" rel="stylesheet" type="text/css" media="screen" />
		<link href="${ctx}/static/bo/bootstrap/css/bootstrap.css" rel="stylesheet"  type="text/css">
		<link href="${ctx}/static/bo/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet"  type="text/css">
		<script src="${ctx}/static/bo/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
		<script src="${ctx}/static/bo/bootstrap/js/bootbox.js" type="text/javascript"></script>
		<script src="${ctx}/static/bo/bootstrap/js/jqBootstrapValidation.js" type="text/javascript"></script>

		<script src="${ctx}/static/bo/datepicker/js/bootstrap-datepicker.js" type="text/javascript"></script>
		<script src="${ctx}/static/bo/datepicker/js/locales/bootstrap-datepicker.zh-CN.js" type="text/javascript"></script>
		<link href="${ctx}/static/bo/datepicker/css/datepicker.css" rel="stylesheet"  type="text/css">

		<script src="${ctx}/static/bo/datetimepicker/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
		<script src="${ctx}/static/bo/datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js" type="text/javascript"></script>
		<link href="${ctx}/static/bo/datetimepicker/css/datetimepicker.css" rel="stylesheet"  type="text/css">

		<script src="${ctx}/static/bo/select2/select2.js" type="text/javascript"></script>
		<script src="${ctx}/static/bo/select2/select2_locale_zh-CN.js" type="text/javascript"></script>
		<link href="${ctx}/static/bo/select2/select2.css" rel="stylesheet"  type="text/css">

		<script src="${ctx}/static/bo/cluetip/jquery.cluetip.js" type="text/javascript"></script>
		<link rel="stylesheet" href="${ctx}/static/bo/cluetip/jquery.cluetip.css">

		<script type="text/javascript" src="${ctx}/static/bo/js/lingma.js"></script>
		${head}
	</head>
	<body>
		<#include "header.ftl"/>
		<div class="container-fluid">
			<div class="row-fluid">
				<#include "aside.ftl"/>
				${body}
			</div>
		</div>
		<#include "footer.ftl"/>
	</body>
</html>