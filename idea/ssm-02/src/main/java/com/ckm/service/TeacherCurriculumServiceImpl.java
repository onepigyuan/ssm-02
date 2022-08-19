package com.ckm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ckm.dao.TeacherCurriculumDao;
import com.ckm.pojo.Curriculum;

@Service
@Transactional
public class TeacherCurriculumServiceImpl implements TeacherCurriculumService{
	
	@Autowired
	private TeacherCurriculumDao teacherCurriculumDao;

	@Override
	public List<Curriculum> my_curriculum(String teacher_id) {
		return teacherCurriculumDao.my_curriculum(teacher_id);
	}

	@Override
	public List<Curriculum> my_curriculum_findPage(int pageLimit, int pageSize, String teacher_id) {
		int pageV=(pageSize-1)*pageLimit;
		return teacherCurriculumDao.my_curriculum_findPage(pageLimit, pageV, teacher_id);
	}

	@Override
	public List<Curriculum> select_success(String curriculum_teacher_id, String curriculum_name) {
		return teacherCurriculumDao.select_success(curriculum_teacher_id, curriculum_name);
	}

	@Override
	public List<Curriculum> select_findPage_success(int pageLimit, int pageSize, String teacher_id,
			String curriculum_name) {
		int pageV=(pageSize-1)*pageLimit;
		return teacherCurriculumDao.select_findPage_success(pageLimit, pageV, teacher_id, curriculum_name);
	}

	@Override
	public int success_update(Curriculum curriculum) {
		return teacherCurriculumDao.success_update(curriculum);
	}

}
