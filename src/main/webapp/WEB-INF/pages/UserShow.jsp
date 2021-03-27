<%--
  Created by IntelliJ IDEA.
  User: 27962
  Date: 2021/2/27
  Time: 21:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>${chapter.title }</title>
    <link href="/css/UserShow.css" rel="stylesheet">
    <script src="/js/jquery-3.4.1/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.bootcss.com/showdown/1.3.0/showdown.min.js"></script>
</head>
<body style="zoom: 1;" id="body-theme" class="${setting.theme}">
<div style="position: fixed;
    z-index: 1;
    top: 0;
    left: 0;
    overflow: hidden;
    width: 100%;
    background-size:100% auto;
    -moz-background-size:100% 100%;
    height: 100%; background: url(/images/readBackground.jpg) center 0 no-repeat;">
</div>
<div class="main-read-container" >
    <div class="read-main-wrap ${setting.fontfamily}" style="font-size: ${setting.fontsize}px" id="font-setting">
        <div class="text-wrap">
            <div class="main-text-wrap ">
                <div class="text-head">
                    <h3>
                        <span>${chapter.title }</span>
                    </h3>
                    <div class="text-info cf">
                        <div class="info fl">
                            <a href="javascript:"><em class="iconfont"> </em>${book.book_name }
                            </a> <a href="javascript:"><em class="iconfont"> </em>${book.author }</a>
                        </div>
                    </div>
                </div>
                <div class="read-content">
                    <p>
							<span class="content-wrap" id="article">
                                ${chapter.contexts }</span>
                    </p>
                </div>
            </div>
        </div>
        <div class="chapter-control dib-wrap">
            <a id="forwardPage"
               href="/user/showtext?id=${chapter.id }&orders=${chapter.orders-1 }">上一章</a><span>|</span>
            <a href="/user/content?book_id=${book.book_id}">目录</a><span>|</span>
            <a id="nextPage"
               href="/user/showtext?id=${chapter.id }&orders=${chapter.orders+1 }">下一章</a>
        </div>
    </div>
</div>

<div class="left-bar-list" style="top: 0px;">
    <dl>
        <dd id="catalog_1">
            <a href="javascript:"><i><em class="iconfont"> </em><span>目录</span></i></a>
            <div class="guide-box">
                <cite></cite> 目录
            </div>
        </dd>
        <dd id="catalog_2">
            <a href="javascript:"><i><em class="iconfont"> </em><span>设置</span></i></a>
            <div class="guide-box">
                <cite></cite> 设置
            </div>
        </dd>
        <dd>
            <a href="javascript:"><i><em class="iconfont"> </em><span>书架</span></i></a>
            <div class="guide-box">
                <cite></cite> 加入书架
            </div>
        </dd>
        <dd>
            <a href="/user/intoInterface"> <i><em class="iconfont"> </em><span>书页</span></i></a>
        </dd>
    </dl>
    <!-- start 目录面板浮层 -->
    <div class="panel-wrap catalog" style="display: none;"
         id="catalog_display">
        <a class="iconfont close-panel" href="javascript:" id="cha1"></a>
        <div class="panel-box">
            <div class="dib-wrap catalog-tab" id="">
                <span class="lang act">目录</span>
            </div>
            <div class="panel-list-wrap catalog-scroll-wrap"
                 style="max-height: 405px;">
                <div class="catalog-list-wrap volume-list" style="display: block;">
                    <ul>
                        <c:forEach items="${chapters}" var="chapters">
                            <c:choose>
                                <c:when test="${chapters.orders eq paramorders }">
                                    <li style="padding-left: 24px"><a
                                            href="/user/showtext?id=${chapters.id }&orders=${chapters.orders }"
                                            style="color: #ed4259;">${chapters.title }</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li style="padding-left: 24px;"><a
                                            href="/user/showtext?id=${chapters.id }&orders=${chapters.orders }">${chapters.title }</a></li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- end 目录面板浮层 -->
    <!-- start 设置面板浮层 -->
    <div class="panel-wrap setting" style="display: none;" id="setting_display">
        <a class="iconfont close-panel" href="javascript:" id="cha2"></a>
        <div class="panel-box">
            <h4 class="lang">设置</h4>
            <div class="setting-list-wrap">
                <ul>
                    <li class="theme-list"><i>阅读主题</i>
                        <span title="默认" class="theme-0" id="theme-0-back"><em class="iconfont"> </em></span>
                        <span title="牛皮纸" class="theme-1" id="theme-1-back"><em class="iconfont"> </em></span>
                        <span title="淡绿色" class="theme-2" id="theme-2-back"><em class="iconfont"> </em></span> <span
                                title="淡蓝色" class="theme-3" id="theme-3-back"><em class="iconfont"> </em></span> <span
                                title="淡粉色" class="theme-4" id="theme-4-back"><em class="iconfont"> </em></span> <span
                                title="灰色" class="theme-5" id="theme-5-back"><em class="iconfont"> </em></span> <span
                                title="黑色" class="theme-6" id="theme-6-back"><cite
                                class="iconfont"> </cite></span></li>
                    <li class="font-family" id="zhengfont"><i>正文字体</i> <span
                            class="yahei" id="font1">雅黑</span> <span
                            class="yahei" id="font2">宋体</span> <span
                            class="yahei" id="font3">楷书</span></li>
                    <li class="font-size" id="fontSize"><i>字体大小</i> <cite>
                        <span class="prev" id="minusfont"><em class="iconfont"> </em></span><b></b> <span
                            class="lang" id="minusadd">${setting.fontsize}</span><b></b> <span class="next" id="addfont"><em
                            class="iconfont"> </em></span>
                    </cite></li>
                </ul>
            </div>
        </div>
    </div>
    <!-- end 设置面板浮层 -->

</div>
<script type="text/javascript">
    window.onload = function() {
        var order = ${paramorders};
        if (order == 1) {
            document.getElementById('forwardPage').addEventListener(
                'click', function(e) {
                    e.preventDefault();
                }, false);
            document.getElementById("forwardPage").style.backgroundColor = '#555555';//设置背景色
        }
        var maxorder = ${book.chapter_count};
        if (order == maxorder) {
            document.getElementById('nextPage').addEventListener('click',
                function(e) {
                    e.preventDefault();
                }, false);
            document.getElementById("nextPage").style.backgroundColor = '#555555';//设置背景色
        }
        var theme="${setting.theme}";
        var fontfamily="${setting.fontfamily}";
        var fontsize=${setting.fontsize};
        /*if(theme!="theme0"){
            removeTheme();
            document.getElementById("body-theme").classList
            .add(theme);
        }
        document.getElementById("font-setting").classList
        .remove("font-family02");
        document.getElementById("font-setting").classList
        .remove("font-family01");
        document.getElementById("font-setting").classList
        .remove("font-family03");
        document.getElementById("font-setting").classList
        .add(fontfamily);*/

        //$('#minusadd').html(fontsize);
        //document.getElementById("font-setting").style["font-size"] =fontsize+"px";

        /*document.getElementById("theme-0-back").classList
        .remove("act");*/
        if(theme=="theme0"){
            document.getElementById("theme-0-back").classList.add("act");
        }else if(theme=="theme1"){
            document.getElementById("theme-1-back").classList.add("act");
        }else if(theme=="theme2"){
            document.getElementById("theme-2-back").classList.add("act");
        }else if(theme=="theme3"){
            document.getElementById("theme-3-back").classList.add("act");
        }else if(theme=="theme4"){
            document.getElementById("theme-4-back").classList.add("act");
        }else if(theme=="theme5"){
            document.getElementById("theme-5-back").classList.add("act");
        }else if(theme=="theme6"){
            document.getElementById("theme-6-back").classList.add("act");
        }
        if(fontfamily=="font-family01"){
            document.getElementById("font1").classList
                .add("act");
        }else if(fontfamily=="font-family02"){
            document.getElementById("font2").classList
                .add("act");
        }else if(fontfamily=="font-family03"){
            document.getElementById("font3").classList
                .add("act");
        }
    }
    $('#catalog_1')
        .click(
            function() {
                var display = document
                    .getElementById("catalog_display").style.display;
                if (display == "none") {
                    document.getElementById("catalog_2").classList
                        .remove("act");
                    document.getElementById("setting_display").style.display = "none";
                    document.getElementById("catalog_1").classList
                        .add("act");
                    document.getElementById("catalog_display").style.display = "block";
                } else if (display == "block") {
                    document.getElementById("catalog_1").classList
                        .remove("act");
                    document.getElementById("catalog_display").style.display = "none";
                }
            });
    $('#catalog_2')
        .click(
            function() {
                var display = document
                    .getElementById("setting_display").style.display;
                if (display == "none") {
                    document.getElementById("catalog_1").classList
                        .remove("act");
                    document.getElementById("catalog_display").style.display = "none";
                    document.getElementById("catalog_2").classList
                        .add("act");
                    document.getElementById("setting_display").style.display = "block";
                } else if (display == "block") {
                    document.getElementById("catalog_2").classList
                        .remove("act");
                    document.getElementById("setting_display").style.display = "none";
                }
            });
    $('#cha1').click(function() {
        document.getElementById("catalog_1").classList.remove("act");
        document.getElementById("catalog_display").style.display = "none";
    });
    $('#cha2').click(function() {
        document.getElementById("catalog_2").classList.remove("act");
        document.getElementById("setting_display").style.display = "none";
    });
    function removeTheme(){     //先定义方法，再调用
        document.getElementById("body-theme").classList
            .remove("theme1");
        document.getElementById("body-theme").classList
            .remove("theme2");
        document.getElementById("body-theme").classList
            .remove("theme3");
        document.getElementById("body-theme").classList
            .remove("theme4");
        document.getElementById("body-theme").classList
            .remove("theme5");
        document.getElementById("body-theme").classList
            .remove("theme6");
    }
    function removeThemeAct(){     //先定义方法，再调用
        document.getElementById("theme-0-back").classList
            .remove("act");
        document.getElementById("theme-1-back").classList
            .remove("act");
        document.getElementById("theme-2-back").classList
            .remove("act");
        document.getElementById("theme-3-back").classList
            .remove("act");
        document.getElementById("theme-4-back").classList
            .remove("act");
        document.getElementById("theme-5-back").classList
            .remove("act");
        document.getElementById("theme-6-back").classList
            .remove("act");
    }
    $('#theme-0-back').click(function() {
        removeTheme();
        var id=${paramid }
            ModifySetting(1,id,"theme0");
        removeThemeAct();
        document.getElementById("theme-0-back").classList.add("act");
    });
    $('#theme-1-back').click(function() {
        removeTheme();
        document.getElementById("body-theme").classList
            .add("theme1");
        var id=${paramid }
            ModifySetting(1,id,"theme1");
        removeThemeAct();
        document.getElementById("theme-1-back").classList.add("act");
    });
    $('#theme-2-back').click(function() {
        removeTheme();
        document.getElementById("body-theme").classList
            .add("theme2");
        var id=${paramid }
            ModifySetting(1,id,"theme2");
        removeThemeAct();
        document.getElementById("theme-2-back").classList.add("act");
    });
    $('#theme-3-back').click(function() {
        removeTheme();
        document.getElementById("body-theme").classList
            .add("theme3");
        var id=${paramid }
            ModifySetting(1,id,"theme3");
        removeThemeAct();
        document.getElementById("theme-3-back").classList.add("act");
    });
    $('#theme-4-back').click(function() {
        removeTheme();
        document.getElementById("body-theme").classList
            .add("theme4");
        var id=${paramid }
            ModifySetting(1,id,"theme4");
        removeThemeAct();
        document.getElementById("theme-4-back").classList.add("act");
    });
    $('#theme-5-back').click(function() {
        removeTheme();
        document.getElementById("body-theme").classList
            .add("theme5");
        var id=${paramid }
            ModifySetting(1,id,"theme5");
        removeThemeAct();
        document.getElementById("theme-5-back").classList.add("act");
    });
    $('#theme-6-back').click(function() {
        removeTheme();
        document.getElementById("body-theme").classList
            .add("theme6");
        var id=${paramid }
            ModifySetting(1,id,"theme6");
        removeThemeAct();
        document.getElementById("theme-6-back").classList.add("act");
    });
    function removeFontAct(){
        document.getElementById("font1").classList
            .remove("act");
        document.getElementById("font2").classList
            .remove("act");
        document.getElementById("font3").classList
            .remove("act");
    }
    $('#font1').click(function() {
        document.getElementById("font-setting").classList
            .remove("font-family02");
        document.getElementById("font-setting").classList
            .remove("font-family03");
        document.getElementById("font-setting").classList
            .add("font-family01");
        var id=${paramid }
            ModifySetting(2,id,"font-family01");
        removeFontAct();
        document.getElementById("font1").classList
            .add("act");
    });
    $('#font2').click(function() {
        document.getElementById("font-setting").classList
            .remove("font-family01");
        document.getElementById("font-setting").classList
            .remove("font-family03");
        document.getElementById("font-setting").classList
            .add("font-family02");
        var id=${paramid }
            ModifySetting(2,id,"font-family02");
        removeFontAct();
        document.getElementById("font2").classList
            .add("act");
    });
    $('#font3').click(function() {
        document.getElementById("font-setting").classList
            .remove("font-family02");
        document.getElementById("font-setting").classList
            .remove("font-family01");
        document.getElementById("font-setting").classList
            .add("font-family03");
        var id=${paramid }
            ModifySetting(2,id,"font-family03");
        removeFontAct();
        document.getElementById("font3").classList
            .add("act");
    });
    $('#minusfont').click(function() {
        var text=parseInt($('#minusadd').html());
        if(text!=12){
            $('#minusadd').html(text-2);
            var te=text-2;
            document.getElementById("font-setting").style["font-size"] =te+"px";
            var id=${paramid }
                ModifySetting(3,id,te);
        }

    });
    $('#addfont').click(function() {
        var text=parseInt($('#minusadd').html());
        if(text!=48){
            $('#minusadd').html(text+2);
            var te=text+2;
            document.getElementById("font-setting").style["font-size"] =te+"px";
            var id=${paramid }
                ModifySetting(3,id,te);
        }
    });

    function ModifySetting(code,id,value) {
        var params = {};
        params.code = code;
        params.id = id;
        params.value = value;
        $.ajax({
            type:'post',
            url:"/user/setting",
            dataType:'JSON',
            data:JSON.stringify(params),
            contentType:'application/json;charset=utf-8',
            success:function (data) {
            },
            error:function () {
            }
        });
    }
</script>
</body>
</html>