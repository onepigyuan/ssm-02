package com.ckm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.ckm.pojo.Curriculum;

public interface TeacherCurriculumDao {
	// ��ѯ�ҵĿγ�
	@Select("select * from tb_root_curriculum where curriculum_teacher_id=#{teacher_id}")
	List<Curriculum> my_curriculum(String teacher_id);
	//��ҳ
	@Select("select * from tb_root_curriculum where curriculum_teacher_id=#{arg2} order by id limit #{arg1},#{arg0}")
	List<Curriculum> my_curriculum_findPage(int pageLimit, int pageSize, String teacher_id);

	// ��ѯ�ɼ��γ�
	@Select("select * from tb_student_selectedcurriculum where curriculum_teacher_id=#{curriculum_teacher_id} and curriculum_name=#{curriculum_name}")
	List<Curriculum> select_success(@Param("curriculum_teacher_id") String curriculum_teacher_id,@Param("curriculum_name") String curriculum_name);
	@Select("select * from tb_student_selectedcurriculum where curriculum_teacher_id=#{arg2} and curriculum_name=#{arg3} order by id limit #{arg1},#{arg0}")
	List<Curriculum> select_findPage_success(int pageLimit, int pageSize, String teacher_id, String curriculum_name);

	// ���
	@Update("update tb_student_selectedcurriculum set curriculum_name=#{curriculum_name},curriculum_teacher_id=#{curriculum_teacher_id},curriculum_date=#{curriculum_date},curriculum_place=#{curriculum_place},curriculum_week=#{curriculum_week},curriculum_type=#{curriculum_type},curriculum_credit=#{curriculum_credit},student_id=#{student_id},curriculum_success=#{curriculum_success} where id=#{id}")
	int success_update(Curriculum curriculum);
}
