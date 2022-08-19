package com.ckm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ckm.dao.LoginDao;
import com.ckm.pojo.Root;
import com.ckm.pojo.Student;
import com.ckm.pojo.Teacher;

@Service
@Transactional
public class LoginServiceImpl implements LoginService{
	
	@Autowired
	private LoginDao loginDao;

	
	public Root rootSelect(String username, String password) {
		return loginDao.rootSelect(username, password);
	}


	public Teacher teacherSelect(String username, String password) {
		return loginDao.teacherSelect(username, password);
	}


	public Student studentSelect(String username, String password) {
		return loginDao.studentSelect(username, password);
	}


	public int teacherUpdate(Teacher teacher) {
		return loginDao.teacherUpdate(teacher);
	}


	public int studentUpdate(Student student) {
		return loginDao.studentUpdate(student);
	}


	@Override
	public int root_update_password(String username, String password) {
		return loginDao.root_update_password(username, password);
	}


	@Override
	public int student_update_password(String username, String password){
		return loginDao.student_update_password(username, password);
	}


	@Override
	public int teacher_update_password(String username, String password) {
		return loginDao.teacher_update_password(username, password);
	}

}
