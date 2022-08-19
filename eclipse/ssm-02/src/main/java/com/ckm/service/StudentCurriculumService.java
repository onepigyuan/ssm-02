package com.ckm.service;

import java.util.List;


import com.ckm.pojo.Curriculum;

public interface StudentCurriculumService {
	// ����γ̵���ѡ
	int insert_selected_curriculum(Curriculum curriculum);

	// ��ѯ��ѡ�Ŀγ�
	List<Curriculum> selected_curriculum(String student_id);

	List<Curriculum> selected_curriculum_findPage(int pageLimit, int pageSize, String student_id);

	// ��ѯ���޵Ŀγ�
	List<Curriculum> complete_curriculum(String student_id);

	List<Curriculum> complete_curriculum_findPage(int pageLimit, int pageSize, String student_id);

	// �ж��Ƿ��Ѿ����ڣ�
	List<Curriculum> if_select(String curriculum_name, String curriculum_teacher_id, String student_id);
}
