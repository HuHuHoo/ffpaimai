<html>
<head>
    <title>${type.abbr}详情</title>
    <script src="${ctx}/static/bootstrap/js/bootstrap-carousel.js"></script>
</head>
<body>
<div class="span10">
    <div class="hero-unit">
        <h4>${type.abbr}</h4>
        <#include "message.ftl"/>
        <div class="form-horizontal">
            <div class="control-group">
                <label class="control-label">名称:</label>
                <div class="controls">
                ${content.name?if_exists}
                </div>
            </div>
        </div>
        <div class="form-horizontal">
            <div class="control-group">
                <label class="control-label">摘要:</label>
                <div class="controls">
                ${content.summary?if_exists}
                </div>
            </div>
        </div>
        <div class="form-horizontal">
            <div class="control-group">
                <label class="control-label">详情:</label>
                <div class="controls">
                    ${content.detail?if_exists}
                </div>
            </div>
        </div>
        <div class="form-horizontal">
            <div class="control-group">
                <label class="control-label"></label>
                <div class="controls">
                    <button class="btn" type="button" onclick="goTo('${ctx}/bo/content/${type}/addOrModify?contentId=${content.id?c}')">编辑</button>
                    <button class="btn" type="button" onclick="goTo('${ctx}/bo/content/${type}/list')">返回</button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>