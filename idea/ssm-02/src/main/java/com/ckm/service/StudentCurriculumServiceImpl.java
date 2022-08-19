package com.ckm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ckm.dao.StudentCurriculumDao;
import com.ckm.pojo.Curriculum;

@Service
@Transactional
public class StudentCurriculumServiceImpl implements StudentCurriculumService{

	@Autowired
	private StudentCurriculumDao studentCurriculumDao;

	@Override
	public int insert_selected_curriculum(Curriculum curriculum) {
		return studentCurriculumDao.insert_selected_curriculum(curriculum);
	}

	@Override
	public List<Curriculum> selected_curriculum(String student_id) {
		return studentCurriculumDao.selected_curriculum(student_id);
	}

	@Override
	public List<Curriculum> selected_curriculum_findPage(int pageLimit, int pageSize, String student_id) {
		int pageV=(pageSize-1)*pageLimit;
		return studentCurriculumDao.selected_curriculum_findPage(pageLimit, pageV, student_id);
	}

	@Override
	public List<Curriculum> complete_curriculum(String student_id) {
		return studentCurriculumDao.complete_curriculum(student_id);
	}

	@Override
	public List<Curriculum> complete_curriculum_findPage(int pageLimit, int pageSize, String student_id) {
		int pageV=(pageSize-1)*pageLimit;
		return studentCurriculumDao.complete_curriculum_findPage(pageLimit, pageV, student_id);
	}

	@Override
	public List<Curriculum> if_select(String curriculum_name, String curriculum_teacher_id, String student_id) {
		return studentCurriculumDao.if_select(curriculum_name, curriculum_teacher_id, student_id);
	}

}
