<!DOCTYPE html><!--[if IE 7 ]><html class="ie7" lang="en"><![endif]--><!--[if IE 8 ]><html class="ie8" lang="en"><![endif]--><!--[if IE 9 ]><html class="ie9" lang="en"><![endif]--><!--[if (gte IE 10)|!(IE)]><!-->
<html xmlns="http://www.w3.org/1999/xhtml" lang="en-US"><!--<![endif]-->
<head>
    <title>竞拍报名</title>
</head>
<body>
<div class="auction two clearfix">
    <h2>竞拍报名</h2>
    <ul class="clearfix">
        <script>/* js脚本文件
                     ===============================================================
                     ===============================================================
                     */
        //===================取字符的长度================
        function getLen(str) {
            var totallength = 0;
            for (var i = 0; i < str.length; i++) {
                var intCode = str.charCodeAt(i);
                if (intCode >= 0 && intCode <= 128) {
                    totallength = totallength + 1; //非中文单个字符长度加 1
                }
                else {
                    totallength = totallength + 2; //中文字符长度则加 2
                }
            } //end for
            return totallength;
        }
        //===========判断输入是否为空=======================
        function Null_Full(Put_Name, _DvName) {
            var Over_Name = document.getElementById(Put_Name);
            if (Over_Name) {
                var DvName = document.getElementById(_DvName);
                if (getLen(Over_Name.value) > 0) {
                    if (DvName) {
                        DvName.innerHTML = "";
                    }
                    return true;
                }
                if (DvName) {
                    DvName.innerHTML = "内容不能为空!";
                }
                return false;
            }
            return false;
        }
        //=================判断输入大于6位====================
        function En_Name(_Ful, _DvFul) {
            var E_Name = document.getElementById(_Ful);
            if (E_Name) {
                var DvFul = document.getElementById(_DvFul);
                if (getLen(E_Name.value) > 4) {
                    if (DvFul) {
                        DvFul.innerHTML = "输入正确!";
                    }
                    return true;
                }

                if (DvFul) {
                    DvFul.innerHTML = "输入的内容必须大于4个字符!";
                }
                return false;
            }
            return false;
        }

        //=========================================
        function VerifyAll() {
//==================用户判断==============
            if (!Null_Full("title1", "")) {
                document.getElementById("dvEn_Name1").innerHTML = "不能为空!";
                return false;
            }
            if (!Null_Full("username1", "")) {
                document.getElementById("dvEn_Username1").innerHTML = "不能为空!";
                return false;
            }
//====================手机=================
            if (!Null_Full("telephone1", "")) {
                document.getElementById("dv_lx_tell1").innerHTML = "不能为空!";
                return false;
            }
//===================结束==================
            return true;
        }
        </script>
        <form onSubmit="return VerifyAll();" method="post" id="form" name="form"
              action="${ctx}/home/signUp">
            <li><span>意向竞买品名称</span><input type="text" size="8" id="title1" name="name"
                                           onkeyup="Null_Full('title1','dvEn_Name1');"><span
                    class="s_1">*</span><span style="float:none;color:#f00;" class="dvEn_Name1"
                                              id="dvEn_Name1"></span></li>
            <li><span>联 系 人</span><input type="text" size="14" id="username1" name="contact"
                                         onkeyup="Null_Full('username1','dvEn_Username1');"><span
                    class="s_1">*</span><span style="float:none;color:#f00;" class="dvEn_Username1"
                                              id="dvEn_Username1"></span></li>
            <li class="n_2">先生：
                <input type="radio" checked="checked" name="sex" value="先生"/> &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp;
                女士：
                <input type="radio" name="sex" value="女士"/></li>
            <li><span>联系电话</span><input type="text" size="32" id="telephone1" name="tel"
                                        onkeyup="Null_Full('telephone1','dv_lx_tell1');"><span
                    class="s_1">*</span><span style="float:none;color:#f00;" class="dv_lx_tel1l"
                                              id="dv_lx_tell1"></span></li>
            <li><span>邮    箱</span><input type="text" size="32" id="email" name="email"></li>
            <li><span>联系地址</span><input type="text" size="32" id="address" name="address"></li>
            <li class="n_1"><span>其他说明</span><textarea id="content" rows="4" cols="49"
                                                       name="other"></textarea></li>
            <li class="n_3"><input type="submit" value="提交" name="submit"><input type="reset" value="重置">
            </li>
        </form>
    </ul>


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