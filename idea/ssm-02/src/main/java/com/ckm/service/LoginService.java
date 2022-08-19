package com.ckm.service;


import org.apache.ibatis.annotations.Param;

import com.ckm.pojo.Root;
import com.ckm.pojo.Student;
import com.ckm.pojo.Teacher;

public interface LoginService {
	
	//管理员
	Root rootSelect(String username,String password);

	//教师
	Teacher teacherSelect(@Param("username") String username,@Param("password") String password);
	
	//学生
	Student studentSelect(@Param("username") String username,@Param("password") String password);
	
	//教师注册
	int teacherUpdate(Teacher teacher);
	
	//学生注册
	int studentUpdate(Student student);
	
	 //root用户修改密码
    int root_update_password(String username,String password);
    //学生修改密码
    int student_update_password(String username,String password);
    //教师修改密码
    int teacher_update_password(String username,String password);
}
