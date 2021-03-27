<%--
  Created by IntelliJ IDEA.
  User: 27962
  Date: 2021/3/1
  Time: 20:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html><head>
    <meta charset="utf-8">
    <title>VXIAO.COM.MANAGE</title>
    <link rel="stylesheet" href="/css/layui/css/layui.css" />
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo" style="cursor: pointer;"><a href="/manage/manageInferface"> VXIAO.COM</a></div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="/manage/userInfor">用户管理</a></li>
            <li class="layui-nav-item"><a href="">书籍管理</a></li>
            <li class="layui-nav-item"><a href="">章节管理</a></li>
            <span class="layui-nav-bar" style="left: 201.5px; top: 55px; width: 0px; opacity: 0;"></span></ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item"><a href="/Login.jsp">登出</a></li>
            <span class="layui-nav-bar" style="left: 76px; top: 55px; width: 0px; opacity: 0;"></span></ul>
    </div>

    <!-- 内容主体区域 -->
    <img src="/images/readBackground.jpg">

</div>

<script  src="/css/layui/layui.js"  type="text/javascript"></script>
<script  src="/js/jquery-3.4.1/jquery-3.4.1.min.js"  type="text/javascript" ></script>
</body></html>
