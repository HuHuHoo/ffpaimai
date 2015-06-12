<#assign sec=JspTaglibs["/WEB-INF/security.tld"]>
<#assign jmesa=JspTaglibs["/WEB-INF/jmesa.tld"]>
<html>
<head>
    <title>拍品公告</title>
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
                    ajaxGet("${ctx}/bo/announce/ajax/switchStatus/" + id);
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
                    ajaxGet("${ctx}/bo/announce/ajax/switchRecommend/" + id);
                }
            });
        }
        function switchFresh(id, status) {
            if (status == 1) {
                var msg = "确认要设置最新吗？";
            } else {
                var msg = "确认要取消最新吗？";
            }
            bootbox.confirm(msg, function (result) {
                if (result) {
                    ajaxGet("${ctx}/bo/announce/ajax/switchFresh/" + id);
                }
            });
        }
    </script>
</head>
<body>
<div class="span10">
    <div class="hero-unit">
        <h3>拍品公告列表</h3>
        <p>
            <button class="btn btn-info" type="button" onclick="window.location='${ctx}/bo/announce/addOrModify';">添加拍品公告
            </button>
        </p>
        <form name="userForm" action="${ctx}/bo/announce/list">
        <@jmesa.tableModel id="lib" items=announces var="announce">
            <@jmesa.htmlTable>
                <@jmesa.htmlRow>
                    <@jmesa.htmlColumn filterable=true sortable=true property="id" title="ID" />
                    <@jmesa.htmlColumn filterable=true sortable=true property="name" title="名称" >
                        <a href="${ctx}/bo/announce/${announce.id?c}">${announce.name?if_exists}</a>
                    </@jmesa.htmlColumn>
                    <@jmesa.htmlColumn filterable=false sortable=true property="status" title="显示" >
                        <#if announce.status==1>是<#else>否</#if>
                    </@jmesa.htmlColumn>
                    <@jmesa.htmlColumn filterable=false sortable=true property="recommend" title="推荐" >
                        <#if announce.recommend==1>是<#else>否</#if>
                    </@jmesa.htmlColumn>
                    <@jmesa.htmlColumn filterable=false sortable=true property="fresh" title="最新" >
                        <#if announce.fresh==1>是<#else>否</#if>
                    </@jmesa.htmlColumn>
                    <@jmesa.htmlColumn filterable=false sortable=false property="" title="操作">
                        <#if announce.status==0>
                            <a href="javascript:void(0);" onclick="switchStatus(${announce.id?c},1)">显示</a>
                        <#else>
                            <a href="javascript:void(0);" onclick="switchStatus(${announce.id?c},0)">隐藏</a>
                        </#if>
                        <#if announce.recommend==0>
                            <a href="javascript:void(0);" onclick="switchRecommend(${announce.id?c},1)">推荐</a>
                        <#else>
                            <a href="javascript:void(0);" onclick="switchRecommend(${announce.id?c},0)">取消推荐</a>
                        </#if>
                        <#if announce.fresh==0>
                            <a href="javascript:void(0);" onclick="switchFresh(${announce.id?c},1)">最新</a>
                        <#else>
                            <a href="javascript:void(0);" onclick="switchFresh(${announce.id?c},0)">取消最新</a>
                        </#if>
                        <a href="${ctx}/bo/announce/addOrModify?announceId=${announce.id?c}">修改</a>
                    </@jmesa.htmlColumn>
                </@jmesa.htmlRow>
            </@jmesa.htmlTable>
        </@jmesa.tableModel>
        </form>
    </div>
</div>
</body>
</html>