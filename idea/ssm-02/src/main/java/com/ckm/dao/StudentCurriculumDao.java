package com.ckm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.ckm.pojo.Curriculum;

public interface StudentCurriculumDao {
	// ����γ̵���ѡ
	@Insert("insert into tb_student_selectedcurriculum (curriculum_name,curriculum_teacher_id,curriculum_date,curriculum_place,curriculum_week,curriculum_type,curriculum_credit,student_id) values (#{curriculum_name},#{curriculum_teacher_id},#{curriculum_date},#{curriculum_place},#{curriculum_week},#{curriculum_type},#{curriculum_credit},#{student_id})")
	int insert_selected_curriculum(Curriculum curriculum);

	// ��ѯ��ѡ�Ŀγ�
	@Select("select * from tb_student_selectedcurriculum where student_id=#{student_id} and curriculum_success is null")
	List<Curriculum> selected_curriculum(String student_id);

	@Select("select * from tb_student_selectedcurriculum where student_id=#{arg2} and curriculum_success is null order by id limit #{arg1},#{arg0}")
	List<Curriculum> selected_curriculum_findPage(int pageLimit, int pageSize, String student_id);

	// ��ѯ���޵Ŀγ�
	@Select("select * from tb_student_selectedcurriculum where student_id=#{student_id} and curriculum_success is not null")
	List<Curriculum> complete_curriculum(String student_id);

	@Select("select * from tb_student_selectedcurriculum where student_id=#{arg2} and curriculum_success is not null order by id limit #{arg1},#{arg0}")
	List<Curriculum> complete_curriculum_findPage(int pageLimit, int pageSize, String student_id);

	// �ж��Ƿ��Ѿ����ڣ�
	@Select("select * from tb_student_selectedcurriculum where curriculum_name=#{curriculum_name} and curriculum_teacher_id=#{curriculum_teacher_id} and student_id=#{student_id}")
	List<Curriculum> if_select(@Param("curriculum_name") String curriculum_name,@Param("curriculum_teacher_id") String curriculum_teacher_id,@Param("student_id") String student_id);
}
