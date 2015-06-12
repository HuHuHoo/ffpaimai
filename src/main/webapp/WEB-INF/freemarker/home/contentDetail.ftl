<!DOCTYPE html><!--[if IE 7 ]><html class="ie7" lang="en"><![endif]--><!--[if IE 8 ]><html class="ie8" lang="en"><![endif]--><!--[if IE 9 ]><html class="ie9" lang="en"><![endif]--><!--[if (gte IE 10)|!(IE)]><!-->
<html xmlns="http://www.w3.org/1999/xhtml" lang="en-US"><!--<![endif]-->
<head>
    <title>${type.abbr}</title>
</head>
<body>
    <div class="p_banner"></div>
    <div id="ib-main-wrapper" class="ib-main-wrapper">
        <div class="ib-main" id="naviSlider3">
            <li sindex="1" class="on">
                <a class="ib-content"><div class="ib-teaser">${type.abbr}</div></a>
            </li>
            <div class="clr"></div>
        </div>
    </div>
    <div class="row clearfix">
        <div class="news_more clearfix">
            <h2>${content.name?if_exists}</h2>
            <#if content??>
                <h3>${content.operateDate?string('yyyy-MM-dd')}</h3>
                <div>
                    ${content.detail?if_exists}
                </div>
            </#if>
            <p class="p_1 clearfix">
                <#if pre??>
                    <span class="s_1">
                                <a href="${ctx}/home/content/detail/${pre?c}/${type}">&lt;&nbsp;上一条</a>
                            </span>
                </#if>

                <#if after??>
                    <span class="s_2">
                            <a href="${ctx}/home/content/detail/${after?c}/${type}">下一条&nbsp;&gt;</a>
                            </span>

                </#if>
            </p>
        </div>
    </div>
<!-- end frame -->
    <div id="toTop">
        <i class="icon-angle-up"></i>
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