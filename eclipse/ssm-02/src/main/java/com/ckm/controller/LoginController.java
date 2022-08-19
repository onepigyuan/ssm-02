package com.ckm.controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ckm.pojo.Root;
import com.ckm.pojo.Student;
import com.ckm.pojo.Teacher;
import com.ckm.service.LoginServiceImpl;
import com.ckm.utils.Constants;
import com.ckm.utils.MD5;

@Controller
public class LoginController {

	@Autowired
	private LoginServiceImpl loginServiceImpl;

	@RequestMapping("/")
	public String index() {
		return "index";
	}

	@ResponseBody
	@RequestMapping("/login")
	public String login(HttpSession session, @Param("username") String username, @Param("password") String password,
			@Param("role") String role) {


		if (role.equals("管理员")) {
			Root rootLogin = loginServiceImpl.rootSelect(username, MD5.md5(password));
			System.out.println(rootLogin);
			if (rootLogin == null) {
				System.out.println("用户名或密码错误！");
				return "404";
			}
			session.setAttribute(Constants.LOGIN_USER, "管理员");
			session.setAttribute(Constants.ROOT_USERNAME, username);
			return "1";
		}
		if (role.equals("教师")) {
			// 登陆 --> md5密码
			Teacher teacherLogin = loginServiceImpl.teacherSelect(username, MD5.md5(password));
			if (teacherLogin == null) {
				System.out.println("用户名或密码错误！");
				return "404";
			}
			session.setAttribute(Constants.LOGIN_USER, "教师");
			session.setAttribute(Constants.TEACHER_USERNAME, username);
			return "2";
		}
		if (role.equals("学生")) {
			// 登陆 --> md5密码
			Student studentLogin = loginServiceImpl.studentSelect(username, MD5.md5(password));
			if (studentLogin == null) {
				System.out.println("用户名或密码错误！");
				return "404";
			}
			session.setAttribute(Constants.LOGIN_USER, "学生");
			session.setAttribute(Constants.STUDENT_USERNAME, username);
			return "3";
		}

		return "index";

	}
	
	//root、student、teacher修改密码！
	@ResponseBody
	@RequestMapping("/updatePassword")
	public String updatePassword(String username,String password,String role) {
		System.out.println("修改密码请求");
		System.out.println(role);
		if (role.equals("管理员")) {
			int rootPs = loginServiceImpl.root_update_password(username, MD5.md5(password));
			System.out.println(rootPs);
			if (rootPs==1) {
				return "1";
			}else {
				return "404";
			}
			
		}else if (role.equals("教师")) {
			int teacherPs = loginServiceImpl.teacher_update_password(username, MD5.md5(password));
			if (teacherPs==1) {
				return "1";
			}else {
				return "404";
			}
		}else if (role.equals("学生")) {
			int studentPs = loginServiceImpl.student_update_password(username, MD5.md5(password));
			if (studentPs==1) {
				return "1";
			}else {
				return "404";
			}
		}

		return "ok";
	}

	
	
	
	
	
	//退出登陆 --> 重定向到index 登陆页面
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		System.out.println("进入 退出登录！");
		session.removeAttribute(Constants.ROOT_USERNAME);
		session.removeAttribute(Constants.STUDENT_USERNAME);
		session.removeAttribute(Constants.TEACHER_USERNAME);

		return "redirect:/index.jsp";
	}

}
