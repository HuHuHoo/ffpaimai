<!DOCTYPE html><!--[if IE 7 ]>
<html class="ie7" lang="en"><![endif]--><!--[if IE 8 ]>
<html class="ie8" lang="en"><![endif]--><!--[if IE 9 ]>
<html class="ie9" lang="en"><![endif]--><!--[if (gte IE 10)|!(IE)]><!-->
<html xmlns="http://www.w3.org/1999/xhtml" lang="en-US"><!--<![endif]-->
<head><title>${type.abbr}</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
    <!-- Seo Meta -->
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <!-- Styles -->
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/lanrenzhijia.css" />
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/bootstrap.css" media="screen"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/default.css" media="screen"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/style.css"  media="screen"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/icons.css" media="screen"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/animate.css" media="screen"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/csss/settings.css" media="screen"/>
    <!-- Revolution Slider -->
    <link rel="stylesheet" type="text/css" href="${ctx}/static/csss/responsive.css"
          tppabs="${ctx}/static/css/responsive.css" media="screen"/>
    <!-- Favicon --><!--[if IE]>
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=EmulateIE8; IE=EDGE"/>
    <script src="${ctx}/static/js/html5.js"
            tppabs="${ctx}/static/js/html5.js"></script>
    <script language="javascript" type="text/javascript" src="${ctx}/static/js/excanvas.min.js"
            tppabs="${ctx}/static/js/excanvas.min.js"></script><![endif]--></head>
<body>
    <div class="row">
        <div class=" news clearfix">
            <#if contents?has_content>
                <#list contents as content >
                    <dl class="s_1 clearfix" <#if content_index==1 ||content_index=3>id="s_3"</#if>>
                        <dt>${content.name?if_exists}</dt>
                        <dd class="d_1">
                           ${content.summary?default("暂无摘要")}
                        </dd>
                        <dd class="d_2 clearfix">
                            <span class="s_2">
                                <a href="${ctx}/home/content/detail/${content.id?c}/${type}" target="_top">详细&gt;&gt;</a>
                            </span>
                        </dd>
                    </dl>
                </#list>
            </#if>
            <div class="not_next clearfix" id="news_p">
                <#if pre??>
                    <p class="p_1">
                        <a href="${ctx}/home/content/index/${type}/${pre?c}" >&lt;&nbsp;上一页</a>
                    </p>
                </#if>

                <#if after??>
                    <p class="p_2">
                        <a href="${ctx}/home/content/index/${type}/${after?c}">下一页&nbsp;&gt;</a>
                    </p>
                </#if>

            </div>
        </div>
    </div>
<div id="toTop"><i class="icon-angle-up"></i></div>
<!-- Back to top --><!-- 公共Scripts -->
<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"
        tppabs="${ctx}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/zzsc.js"
        tppabs="${ctx}/static/js/zzsc.js"></script>
<!--滚动图片-->
<script type="text/javascript" src="${ctx}/static/js/jquery.themepunch.revolution.min.js"
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