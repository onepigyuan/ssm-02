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
        <h1><img src="../../images/y.jpg" class="radius-circle rotate-hover" height="50" alt="" />学生选课中心</h1>
    </div>
    <div class="head-l"><a class="button button-little bg-green" href="" target="_blank"><span class="icon-home"></span> 前台首页</a> &nbsp;&nbsp;<a href="##" class="button button-little bg-blue"><span class="icon-wrench"></span> 清除缓存</a> &nbsp;&nbsp;<a class="button button-little bg-red" href="/ssm-02/logout"><span class="icon-power-off"></span> 退出登录</a> </div>
</div>
<div class="leftnav">
    <div class="leftnav-title"><strong><span class="icon-list"></span>功能列表</strong></div>
    <h2><span class="icon-user"></span>学生平台(${sessionScope.student_username})</h2>
    <ul style="display:block">
        <li><a href="../../jsp/student/all_curriculum.jsp" style="background-color: #E6E6FA"><span class="icon-caret-right"></span>所有课程</a></li>
        <li><a href="../../jsp/student/selected_curriculum.jsp"><span class="icon-caret-right"></span>已选课程</a></li>
        <li><a href="../../jsp/student/complete_curriculum.jsp"><span class="icon-caret-right"></span>已修课程</a></li>
        <li><a href="../../jsp/student/password.jsp"><span class="icon-caret-right"></span>修改密码</a></li>
        <li><a href="/ssm-02/logout" ><span class="icon-caret-right"></span>退出系统</a></li>
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
    <li><a href="#" id="a_leader_txt">所有课程</a></li>
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
        </div>
        <table class="layui-hide" id="test" lay-filter="test"></table>
    </div>
</div>



<style>
    .copyrights{text-indent:-9999px;height:0;line-height:0;font-size:0;overflow:hidden;}
</style>

</body>
</html>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">选课</a>
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
            ,url:'/ssm-02/studentCurriculumJson'
            ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            ,defaultToolbar: ['filter1', 'exports', 'print1', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
                title: '提示'
                ,layEvent: 'LAYTABLE_TIPS1'
                ,icon: 'layui-icon-tips1'
            }]
            ,title: '用户数据表'
            ,done: function (res, curr, count){
                $("table").css("width", "100%");
            }
            ,cols: [[
                {type: 'checkbox', fixed: 'left'}
                ,{field: 'id', title: '序号', fixed: 'left'}
                ,{field: 'curriculum_name', title: '课程名称'}
                ,{field: 'curriculum_teacher_id', title: '授课老师编号'}
                ,{field: 'curriculum_date', title: '上课时间'}
                ,{field: 'curriculum_place', title: '上课地点'}
                ,{field: 'curriculum_week', title: '周数'}
                ,{field: 'curriculum_type', title: '课程类型'}
                ,{field: 'curriculum_credit', title: '学分'}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
            ]]
        });
        $('#select_btn').click(function () {
            var inputVal = $('.layui-input').val()
            console.log(inputVal)
            table.reload('test', {
                url: '/curriculum_select_filter'
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
                layer.confirm('确认选择该课程吗？', function(index){
                    $.ajax({
                        url:"/ssm-02/studentSelectedCurriculum",
                        type:"POST",
                        data:{
                            "id":data.id
                            ,"curriculum_name":data.curriculum_name
                            ,"curriculum_teacher_id":data.curriculum_teacher_id
                            ,"curriculum_date":data.curriculum_date
                            ,"curriculum_place":data.curriculum_place
                            ,"curriculum_week":data.curriculum_week
                            ,"curriculum_type":data.curriculum_type
                            ,"curriculum_credit":data.curriculum_credit
                        },
                        dataType:"json",
                        success: function (data) {
                            console.log(data)
                            if (data==1){

                                layer.close(index);
                                layer.msg("选课成功",{icon:6});
                            }else if (data==505){
                                layer.msg("此课程已经选过啦！",{icon:5});
                            }else {
                                layer.msg("选课失败",{icon:5});
                            }
                        }
                    })
                });
            }
        });
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