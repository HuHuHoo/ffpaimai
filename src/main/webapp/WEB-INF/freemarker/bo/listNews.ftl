<#assign sec=JspTaglibs["/WEB-INF/security.tld"]>
<#assign jmesa=JspTaglibs["/WEB-INF/jmesa.tld"]>
<html>
<head>
    <title>新闻管理</title>
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
        <h3>拍品列表</h3>
        <p>
            <button class="btn btn-info" type="button" onclick="window.location='${ctx}/bo/goods/addOrModify';">添加拍品
            </button>
        </p>
        <form name="userForm" action="${ctx}/bo/goods/list">
        <@jmesa.tableModel id="lib" items=goodsList var="goods">
            <@jmesa.htmlTable>
                <@jmesa.htmlRow>
                    <@jmesa.htmlColumn filterable=true sortable=true property="name" title="名称" >
                        <a href="${ctx}/bo/content/news/${goods.id?c}">${goods.name?if_exists}</a>
                    </@jmesa.htmlColumn>
                    <@jmesa.htmlColumn filterable=true sortable=true property="type.desc" title="类型" />
                    <@jmesa.htmlColumn filterable=true sortable=true property="tradeDate" title="时间" >
                    ${goods.tradeDate?string("yyyy年-MM月-dd日 HH点")}
                    </@jmesa.htmlColumn>
                    <@jmesa.htmlColumn filterable=true sortable=true property="location" title="地点" />
                    <@jmesa.htmlColumn filterable=true sortable=true property="status" title="状态" >
                        <#if goods.status==1>推荐<#else>不推荐</#if>
                    </@jmesa.htmlColumn>
                    <@jmesa.htmlColumn filterable=true sortable=true property="recommend" title="推荐" >
                        <#if goods.status==0>隐藏<#else>显示</#if>
                    </@jmesa.htmlColumn>
                    <@jmesa.htmlColumn filterable=false sortable=false property="" title="操作">
                        <#if goods.status==0>
                            <a href="javascript:void(0);" onclick="switchStatus(${goods.id?c},1)">显示</a>
                        <#else>
                            <a href="javascript:void(0);" onclick="switchStatus(${goods.id?c},0)">隐藏</a>
                        </#if>
                        <#if goods.recommend==0>
                            <a href="javascript:void(0);" onclick="switchRecommend(${goods.id?c},1)">推荐</a>
                        <#else>
                            <a href="javascript:void(0);" onclick="switchRecommend(${goods.id?c},0)">取消推荐</a>
                        </#if>
                        <a href="${ctx}/bo/goods/addOrModify?goodsId=${goods.id?c}">修改</a>
                    </@jmesa.htmlColumn>
                </@jmesa.htmlRow>
            </@jmesa.htmlTable>
        </@jmesa.tableModel>
        </form>
    </div>
</div>
</body>
</html>