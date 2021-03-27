<%@ page contentType="text/html; charset=UTF-8"  %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <title>VXIAO.COM</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link type="text/css" rel="styleSheet"  href="/css/zhuye.css" />
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

</head>
<body>

<nav class="navbar navbar-default" role="navigation" style="position:fixed;left:0%;right:0%;z-index:100;">
    <div class="container-fluid">
        <div class="navbar-header" style="margin-left:5%;">
            <a class="navbar-brand" href="/user/intoInterface">VXIAO.COM</a>
        </div>
        <div class="navbar-header" style="margin-left:5%;">
            <a class="navbar-brand" href="#">我的书架</a>
        </div>
        <form class="navbar-form navbar-left" role="search" style="margin-left:10%;"action="/user/findbenzhan" method="post">
            <div class="form-group" style="border: 1px solid #ccc;border-radius: 4px;">
                <input id="authorOrBookname" type="text" class="form-control" placeholder="输入书名或作者名" name="authorOrBookname">
                <select id="searchBook" class="form-control" name="searchBook">
                    <option value="benzhan" style="border: 1px solid #ccc;border-radius: 4px;">本站</option>
                    <option value="waizhan" style="border: 1px solid #ccc;border-radius: 4px;">全网</option>
                </select>
            </div>
            <button id="searchButton" type="submit" class="btn btn-default" >搜索</button>
        </form>
    </div>
</nav>
<script>
    // $(function () {
    //
    //     $('#searchButton').click(function () {
    //         searchBook();
    //     });
    //
    //
    // });
    // function searchBook() {
    //     var searchWeb=$('#searchBook').val();
    //     var authorOrbookname=document.getElementById("authorOrBookname").value;
    //     alert(authorOrbookname);
    //     var params = {};
    //     params.searchWeb = searchWeb;
    //     params.authorOrbookname = authorOrbookname;
    //     $.ajax({
    //         type:'post',
    //         url:'/user/findbenzhan',
    //         dataType:'json',
    //         data:JSON.stringify(params),
    //         contentType:'application/json;charset=utf-8'
    //     })
    //
    // }

</script>
<div id="main" class="backtenal divHeigh"style="float:left;position:relative;top:55px;width:70%;height:100%;left:5%;">
    <!--主页的最热的书，也客串本网站书籍-->
     <c:forEach items="${hotbooks}" var="books">
        <div style="float:left;margin-left:5%;margin-top:10px;width:90%; height:250px;background-color:#FFFFFF;margin-bottom: 10px;">
            <div style="float:left;position:relative;width:25%;height:100%; padding-top: 10px;padding-left: 34px;">
                <img src="${books.book_img}" style="width: 180px;height: 240px;"/></div>

            <div style="float:left;position:relative;width:72%;height:100%;margin-left:3%;">
                <h4><em>${books.book_name}</em>   ${books.author}  著</h4>
                <hr style="margin:10px 0;">
                <div style="height: 55%;text-overflow:ellipsis; overflow: hidden;">
                    ${books.summary}
                </div>
                <div style="height: 20%;margin-top: 20px;">
                    <button type="button" class="btn btn-warning">加入书架</button>
                    <button type="button" class="btn btn-success"><a href="/user/content?book_id=${books.book_id}">开始阅读</a></button>
                </div>
            </div>
        </div>
    </c:forEach>
    <c:forEach items="${browerBooks}" var="books">
        <div style="float:left;margin-left:5%;margin-top:10px;width:90%; height:250px;background-color:#FFFFFF;margin-bottom: 10px;">
            <div style="float:left;position:relative;width:25%;height:100%; padding-top: 10px;padding-left: 34px;">
                <img src="${books.book_img}" style="width: 180px;height: 240px;"/></div>

            <div style="float:left;position:relative;width:72%;height:100%;margin-left:3%;">
                <h4><em>${books.book_name}</em>   ${books.book_author}  著</h4>
                <hr style="margin:10px 0;">
                <div style="height: 55%;text-overflow:ellipsis; overflow: hidden;">
                        ${books.introduce}
                </div>
                <div style="height: 20%;margin-top: 20px;">
                    <button type="button" class="btn btn-warning">加入书架</button>
                    <button type="button" class="btn btn-success"><a href="/user/websitecontent?book_id=${books.book_href}">开始阅读</a></button>
                </div>
            </div>
        </div>
    </c:forEach>
</div>
<div id="right" class="backtenal"style="float:left;position:relative;top:55px;width:19%;height:420px;left:6%;">

    <div style="float:left;position:relative;width:50%;height:60px;padding:16px 0 0 16px;">
        <a href="#" style="">
            <img src="/images/xuanhuan.png" style="width:35%;height:60%;float:left;margin-top:10px;margin-right:10px;"/>
            <span class="info">
				<i>玄幻</i><br>
				<b>${kinds.get(0)}</b>
				</span>
        </a>
    </div>
    <div style="float:left;position:relative;width:50%;height:60px;padding:16px 0 0 16px;">
        <a href="#" style="">
            <img src="/images/qihuan.png" style="width:35%;height:60%;float:left;margin-top:10px;margin-right:10px;"/>
            <span class="info">
				<i>奇幻</i><br>
				<b>${kinds.get(1)}</b>
				</span>
        </a>
    </div>
    <div style="float:left;position:relative;width:50%;height:60px;padding:16px 0 0 16px;">
        <a href="#" style="">
            <img src="/images/wuxia.png" style="width:35%;height:60%;float:left;margin-top:10px;margin-right:10px;"/>
            <span class="info">
				<i>武侠</i><br>
				<b>${kinds.get(2)}</b>
				</span>
        </a>
    </div>
    <div style="float:left;position:relative;width:50%;height:60px;padding:16px 0 0 16px;">
        <a href="#" style="">
            <img src="/images/xianxia.png" style="width:35%;height:60%;float:left;margin-top:10px;margin-right:10px;"/>
            <span class="info">
				<i>仙侠</i><br>
				<b>${kinds.get(3)}</b>
				</span>
        </a>
    </div>
    <div style="float:left;position:relative;width:50%;height:60px;padding:16px 0 0 16px;">
        <a href="#" style="">
            <img src="/images/dushi.png" style="width:35%;height:60%;float:left;margin-top:10px;margin-right:10px;"/>
            <span class="info">
				<i>都市</i><br>
				<b>${kinds.get(4)}</b>
				</span>
        </a>
    </div>
    <div style="float:left;position:relative;width:50%;height:60px;padding:16px 0 0 16px;">
        <a href="#" style="">
            <img src="/images/xianshi.png" style="width:35%;height:60%;float:left;margin-top:10px;margin-right:10px;"/>
            <span class="info">
				<i>现实</i><br>
				<b>${kinds.get(5)}</b>
				</span>
        </a>
    </div>
    <div style="float:left;position:relative;width:50%;height:60px;padding:16px 0 0 16px;">
        <a href="#" style="">
            <img src="/images/junshi.png" style="width:35%;height:60%;float:left;margin-top:10px;margin-right:10px;"/>
            <span class="info">
				<i>军事</i><br>
				<b>${kinds.get(6)}</b>
				</span>
        </a>
    </div>
    <div style="float:left;position:relative;width:50%;height:60px;padding:16px 0 0 16px;">
        <a href="#" style="">
            <img src="/images/lishi.png" style="width:35%;height:60%;float:left;margin-top:10px;margin-right:10px;"/>
            <span class="info">
				<i>历史</i><br>
				<b>${kinds.get(7)}</b>
				</span>
        </a>
    </div>
    <div style="float:left;position:relative;width:50%;height:60px;padding:16px 0 0 16px;">
        <a href="#" style="">
            <img src="/images/youxi.png" style="width:35%;height:60%;float:left;margin-top:10px;margin-right:10px;"/>
            <span class="info">
				<i>游戏</i><br>
				<b>${kinds.get(8)}</b>
				</span>
        </a>
    </div>
    <div style="float:left;position:relative;width:50%;height:60px;padding:16px 0 0 16px;">
        <a href="#" style="">
            <img src="/images/tiyv.png" style="width:35%;height:60%;float:left;margin-top:10px;margin-right:10px;"/>
            <span class="info">
				<i>体育</i><br>
				<b>${kinds.get(9)}</b>
				</span>
        </a>
    </div>
    <div style="float:left;position:relative;width:50%;height:60px;padding:16px 0 0 16px;">
        <a href="#" style="">
            <img src="/images/kehuan.png" style="width:35%;height:60%;float:left;margin-top:10px;margin-right:10px;"/>
            <span class="info">
				<i>科幻</i><br>
				<b>${kinds.get(10)}</b>
				</span>
        </a>
    </div>
    <div style="float:left;position:relative;width:50%;height:60px;padding:16px 0 0 16px;">
        <a href="#" style="">
            <img src="/images/xuanyi.png" style="width:35%;height:60%;float:left;margin-top:10px;margin-right:10px;"/>
            <span class="info">
				<i>悬疑</i><br>
				<b>${kinds.get(11)}</b>
				</span>
        </a>
    </div>
    <div style="float:left;position:relative;width:50%;height:60px;padding:16px 0 0 16px;">
        <a href="#" style="">
            <img src="/images/yanqing.png" style="width:35%;height:60%;float:left;margin-top:10px;margin-right:10px;"/>
            <span class="info">
				<i>言情</i><br>
				<b>${kinds.get(12)}</b>
				</span>
        </a>
    </div>
    <div style="float:left;position:relative;width:50%;height:60px;padding:16px 0 0 16px;">
        <a href="#" style="">
            <img src="/images/qingxiaoshuo.png" style="width:35%;height:60%;float:left;margin-top:10px;margin-right:10px;"/>
            <span class="info">
				<i>轻松</i><br>
				<b>${kinds.get(13)}</b>
				</span>
        </a>
    </div>

</div>
<!-- 底部 -->
<div id="footer" style="clear:both;"><text>本站小说来源于免费小说网站，仅做技术学习与交流。©版权所有 支持正版</text>></div>
</body>
</html>