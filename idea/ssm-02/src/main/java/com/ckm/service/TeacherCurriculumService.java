package com.ckm.service;

import java.util.List;

import com.ckm.pojo.Curriculum;

public interface TeacherCurriculumService {
	// ��ѯ�ҵĿγ�
		List<Curriculum> my_curriculum(String teacher_id);

		List<Curriculum> my_curriculum_findPage(int pageLimit, int pageSize, String teacher_id);

		// ��ѯ�ɼ��γ�
		List<Curriculum> select_success(String curriculum_teacher_id, String curriculum_name);

		List<Curriculum> select_findPage_success(int pageLimit, int pageSize, String teacher_id, String curriculum_name);

		// ���
		int success_update(Curriculum curriculum);
}
