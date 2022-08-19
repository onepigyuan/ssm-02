package com.ckm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.ckm.pojo.Teacher;

public interface RootTeacherDao {
	// ��ѯ���н�ʦ��Ϣ
	@Select("select * from tb_root_teacher,tb_root_curriculum where tb_root_teacher.teacher_id=tb_root_curriculum.curriculum_teacher_id")
	List<Teacher> select();

	// ����ѧ��idɾ��һ����ʦ
	@Delete("delete from tb_root_teacher where id=#{id}")
	int delete(int id);

	// ����һ����ʦ
	@Insert("insert into tb_root_teacher (teacher_id,teacher_name,teacher_gender,teacher_birth_year,teacher_education,teacher_title,teacher_entrydate,teacher_college) values (#{teacher_id},#{teacher_name},#{teacher_gender},#{teacher_birth_year},#{teacher_education},#{teacher_title},#{teacher_entrydate},#{teacher_college})")
	int insert(Teacher teacher);

	// �޸�һ����ʦ����Ϣ
	@Update("update tb_root_teacher set teacher_id=#{teacher_id},teacher_name=#{teacher_name},teacher_gender=#{teacher_gender},teacher_birth_year=#{teacher_birth_year},teacher_education=#{teacher_education},teacher_title=#{teacher_title},teacher_entrydate=#{teacher_entrydate},teacher_college=#{teacher_college} where id=#{id}")
	int update(Teacher teacher);

	// ���ݷ�ҳ��ѯ��ʦ��Ϣ
	@Select("select * from tb_root_teacher,tb_root_curriculum where tb_root_teacher.teacher_id=tb_root_curriculum.curriculum_teacher_id limit #{arg1},#{arg0}")
	List<Teacher> findPage(int pageLimit, int pageSize);

	// ģ����ѯ
	@Select("select * from tb_root_teacher where concat(teacher_id,teacher_name,teacher_gender,teacher_birth_year,teacher_education,teacher_title,teacher_entrydate,teacher_college) like #{like}")
	List<Teacher> selectFilter(String like);

}
