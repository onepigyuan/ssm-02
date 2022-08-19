<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-cn">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
  <meta name="renderer" content="webkit">
  <title>登录</title>
  <link rel="stylesheet" href="css/pintuer.css">
  <link rel="stylesheet" href="css/admin.css">
  <script src="js/jquery.js"></script>
  <script src="js/pintuer.js"></script>
  <script src="layui/layui.js"></script>
  <script src="layui/css/layui.css"></script>
</head>
<body>
<div class="bg"></div>
<div class="container">
  <div class="line bouncein">
    <div class="xs6 xm4 xs3-move xm4-move">
      <div style="height:55px;"></div>
      <div class="media media-y margin-big-bottom">
      </div>
      <div  id="login">
        <div class="panel loginbox">
          <div class="text-center margin-big padding-big-top"><h1>后台管理中心</h1></div>
          <div class="panel-body" style="padding:30px; padding-bottom:10px; padding-top:10px;">
            <div class="form-group">
              <div class="field field-icon-right">
                <input type="text" class="input input-big" id="username" placeholder="登录账号" data-validate="required:请填写账号" />
                <span class="icon icon-key margin-small"></span>
              </div>
            </div>
            <div class="form-group">
              <div class="field field-icon-right">
                <input type="password" class="input input-big" id="password" placeholder="登录密码" data-validate="required:请填写密码" />
                <span class="icon icon-key margin-small"></span>
              </div>
            </div>
            <div class="form-group">
              <div class="field field-icon-right">
                <input type="text" class="input input-big" id="role" list="sexlist" placeholder="角色登录" data-validate="required:请填写角色" />
                <datalist id="sexlist">
                  <option>管理员</option>
                  <option>教师</option>
                  <option>学生</option>
                </datalist>
                <span class="icon icon-user margin-small"></span>
              </div>
            </div>
            <div class="form-group">
              <div class="field">
                <input type="text" class="input input-big" name="code" placeholder="填写右侧的验证码" data-validate="required:请填写右侧的验证码" />
                <img src="images/passcode.jpg" alt="" width="100" height="32" class="passcode" style="height:43px;cursor:pointer;" onclick="this.src=this.src+'?'">
              </div>
            </div>
          </div>
          <div style="padding:30px;">
            <input type="submit" class="button button-block bg-main text-big input-big" id="btn_login" value="登录">
            <input type="submit" id="btn_register" class="button button-block bg-main text-big input-big" value="注册" style="margin-top: 8px">
          </div>
        </div>
      </div>

      <div  style="display:none;" id="register">
        <div class="panel loginbox">
          <div class="text-center margin-big padding-big-top"><h1>后台管理中心</h1></div>
          <div class="panel-body" style="padding:30px; padding-bottom:10px; padding-top:10px;">
            <div class="form-group">
              <div class="field field-icon-right">
                <input type="text" class="input input-big" id="register_username" placeholder="账号或邮箱" data-validate="required:请填写账号" />
                <span class="icon icon-key margin-small"></span>
              </div>
            </div>
            <div class="form-group">
              <div class="field field-icon-right">
                <input type="password" class="input input-big" id="register_password" placeholder="密码" data-validate="required:请填写密码" />
                <span class="icon icon-key margin-small"></span>
              </div>
            </div>
            <div class="form-group">
              <div class="field field-icon-right">
                <input type="password" class="input input-big" id="register_password2" placeholder="确认密码" data-validate="required:请再次填写密码" />
                <span class="icon icon-key margin-small"></span>
              </div>
            </div>
            
            
            
            
			<!-- 邮箱验证！ -->
             <div class="form-group">
              <div class="field">
                <input type="text" class="input input-big" id="register_email" name="code" placeholder="邮箱" data-validate="required:请填写右侧的邮箱" />
                <img src="images/4DABC565-FEA7-43F3-A4E5-5C323085D016.png" id="btn_email" alt="" width="100" height="32" class="passcode" style="height:43px;cursor:pointer;" onclick="this.src=this.src+'?'">
              </div>
            </div>
              <div class="form-group">
              <div class="field field-icon-right">
                <input type="text" class="input input-big" id="email_msg" placeholder="请输入验证码" data-validate="required:请填写账号" />
                <span class="icon icon-key margin-small"></span>
              </div>
            </div>
            
            
            
            
            <div class="form-group">
              <div class="field field-icon-right">
                <input type="text" class="input input-big" id="register_role" list="sexlist1" placeholder="角色登录" data-validate="required:请填写角色" />
                <datalist id="sexlist1">
<%--                  <option>管理员</option>--%>
                  <option>教师</option>
                  <option>学生</option>
                </datalist>
                <span class="icon icon-user margin-small"></span>
              </div>
            </div>
          </div>
          <div style="padding:30px;"><input type="submit" class="button button-block bg-main text-big input-big" id="btn_register_click" value="注册"></div>
        </div>
      </div>

    </div>
  </div>
</div>

</body>
</html>
<script>
  $("#btn_register").click(function () {
    $("#login").css('display','none')
    $("#register").css('display','block')
  })
</script>
<script>
  $("#btn_login").click(function () {
    layui.use("layer", function () {
      var layer = layui.layer;
      $.ajax({
        url: "/ssm-02/login",
        type: "post",
        data: {
          "username": $("#username").val()
          , "password": $("#password").val()
          , "role": $("#role").val()
        },
        dataType: "json",
        success: function (data) {
          console.log(data)
          if (data == 1) {
            layer.msg("登录成功",{icon:6,time:1500},function () {
              window.location.href = '/ssm-02/jsp/root/student.jsp';
            });
          } else if (data == 2) {
            layer.msg("登录成功",{icon:6,time:1500},function () {
              window.location.href = '/ssm-02/jsp/teacher/my_curriculum.jsp';
            });

          } else if (data == 3) {
            layer.msg("登录成功",{icon:6,time:1500},function () {
              window.location.href = '/ssm-02/jsp/student/all_curriculum.jsp';
            })
          } else if (data==404){
            layer.msg("用户名或密码错误",{icon:5});
            $("#username").val('')
            $("#password").val('')
          }
        }
      })
    })
  })
</script>

<script>
  $("#btn_register_click").click(function () {
    layui.use("layer", function () {
      var layer = layui.layer;
      if ($("#register_password").val() == $("#register_password2").val()) {
        $.ajax({
          url: "/ssm-02/teacherAndStudentRegister",
          type: "post",
          data: {
             "username": $("#register_username").val()
            , "password": $("#register_password").val()
            , "role": $("#register_role").val()
            , "email_msg": $("#email_msg").val()
            
          },
          dataType: "json",
          success: function (data) {
            console.log(data)
            if (data == 11) {
              layer.msg("注册成功，正在跳转登录页面···",{icon:6,time:1500},function () {
                window.location.href = 'index.jsp';
              });
            } else if (data == 111) {
              layer.msg("注册成功，正在跳转登录页面···",{icon:6,time:1500},function () {
                window.location.href = 'index.jsp';
              });
            } else if (data==404){
              layer.msg("注册失败",{icon:5});
              $("#password").val('')
            }else if (data==505){
                layer.msg("请输入正确的邮箱验证码",{icon:5});
                $("#email_msg").val('')
            }else if (data==501){
                layer.msg("请先发送验证码",{icon:5});
            }
          }
        })
        return false;
      } else {
        alert("两次输入密码不一致！")
      }
    })
  })
</script>

<script>
$("#btn_email").click(function(){
	layui.use("layer", function () {
	layer.msg("发送成功",{icon:6,time:1500},function () {
				
		$.ajax({
			url: "/ssm-02/send"
			,type: "post"
			,data: {"userEmail":$("#register_email").val()}
			,success: function data() {
	            console.log(data)
			}
		})
	    });
	
})
})
</script>
<script>
	window.${sessionScope.login_role}
</script>