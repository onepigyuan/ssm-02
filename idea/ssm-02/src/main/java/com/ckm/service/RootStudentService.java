package com.ckm.service;

import java.util.List;

import com.ckm.pojo.Student;

public interface RootStudentService {
	//查询所有学生信息
    List<Student> select();
    //根据学生id删除一个学生
    int delete(int id);
    //增加一个学生
    int insert(Student student);
    //修改一个学生的信息
    int update(Student student);
    //根据分页查询学生信息
    List<Student> findPage(int pageLimit,int pageSize);
    //模糊查询
    List<Student> selectFilter(String like);


}
