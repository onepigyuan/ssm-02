package com.ckm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ckm.dao.RootCurriculumDao;
import com.ckm.pojo.Curriculum;

@Service
@Transactional
public class RootCurriculumServiceImpl implements RootCurriculumService{
	
	@Autowired
	private RootCurriculumDao curriculumDao;

	@Override
	public List<Curriculum> curriculums() {
		return curriculumDao.curriculums();
	}

	@Override
	public int delete(int id) {
		return curriculumDao.delete(id);
	}

	@Override
	public int insert(Curriculum curriculum) {
		return curriculumDao.insert(curriculum);
	}

	@Override
	public int update(Curriculum curriculum) {
		return curriculumDao.update(curriculum);
	}

	@Override
	public List<Curriculum> findPage(int pageLimit, int pageSize) {
		int pageV=(pageSize-1)*pageLimit;
		return curriculumDao.findPage(pageLimit, pageV);
	}

	@Override
	public List<Curriculum> selectFilter(String like) {
		return curriculumDao.selectFilter(like);
	}

}
