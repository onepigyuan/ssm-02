package com.ckm.service;

import java.util.List;


import com.ckm.pojo.Curriculum;
import com.ckm.pojo.Teacher;

public interface RootTeacherService {
	//查询所有教师信息
    List<Teacher> select();
    //根据学生id删除一个教师
    int delete(int id);
    //增加一个教师
    int insert(Teacher teacher);
    //修改一个教师的信息
    int update(Teacher teacher);
    //根据分页查询教师信息
    List<Teacher> findPage(int pageLimit,int pageSize);
    //模糊查询
    List<Teacher> selectFilter(String like);


    //查询我的课程
    List<Curriculum> my_curriculum(String teacher_id);
    List<Curriculum> my_curriculum_findPage(int pageLimit,int pageSize,String teacher_id);

    //查询成绩课程
    List<Curriculum> select_success(String teacher_id,String curriculum_name) ;
    List<Curriculum> select_findPage_success(int pageLimit,int pageSize,String teacher_id,String curriculum_name);

    //打分
    int success_update(Curriculum curriculum);
}
