<%--
Created by IntelliJ IDEA.
User: xm1999year
Date: 2021/12/2
Time: 21:36
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>选课管理系统</title>
    <meta name="keywords" content="选课管理系统" />
    <meta name="description" content="选课管理系统" />
    <link rel="stylesheet" href="../../css/pintuer.css">
    <link rel="stylesheet" href="../../css/admin.css">
    <script src="../../js/jquery.js"></script>
    <link rel="stylesheet" href="../../layui/css/layui.css" media="all">
    <script src="../../layui/layui.js" charset="utf-8"></script>


</head>
<body style="background-color:#f2f9fd;">
<div class="header bg-main">
    <div class="logo margin-big-left fadein-top">
        <h1><img src="../../images/y.jpg" class="radius-circle rotate-hover" height="50" alt="" />后台管理中心</h1>
    </div>
    <div class="head-l"><a class="button button-little bg-green" href="" target="_blank"><span class="icon-home"></span> 前台首页</a> &nbsp;&nbsp;<a href="##" class="button button-little bg-blue"><span class="icon-wrench"></span> 清除缓存</a> &nbsp;&nbsp;<a class="button button-little bg-red" href="/logout"><span class="icon-power-off"></span> 退出登录</a> </div>
</div>
<div class="leftnav">
    <div class="leftnav-title"><strong><span class="icon-list"></span>功能列表</strong></div>
    <h2><span class="icon-user"></span>管理员平台(${sessionScope.login_user_name})</h2>
    <ul style="display:block">
        <li><a href="../../jsp/root/student.jsp"><span class="icon-caret-right"></span>学生管理</a></li>
        <li><a href="../../jsp/root/curriculum.jsp"><span class="icon-caret-right"></span>课程管理</a></li>
        <li><a href="../../jsp/root/teacher.jsp" style="background-color: #E6E6FA"><span class="icon-caret-right"></span>教师管理</a></li>
        <li><a href="../../jsp/root/password.jsp" ><span class="icon-caret-right"></span>修改密码</a></li>
        <li><a href="/logout" ><span class="icon-caret-right"></span>退出系统</a></li>
    </ul>

</div>
<script type="text/javascript">
    $(function(){
        $(".leftnav h2").click(function(){
            $(this).next().slideToggle(200);
            $(this).toggleClass("on");
        })
        $(".leftnav ul li a").click(function(){
            $("#a_leader_txt").text($(this).text());
            $(".leftnav ul li a").removeClass("on");
            $(this).addClass("on");
        })
    });
</script>
<ul class="bread">
    <li><a href="#" target="right" class="icon-home"> 首页</a></li>
    <li><a href="#" id="a_leader_txt">教师管理</a></li>
    <li><b>当前语言：</b><span style="color:red;">中文</php></span>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;切换语言：<a href="#">中文</a> &nbsp;&nbsp;<a href="#">英文</a> </li>
</ul>


<div class="admin">
    <%--  <iframe scrolling="auto" rameborder="0" src="info.html" name="right" width="100%" height="100%"></iframe>--%>

    <!-- 内容主体区域 -->

    <div style="padding: 15px">
        <div class="demoTable" >
            搜索：
            <div class="layui-inline">
                <input class="layui-input" name="keyword" id="demoReload" autocomplete="off">
            </div>
            <button class="layui-btn" id="select_btn" data-type="reload">搜索</button>
            <button type="button" class="layui-btn" id="add">添加</button>
        </div>
        <table class="layui-hide" id="test" lay-filter="test"></table>
    </div>
</div>

<!--update-->
<div id="teacher_update" style="display: none">
    <input id='tb_teacher_id' type='text' class='layui-layer-input' style="cursor:not-allowed" disabled="disabled" >
    <input style='margin-top:10px;' id='teacher_id' type='text' class='layui-layer-input' placeholder='请输入教师编号'>
    <input style='margin-top:10px;' id='teacher_name' type='text' class='layui-layer-input' placeholder='请输入姓名'>
    <input style='margin-top:10px;' id='teacher_gender' type='text' class='layui-layer-input' placeholder='请输入性别'>
    <input style='margin-top:10px;' id='teacher_birth_year' type='date' class='layui-layer-input' placeholder='请输入出生年份'>
    <input style='margin-top:10px;' id='teacher_education' type='text' class='layui-layer-input' placeholder='请输入学历'>
    <input style='margin-top:10px;' id='teacher_title' type='text' class='layui-layer-input' placeholder='请输入职称'>
    <input style='margin-top:10px;' id='teacher_entrydate' type='date' class='layui-layer-input' placeholder='请输入入职时间'>
    <input style='margin-top:10px;' id='teacher_college' type='text' class='layui-layer-input' placeholder='请输入所属学院'>

</div>

<style>
    .copyrights{text-indent:-9999px;height:0;line-height:0;font-size:0;overflow:hidden;}
</style>

</body>
</html>

<!-- 关闭老师的删除功能，因为已经与课程表有外键！ -->
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del停用" style="cursor:not-allowed">删除</a>
</script>
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>
    </div>
</script>
<script>


    layui.use('table', function(){
        var table = layui.table;

        table.render({
            elem: '#test'
            , cellMinWidth: 80
            ,page: true
            , limit:10
            ,url:'/teacherJson'
            ,title: '用户数据表'
            ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            ,defaultToolbar: ['filter1', 'exports', 'print1', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
                title: '提示'
                ,layEvent: 'LAYTABLE_TIPS'
                ,icon: 'layui-icon-tips'
            }]
            ,cols: [[
                {type: 'checkbox', fixed: 'left'}
                ,{field: 'id', title: '序号', fixed: 'left'}
                ,{field: 'teacher_id', title: '教师编号'}
                ,{field: 'teacher_name', title: '姓名'}
                ,{field: 'teacher_gender', title: '性别'}
                ,{field: 'teacher_birth_year', title: '出生年份'}
                ,{field: 'teacher_education', title: '学历'}
                ,{field: 'teacher_title', title: '职称'}
                ,{field: 'teacher_entrydate', title: '入职时间'}
                ,{field: 'curriculum_name', title: '所教课程'}
                ,{field: 'teacher_college', title: '所属学院'}
                
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
            ]]
        });
        $('#select_btn').click(function () {
            var inputVal = $('.layui-input').val()
            console.log(inputVal)
            table.reload('test', {
                url: '/teacher_select_filter'
                , request: {
                    pageName: 'page' //页码的参数名称，默认：page
                    , limitName: 'pageSize' //每页数据量的参数名，默认：limit
                }
                , where: {
                    query: inputVal
                }
                , page: {
                    curr: 1
                }
            });
        })

        //工具栏事件
        table.on('toolbar(test)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id);
            switch(obj.event){
                case 'getCheckData':
                    var data = checkStatus.data;
                    layer.alert(JSON.stringify(data));
                    break;
            }
        });

        //监听行工具事件
        table.on('tool(test)', function(obj){
            var data = obj.data;
            console.log(obj)
            if(obj.event === 'del'){
                layer.confirm('确认删除该行信息吗？', function(index){
                    $.ajax({
                        url:"/teacherDelete",
                        type:"POST",
                        data:{"id":data.id},
                        dataType:"json",
                        success: function (data) {
                            console.log(data)
                            if (data==1){
                                obj.del();
                                layer.close(index);
                                layer.msg("删除成功",{icon:6});
                            }else {
                                layer.msg("删除失败",{icon:5});
                            }
                        }
                    })
                });
            } else if(obj.event === 'edit'){
                layer.open({
                    type: 1 //Page层类型
                    ,btn:["确定","取消"]
                    ,title: '修改宿舍信息'
                    ,skin: 'layui-layer-prompt'
                    ,content:$('#teacher_update').html(function () {
                        $("#tb_teacher_id").val(data.id)
                        $("#teacher_id").val(data.teacher_id)
                        $("#teacher_name").val(data.teacher_name)
                        $("#teacher_gender").val(data.teacher_gender)
                        $("#teacher_birth_year").val(data.teacher_birth_year)
                        $("#teacher_education").val(data.teacher_education)
                        $("#teacher_title").val(data.teacher_title)
                        $("#teacher_entrydate").val(data.teacher_entrydate)
                        $("#teacher_college").val(data.teacher_college)

                    })
                    ,yes: function(index, layero){

                        $.ajax({
                            url:"/teacherUpdate",
                            type:"POST",
                            data:{
                                "id":$(layero).find("#tb_teacher_id").val()
                                ,"teacher_id":$(layero).find("#teacher_id").val()
                                ,"teacher_name":$(layero).find("#teacher_name").val()
                                ,"teacher_gender":$(layero).find("#teacher_gender").val()
                                ,"teacher_birth_year":$(layero).find("#teacher_birth_year").val()
                                ,"teacher_education":$(layero).find("#teacher_education").val()
                                ,"teacher_title":$(layero).find("#teacher_title").val()
                                ,"teacher_entrydate":$(layero).find("#teacher_entrydate").val()
                                ,"teacher_college":$(layero).find("#teacher_college").val()

                            },
                            dataType: "json",
                            success: function (data) {
                                if (data==1){
                                    obj.update({
                                        id:$(layero).find("#tb_teacher_id").val()
                                        ,teacher_id:$(layero).find("#teacher_id").val()
                                        ,teacher_name:$(layero).find("#teacher_name").val()
                                        ,teacher_gender:$(layero).find("#teacher_gender").val()
                                        ,teacher_birth_year:$(layero).find("#teacher_birth_year").val()
                                        ,teacher_education:$(layero).find("#teacher_education").val()
                                        ,teacher_title:$(layero).find("#teacher_title").val()
                                        ,teacher_entrydate:$(layero).find("#teacher_entrydate").val()
                                        ,teacher_college:$(layero).find("#teacher_college").val()
                                    });
                                    layer.close(index);
                                    layer.msg("修改成功",{icon:6});
                                }else {
                                    layer.msg("修改失败",{icon:5});
                                }

                            }
                        })
                    }
                });

            }
        });
        document.getElementById('add').addEventListener('click',function (data) {
            layer.open({
                type: 1 //Page层类型
                ,btn:["确定","取消"]
                ,title: '添加宿舍信息'
                ,skin: 'layui-layer-prompt'
                ,content: "<div id='test'><input style='margin-top:10px;' id='add_teacher_id' type='text' class='layui-layer-input' placeholder='请输入教师编号'>" +
                    "<input style='margin-top:10px;' id='add_teacher_name' type='text' class='layui-layer-input' placeholder='请输入姓名'>" +
                    "<input style='margin-top:10px;' id='add_teacher_gender' type='text' class='layui-layer-input' placeholder='请输入性别'>" +
                    "<input style='margin-top:10px;' id='add_teacher_birth_year' type='date' class='layui-layer-input' placeholder='请输入出生年份'>" +
                    "<input style='margin-top:10px;' id='add_teacher_education' type='text' class='layui-layer-input' placeholder='请输入学历'>" +
                    "<input style='margin-top:10px;' id='add_teacher_title' type='text' class='layui-layer-input' placeholder='请输入职称'>" +
                    "<input style='margin-top:10px;' id='add_teacher_entrydate' type='date' class='layui-layer-input' placeholder='请输入入职时间'>" +
                    "<input style='margin-top:10px;' id='add_teacher_college' type='text' class='layui-layer-input' placeholder='请输入所属学院'>" +


                    "</div>"
                ,yes: function(index, layero){
                    if (
                        $("#add_teacher_id").val()=='' ||
                        $("#add_teacher_name").val()=='' ||
                        $("#add_teacher_gender").val()=='' ||
                        $("#add_teacher_birth_year").val()=='' ||
                        $("#add_teacher_education").val()=='' ||
                        $("#add_teacher_title").val()==''||
                        $("#add_teacher_entrydate").val()==''||
                        $("#add_teacher_college").val()==''

                    ){
                        layer.msg("请输入完整，不能为空！",{icon:5});
                    }else {
                        $.ajax({
                            url: "/teacherInsert",
                            type: "POST",
                            data: {

                                "teacher_id": $("#add_teacher_id").val()
                                , "teacher_name": $("#add_teacher_name").val()
                                , "teacher_gender": $("#add_teacher_gender").val()
                                , "teacher_birth_year": $("#add_teacher_birth_year").val()
                                , "teacher_education": $("#add_teacher_education").val()
                                , "teacher_title": $("#add_teacher_title").val()
                                , "teacher_entrydate": $("#add_teacher_entrydate").val()
                                , "teacher_college": $("#add_teacher_college").val()
                            },
                            dataType: "json",
                            success: function (data) {
                                console.log(data)
                                if (data == 1) {
                                    console.log("add!!!")
                                    var oldData = table.cache.test;
                                    oldData.push({

                                        "teacher_id": $("#add_teacher_id").val()
                                        , "teacher_name": $("#add_teacher_name").val()
                                        , "teacher_gender": $("#add_teacher_gender").val()
                                        , "teacher_birth_year": $("#add_teacher_birth_year").val()
                                        , "teacher_education": $("#add_teacher_education").val()
                                        , "teacher_title": $("#add_teacher_title").val()
                                        , "teacher_entrydate": $("#add_teacher_entrydate").val()
                                        , "teacher_college": $("#add_teacher_college").val()
                                    });
                                    table.reload('test', {data: oldData});
                                    console.log(oldData)
                                    layer.close(index);
                                    layer.msg("添加成功", {icon: 6});

                                    $("#teacher_id").val('')
                                    $("#teacher_name").val('')
                                    $("#teacher_gender").val('')
                                    $("#teacher_birth_year").val('')
                                    $("#teacher_education").val('')
                                    $("#teacher_title").val('')
                                    $("#teacher_entrydate").val('')
                                    $("#teacher_college").val('')

                                } else {
                                    layer.close(index);
                                    layer.msg("添加失败", {icon: 5});
                                    $("#teacher_id").val('')
                                    $("#teacher_name").val('')
                                    $("#teacher_gender").val('')
                                    $("#teacher_birth_year").val('')
                                    $("#teacher_education").val('')
                                    $("#teacher_title").val('')
                                    $("#teacher_entrydate").val('')
                                    $("#teacher_college").val('')

                                }
                            }
                        })
                    }
                }

            })
        })
    });
</script>
</body>
</html>

<script>
    //JS
    layui.use(['element', 'layer', 'util'], function(){
        var element = layui.element
            ,layer = layui.layer
            ,util = layui.util
            ,$ = layui.$;

        //头部事件
        util.event('lay-header-event', {
            //左侧菜单事件
            menuLeft: function(othis){
                layer.msg('展开左侧菜单的操作', {icon: 0});
            }
            ,menuRight: function(){
                layer.open({
                    type: 1
                    ,content: '<div style="padding: 15px;">处理右侧面板的操作</div>'
                    ,area: ['260px', '100%']
                    ,offset: 'rt' //右上角
                    ,anim: 5
                    ,shadeClose: true
                });
            }
        });

    });
</script>