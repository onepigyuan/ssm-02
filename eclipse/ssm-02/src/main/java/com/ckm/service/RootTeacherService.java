package com.ckm.service;

import java.util.List;


import com.ckm.pojo.Curriculum;
import com.ckm.pojo.Teacher;

public interface RootTeacherService {
	//��ѯ���н�ʦ��Ϣ
    List<Teacher> select();
    //����ѧ��idɾ��һ����ʦ
    int delete(int id);
    //����һ����ʦ
    int insert(Teacher teacher);
    //�޸�һ����ʦ����Ϣ
    int update(Teacher teacher);
    //���ݷ�ҳ��ѯ��ʦ��Ϣ
    List<Teacher> findPage(int pageLimit,int pageSize);
    //ģ����ѯ
    List<Teacher> selectFilter(String like);


    //��ѯ�ҵĿγ�
    List<Curriculum> my_curriculum(String teacher_id);
    List<Curriculum> my_curriculum_findPage(int pageLimit,int pageSize,String teacher_id);

    //��ѯ�ɼ��γ�
    List<Curriculum> select_success(String teacher_id,String curriculum_name) ;
    List<Curriculum> select_findPage_success(int pageLimit,int pageSize,String teacher_id,String curriculum_name);

    //���
    int success_update(Curriculum curriculum);
}
