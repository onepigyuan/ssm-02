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
	<style type="text/css">
		.layui-table-fixed{
			display: none;
		}
	</style>

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
    <li><a href="../../jsp/root/student.jsp" style="background-color: #E6E6FA"><span class="icon-caret-right"></span>学生管理</a></li>
    <li><a href="../../jsp/root/curriculum.jsp"><span class="icon-caret-right"></span>课程管理</a></li>
    <li><a href="../../jsp/root/teacher.jsp"><span class="icon-caret-right"></span>教师管理</a></li>
    <li><a href="../../jsp/root/password.jsp"><span class="icon-caret-right"></span>修改密码</a></li>
    <li><a href="/logout"><span class="icon-caret-right"></span>退出系统</a></li>
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
    <li><a href="#" id="a_leader_txt">学生管理</a></li>
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
<div id="student_update" style="display: none">
    <input id='tb_id' type='text' class='layui-layer-input' style="cursor:not-allowed" disabled="disabled" >
    <input style='margin-top:10px;' id='student_id' type='text' class='layui-layer-input' placeholder='请输入学号'>
    <input style='margin-top:10px;' id='student_name' type='text' class='layui-layer-input' placeholder='请输入姓名'>
    <select style='margin-top:10px;' id='student_gender' type='text' class='layui-layer-input'>
        <option value="男">男</option>
        <option value="女">女</option>
    </select>
    <input style='margin-top:10px;' id='student_birth_year' type='date' class='layui-layer-input' placeholder='请输入出生年份'>
    <input style='margin-top:10px;' id='student_entrance' type='date' class='layui-layer-input' placeholder='请输入入学时间'>
    <input style='margin-top:10px;' id='student_college' type='text' class='layui-layer-input' placeholder='请输入所属学院'>
    <input style='margin-top:10px;' id='tb_password' type='text' class='layui-layer-input' placeholder='请输入学生密码'>
    <input style='margin-top:10px;' id='tb_email' type='text' class='layui-layer-input' placeholder='请输入邮箱'>

</div>

<style>
.copyrights{text-indent:-9999px;height:0;line-height:0;font-size:0;overflow:hidden;}
</style>

</body>
</html>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
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
            ,url:'/studentAll'
            ,title: '用户数据表'
            ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            ,defaultToolbar: ['filter1', 'exports', 'print1', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
                title: '提示'
                ,layEvent: 'LAYTABLE_TIPS'
                ,icon: 'layui-icon-tips'
            }]
            ,title: '用户数据表'
            ,done: function (res, curr, count){
                $("table").css("width", "100px");
            }
            ,cols: [[
            	  {type: 'checkbox', fixed: 'left'}
                ,{field: 'id', title: '序号'}
                ,{field: 'student_id', title: '学号'}
                ,{field: 'student_name', title: '学生名字'}
                ,{field: 'student_gender', title: '性别'}
                ,{field: 'student_birth_year', title: '出生年份'}
                ,{field: 'student_entrance', title: '入学时间'}
                ,{field: 'student_college', title: '所属学院'}
                ,{field: 'password', title: '学生密码'}
                ,{field: 'email',title: '邮箱'}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
            ]]
        });
        $('#select_btn').click(function () {
            var inputVal = $('.layui-input').val()
            console.log(inputVal)
            table.reload('test', {
                url: '/student_select_filter'
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
                        url:"/studentDelete",
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
                    ,title: '修改学生信息'
                    ,skin: 'layui-layer-prompt'
                    ,content:$('#student_update').html(function () {
                        $("#tb_id").val(data.id)
                        $("#student_id").val(data.student_id)
                        $("#student_name").val(data.student_name)
                        $("#student_gender").val(data.student_gender)
                        $("#student_birth_year").val(data.student_birth_year)
                        $("#student_entrance").val(data.student_entrance)
                        $("#student_college").val(data.student_college)
                        $("#tb_password").val(data.password)
                        $("#tb_email").val(data.email)

                        

                    })
                    ,yes: function(index, layero){

                        $.ajax({
                            url:"/studentUpdate",
                            type:"POST",
                            data:{
                                "id":$(layero).find("#tb_id").val()
                                ,"student_id":$(layero).find("#student_id").val()
                                ,"student_name":$(layero).find("#student_name").val()
                                ,"student_gender":$(layero).find("#student_gender").val()
                                ,"student_birth_year":$(layero).find("#student_birth_year").val()
                                ,"student_entrance":$(layero).find("#student_entrance").val()
                                ,"student_college":$(layero).find("#student_college").val()
                                ,"password":$(layero).find("#tb_password").val()
                                ,"email":$(layero).find("#tb_email").val()

                            },
                            dataType: "json",
                            success: function (data) {
                                if (data==1){
                                    obj.update({
                                        id:$(layero).find("#tb_id").val()
                                        ,student_id:$(layero).find("#student_id").val()
                                        ,student_name:$(layero).find("#student_name").val()
                                        ,student_gender:$(layero).find("#student_gender").val()
                                        ,student_birth_year:$(layero).find("#student_birth_year").val()
                                        ,student_entrance:$(layero).find("#student_entrance").val()
                                        ,student_college:$(layero).find("#student_college").val()
                                       ,password:$(layero).find("#tb_password").val()
                                       ,email:$(layero).find("#tb_email").val()
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
                ,title: '添加学生信息'
                ,skin: 'layui-layer-prompt'
                ,content: "<div id='test'><input style='margin-top:10px;' id='add_student_id' type='text' class='layui-layer-input' placeholder='请输入学号'>" +
                    "<input style='margin-top:10px;' id='add_student_name' type='text' class='layui-layer-input' placeholder='请输入姓名'>" +
                    "<input style='margin-top:10px;' id='add_student_gender' type='text' class='layui-layer-input' placeholder='请输入性别'>" +
                    "<input style='margin-top:10px;' id='add_student_birth_year' type='date' class='layui-layer-input' placeholder='请输入出生年份'>" +
                    "<input style='margin-top:10px;' id='add_student_entrance' type='date' class='layui-layer-input' placeholder='请输入入学时间'>" +
                    "<input style='margin-top:10px;' id='add_student_college' type='text' class='layui-layer-input' placeholder='请输入所属学院'>" +


                    "</div>"
                ,yes: function(index, layero){
                    if (
                        $("#add_student_id").val()=='' ||
                        $("#add_student_name").val()=='' ||
                        $("#add_student_gender").val()=='' ||
                        $("#add_student_birth_year").val()=='' ||
                        $("#add_student_entrance").val()=='' ||
                        $("#add_student_college").val()==''

                    ){
                        layer.msg("请输入完整，不能为空！",{icon:5});
                    }else {
                        $.ajax({
                            url: "/studentInsert",
                            type: "POST",
                            data: {

                                "student_id": $("#add_student_id").val()
                                , "student_name": $("#add_student_name").val()
                                , "student_gender": $("#add_student_gender").val()
                                , "student_birth_year": $("#add_student_birth_year").val()
                                , "student_entrance": $("#add_student_entrance").val()
                                , "student_college": $("#add_student_college").val()
                            },
                            dataType: "json",
                            success: function (data) {
                                console.log(data)
                                if (data == 1) {
                                    console.log("add!!!")
                                    var oldData = table.cache.test;
                                    oldData.push({
                                        "student_id": $("#add_student_id").val()
                                        , "student_name": $("#add_student_name").val()
                                        , "student_gender": $("#add_student_gender").val()
                                        , "student_birth_year": $("#add_student_birth_year").val()
                                        , "student_entrance": $("#add_student_entrance").val()
                                        , "student_college": $("#add_student_college").val()
                                    });
                                    table.reload('test', {data: oldData});
                                    console.log(oldData)
                                    layer.close(index);
                                    layer.msg("添加成功", {icon: 6});

                                    $("#student_id").val('')
                                    $("#student_name").val('')
                                    $("#student_gender").val('')
                                    $("#student_birth_year").val('')
                                    $("#student_entrance").val('')
                                    $("#student_college").val('')

                                } else {
                                    layer.close(index);
                                    layer.msg("添加失败", {icon: 5});
                                    $("#student_id").val('')
                                    $("#student_name").val('')
                                    $("#student_gender").val('')
                                    $("#student_birth_year").val('')
                                    $("#student_entrance").val('')
                                    $("#student_college").val('')

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