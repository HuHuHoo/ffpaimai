<html>
<head>
    <title>公告详情</title>
    <script src="${ctx}/static/bootstrap/js/bootstrap-carousel.js"></script>
</head>
<body>
<div class="span10">
    <div class="hero-unit">
        <h4>公告详情</h4>
    <#include "message.ftl"/>
        <div class="form-horizontal">
            <div class="control-group">
                <label class="control-label">公告名称:</label>
                <div class="controls">
                ${announce.name?if_exists}
                </div>
            </div>
        </div>
        <div class="form-horizontal">
            <div class="control-group">
                <label class="control-label">拍卖地点:</label>
                <div class="controls">
                ${announce.location?if_exists}
                </div>
            </div>
        </div>
        <div class="form-horizontal">
            <div class="control-group">
                <label class="control-label">拍卖时间:</label>
                <div class="controls">
                ${announce.tradeDate?if_exists}
                </div>
            </div>
        </div>
        <div class="form-horizontal">
            <div class="control-group">
                <label class="control-label">是否显示:</label>
                <div class="controls" >
                <#if announce.status==0>否<#else>是</#if>
                </div>
            </div>
        </div>
        <div class="form-horizontal">
            <div class="control-group">
                <label class="control-label">是否推荐:</label>
                <div class="controls" >
                <#if announce.recommend==0>否<#else>是</#if>
                </div>
            </div>
        </div>
        <div class="form-horizontal">
            <div class="control-group">
                <label class="control-label">是否最新:</label>
                <div class="controls" >
                <#if announce.fresh==0>否<#else>是</#if>
                </div>
            </div>
        </div>
        <div class="form-horizontal">
            <div class="control-group">
                <label class="control-label">公告摘要:</label>
                <div class="controls">
                ${announce.summary?if_exists}
                </div>
            </div>
        </div>
        <div class="form-horizontal">
            <div class="control-group">
                <label class="control-label">公告详情:</label>
                <div class="controls">
                ${announce.detail?if_exists}
                </div>
            </div>
        </div>
        <div class="form-horizontal">
            <div class="control-group">
                <label class="control-label"></label>
                <div class="controls">
                    <button class="btn" type="button" onclick="goTo('${ctx}/bo/announce/addOrModify?announceId=${announce.id?c}')">编辑详情</button>
                    <button class="btn" type="button" onclick="goTo('${ctx}/bo/announce/list')">返回</button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>