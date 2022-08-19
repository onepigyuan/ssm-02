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
        <h1><img src="../../images/y.jpg" class="radius-circle rotate-hover" height="50" alt="" />教师管理中心</h1>
    </div>
    <div class="head-l"><a class="button button-little bg-green" href="" target="_blank"><span class="icon-home"></span> 前台首页</a> &nbsp;&nbsp;<a href="##" class="button button-little bg-blue"><span class="icon-wrench"></span> 清除缓存</a> &nbsp;&nbsp;<a class="button button-little bg-red" href="/logout"><span class="icon-power-off"></span> 退出登录</a> </div>
</div>
<div class="leftnav">
    <div class="leftnav-title"><strong><span class="icon-list"></span>功能列表</strong></div>
    <h2><span class="icon-user"></span>教师平台(${sessionScope.teacher_username})</h2>
    <ul style="display:block">
        <li><a href="../../jsp/teacher/my_curriculum.jsp" ><span class="icon-caret-right"></span>我的课程</a></li>
        <li><a href="../../jsp/teacher/password.jsp" style="background-color: #E6E6FA"><span class="icon-caret-right"></span>修改密码</a></li>
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
    <li><a href="#" id="a_leader_txt">修改密码</a></li>
    <li><b>当前语言：</b><span style="color:red;">中文</php></span>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;切换语言：<a href="#">中文</a> &nbsp;&nbsp;<a href="#">英文</a> </li>
</ul>


<div class="admin">
    <%--  <iframe scrolling="auto" rameborder="0" src="info.html" name="right" width="100%" height="100%"></iframe>--%>

    <!-- 内容主体区域 -->
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
        <legend>修改密码</legend>
    </fieldset>
    <div class="layui-form layui-form-pane">

        <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-inline">
                <input style="cursor:not-allowed" disabled="disabled" type="text" name="username" id="user_username" value="${sessionScope.teacher_username}" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">新密码</label>
            <div class="layui-input-inline">
                <input type="password" name="username" id="user_password" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">再次输入</label>
            <div class="layui-input-inline">
                <input type="password" name="username" id="user_password2" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1" onclick="teacher_btn()">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary" onclick="teacher_clear()">重置</button>
            </div>
        </div>
    </div>
</div>



<style>
    .copyrights{text-indent:-9999px;height:0;line-height:0;font-size:0;overflow:hidden;}
</style>

</body>
</html>

<script>
    function teacher_btn() {
        var username = $("#user_username").val()
        var password = $("#user_password").val()
        var password2 = $("#user_password2").val()
        layui.use("layer", function () {
            var layer = layui.layer;
            if (password == password2){
                $.ajax({
                    url: "/updatePassword"
                    ,type: "POST"
                    ,data: {"username":username,"password":password,"role":"${sessionScope.login_user}"}
                    ,dataType: "json"
                    ,success: function (data) {
                        if (data==1){
                            layer.msg("修改密码成功",{icon:6});
                            $("#user_password").val('')
                            $("#user_password2").val('')
                        }else if (data==0){
                            layer.msg("修改密码失败",{icon:5});
                        }else if (data==404){
                            layer.msg("修改密码失败",{icon:5});
                        }
                    }
                })
            }
            else {
                layer.msg("两次输入密码不一致！",{icon:5});
            }
        })
    }
</script>
<script>
    function teacher_clear() {
        $("#user_password").val('')
        $("#user_password2").val('')
    }
</script>