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
    <li><a href="../../jsp/teacher/my_curriculum.jsp" style="background-color: #E6E6FA"><span class="icon-caret-right"></span>我的课程</a></li>
    <li><a href="../../jsp/teacher/password.jsp" ><span class="icon-caret-right"></span>修改密码</a></li>
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
  <li><a href="#" id="a_leader_txt">我的课程</a></li>
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

<!--update-->
<div id="curriculum_update" style="display: none">
  <input id='tb_curriculum_id' type='text' class='layui-layer-input' style="cursor:not-allowed" disabled="disabled" >
  <input style='margin-top:10px;cursor:not-allowed' id='curriculum_name' type='text' class='layui-layer-input' placeholder='请输入课程名称' disabled="disabled" >
  <input style='margin-top:10px;cursor:not-allowed' id='curriculum_teacher_id' type='text' class='layui-layer-input' placeholder='请输入授课老师编号' disabled="disabled" >
  <input style='margin-top:10px;cursor:not-allowed' id='curriculum_date' type='date' class='layui-layer-input' placeholder='请输入上课时间' disabled="disabled" >
  <input style='margin-top:10px;cursor:not-allowed' id='curriculum_place' type='text' class='layui-layer-input' placeholder='请输入上课地点' disabled="disabled" >
  <input style='margin-top:10px;cursor:not-allowed' id='curriculum_week' type='text' class='layui-layer-input' placeholder='请输入周数' disabled="disabled" >
  <input style='margin-top:10px;cursor:not-allowed' id='curriculum_type' type='text' class='layui-layer-input' placeholder='请输入课程类型' disabled="disabled" >
  <input style='margin-top:10px;cursor:not-allowed' id='curriculum_credit' type='text' class='layui-layer-input' placeholder='请输入学分' disabled="disabled" >
  <input style='margin-top:10px;cursor:not-allowed' id='curriculum_student_id' type='text' class='layui-layer-input' placeholder='请输入学生学号' disabled="disabled" >
  <input style='margin-top:10px;' id='curriculum_student_success' type='text' class='layui-layer-input' placeholder='请输入学生成绩'>

</div>

<style>
  .copyrights{text-indent:-9999px;height:0;line-height:0;font-size:0;overflow:hidden;}
</style>

</body>
</html>
<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del" id="success_bar">成绩管理</a>
</script>
<script type="text/html" id="barDemo1">
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">打分</a>
</script>
<script type="text/html" id="toolbarDemo">
  <div class="layui-btn-container">
    <button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>
  </div>
</script>
<script>

  <!-- 查询全部 -->
  layui.use('table', function() {
    var table = layui.table;

    table.render({
      elem: '#test'
      , cellMinWidth: 80
      , page: true
      , limit: 10
      , url: '/myCurriculumJson'
      , toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
      , defaultToolbar: ['filter1', 'exports', 'print1', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
        title: '提示'
        , layEvent: 'LAYTABLE_TIPS1'
        , icon: 'layui-icon-tips1'
      }]
      , title: '用户数据表'
      , done: function (res, curr, count) {
        $("table").css("width", "100%");
      }
      , cols: [[
        {type: 'checkbox'}
        , {field: 'id', title: '序号'}
        , {field: 'curriculum_name', title: '课程名称'}
        , {field: 'curriculum_teacher_id', title: '授课老师编号'}
        , {field: 'curriculum_date', title: '上课时间'}
        , {field: 'curriculum_place', title: '上课地点'}
        , {field: 'curriculum_week', title: '周数'}
        , {field: 'curriculum_type', title: '课程类型'}
        , {field: 'curriculum_credit', title: '学分'}
        // , {field: 'student_id', title: ''}
        // , {field: 'curriculum_success', title: ''}
        , {fixed: 'right', title: '操作', toolbar: '#barDemo', width: 150}
      ]]
    });
    <!-- 模糊 后端未写 -->
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
    table.on('toolbar(test)', function (obj) {
      var checkStatus = table.checkStatus(obj.config.id);
      switch (obj.event) {
        case 'getCheckData':
          var data = checkStatus.data;
          layer.alert(JSON.stringify(data));
          break;
      }
    });
    
    <!-- 点击课程后跳转到新的表格 去打分！ -->
    //监听行工具事件
    table.on('tool(test)', function(obj){
        var data = obj.data;
        if(obj.event === 'del'){

          $.ajax({
            url: '/select_student_success'
            ,type:"GET"
            ,data:{"curriculum_teacher_id":data.curriculum_teacher_id,"curriculum_name":data.curriculum_name}
            ,dataType:"json"
            ,success: function (data) {
                console.log(data)
              table.render({
                elem: '#test'
                , cellMinWidth: 80
                , page: true
                , limit: 10
                , data: data
                , toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
                , defaultToolbar: ['filter1', 'exports', 'print1', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
                  title: '提示'
                  , layEvent: 'LAYTABLE_TIPS1'
                  , icon: 'layui-icon-tips1'
                }]
                , title: '用户数据表'
                , done: function (res, curr, count) {
                  $("table").css("width", "100%");
                }
              , cols: [[
                  {type: 'checkbox'}
                  , {field: 'id', title: '序号'}
                  , {field: 'curriculum_name', title: '课程名称'}
                  , {field: 'curriculum_teacher_id', title: '授课老师编号'}
                  , {field: 'curriculum_date', title: '上课时间'}
                  , {field: 'curriculum_place', title: '上课地点'}
                  , {field: 'curriculum_week', title: '周数'}
                  , {field: 'curriculum_type', title: '课程类型'}
                  , {field: 'curriculum_credit', title: '学分'}
                  , {field: 'student_id', title: '学号'}
                  , {field: 'curriculum_success', title: '成绩'}
                  , {fixed: 'right', title: '操作', toolbar: '#barDemo', width: 150}
                ]]
              });
              table.on('tool(test)', function(obj) {
                var data = obj.data;
                console.log(obj)
                if (obj.event === 'del') {
                  layer.open({
                    type: 1 //Page层类型
                    ,btn:["确定","取消"]
                    ,title: '修改宿舍信息'
                    ,skin: 'layui-layer-prompt'
                    ,content:$('#curriculum_update').html(function () {
                      $("#tb_curriculum_id").val(data.id)
                      $("#curriculum_name").val(data.curriculum_name)
                      $("#curriculum_teacher_id").val(data.curriculum_teacher_id)
                      $("#curriculum_date").val(data.curriculum_date)
                      $("#curriculum_place").val(data.curriculum_place)
                      $("#curriculum_week").val(data.curriculum_week)
                      $("#curriculum_type").val(data.curriculum_type)
                      $("#curriculum_credit").val(data.curriculum_credit)
                      $("#curriculum_student_id").val(data.student_id)
                      $("#curriculum_student_success").val(data.curriculum_success)

                    })
                    ,yes: function(index, layero){
                      //打分 编辑
                      $.ajax({
                        url: "/select_student_success"
                        ,type:"POST"
                        ,data:{
                          "id":$(layero).find("#tb_curriculum_id").val()
                          ,"curriculum_name":$(layero).find("#curriculum_name").val()
                          ,"curriculum_teacher_id":$(layero).find("#curriculum_teacher_id").val()
                          ,"curriculum_date":$(layero).find("#curriculum_date").val()
                          ,"curriculum_place":$(layero).find("#curriculum_place").val()
                          ,"curriculum_week":$(layero).find("#curriculum_week").val()
                          ,"curriculum_type":$(layero).find("#curriculum_type").val()
                          ,"curriculum_credit":$(layero).find("#curriculum_credit").val()
                          ,"curriculum_student_id":$(layero).find("#curriculum_student_id").val()
                          ,"curriculum_student_success":$(layero).find("#curriculum_student_success").val()
                        }
                        ,dataType: "json"
                        ,success: function (data) {
                          if (data==1){
                              obj.update({
                                id:$(layero).find("#tb_curriculum_id").val()
                                ,curriculum_name:$(layero).find("#curriculum_name").val()
                                ,curriculum_teacher_id:$(layero).find("#curriculum_teacher_id").val()
                                ,curriculum_date:$(layero).find("#curriculum_date").val()
                                ,curriculum_place:$(layero).find("#curriculum_place").val()
                                ,curriculum_week:$(layero).find("#curriculum_week").val()
                                ,curriculum_type:$(layero).find("#curriculum_type").val()
                                ,curriculum_credit:$(layero).find("#curriculum_credit").val()
                                ,student_id:$(layero).find("#curriculum_student_id").val()
                                ,curriculum_success:$(layero).find("#curriculum_student_success").val()
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
              })
          }

        })





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