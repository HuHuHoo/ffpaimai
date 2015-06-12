<html>
	<head>
		<title>拍品详情</title>
	</head>
	<body>
		<div class="span10">
			<div class="hero-unit">
				<h4>拍品详情</h4>
				<#include "message.ftl"/>
				<div class="form-horizontal">
					<div class="control-group">
				    	<label class="control-label">拍品名称:</label>
			    		<div class="controls">
			    			${goods.name?if_exists}
			    		</div>
				  	</div>
                </div>
                <div class="form-horizontal">
					<div class="control-group">
				    	<label class="control-label">拍品类别:</label>
			    		<div class="controls">
			    			${goods.type?if_exists}
			    		</div>
				  	</div>
                 </div>
                <div class="form-horizontal">
					<div class="control-group">
				    	<label class="control-label">时间:</label>
			    		<div class="controls">
			    			${goods.tradeDate?if_exists}
			    		</div>
				  	</div>
                 </div>
                <div class="form-horizontal">
					<div class="control-group">
				    	<label class="control-label">价格:</label>
			    		<div class="controls">
			    			${goods.price?if_exists}
			    		</div>
				  	</div>
                 </div>
                <div class="form-horizontal">
					<div class="control-group">
				    	<label class="control-label">状态:</label>
			    		<div class="controls">
			    			${goods.state?if_exists}
			    		</div>
				  	</div>
                 </div>
                <div class="form-horizontal">
					<div class="control-group">
				    	<label class="control-label">图片:</label>
			    		<div class="controls" >
                            <img src="${goods.image?if_exists}"  style="width: 200px" height="200px"/>
			    		</div>
				  	</div>
                </div>
                <div class="form-horizontal">
					<div class="control-group">
				    	<label class="control-label">是否显示:</label>
			    		<div class="controls" >
                            <#if goods.status==0>否<#else>是</#if>
			    		</div>
				  	</div>
                </div>
                <div class="form-horizontal">
					<div class="control-group">
				    	<label class="control-label">详情:</label>
			    		<div class="controls" >
                           ${goods.detail?if_exists}
			    		</div>
				  	</div>
                </div>
                <div class="form-horizontal">
                    <div class="control-group">
                        <label class="control-label"></label>
                        <div class="controls">
                            <button class="btn" type="button" onclick="goTo('${ctx}/bo/article/goods/${goods.id?c}')">编辑详情</button>
                            <button class="btn" type="button" onclick="goTo('${ctx}/bo/goods/list')">返回</button>
                        </div>
                    </div>
                </div>
			</div>
		</div>
	</body>
</html>