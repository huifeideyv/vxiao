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
    <div >
        <table class="layui-hide" id="test" lay-filter="test"></table></div>

</div>
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>
        <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>
        <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>
    </div>
</script>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit" >编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script  src="/css/layui/layui.js"  type="text/javascript"></script>
<script  src="/js/jquery-3.4.1/jquery-3.4.1.min.js"  type="text/javascript" ></script>
<script>
    layui.use(['layer'],function () {
        var layer = layui.layer;
    })
    layui.use(['table'], function(){
        var table = layui.table;
        table.render({
            elem: '#test'
            ,url:'/manage/selectuser'
            ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            ,defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
                title: '提示'
                ,layEvent: 'LAYTABLE_TIPS'
                ,icon: 'layui-icon-tips'
            }]
            ,cellMinWidth: 200
            ,title: '用户数据表'
            ,cols: [[
                {field:'id', title:'ID', width:'15%', fixed: 'left', unresize: true, sort: true,align: 'center'}
                ,{field:'username', title:'用户名', width:'15%', edit: 'text',align: 'center'}
                ,{field:'passwd', title:'密码', width:'15%', edit: 'text',align: 'center'}
                ,{field:'startdate', title:'注册时间', width:'15%',align: 'center'}
                ,{field:'enddate', title:'最近登录时间', width:'15%',align: 'center'}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:'25%',align: 'center'}
            ]]
            ,page: true
            , limit: 15 //默认分页条数
            , limits: [15, 30, 50] //自定义分页数据选项
            , id: 'reload' //用于绑定模糊查询条件等等
            , done:function(res){
                var data = res.data;
            }
            , loading: false //请求数据时，是否显示loading
        });

        //头工具栏事件
        table.on('toolbar(test)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id);
            switch(obj.event){
                case 'getCheckData':
                    var data = checkStatus.data;
                    layer.alert(JSON.stringify(data));
                    break;
                case 'getCheckLength':
                    var data = checkStatus.data;
                    layer.msg('选中了：'+ data.length + ' 个');
                    break;
                case 'isAll':
                    layer.msg(checkStatus.isAll ? '全选': '未全选');
                    break;

                //自定义头工具栏右侧图标 - 提示
                case 'LAYTABLE_TIPS':
                    layer.alert('这是工具栏右侧自定义的一个图标按钮');
                    break;
            };
        });
        function deleteUser(id) {
            var params = {};
            params.id=id;
            $.ajax({
                type:'post',
                url:'/manage/deleteuser',
                dataType:'json',
                data:JSON.stringify(params),
                contentType:'application/json;charset=utf-8',
                success:function (data) {
                    alert("success")
                },
                error:function () {

                }
            });
        }
        //监听行工具事件
        table.on('tool(test)', function(obj){
            var data = obj.data;
            console.log(obj)
            if(obj.event === 'del'){
                //删除用户信息
                deleteUser(obj.data.id)
            } else if(obj.event === 'edit'){
                //保存用户信息

            }
        });
    });
</script>
</body></html>
