<!DOCTYPE html><!--[if IE 7 ]><html class="ie7" lang="en"><![endif]--><!--[if IE 8 ]><html class="ie8" lang="en"><![endif]--><!--[if IE 9 ]><html class="ie9" lang="en"><![endif]--><!--[if (gte IE 10)|!(IE)]><!-->
<html xmlns="http://www.w3.org/1999/xhtml" lang="en-US"><!--<![endif]-->
<head>
    <title>拍卖公告</title>
</head>
<body>
<div class="p_banner"></div>
<div class="newtab">
    <div id="ib-main-wrapper" class="ib-main-wrapper">
        <div class="ib-main">
                <span class="idTabs">
                    <a href="#" rel="#locA" class="locOn">买受人须知</a><a href="#" rel="#locB">拍卖流程</a><a href="#" rel="#locC">拍卖法规</a><a href="#" rel="#locD"> 拍卖分析</a><a href="#" rel="#locE">常见问题</a></span>

            <div class="clr"></div>
        </div>
    </div>
    <div class="row" style="padding-bottom:50px;">
        <ul id="locA" class="loc">
            <iframe scrolling="no" frameborder="0" id="page" name="page" src="${ctx}/home/content/index/instruction/0" class="not_page" allowtransparency="true"></iframe>
        </ul>
        <!--2-->
        <ul id="locB" class="loc">
            <iframe scrolling="no" frameborder="0" id="page" name="page" src="${ctx}/home/content/index/flow/0" class="not_page" allowtransparency="true"></iframe>
        </ul>
        <ul id="locC" class="loc">
            <iframe scrolling="no" frameborder="0" id="page" name="page" src="${ctx}/home/content/index/law/0" class="not_page" allowtransparency="true"></iframe>
        </ul>
        <ul id="locD" class="loc">
            <iframe scrolling="no" frameborder="0" id="page" name="page" src="${ctx}/home/content/index/analysis/0" class="not_page" allowtransparency="true"></iframe>
        </ul>
        <ul id="locE" class="loc">
            <iframe scrolling="no" frameborder="0" id="page" name="page" src="${ctx}/home/content/index/question/0" class="not_page" allowtransparency="true"></iframe>
        </ul>
    </div>
</div>
<div id="toTop"><i class="icon-angle-up"></i></div>
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
<script type="text/javascript">  /* <![CDATA[ */
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
<!-- 公共Scripts --><!--滚动-->
<script type="text/javascript" src="${ctx}/static/js/jquery.kinetic.js" tppabs="${ctx}/static/js/jquery.kinetic.js"></script>
<script type="text/javascript">        (function ($) {
    $(function () {

        var $ibWrapper = $('#ib-main-wrapper'),

                Template = (function () {

                    // true if dragging the container
                    var kinetic_moving = false,
                    // current index of the opened item
                            current = -1,
                    // true if the item is being opened / closed
                            isAnimating = false,
                    // items on the grid
                            $ibItems = $ibWrapper.find('div.ib-main > a'),
                    // image items on the grid
                            $ibImgItems = $ibItems.not('.ib-content'),
                    // total image items on the grid
                            imgItemsCount = $ibImgItems.length,
                            init = function () {

                                // add a class ib-image to the image items
                                $ibImgItems.addClass('ib-image');
                                // apply the kinetic plugin to the wrapper
                                loadKinetic();
                                // load some events
                                initEvents();

                            },
                            loadKinetic = function () {

                                setWrapperSize();

                                $ibWrapper.kinetic({
                                    moved: function () {

                                        kinetic_moving = true;

                                    },
                                    stopped: function () {

                                        kinetic_moving = false;

                                    }
                                });

                            },
                            setWrapperSize = function () {

                                var containerMargins = $('#ib-top').outerHeight(true) + $('#header').outerHeight(true) + parseFloat($ibItems.css('margin-top'));
                                $ibWrapper.css('height', $(window).height() - containerMargins)

                            },
                            initEvents = function () {

                                // open the item only if not dragging the container
                                $ibItems.bind('click.ibTemplate', function (event) {

                                    if (!kinetic_moving)
                                        openItem($(this));

                                    return false;

                                });

                                // on window resize, set the wrapper and preview size accordingly
                                $(window).bind('resize.ibTemplate', function (event) {

                                    setWrapperSize();

                                    $('#ib-img-preview, #ib-content-preview').css({
                                        width: $(window).width(),
                                        height: $(window).height()
                                    })

                                });

                            },
                            openItem = function ($item) {

                                if (isAnimating) return false;

                                // if content item
                                if ($item.hasClass('ib-content')) {

                                    isAnimating = true;
                                    current = $item.index('.ib-content');
                                    loadContentItem($item, function () {
                                        isAnimating = false;
                                    });

                                }
                                // if image item
                                else {

                                    isAnimating = true;
                                    current = $item.index('.ib-image');
                                    loadImgPreview($item, function () {
                                        isAnimating = false;
                                    });

                                }

                            },
                    // opens one image item (fullscreen)
                            loadImgPreview = function ($item, callback) {

                                var largeSrc = $item.children('img').data('largesrc'),
                                        description = $item.children('span').text(),
                                        largeImageData = {
                                            src: largeSrc,
                                            description: description
                                        };

                                // preload large image
                                $item.addClass('ib-loading');

                                preloadImage(largeSrc, function () {

                                    $item.removeClass('ib-loading');

                                    var hasImgPreview = ( $('#ib-img-preview').length > 0 );

                                    if (!hasImgPreview)
                                        $('#previewTmpl').tmpl(largeImageData).insertAfter($ibWrapper);
                                    else
                                        $('#ib-img-preview').children('img.ib-preview-img')
                                                .attr('src', largeSrc)
                                                .end()
                                                .find('span.ib-preview-descr')
                                                .text(description);

                                    //get dimentions for the image, based on the windows size
                                    var dim = getImageDim(largeSrc);

                                    $item.removeClass('ib-img-loading');

                                    //set the returned values and show/animate preview
                                    $('#ib-img-preview').css({
                                        width: $item.width(),
                                        height: $item.height(),
                                        left: $item.offset().left,
                                        top: $item.offset().top
                                    }).children('img.ib-preview-img').hide().css({
                                        width: dim.width,
                                        height: dim.height,
                                        left: dim.left,
                                        top: dim.top
                                    }).fadeIn(400).end().show().animate({
                                        width: $(window).width(),
                                        left: 0
                                    }, 500, 'easeOutExpo', function () {

                                        $(this).animate({
                                            height: $(window).height(),
                                            top: 0
                                        }, 400, function () {

                                            var $this = $(this);
                                            $this.find('span.ib-preview-descr, span.ib-close').show()
                                            if (imgItemsCount > 1)
                                                $this.find('div.ib-nav').show();

                                            if (callback) callback.call();

                                        });

                                    });

                                    if (!hasImgPreview)
                                        initImgPreviewEvents();

                                });

                            },
                    // opens one content item (fullscreen)
                            loadContentItem = function ($item, callback) {

                                var hasContentPreview = ( $('#ib-content-preview').length > 0 ),
                                        teaser = $item.children('div.ib-teaser').html(),
                                        content = $item.children('div.ib-content-full').html(),
                                        contentData = {
                                            teaser: teaser,
                                            content: content
                                        };

                                if (!hasContentPreview)
                                    $('#contentTmpl').tmpl(contentData).insertAfter($ibWrapper);

                                //set the returned values and show/animate preview
                                $('#ib-content-preview').css({
                                    width: $item.width(),
                                    height: $item.height(),
                                    left: $item.offset().left,
                                    top: $item.offset().top
                                }).show().animate({
                                    width: $(window).width(),
                                    left: 0
                                }, 500, 'easeOutExpo', function () {

                                    $(this).animate({
                                        height: $(window).height(),
                                        top: 0
                                    }, 400, function () {

                                        var $this = $(this),
                                                $teaser = $this.find('div.ib-teaser'),
                                                $content = $this.find('div.ib-content-full'),
                                                $close = $this.find('span.ib-close');

                                        if (hasContentPreview) {
                                            $teaser.html(teaser)
                                            $content.html(content)
                                        }

                                        $teaser.show();
                                        $content.show();
                                        $close.show();

                                        if (callback) callback.call();

                                    });

                                });

                                if (!hasContentPreview)
                                    initContentPreviewEvents();

                            },
                    // preloads an image
                            preloadImage = function (src, callback) {

                                $('<img/>').load(function () {

                                    if (callback) callback.call();

                                }).attr('src', src);

                            },
                    // load the events for the image preview : navigation ,close button, and window resize
                            initImgPreviewEvents = function () {

                                var $preview = $('#ib-img-preview');

                                $preview.find('span.ib-nav-prev').bind('click.ibTemplate', function (event) {

                                    navigate('prev');

                                }).end().find('span.ib-nav-next').bind('click.ibTemplate', function (event) {

                                    navigate('next');

                                }).end().find('span.ib-close').bind('click.ibTemplate', function (event) {

                                    closeImgPreview();

                                });

                                //resizing the window resizes the preview image
                                $(window).bind('resize.ibTemplate', function (event) {

                                    var $largeImg = $preview.children('img.ib-preview-img'),
                                            dim = getImageDim($largeImg.attr('src'));

                                    $largeImg.css({
                                        width: dim.width,
                                        height: dim.height,
                                        left: dim.left,
                                        top: dim.top
                                    })

                                });

                            },
                    // load the events for the content preview : close button
                            initContentPreviewEvents = function () {

                                $('#ib-content-preview').find('span.ib-close').bind('click.ibTemplate', function (event) {

                                    closeContentPreview();

                                });

                            },
                    // navigate the image items in fullscreen mode
                            navigate = function (dir) {

                                if (isAnimating) return false;

                                isAnimating = true;

                                var $preview = $('#ib-img-preview'),
                                        $loading = $preview.find('div.ib-loading-large');

                                $loading.show();

                                if (dir === 'next') {

                                    ( current === imgItemsCount - 1 ) ? current = 0 : ++current;

                                }
                                else if (dir === 'prev') {

                                    ( current === 0 ) ? current = imgItemsCount - 1 : --current;

                                }

                                var $item = $ibImgItems.eq(current),
                                        largeSrc = $item.children('img').data('largesrc'),
                                        description = $item.children('span').text();

                                preloadImage(largeSrc, function () {

                                    $loading.hide();

                                    //get dimentions for the image, based on the windows size
                                    var dim = getImageDim(largeSrc);

                                    $preview.children('img.ib-preview-img')
                                            .attr('src', largeSrc)
                                            .css({
                                                width: dim.width,
                                                height: dim.height,
                                                left: dim.left,
                                                top: dim.top
                                            })
                                            .end()
                                            .find('span.ib-preview-descr')
                                            .text(description);

                                    $ibWrapper.scrollTop($item.offset().top)
                                            .scrollLeft($item.offset().left);

                                    isAnimating = false;

                                });

                            },
                    // closes the fullscreen image item
                            closeImgPreview = function () {

                                if (isAnimating) return false;

                                isAnimating = true;

                                var $item = $ibImgItems.eq(current);

                                $('#ib-img-preview').find('span.ib-preview-descr, div.ib-nav, span.ib-close')
                                        .hide()
                                        .end()
                                        .animate({
                                            height: $item.height(),
                                            top: $item.offset().top
                                        }, 500, 'easeOutExpo', function () {

                                            $(this).animate({
                                                width: $item.width(),
                                                left: $item.offset().left
                                            }, 400, function () {

                                                $(this).fadeOut(function () {
                                                    isAnimating = false;
                                                });

                                            });

                                        });

                            },
                    // closes the fullscreen content item
                            closeContentPreview = function () {

                                if (isAnimating) return false;

                                isAnimating = true;

                                var $item = $ibItems.not('.ib-image').eq(current);

                                $('#ib-content-preview').find('div.ib-teaser, div.ib-content-full, span.ib-close')
                                        .hide()
                                        .end()
                                        .animate({
                                            height: $item.height(),
                                            top: $item.offset().top
                                        }, 500, 'easeOutExpo', function () {

                                            $(this).animate({
                                                width: $item.width(),
                                                left: $item.offset().left
                                            }, 400, function () {

                                                $(this).fadeOut(function () {
                                                    isAnimating = false;
                                                });

                                            });

                                        });

                            },
                    // get the size of one image to make it full size and centered
                            getImageDim = function (src) {

                                var img = new Image();
                                img.src = src;

                                var w_w = $(window).width(),
                                        w_h = $(window).height(),
                                        r_w = w_h / w_w,
                                        i_w = img.width,
                                        i_h = img.height,
                                        r_i = i_h / i_w,
                                        new_w, new_h,
                                        new_left, new_top;

                                if (r_w > r_i) {

                                    new_h = w_h;
                                    new_w = w_h / r_i;

                                }
                                else {

                                    new_h = w_w * r_i;
                                    new_w = w_w;

                                }

                                return {
                                    width: new_w,
                                    height: new_h,
                                    left: (w_w - new_w) / 2,
                                    top: (w_h - new_h) / 2
                                };

                            };

                    return { init: init };

                })();

        Template.init();

    });
})(jQuery)
</script>
<!--滚动-->
<script type="text/javascript" src="${ctx}/static/js/jquery.idTabs.min.js"
        tppabs="${ctx}/static/js/jquery.idTabs.min.js"></script>
</body>
</html>