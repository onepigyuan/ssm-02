package com.ckm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.ckm.pojo.Student;

public interface RootStudentDao {
	// ��ѯ����ѧ����Ϣ
	@Select("select * from tb_root_student")
	List<Student> select();

	// ����ѧ��idɾ��һ��ѧ��
	@Delete("delete from tb_root_student where id=#{id}")
	int delete(int id);

	// ����һ��ѧ��
	@Insert("insert into tb_root_student (student_id,student_name,student_gender,student_birth_year,student_entrance,student_college) values (#{student_id},#{student_name},#{student_gender},#{student_birth_year},#{student_entrance},#{student_college})")
	int insert(Student student);

	// �޸�һ��ѧ������Ϣ
	@Update("update tb_root_student set student_id=#{student_id},student_name=#{student_name},student_gender=#{student_gender},student_birth_year=#{student_birth_year},student_entrance=#{student_entrance},student_college=#{student_college},password=#{password} where id=#{id}")
	int update(Student student);

	// ���ݷ�ҳ��ѯѧ����Ϣ
	@Select("select * from tb_root_student order by id limit #{arg1},#{arg0}")
	List<Student> findPage(int pageLimit, int pageSize);

	// ģ����ѯ
	@Select("select * from tb_root_student where concat(student_id,student_name,student_gender,student_birth_year,student_entrance,student_college) like #{like}")
	List<Student> selectFilter(String like);


}
