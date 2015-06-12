<html>
<head>
    <title><#if announceId??>编辑<#else>添加</#if>公告</title>
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
        <h4><#if announceId??>修改<#else>添加</#if>公告</h4>
    <#include "message.ftl"/>
        <form id="addOrModifyAnnounce" class="form-horizontal" action="${ctx}/bo/announce/addOrModify" method="POST">
        <#if announceId??>
            <input type="hidden" name="announceId" value="${announceId?c}"/>
        </#if>
            <div class="control-group">
                <label class="control-label" for="name">名称</label>
                <div class="controls">
                    <input type="text" required  id="name" name="name" placeholder="名称" <#if announce??>value="${announce.name?if_exists}" </#if>>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="location">拍卖地点</label>
                <div class="controls">
                    <input type="text" required  id="location" name="location" placeholder="地点" <#if announce??>value="${announce.location?if_exists}" </#if>>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="tradeDate">拍卖日期</label>
                <div class="controls">
                    <input type="text" required  id="tradeDate" name="tradeDate" placeholder="拍卖日期" <#if announce??>value="${announce.tradeDate?if_exists}" </#if>>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="name">是否显示</label>
                <div class="controls">
                    <select required id="status" name="status">
                        <option value="1" <#if announce?exists &&(announce.status=1)> selected </#if>>是</option>
                        <option value="0" <#if announce?exists &&(announce.status=0)> selected </#if>>否 </option>
                    </select>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="recommend">是否推荐</label>
                <div class="controls">
                    <select required id="recommend" name="recommend">
                        <option value="1" <#if announce?exists &&(announce.recommend=1)> selected </#if>>是</option>
                        <option value="0" <#if announce?exists &&(announce.recommend=0)> selected </#if>>否 </option>
                    </select>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="name">是否最新</label>
                <div class="controls">
                    <select required id="fresh" name="fresh">
                        <option value="1" <#if announce?exists &&(announce.fresh=1)> selected </#if>>是</option>
                        <option value="0" <#if announce?exists &&(announce.fresh=0)> selected </#if>>否 </option>
                    </select>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="summary">公告摘要</label>
                <div class="controls">
                    <textarea class="span6" id="summary" name="summary"><#if announce??>${announce.summary?if_exists}</#if></textarea>
                </div>
            </div>
            <div class="control-group">
                <div class="hero-unit">
                    <h5>详情</h5>
                    <textarea name="detail"><#if announce??>${announce.detail?if_exists}</#if></textarea>
                </div>
            </div>

            <div class="control-group">
                <div class="controls">
                    <input class="btn btn-primary" type="submit" value="确认"/><button class="btn" type="button" onclick="goTo('${ctx}/bo/announce/list')">返回</button>
                </div>
            </div>


        </form>
    </div>
</div>
</body>
</html>