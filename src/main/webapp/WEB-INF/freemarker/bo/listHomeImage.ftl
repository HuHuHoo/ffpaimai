<html>
<head>
    <title>首页图片</title>
    <script src="${ctx}/static/bo/bootstrap/js/bootstrap-carousel.js"></script>
</head>
<body>
<div class="span10">
    <div class="hero-unit">
        <h4>首页图片</h4>

        <#if images?has_content>
            <#list images as image>
                <form id="upload" name="upload" action="${ctx}/bo/homeImage/upload/${image.id?c}" method="POST" enctype="multipart/form-data">
                    <div class="control-group">
                        <h5>${image.name?if_exists}</h5>
                    </div>
                    <div class="controls">
                        <img src="${image.path?if_exists}" class="img-polaroid"/>
                    </div>
                    <div class="control-group">
                        <label class="control-label"></label>
                        <input id="upload" name="upload" type="file" multiple/>
                    </div>
                    <div class="control-group">
                        <input type="submit" value="上传" class="btn btn-info"/>
                    </div>
                </form>
            </#list>
        </#if>
    </div>
</body>
</html>