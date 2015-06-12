<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>文章编辑</title>
    <script language="javascript" type="text/javascript" src="${ctx}/static/bo/ckeditor/ckeditor.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            CKEDITOR.replace('detail');
        });
    </script>
</head>
<body>
    <div class="span10">
        <div class="hero-unit">
            <h4>文章编辑</h4>
            <#include "message.ftl"/>
            <form id="addOrModifyGoods" class="form-horizontal" action="${ctx}/bo/article/${entityClass?if_exists}/${entityId?c}" method="POST">
                <input  type="hidden" name="entityClass" value="${entityClass?if_exists}"/>
                <input type="hidden" name="entityId" value="${entityId?c}"/>
                <#if article??>
                    <input type="hidden" name="id" value="${id?if_exists}"/>
                </#if>
                <div class="control-group">
                    <div class="hero-unit">
                        <h5>文章摘要</h5>
                        <textarea class="span6" id="summary" name="summary"><#if article??>${article.summary?if_exists}</#if></textarea>
                        <h5>文章详情</h5>
                        <textarea name="detail"><#if article??>${article.detail?if_exists}</#if></textarea>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <input class="btn btn-primary" type="submit" value="确认"/>
                        <button class="btn" type="button" onclick="goTo('${ctx}/bo/${entityClass?if_exists}/detail/${entityId?c}')">返回</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
