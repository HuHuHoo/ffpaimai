<!DOCTYPE html><!--[if IE 7 ]><html class="ie7" lang="en"><![endif]--><!--[if IE 8 ]><html class="ie8" lang="en"><![endif]--><!--[if IE 9 ]><html class="ie9" lang="en"><![endif]--><!--[if (gte IE 10)|!(IE)]><!-->
<html xmlns="http://www.w3.org/1999/xhtml" lang="en-US"><!--<![endif]-->
<head>
    <title>牌品详情</title>
</head>
<body>
    <div class="p_banner"></div>
    <div id="ib-main-wrapper" class="ib-main-wrapper">
        <div class="ib-main" id="naviSlider3">
            <li sindex="1" class="on"><a class="ib-content">
                <div class="ib-teaser">${goods.type.desc}</div>
            </a></li>
            <div class="clr"></div>
        </div>
        <!-- ib-main --></div>
    <!-- ib-main-wrapper -->
    <div class="row clearfix">
        <div class="not_box clearfix">
            <dl class="x_4 clearfix" id="x_6">
                <dt><img src="${ctx}${goods.image}"
                         tppabs="${ctx}${goods.image}"></dt>
                <dd class="d_1">${goods.name?if_exists}</dd>
                <dd class="d_2">起拍价(RMB)：${goods.price?if_exists}<br>拍卖日期：${goods.tradeDate?if_exists}<br>状态：${goods.state?if_exists}</dd>


                <dd class="d_4">
                    <#if pre??>
                        <span class="s_1">
                            <a href="${ctx}/home/goods/${pre?c}">&lt;&nbsp;上一条</a>
                        </span>
                    </#if>
                    <#if after??>
                        <span class="s_2">
                        <a href="${ctx}/home/goods/${after?c}">下一条&nbsp;&gt;</a>
                    </span>
                    </#if>
                </dd>
                <dd class="d_3 clearfix">
                    <span class="s_1">
                        <a href="${ctx}/home/signUp" target="_top">竞拍报名</a>
                    </span>
                </dd>
            </dl>
            <dl class="x_7">
                <dt>详细</dt>
                <dd></dd>
                    ${goods.detail?default("暂无详情")}
                <dd></dd>
                </dd>
            </dl>
        </div>
    </div>
<!-- Back to top --><!-- 公共Scripts -->
<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"
        tppabs="${ctx}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/zzsc.js"
        tppabs="${ctx}/static/js/zzsc.js"></script>
<!--滚动图片-->
<script type="text/javascript" src="${ctx}/static/js/rs-plugin/js/jquery.themepunch.revolution.min.js"
        tppabs="${ctx}/static/js/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/theme20.js"
        tppabs="${ctx}/static/js/theme20.js"></script>
<script type="text/javascript" src="${ctx}/static/js/jquery.nicescroll.min.js"
        tppabs="${ctx}/static/js/jquery.nicescroll.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/custom.js"
        tppabs="${ctx}/static/js/custom.js"></script>
<script type="text/javascript">    /* <![CDATA[ */
var tpj = jQuery;
tpj.noConflict();
tpj(document).ready(function () {
    if (tpj.fn.cssOriginal != undefined)
        tpj.fn.css = tpj.fn.cssOriginal;
    var api = tpj('.revolution').revolution({
        delay: 6000,
        startheight: 410,
        startwidth: 1140,
        navigationType: "bullet",
        navigationArrows: "solo",
        navigationStyle: "round",
        touchenabled: "on",
        onHoverStop: "on",
        navOffsetHorizontal: 0,
        navOffsetVertical: 20,
        shadow: 0
    });
});
/* ]]> */
</script>
<!-- 公共Scripts --></body>
</html>