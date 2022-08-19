package com.ckm.controller;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ckm.pojo.Student;
import com.ckm.pojo.Teacher;
import com.ckm.service.LoginServiceImpl;
import com.ckm.utils.Constants;
import com.ckm.utils.MD5;

@Controller
public class RegisterController {

	@Autowired
	private LoginServiceImpl loginServiceImpl;
	@Autowired
	private JavaMailSender javaMailSender;// 邮箱

	// 教师注册 //学生注册
	@ResponseBody
	@RequestMapping("/teacherAndStudentRegister")
	public String teacherAndStudentRegister(HttpSession httpSession, String username, String password, String role,
			String email_msg) {

		// 获取邮箱账号、获取邮箱验证码
		String msg = (String) httpSession.getAttribute(Constants.EMAIL_MSG);
		String nub = (String) httpSession.getAttribute(Constants.EMAIL_NUB);

		// 判断邮箱账号或验证码是否为空
		if (msg == null || nub == null) {
			return "501";
		}
		if (role.equals("教师")) {
			if (msg.equals(email_msg)) {
				// 注册 --> md5加密密码
				Teacher teacher = new Teacher(0, username, null, null, null, null, null, null, null, MD5.md5(password),
						nub, null);
				int register = loginServiceImpl.teacherUpdate(teacher);
				System.out.println(register);
				httpSession.removeAttribute(Constants.EMAIL_MSG);
				httpSession.removeAttribute(Constants.EMAIL_NUB);
				return "11";
			} else {
				return "505";
			}
		}
		if (role.equals("学生")) {
			if (msg.equals(email_msg)) {
				// 注册 --> md5加密密码
				Student student = new Student(0, username, null, null, null, null, null, MD5.md5(password), nub);
				int register = loginServiceImpl.studentUpdate(student);
				System.out.println(register);
				httpSession.removeAttribute(Constants.EMAIL_MSG);
				httpSession.removeAttribute(Constants.EMAIL_NUB);
				return "111";
			} else {
				return "505";
			}
		}
		return "index";

	}

	// 邮箱验证
	@PostMapping("/send")
	public String senMsg(HttpSession httpSession, @RequestParam("userEmail") String userEmail) {
		// 生成六位数验证码
		String Captcha = String.valueOf(new Random().nextInt(899999) + 100000);
		httpSession.setAttribute("Captcha", Captcha);// 存储验证码
		SimpleMailMessage message = new SimpleMailMessage();
		// 发件人的邮箱地址
		message.setFrom("809945573@qq.com");
		// 收件人的邮箱地址
		message.setTo(userEmail);
		// 邮件主题
		message.setSubject("验证码");
		// 邮件内容
		message.setText("验证码:" + Captcha);
		// 发送邮件
		javaMailSender.send(message);
		httpSession.setAttribute(Constants.EMAIL_MSG, Captcha);
		httpSession.setAttribute(Constants.EMAIL_NUB, userEmail);
		return "200";
	}

}
