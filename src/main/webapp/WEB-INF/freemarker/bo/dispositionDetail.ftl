<html>
<head>
    <title>报名详情</title>
</head>
<body>
<div class="span10">
    <div class="hero-unit">
        <h4>报名详情</h4>
    <#include "message.ftl"/>
        <div class="form-horizontal">
            <div class="control-group">
                <label class="control-label">拍品名称:</label>
                <div class="controls">
                    ${disposition.name?if_exists}
                </div>
            </div>
        </div>
        <div class="form-horizontal">
            <div class="control-group">
                <label class="control-label">联系人:</label>
                <div class="controls">
                    ${disposition.contact?if_exists} &nbsp;&nbsp;${disposition.sex?if_exists}
                </div>
            </div>
        </div>
        <div class="form-horizontal">
            <div class="control-group">
                <label class="control-label">电话:</label>
                <div class="controls">
                    ${disposition.tel?if_exists}
                </div>
            </div>
        </div>
        <#if disposition.email??>
            <div class="form-horizontal">
                <div class="control-group">
                    <label class="control-label">邮箱:</label>
                    <div class="controls">
                    ${disposition.email?if_exists}
                    </div>
                </div>
            </div>
        </#if>
        <#if disposition.address??>
            <div class="form-horizontal">
                <div class="control-group">
                    <label class="control-label">地址:</label>
                    <div class="controls">
                    ${disposition.address?if_exists}
                    </div>
                </div>
            </div>
        </#if>
        <#if disposition.other??>
            <div class="form-horizontal">
                <div class="control-group">
                    <label class="control-label">地址:</label>
                    <div class="controls">
                    ${disposition.other?if_exists}
                    </div>
                </div>
            </div>
        </#if>
            <div class="form-horizontal">
                <div class="control-group">
                    <label class="control-label">状态:</label>
                    <div class="controls">
                        <#if disposition.status=1>
                            已处理
                        <#else >
                            未处理
                        </#if>
                    </div>
                </div>
            </div>
        <div class="form-horizontal">
            <div class="control-group">
                <label class="control-label"></label>
                <div class="controls">
                    <button class="btn" type="button" onclick="goTo('${ctx}/bo/disposition/list')">返回</button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>