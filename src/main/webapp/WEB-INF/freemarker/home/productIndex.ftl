<!DOCTYPE html><!--[if IE 7 ]><html class="ie7" lang="en"><![endif]--><!--[if IE 8 ]><html class="ie8" lang="en"><![endif]--><!--[if IE 9 ]><html class="ie9" lang="en"><![endif]--><!--[if (gte IE 10)|!(IE)]><!-->
<html xmlns="http://www.w3.org/1999/xhtml" lang="en-US"><!--<![endif]-->
<head>
    <title>PH</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
    <!-- Seo Meta --><!-- Styles -->
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/bootstrap.css" media="screen"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/default.css" media="screen"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/style.css" media="screen"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/icons.css" media="screen"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/animate.css" media="screen"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/settings.css" media="screen"/>
    <!-- Revolution Slider -->
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/responsive.css" media="screen"/>
    <!-- Favicon --><!--[if IE]>
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=EmulateIE8; IE=EDGE"/>
    <script language="javascript" type="text/javascript" src="${ctx}/static/js/html5.js"></script>
    <script language="javascript" type="text/javascript" src="${ctx}/static/js/excanvas.min.js"></script><![endif]-->
</head>
<body>
<div class="not_box clearfix">
    <h2>${type.desc}</h2>
<#if result?has_content>
    <#list result as goods>
        <dl class="x_4 clearfix" <#if goods_index=1||goods_index=3> id="x_5"</#if>>
            <dt><img src="${ctx}${goods.image?if_exists}"
                     tppabs="${ctx}${goods.image?if_exists}"></dt>
            <dd class="d_1">${goods.name?if_exists}</dd>
            <dd class="d_2">起拍价(RMB)：<br> 拍卖日期：${goods.tradeDate?if_exists}<br> 状态：</dd>
            <dd class="d_3 clearfix"><span class="s_1"><a href="${ctx}/home/signUp"
                                                          tppabs="${ctx}/home/signUp" target="_top">竞拍报名</a></span><span
                    class="s_2"><a href="${ctx}/home/goods/${goods.id?c}" tppabs="${ctx}/home/goods/${goods.id?c}"
                                   target="_top">详细 &gt;&gt;</a></span></dd>
        </dl>
    </#list>
</#if>
</div>
<div class="not_next clearfix">
<#if pre??>
    <p class="p_1">
        <a href="${ctx}/home/product/${type}/${pre?c}" tppabs="${ctx}/home/product/${type}/${pre?c}">&lt;&nbsp;上一页</a>
    </p>
</#if>
<#if after??>
    <p class="p_2">
        <a href="${ctx}/home/product/${type}/${after?c}" tppabs="${ctx}/home/product/${type}/${after?c}">下一页&nbsp;&gt;</a>
    </p>
</#if>
</div>
</body>
</html>