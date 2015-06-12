<html>
<head>
    <title><#if goodId??>编辑<#else>添加</#if>部件</title>
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
        <h4><#if newsId??>编辑<#else>添加</#if>新闻</h4>
        <#include "message.ftl"/>
        <form id="addOrModifyNews" class="form-horizontal" action="${ctx}/bo/news/addOrModify" method="POST"  enctype="multipart/form-data">
        <#if newsId??>
            <input type="hidden" name="newsId" value="${newsId?c}"/>
        </#if>
        <div class="control-group">
            <label class="control-label" for="name">新闻名称</label>
            <div class="controls">
                <input type="text" required  id="name" name="name" placeholder="名称" <#if news??>value="${news.name?if_exists}" </#if>>
            </div>
        </div>
        <#if (news.image)??>
            <div class="control-group">
                <label class="control-label" for="name">图片</label>
                <div class="controls">
                    <img src="${ctx}${news.image?if_exists}" style="width: 134px;height: 89px"/>
                </div>
            </div>
        </#if>
        <div class="control-group">
            <label class="control-label" for="name">上传图片</label>
            <div class="controls">
                <input <#if !(newsId??)>  required </#if> id="upload" name="upload" type="file" multiple/>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label" for="name">摘要</label>
            <div class="controls">
                <textarea name="summary"><#if news??>${news.summary?if_exists}</#if></textarea>
            </div>
        </div>
         <div class="control-group">
            <label class="control-label" for="name">文章详情</label>
        </div>
        <div class="control-group">
            <div class="hero-unit">
                <textarea name="detail"><#if news??>${news.detail?if_exists}</#if></textarea>
            </div>
        </div>

        <div class="control-group">
            <div class="controls">
                <input class="btn btn-primary" type="submit" value="确认"/><button class="btn" type="button" onclick="goTo('${ctx}/bo/news/list')">返回</button>
            </div>
        </div>


        </form>
    </div>
</div>
</body>
</html>