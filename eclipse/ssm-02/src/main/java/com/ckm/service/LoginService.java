package com.ckm.service;


import org.apache.ibatis.annotations.Param;

import com.ckm.pojo.Root;
import com.ckm.pojo.Student;
import com.ckm.pojo.Teacher;

public interface LoginService {
	
	//����Ա
	Root rootSelect(String username,String password);

	//��ʦ
	Teacher teacherSelect(@Param("username") String username,@Param("password") String password);
	
	//ѧ��
	Student studentSelect(@Param("username") String username,@Param("password") String password);
	
	//��ʦע��
	int teacherUpdate(Teacher teacher);
	
	//ѧ��ע��
	int studentUpdate(Student student);
	
	 //root�û��޸�����
    int root_update_password(String username,String password);
    //ѧ���޸�����
    int student_update_password(String username,String password);
    //��ʦ�޸�����
    int teacher_update_password(String username,String password);
}
