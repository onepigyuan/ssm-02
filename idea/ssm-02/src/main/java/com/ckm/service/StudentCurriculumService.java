package com.ckm.service;

import java.util.List;


import com.ckm.pojo.Curriculum;

public interface StudentCurriculumService {
	// 插入课程到已选
	int insert_selected_curriculum(Curriculum curriculum);

	// 查询已选的课程
	List<Curriculum> selected_curriculum(String student_id);

	List<Curriculum> selected_curriculum_findPage(int pageLimit, int pageSize, String student_id);

	// 查询已修的课程
	List<Curriculum> complete_curriculum(String student_id);

	List<Curriculum> complete_curriculum_findPage(int pageLimit, int pageSize, String student_id);

	// 判断是否已经存在？
	List<Curriculum> if_select(String curriculum_name, String curriculum_teacher_id, String student_id);
}
