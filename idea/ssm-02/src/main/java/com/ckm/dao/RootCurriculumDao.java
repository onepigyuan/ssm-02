package com.ckm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.ckm.pojo.Curriculum;

public interface RootCurriculumDao {
	// 查询全部
	@Select("select * from tb_root_curriculum")
	List<Curriculum> curriculums();

	// 根据学生id删除一个课程
	@Delete("delete from tb_root_curriculum where id=#{id}")
	int delete(int id);

	// 增加一个课程
	@Insert("insert into tb_root_curriculum (curriculum_name,curriculum_teacher_id,curriculum_date,curriculum_place,curriculum_week,curriculum_type,curriculum_credit) values (#{curriculum_name},#{curriculum_teacher_id},#{curriculum_date},#{curriculum_place},#{curriculum_week},#{curriculum_type},#{curriculum_credit})")
	int insert(Curriculum curriculum);

	// 修改一个课程的信息
	@Update("update tb_root_curriculum set curriculum_name=#{curriculum_name},curriculum_teacher_id=#{curriculum_teacher_id},curriculum_date=#{curriculum_date},curriculum_place=#{curriculum_place},curriculum_week=#{curriculum_week},curriculum_type=#{curriculum_type},curriculum_credit=#{curriculum_credit} where id=#{id}")
	int update(Curriculum curriculum);

	// 根据分页查询课程信息
	@Select("select * from tb_root_curriculum order by id limit #{arg1},#{arg0}")
	List<Curriculum> findPage(int pageLimit, int pageSize);

	// 模糊查询
	@Select("select * from tb_root_curriculum where concat(id,curriculum_name,curriculum_teacher_id,curriculum_date,curriculum_place,curriculum_week,curriculum_type,curriculum_credit) like #{like}")
	List<Curriculum> selectFilter(String like);
}
