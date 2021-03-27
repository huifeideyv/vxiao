<%--
  Created by IntelliJ IDEA.
  User: 27962
  Date: 2021/2/28
  Time: 7:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>目录</title>
    <script src="/vxiao/jquery-3.4.1/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="/css/layui/css/layui.css">
    <link rel="stylesheet" href="/css/UserContent.css">
</head>
<body>
<div class="content-cover-wrap site-demo-flow">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend style="color: #ed4259;">${book.book_name }-目录</legend>
    </fieldset>
    <c:forEach items="${chapter }" var="chapter">
        <ul class="content-items">
            <li>
                <a onmouseover="this.style.color='#ed4259';" onmouseout="this.style.color='#333';"
                   href="/user/showtext?id=${chapter.id }&orders=${chapter.orders }"><text style="line-height:40px">${chapter.title }</text></a>
            </li>
        </ul>
        <c:if test="${chapter.orders%3==0 }"><hr/></c:if>
    </c:forEach>
</div>
</body>
</html>
