package com.ckm.service;

import java.util.List;

import com.ckm.pojo.Student;

public interface RootStudentService {
	//��ѯ����ѧ����Ϣ
    List<Student> select();
    //����ѧ��idɾ��һ��ѧ��
    int delete(int id);
    //����һ��ѧ��
    int insert(Student student);
    //�޸�һ��ѧ������Ϣ
    int update(Student student);
    //���ݷ�ҳ��ѯѧ����Ϣ
    List<Student> findPage(int pageLimit,int pageSize);
    //ģ����ѯ
    List<Student> selectFilter(String like);


}
