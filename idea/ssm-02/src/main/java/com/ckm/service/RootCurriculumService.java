package com.ckm.service;

import java.util.List;


import com.ckm.pojo.Curriculum;

public interface RootCurriculumService {
	//查询全部
	List<Curriculum> curriculums();
	 //根据学生id删除一个课程
    int delete(int id);
    //增加一个课程
    int insert(Curriculum curriculum);
    //修改一个课程的信息
    int update(Curriculum curriculum);
    //根据分页查询课程信息
    List<Curriculum> findPage(int pageLimit,int pageSize);
    //模糊查询
    List<Curriculum> selectFilter(String like);
}
