package com.ckm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ckm.dao.RootStudentDao;
import com.ckm.pojo.Student;

@Service
@Transactional
public class RootStudentServiceImpl implements RootStudentService{
	
	@Autowired
	private RootStudentDao studentDao;

	@Override
	public List<Student> select() {
		return studentDao.select();
	}

	@Override
	public int delete(int id) {
		return studentDao.delete(id);
	}

	@Override
	public int insert(Student student) {
		return studentDao.insert(student);
	}

	@Override
	public int update(Student student) {
		return studentDao.update(student);
	}

	@Override
	public List<Student> findPage(int pageLimit, int pageSize) {
	    int pageV=(pageSize-1)*pageLimit;
	    System.out.println(pageV+" "+pageLimit);

		return studentDao.findPage(pageLimit, pageV);
	}

	@Override
	public List<Student> selectFilter(String like) {
		return studentDao.selectFilter(like);
	}

}
