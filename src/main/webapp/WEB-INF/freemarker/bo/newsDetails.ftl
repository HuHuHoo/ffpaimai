<html>
	<head>
		<title>部件详情</title>
		<script src="${ctx}/static/bootstrap/js/bootstrap-carousel.js"></script>
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
			    			${goods.tradeDate?string('yyyy-MM-dd-HH')}
			    		</div>
				  	</div>
                 </div>
                <div class="form-horizontal">
					<div class="control-group">
				    	<label class="control-label">地址:</label>
			    		<div class="controls">
			    			${goods.location?if_exists}
			    		</div>
				  	</div>
                 </div>
                <div class="form-horizontal">
					<div class="control-group">
				    	<label class="control-label">图片:</label>
			    		<div class="controls" style="width: 500px; height: 333px;">
                            <img src="${ctx}${goods.image?if_exists}"/>
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