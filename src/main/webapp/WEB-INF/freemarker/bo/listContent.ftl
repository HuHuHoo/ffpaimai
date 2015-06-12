<#assign sec=JspTaglibs["/WEB-INF/security.tld"]>
<#assign jmesa=JspTaglibs["/WEB-INF/jmesa.tld"]>
<html>
<head>
    <title>${type.desc}</title>
    <link href="${ctx}/static/bo/jmesa/jmesa.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/bo/jmesa/jmesa-pdf.css" rel="stylesheet" type="text/css"/>
    <script src="${ctx}/static/bo/jmesa/jmesa.js"></script>
    <script src="${ctx}/static/bo/jmesa/jquery.jmesa.js"></script>
    <script type="text/javascript">
        function onInvokeAction(id) {
            $.jmesa.setExportToLimit(id, '');
            $.jmesa.createHiddenInputFieldsForLimitAndSubmit(id);
        }
        function switchStatus(id, status) {
            if (status == 1) {
                var msg = "确认要显示吗？";
            } else {
                var msg = "确认要隐藏吗？";
            }
            bootbox.confirm(msg, function (result) {
                if (result) {
                    ajaxGet("${ctx}/bo/goods/ajax/switchStatus/" + id);
                }
            });
        }
        function switchRecommend(id, status) {
            if (status == 1) {
                var msg = "确认要推荐吗？";
            } else {
                var msg = "确认要取消推荐吗？";
            }
            bootbox.confirm(msg, function (result) {
                if (result) {
                    ajaxGet("${ctx}/bo/goods/ajax/switchRecommend/" + id);
                }
            });
        }
    </script>
</head>
<body>
<div class="span10">
    <div class="hero-unit">
        <h3>${type.abbr}列表</h3>

        <p>
            <button class="btn btn-info" type="button" onclick="window.location='${ctx}/bo/content/${type}/addOrModify';">添加${type.abbr}
            </button>
        </p>
        <#if contents?has_content>
            <form name="userForm" action="${ctx}/bo/content/${type}/list">
                <@jmesa.tableModel id="lib" items=contents var="content">
                    <@jmesa.htmlTable>
                        <@jmesa.htmlRow>
                            <@jmesa.htmlColumn filterable=true sortable=true property="id" title="ID" />
                            <@jmesa.htmlColumn filterable=true sortable=true property="name" title="名称" >
                                <a href="${ctx}/bo/content/${type}/${content.id?c}">${content.name?if_exists}</a>
                            </@jmesa.htmlColumn>
                            <@jmesa.htmlColumn filterable=true sortable=true property="operateDate" title="时间" >
                                ${content.operateDate?string("yyyy年-MM月-dd日 HH点")}
                            </@jmesa.htmlColumn>
                            <@jmesa.htmlColumn filterable=false sortable=false property="" title="操作">
                                <a href="javascript:void(0);" onclick="switchStatus(${content.id?c},1)">删除</a>
                            </@jmesa.htmlColumn>
                        </@jmesa.htmlRow>
                    </@jmesa.htmlTable>
                </@jmesa.tableModel>
            </form>
        <#else>
            暂无内容显示！
        </#if>


    </div>
</div>
</body>
</html>