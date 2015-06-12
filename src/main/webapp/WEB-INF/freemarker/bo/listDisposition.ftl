<#assign sec=JspTaglibs["/WEB-INF/security.tld"]>
<#assign jmesa=JspTaglibs["/WEB-INF/jmesa.tld"]>
<html>
<head>
    <title>报名管理</title>
    <link href="${ctx}/static/bo/jmesa/jmesa.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/bo/jmesa/jmesa-pdf.css" rel="stylesheet" type="text/css"/>
    <script src="${ctx}/static/bo/jmesa/jmesa.js"></script>
    <script src="${ctx}/static/bo/jmesa/jquery.jmesa.js"></script>
    <script type="text/javascript">
        function onInvokeAction(id) {
            $.jmesa.setExportToLimit(id, '');
            $.jmesa.createHiddenInputFieldsForLimitAndSubmit(id);
        }
        function switchStatus(id) {
            ajaxGet("${ctx}/bo/disposition/ajax/switchStatus/" + id);
        }
    </script>
</head>
<body>
<div class="span10">
    <div class="hero-unit">
        <h3>报名列表</h3>

        <form name="userForm" action="${ctx}/bo/disposition/list">
        <@jmesa.tableModel id="lib" items=dispositionList var="disposition">
            <@jmesa.htmlTable>
                <@jmesa.htmlRow>
                    <@jmesa.htmlColumn filterable=true sortable=true property="id" title="ID" width="5%"/>
                    <@jmesa.htmlColumn filterable=true sortable=true property="name" title="名称" >
                        <a href="${ctx}/bo/disposition/${disposition.id?c}">${disposition.name?if_exists}</a>
                    </@jmesa.htmlColumn>
                    <@jmesa.htmlColumn filterable=true sortable=true property="contact" title="联系人" />
                    <@jmesa.htmlColumn filterable=true sortable=true property="sex" title="性别" width="5%"/>
                    <@jmesa.htmlColumn filterable=true sortable=true property="tel" title="联系方式" />
                    <@jmesa.htmlColumn filterable=true sortable=true property="status" title="状态" width="5%" >
                        <#if disposition.status==0>未处理<#else>已处理</#if>
                    </@jmesa.htmlColumn>
                    <@jmesa.htmlColumn filterable=false sortable=false property="" title="操作" width="5%">
                        <#if disposition.status==0>
                            <a href="javascript:void(0);" onclick="switchStatus(${disposition.id?c})">处理</a>
                        <#else>
                            <a href="javascript:void(0);" onclick="switchStatus(${disposition.id?c})">未处理</a>
                        </#if>
                    </@jmesa.htmlColumn>
                </@jmesa.htmlRow>
            </@jmesa.htmlTable>
        </@jmesa.tableModel>
        </form>
    </div>
</div>
</body>
</html>