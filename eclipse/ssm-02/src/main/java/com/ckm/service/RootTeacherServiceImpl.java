package com.ckm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ckm.dao.RootTeacherDao;
import com.ckm.pojo.Curriculum;
import com.ckm.pojo.Teacher;

@Service
@Transactional
public class RootTeacherServiceImpl implements RootTeacherService{
	
	@Autowired
	private RootTeacherDao rootTeacherDao;
	
	@Override
	public List<Teacher> select() {
		return rootTeacherDao.select();
	}

	@Override
	public int delete(int id) {
		return rootTeacherDao.delete(id);
	}

	@Override
	public int insert(Teacher teacher) {
		return rootTeacherDao.insert(teacher);
	}

	@Override
	public int update(Teacher teacher) {
		return rootTeacherDao.update(teacher);
	}

	@Override
	public List<Teacher> findPage(int pageLimit, int pageSize) {
	    int pageV=(pageSize-1)*pageLimit;
		return rootTeacherDao.findPage(pageLimit, pageV);
	}

	@Override
	public List<Teacher> selectFilter(String like) {
		return rootTeacherDao.selectFilter(like);
	}


	@Override
	public List<Curriculum> my_curriculum(String teacher_id) {
		return null;
	}

	@Override
	public List<Curriculum> my_curriculum_findPage(int pageLimit, int pageSize, String teacher_id) {
		return null;
	}

	@Override
	public List<Curriculum> select_success(String teacher_id, String curriculum_name) {
		return null;
	}

	@Override
	public List<Curriculum> select_findPage_success(int pageLimit, int pageSize, String teacher_id,
			String curriculum_name) {
		return null;
	}

	@Override
	public int success_update(Curriculum curriculum) {
		return 0;
	}

}
