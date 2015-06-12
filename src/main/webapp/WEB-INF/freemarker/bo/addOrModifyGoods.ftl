<html>
	<head>
		<title><#if goodId??>编辑<#else>添加</#if>部件</title>
        <script language="javascript" type="text/javascript" src="${ctx}/static/bo/ckeditor/ckeditor.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
           		$(function () { $("input,select,textarea").not("[type=submit]").jqBootstrapValidation(); } );
                $(document).ready(function () {
                    CKEDITOR.replace('detail');
                });
           });
        </script>
	</head>
	<body>
		<div class="span10">
			<div class="hero-unit">
				<h4><#if goodsId??>编辑<#else>添加</#if>拍品</h4>
				<#include "message.ftl"/>
				<form id="addOrModifyGoods" class="form-horizontal" action="${ctx}/bo/goods/addOrModify" method="POST"  enctype="multipart/form-data">
					<#if goodsId??>
						<input type="hidden" name="goodsId" value="${goodsId?c}"/>
					</#if>
					<div class="control-group">
				    	<label class="control-label" for="name">拍品名称</label>
			    		<div class="controls">
			      			<input type="text" required  id="name" name="name" placeholder="名称" <#if goods??>value="${goods.name?if_exists}" </#if>>
			    		</div>
				  	</div>
                    <div class="control-group">
                        <label class="control-label" for="name">类型</label>
                        <div class="controls">
                            <select required id="type" name="type">
                                <option value="">请选择类型</option>
                                <#list types as type>
                                    <option value="${type}" <#if goods?exists &&(goods.type=type)> selected </#if>>${type.desc}</option>
                                </#list>
                            </select>
                        </div>
                    </div>
                    <div class="control-group">
				    	<label class="control-label" for="name">拍品日期</label>
			    		<div class="controls">
			      			<input type="text"  id="tradeDate" name="tradeDate" placeholder="日期" <#if goods??>value="${goods.tradeDate?if_exists}" </#if>>
			    		</div>
				  	</div>
                    <div class="control-group">
				    	<label class="control-label" for="name">拍品价格</label>
			    		<div class="controls">
			      			<input type="text" required  id="price" name="price" placeholder="价格" <#if goods??>value="${goods.price?if_exists}" </#if>>
			    		</div>
				  	</div>
                    <div class="control-group">
				    	<label class="control-label" for="name">拍品状态</label>
			    		<div class="controls">
			      			<input type="text" required  id="state" name="state" placeholder="状态" <#if goods??>value="${goods.state?if_exists}" </#if>>
			    		</div>
				  	</div>
                    <#if (goods.image)??>
                        <div class="control-group">
                            <label class="control-label" for="name">图片</label>
                            <div class="controls">
                                <img src="${ctx}${goods.image?if_exists}"/>
                            </div>
                        </div>
                    </#if>
                    <div class="control-group">
                        <label class="control-label" for="name">上传图片</label>
                        <div class="controls">
                            <input <#if !(goodsId??)>  required </#if> id="upload" name="upload" type="file" multiple/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="name">是否显示</label>
                        <div class="controls">
                            <select required id="status" name="status">
                                <option value="1" <#if goods?exists &&(goods.status=1)> selected </#if>>是</option>
                                <option value="0" <#if goods?exists &&(goods.status=0)> selected </#if>>否 </option>
                            </select>
                        </div>
                    </div>
                        <div class="control-group">
                        <label class="control-label" for="name">文章详情</label>
                    </div>
                    <div class="hero-unit">
                        <textarea name="detail"><#if goods??>${goods.detail?if_exists}</#if></textarea>
                    </div>
				  	<div class="control-group">
				    	<div class="controls">
				      		<input class="btn btn-primary" type="submit" value="确认"/><button class="btn" type="button" onclick="goTo('${ctx}/bo/goods/list')">返回</button>
				    	</div>
				  	</div>


				</form>
			</div>
		</div>
	</body>
</html>