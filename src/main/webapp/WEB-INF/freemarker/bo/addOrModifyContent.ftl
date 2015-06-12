<html>
<head>
    <title><#if contentId??>编辑<#else>添加</#if>${type.abbr}</title>
    <script language="javascript" type="text/javascript" src="${ctx}/static/bo/ckeditor/ckeditor.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $(function () { $("input,select,textarea").not("[type=submit]").jqBootstrapValidation(); } );
            CKEDITOR.replace('detail');
        });
    </script>
</head>
<body>
<div class="span10">
    <div class="hero-unit">
        <h4><#if contentId??>修改<#else>添加</#if>${type.abbr}</h4>
        <#include "message.ftl"/>
        <form id="addOrModifyContent" class="form-horizontal" action="${ctx}/bo/content/${type}/addOrModify" method="POST"  enctype="multipart/form-data">
        <#if contentId??>
            <input type="hidden" name="contentId" value="${contentId?c}"/>
            <input type="hidden" name="type" value="${type}"/>
        </#if>
            <div class="control-group">
                <label class="control-label" for="name">名称</label>
                <div class="controls">
                    <input type="text" required  id="name" name="name" placeholder="名称" <#if content??>value="${content.name?if_exists}" </#if>>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="name">摘要</label>
                <div class="controls">
                    <textarea class="span6" id="summary" name="summary"><#if content??>${content.summary?if_exists}</#if></textarea>
                </div>
            </div>
            <div class="control-group">
                <div class="hero-unit">
                    <h5>详情</h5>
                    <textarea name="detail"><#if content??>${content.detail?if_exists}</#if></textarea>
                </div>
            </div>

            <div class="control-group">
                <div class="controls">
                    <input class="btn btn-primary" type="submit" value="确认"/><button class="btn" type="button" onclick="goTo('${ctx}/bo/content/${type}/list')">返回</button>
                </div>
            </div>


        </form>
    </div>
</div>
</body>
</html>