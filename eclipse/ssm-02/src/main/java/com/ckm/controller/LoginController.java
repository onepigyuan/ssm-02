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


		if (role.equals("����Ա")) {
			Root rootLogin = loginServiceImpl.rootSelect(username, MD5.md5(password));
			System.out.println(rootLogin);
			if (rootLogin == null) {
				System.out.println("�û������������");
				return "404";
			}
			session.setAttribute(Constants.LOGIN_USER, "����Ա");
			session.setAttribute(Constants.ROOT_USERNAME, username);
			return "1";
		}
		if (role.equals("��ʦ")) {
			// ��½ --> md5����
			Teacher teacherLogin = loginServiceImpl.teacherSelect(username, MD5.md5(password));
			if (teacherLogin == null) {
				System.out.println("�û������������");
				return "404";
			}
			session.setAttribute(Constants.LOGIN_USER, "��ʦ");
			session.setAttribute(Constants.TEACHER_USERNAME, username);
			return "2";
		}
		if (role.equals("ѧ��")) {
			// ��½ --> md5����
			Student studentLogin = loginServiceImpl.studentSelect(username, MD5.md5(password));
			if (studentLogin == null) {
				System.out.println("�û������������");
				return "404";
			}
			session.setAttribute(Constants.LOGIN_USER, "ѧ��");
			session.setAttribute(Constants.STUDENT_USERNAME, username);
			return "3";
		}

		return "index";

	}
	
	//root��student��teacher�޸����룡
	@ResponseBody
	@RequestMapping("/updatePassword")
	public String updatePassword(String username,String password,String role) {
		System.out.println("�޸���������");
		System.out.println(role);
		if (role.equals("����Ա")) {
			int rootPs = loginServiceImpl.root_update_password(username, MD5.md5(password));
			System.out.println(rootPs);
			if (rootPs==1) {
				return "1";
			}else {
				return "404";
			}
			
		}else if (role.equals("��ʦ")) {
			int teacherPs = loginServiceImpl.teacher_update_password(username, MD5.md5(password));
			if (teacherPs==1) {
				return "1";
			}else {
				return "404";
			}
		}else if (role.equals("ѧ��")) {
			int studentPs = loginServiceImpl.student_update_password(username, MD5.md5(password));
			if (studentPs==1) {
				return "1";
			}else {
				return "404";
			}
		}

		return "ok";
	}

	
	
	
	
	
	//�˳���½ --> �ض���index ��½ҳ��
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		System.out.println("���� �˳���¼��");
		session.removeAttribute(Constants.ROOT_USERNAME);
		session.removeAttribute(Constants.STUDENT_USERNAME);
		session.removeAttribute(Constants.TEACHER_USERNAME);

		return "redirect:/index.jsp";
	}

}
