package com.ckm.service;

import java.util.List;


import com.ckm.pojo.Curriculum;

public interface RootCurriculumService {
	//��ѯȫ��
	List<Curriculum> curriculums();
	 //����ѧ��idɾ��һ���γ�
    int delete(int id);
    //����һ���γ�
    int insert(Curriculum curriculum);
    //�޸�һ���γ̵���Ϣ
    int update(Curriculum curriculum);
    //���ݷ�ҳ��ѯ�γ���Ϣ
    List<Curriculum> findPage(int pageLimit,int pageSize);
    //ģ����ѯ
    List<Curriculum> selectFilter(String like);
}
