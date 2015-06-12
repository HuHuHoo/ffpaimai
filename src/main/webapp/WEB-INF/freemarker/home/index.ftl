<html>
    <head>
        <title>首页</title>
        <script type="text/javascript" src="${ctx}/static/js/jquery_004.js"></script>
        <script type="text/javascript" src="${ctx}/static/js/theme20.js"></script>
        <script type="text/javascript" src="${ctx}/static/js/jquery_002.js"></script>
        <script type="text/javascript" src="${ctx}/static/js/custom.js"></script>

        <script type="text/javascript" src="${ctx}/static/js/jssor.core.js"></script>
        <script type="text/javascript" src="${ctx}/static/js/jssor.utils.js"></script>
        <script type="text/javascript" src="${ctx}/static/js/jssor.slider.js"></script>
    </head>
    <body>
        <div class="sliderr">
            <div id="kinMaxShow">
                <#if images?has_content>
                    <#list images as image>
                        <div style="width: 100%;height: 405px">
                            <a href="" target="_blank"><img src="http://www.ffpaimai.com:8000${image.path?if_exists}" /></a>
                        </div>
                    </#list>
                </#if>

            </div>
        </div>
        <div class="page-content1">
            <div class="row">
                <div style="" class="grid_1 animated fadeInUp" data-gen="fadeInUp" id="quotation">
                    <h3>拍卖公告</h3>
                    <ul style="margin-top: 0px;">
                        <#if announces?has_content>
                            <#list announces as announce>
                                <li style="display: list-item;">
                                    <a href="${ctx}/home/announce/detail/${announce.id?c}/-1/-1">
                                        <b>${announce.name?if_exists}</b>
                                        <p>拍卖时间： ${announce.tradeDate?if_exists}</p>
                                        <p>拍卖地点：${announce.location?default("地点内详")}</p>
                                    </a>
                                </li>
                            </#list>
                        </#if>


                    </ul>
                </div>
                <div class="services mbs clearfix">
                    <div style="opacity: 0;" class="grid_3 animated" data-gen="fadeInUp">
                        <a href="http://pm.caa123.org.cn/"><img src="${ctx}/static/imgs/hang.jpg"></a>
                    </div>
                    <div style="opacity: 0;" class="grid_2 animated" data-gen="fadeInUp">
                        <b>关于拍卖</b>
                        <p><a href="${ctx}/home/rules">买受人须知</a></p>
                        <p><a href="${ctx}/home/rules">拍卖技巧</a></p>
                        <p><a href="${ctx}/home/rules">拍卖人守则</a></p>
                        <p><a href="${ctx}/home/rules">拍卖方式</a></p>
                        <p><a href="${ctx}/home/rules">委托人须知</a></p>
                        <p><a href="${ctx}/home/rules">如何参与竞买</a></p>
                        <p><a href="${ctx}/home/rules">竞买人须知</a></p>
                        <p><a href="${ctx}/home/rules">拍卖术语解释</a></p>
                        <b class="b1">友情链接</b><!-- 代码开始 -->
                        <div class="firend">
                            <div class="picbox">
                                <ul style="width: 847px;" class="piclist mainlist">
                                    <li><a href="" target="_blank" title="厦门中级人民法院"><img
                                            src="${ctx}/static/imgs/5347a5313d045.jpg" style="width:107px;height:39px;"></a><a
                                            href="http://rmfysszc.gov.cn/" target="_blank" title="人民法院诉讼资产网"><img
                                            src="${ctx}/static/imgs/5347a60fa604d.jpg" style="width:107px;height:39px;"></a>
                                    </li>
                                    <li><a href="http://www.xm.fjaic.gov.cn/" target="_blank" title="厦门工商局红盾信息网"><img
                                            src="${ctx}/static/imgs/5344f3dca3e8c.jpg" style="width:107px;height:39px;"></a><a
                                            href="http://www.xmcz.gov.cn/" target="_blank" title="厦门市公共资源市场配置网"><img
                                            src="${ctx}/static/imgs/5344f449ddbc3.jpg" style="width:107px;height:39px;"></a>
                                    </li>
                                    <li><a href="http://www.fjaac.com/" target="_blank" title="福建省拍卖行业协会"><img
                                            src="${ctx}/static/imgs/5344f331050ea.jpg" style="width:107px;height:39px;"></a><a
                                            href="http://www.caa123.org.cn/" target="_blank" title="中国拍卖行业协会"><img
                                            src="${ctx}/static/imgs/5344f240319e0.jpg" style="width:107px;height:39px;"></a>
                                    </li>
                                    <li><a href="http://www.chamc.com.cn/" target="_blank" title="中国华融资产管理股份有限公司"><img
                                            src="${ctx}/static/imgs/5344f4e3590de.jpg" style="width:107px;height:39px;"></a><a
                                            href="http://www.cinda.com.cn/" target="_blank" title="中国信达资产管理股份有限公司"><img
                                            src="${ctx}/static/imgs/534506a63e449.jpg" style="width:107px;height:39px;"></a>
                                    </li>
                                    <li><a href="http://www.gwamcc.com/" target="_blank" title="中国长城资产管理公司"><img
                                            src="${ctx}/static/imgs/534507102eee0.jpg" style="width:107px;height:39px;"></a><a
                                            href="http://www.xmhouse.com/" target="_blank" title="厦门房地产联合网"><img
                                            src="${ctx}/static/imgs/5345078b27f26.jpg" style="width:107px;height:39px;"></a>
                                    </li>
                                    <li><a href="http://www.boc.cn/" target="_blank" title="中国银行"><img
                                            src="${ctx}/static/imgs/534507de6bd9d.jpg" style="width:107px;height:39px;"></a><a
                                            href="http://www.icbc.com.cn/" target="_blank" title="中国工商银行"><img
                                            src="${ctx}/static/imgs/5345081aa1725.jpg" style="width:107px;height:39px;"></a>
                                    </li>
                                    <li><a href="http://www.abchina.com/cn/" target="_blank" title="中国农业银行"><img
                                            src="${ctx}/static/imgs/534508544a0ff.jpg" style="width:107px;height:39px;"></a><a
                                            href="http://www.ccb.com/" target="_blank" title="中国建设银行"><img
                                            src="${ctx}/static/imgs/5345088f1bc28.jpg" style="width:107px;height:39px;"></a>
                                    </li>
                                </ul>
                                <ul style="width: 847px;" class="piclist swaplist">
                                    <li><a href="" target="_blank" title="厦门中级人民法院"><img
                                            src="${ctx}/static/imgs/5347a5313d045.jpg" style="width:107px;height:39px;"></a><a
                                            href="http://rmfysszc.gov.cn/" target="_blank" title="人民法院诉讼资产网"><img
                                            src="${ctx}/static/imgs/5347a60fa604d.jpg" style="width:107px;height:39px;"></a>
                                    </li>
                                    <li><a href="http://www.xm.fjaic.gov.cn/" target="_blank" title="厦门工商局红盾信息网"><img
                                            src="${ctx}/static/imgs/5344f3dca3e8c.jpg" style="width:107px;height:39px;"></a><a
                                            href="http://www.xmcz.gov.cn/" target="_blank" title="厦门市公共资源市场配置网"><img
                                            src="${ctx}/static/imgs/5344f449ddbc3.jpg" style="width:107px;height:39px;"></a>
                                    </li>
                                    <li><a href="http://www.fjaac.com/" target="_blank" title="福建省拍卖行业协会"><img
                                            src="${ctx}/static/imgs/5344f331050ea.jpg" style="width:107px;height:39px;"></a><a
                                            href="http://www.caa123.org.cn/" target="_blank" title="中国拍卖行业协会"><img
                                            src="${ctx}/static/imgs/5344f240319e0.jpg" style="width:107px;height:39px;"></a>
                                    </li>
                                    <li><a href="http://www.chamc.com.cn/" target="_blank" title="中国华融资产管理股份有限公司"><img
                                            src="${ctx}/static/imgs/5344f4e3590de.jpg" style="width:107px;height:39px;"></a><a
                                            href="http://www.cinda.com.cn/" target="_blank" title="中国信达资产管理股份有限公司"><img
                                            src="${ctx}/static/imgs/534506a63e449.jpg" style="width:107px;height:39px;"></a>
                                    </li>
                                    <li><a href="http://www.gwamcc.com/" target="_blank" title="中国长城资产管理公司"><img
                                            src="${ctx}/static/imgs/534507102eee0.jpg" style="width:107px;height:39px;"></a><a
                                            href="http://www.xmhouse.com/" target="_blank" title="厦门房地产联合网"><img
                                            src="${ctx}/static/imgs/5345078b27f26.jpg" style="width:107px;height:39px;"></a>
                                    </li>
                                    <li><a href="http://www.boc.cn/" target="_blank" title="中国银行"><img
                                            src="${ctx}/static/imgs/534507de6bd9d.jpg" style="width:107px;height:39px;"></a><a
                                            href="http://www.icbc.com.cn/" target="_blank" title="中国工商银行"><img
                                            src="${ctx}/static/imgs/5345081aa1725.jpg" style="width:107px;height:39px;"></a>
                                    </li>
                                    <li><a href="http://www.abchina.com/cn/" target="_blank" title="中国农业银行"><img
                                            src="${ctx}/static/imgs/534508544a0ff.jpg" style="width:107px;height:39px;"></a><a
                                            href="http://www.ccb.com/" target="_blank" title="中国建设银行"><img
                                            src="${ctx}/static/imgs/5345088f1bc28.jpg" style="width:107px;height:39px;"></a>
                                    </li>
                                </ul>
                            </div>
                            <div class="og_prev"></div>
                            <div class="og_next"></div>
                        </div>
                    </div>
                </div>
                <!-- services -->
                <div class="i_content">
                    <div class="i_news"><p class="p_1">新闻中心</p>
                    <#if contents?has_content>
                        <#list contents as content>
                            <#if (content_index=0)>
                                <dl>
                                    <dt>
                                        <a href="${ctx}/home/content/detail/${content.id?c}" target="_blank"><img src="${ctx}/static/images/news.jpg"></a>
                                    </dt>
                                    <dd class="d_1">
                                        <a href="${ctx}/home/content/detail/${content.id?c}/news" target="_blank">${content.name?if_exists}</a>
                                    </dd>
                                    <dd class="d_2">
                                        <a href="${ctx}/home/content/detail/${content.id?c}/news" target="_blank">${content.summary?if_exists}</a>
                                    </dd>
                                </dl>
                            <#else>
                                <#if content_index =5>
                                    <#break>
                                </#if>
                                <li>
                                    <a href="${ctx}/home/content/detail/${content.id?c}/news" target="_blank">${content.name?if_exists}</a>
                                </li>
                            </#if>
                        </#list>
                    </#if>
                    </div>
                    <div class="i_about"><p class="p_1">关于方分</p>

                        <p class="p_2"><a href=${ctx}/home/aboutUs target="_blank"><img
                                src="${ctx}/static/imgs/img2.jpg"></a></p>

                        <p class="p_3">厦门市方分拍卖有限公司是经厦门市商务局批准，2014年于厦门市工商局注册成立的拍卖企业。公司注册资金1000万元，公司拥有自有产权办公场所面积1631平方米，
                            其中设有500平方米的多功能拍卖大厅，能同时容纳200多人参加拍卖，拍卖大厅设施齐全，配备专业投影、音响和闭路监控系统等现代化办公设备.</p></div>
                    <div class="i_product">
                        <div id="slider1_container" style="position: relative; top: 0px; left: 0px; width: 809px; height: 160px; overflow: hidden;" >

                            <!-- Loading Screen -->
                            <div u="loading" style="position: absolute; top: 0px; left: 0px;">
                                <div style="filter: alpha(opacity=70); opacity:0.7; position: absolute; display: block;background-color: #000; top: 0px; left: 0px;width: 100%;height:100%;">
                                </div>
                                <div style="position: absolute; display: block; no-repeat center center;top: 0px; left: 0px;width: 100%;height:100%;">
                                </div>
                            </div>

                            <!-- Slides Container -->
                            <div u="slides" style="cursor: move; position: absolute; left: 0px; top: 0px; width: 809px; height: 160px; overflow: hidden;">

                                <#if goodsList?has_content>
                                    <#list goodsList as goods>


                                        <div >
                                            <a href="${ctx}/home/goods/${goods.id?c}" style="height:160px;width:150px">
                                                <img u="image" src="${ctx}${goods.image?if_exists}" style="height:130px;width:150px;">
                                                <p>${goods.name?if_exists}</p>
                                            </a>
                                        </div>
                                    </#list>
                                </#if>
                            </div>
                        </div>
                        <script>
                            jQuery(document).ready(function ($) {
                                var options = {
                                    $AutoPlay: true,                                    //[Optional] Whether to auto play, to enable slideshow, this option must be set to true, default value is false
                                    $AutoPlaySteps: 4,                                  //[Optional] Steps to go for each navigation request (this options applys only when slideshow disabled), the default value is 1
                                    $AutoPlayInterval: 2000,                            //[Optional] Interval (in milliseconds) to go for next slide since the previous stopped if the slider is auto playing, default value is 3000
                                    $PauseOnHover: 1,                               //[Optional] Whether to pause when mouse over if a slider is auto playing, 0 no pause, 1 pause for desktop, 2 pause for touch device, 3 pause for desktop and touch device, default value is 1

                                    $ArrowKeyNavigation: true,   			            //[Optional] Allows keyboard (arrow key) navigation or not, default value is false
                                    $SlideDuration: 160,                                //[Optional] Specifies default duration (swipe) for slide in milliseconds, default value is 500
                                    $MinDragOffsetToSlide: 20,                          //[Optional] Minimum drag offset to trigger slide , default value is 20
                                    $SlideWidth: 200,                                   //[Optional] Width of every slide in pixels, default value is width of 'slides' container
                                    //$SlideHeight: 150,                                //[Optional] Height of every slide in pixels, default value is height of 'slides' container
                                    $SlideSpacing: 3, 					                //[Optional] Space between each slide in pixels, default value is 0
                                    $DisplayPieces: 4,                                  //[Optional] Number of pieces to display (the slideshow would be disabled if the value is set to greater than 1), the default value is 1
                                    $ParkingPosition: 0,                              //[Optional] The offset position to park slide (this options applys only when slideshow disabled), default value is 0.
                                    $UISearchMode: 1,                                   //[Optional] The way (0 parellel, 1 recursive, default value is 1) to search UI components (slides container, loading screen, navigator container, arrow navigator container, thumbnail navigator container etc).
                                    $PlayOrientation: 1,                                //[Optional] Orientation to play slide (for auto play, navigation), 1 horizental, 2 vertical, 5 horizental reverse, 6 vertical reverse, default value is 1
                                    $DragOrientation: 1,                                //[Optional] Orientation to drag slide, 0 no drag, 1 horizental, 2 vertical, 3 either, default value is 1 (Note that the $DragOrientation should be the same as $PlayOrientation when $DisplayPieces is greater than 1, or parking position is not 0)

                                    $BulletNavigatorOptions: {                                //[Optional] Options to specify and enable navigator or not
                                        $Class: $JssorBulletNavigator$,                       //[Required] Class to create navigator instance
                                        $ChanceToShow: 2,                               //[Required] 0 Never, 1 Mouse Over, 2 Always
                                        $AutoCenter: 0,                                 //[Optional] Auto center navigator in parent container, 0 None, 1 Horizontal, 2 Vertical, 3 Both, default value is 0
                                        $Steps: 1,                                      //[Optional] Steps to go for each navigation request, default value is 1
                                        $Lanes: 1,                                      //[Optional] Specify lanes to arrange items, default value is 1
                                        $SpacingX: 0,                                   //[Optional] Horizontal space between each item in pixel, default value is 0
                                        $SpacingY: 0,                                   //[Optional] Vertical space between each item in pixel, default value is 0
                                        $Orientation: 1                                 //[Optional] The orientation of the navigator, 1 horizontal, 2 vertical, default value is 1
                                    },

                                    $ArrowNavigatorOptions: {
                                        $Class: $JssorArrowNavigator$,              //[Requried] Class to create arrow navigator instance
                                        $ChanceToShow: 1,                               //[Required] 0 Never, 1 Mouse Over, 2 Always
                                        $AutoCenter: 2,                                 //[Optional] Auto center navigator in parent container, 0 None, 1 Horizontal, 2 Vertical, 3 Both, default value is 0
                                        $Steps: 4                                       //[Optional] Steps to go for each navigation request, default value is 1
                                    }
                                };

                                var jssor_slider1 = new $JssorSlider$("slider1_container", options);

                                //responsive code begin
                                //you can remove responsive code if you don't want the slider scales while window resizes
                                function ScaleSlider() {
                                    var bodyWidth = document.body.clientWidth;
                                    if (bodyWidth)
                                        jssor_slider1.$SetScaleWidth(Math.min(bodyWidth, 809));
                                    else
                                        window.setTimeout(ScaleSlider, 30);
                                }

                                ScaleSlider();

                                if (!navigator.userAgent.match(/(iPhone|iPod|iPad|BlackBerry|IEMobile)/)) {
                                    $(window).bind('resize', ScaleSlider);
                                }


                                //if (navigator.userAgent.match(/(iPhone|iPod|iPad)/)) {
                                //    $(window).bind("orientationchange", ScaleSlider);
                                //}
                                //responsive code end
                            });
                        </script>
                    </div>
                </div>
            </div>
        </div>

        <!-- 公共Scripts --><!--轮播-->
        <script src="${ctx}/static/js/jquery_003.js" type="text/javascript"></script>
        <script type="text/javascript">
            /* <![CDATA[ */
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
        <script type="text/javascript">
            (function ($) {
                $(function () {
                    $("#kinMaxShow").kinMaxShow();
                });
            })(jQuery)
        </script>
        <!--轮播--><!--文字滚动-->
        <script type="text/javascript">(function ($) {
            $(function () {
                var scrtime;
                $("#quotation").hover(function () {
                    clearInterval(scrtime);

                }, function () {

                    scrtime = setInterval(function () {
                        var $ul = $("#quotation ul");
                        var liHeight = $ul.find("li:last").height();
                        $ul.animate({marginTop: liHeight + 35 + "px"}, 1000, function () {

                            $ul.find("li:last").prependTo($ul)
                            $ul.find("li:first").hide();
                            $ul.css({marginTop: 0});
                            $ul.find("li:first").fadeIn(1000);
                        });
                    }, 4000);

                }).trigger("mouseleave");
            });
        })(jQuery)
        </script>
    </body>
</html>
