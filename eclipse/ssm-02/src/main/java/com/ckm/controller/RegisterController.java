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
	private JavaMailSender javaMailSender;// ����

	// ��ʦע�� //ѧ��ע��
	@ResponseBody
	@RequestMapping("/teacherAndStudentRegister")
	public String teacherAndStudentRegister(HttpSession httpSession, String username, String password, String role,
			String email_msg) {

		// ��ȡ�����˺š���ȡ������֤��
		String msg = (String) httpSession.getAttribute(Constants.EMAIL_MSG);
		String nub = (String) httpSession.getAttribute(Constants.EMAIL_NUB);

		// �ж������˺Ż���֤���Ƿ�Ϊ��
		if (msg == null || nub == null) {
			return "501";
		}
		if (role.equals("��ʦ")) {
			if (msg.equals(email_msg)) {
				// ע�� --> md5��������
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
		if (role.equals("ѧ��")) {
			if (msg.equals(email_msg)) {
				// ע�� --> md5��������
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

	// ������֤
	@PostMapping("/send")
	public String senMsg(HttpSession httpSession, @RequestParam("userEmail") String userEmail) {
		// ������λ����֤��
		String Captcha = String.valueOf(new Random().nextInt(899999) + 100000);
		httpSession.setAttribute("Captcha", Captcha);// �洢��֤��
		SimpleMailMessage message = new SimpleMailMessage();
		// �����˵������ַ
		message.setFrom("809945573@qq.com");
		// �ռ��˵������ַ
		message.setTo(userEmail);
		// �ʼ�����
		message.setSubject("��֤��");
		// �ʼ�����
		message.setText("��֤��:" + Captcha);
		// �����ʼ�
		javaMailSender.send(message);
		httpSession.setAttribute(Constants.EMAIL_MSG, Captcha);
		httpSession.setAttribute(Constants.EMAIL_NUB, userEmail);
		return "200";
	}

}
