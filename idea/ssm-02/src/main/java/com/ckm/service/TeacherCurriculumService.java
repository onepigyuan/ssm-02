package com.ckm.service;

import java.util.List;

import com.ckm.pojo.Curriculum;

public interface TeacherCurriculumService {
	// 查询我的课程
		List<Curriculum> my_curriculum(String teacher_id);

		List<Curriculum> my_curriculum_findPage(int pageLimit, int pageSize, String teacher_id);

		// 查询成绩课程
		List<Curriculum> select_success(String curriculum_teacher_id, String curriculum_name);

		List<Curriculum> select_findPage_success(int pageLimit, int pageSize, String teacher_id, String curriculum_name);

		// 打分
		int success_update(Curriculum curriculum);
}
