package com.ckm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.ckm.pojo.Curriculum;

public interface RootCurriculumDao {
	// ��ѯȫ��
	@Select("select * from tb_root_curriculum")
	List<Curriculum> curriculums();

	// ����ѧ��idɾ��һ���γ�
	@Delete("delete from tb_root_curriculum where id=#{id}")
	int delete(int id);

	// ����һ���γ�
	@Insert("insert into tb_root_curriculum (curriculum_name,curriculum_teacher_id,curriculum_date,curriculum_place,curriculum_week,curriculum_type,curriculum_credit) values (#{curriculum_name},#{curriculum_teacher_id},#{curriculum_date},#{curriculum_place},#{curriculum_week},#{curriculum_type},#{curriculum_credit})")
	int insert(Curriculum curriculum);

	// �޸�һ���γ̵���Ϣ
	@Update("update tb_root_curriculum set curriculum_name=#{curriculum_name},curriculum_teacher_id=#{curriculum_teacher_id},curriculum_date=#{curriculum_date},curriculum_place=#{curriculum_place},curriculum_week=#{curriculum_week},curriculum_type=#{curriculum_type},curriculum_credit=#{curriculum_credit} where id=#{id}")
	int update(Curriculum curriculum);

	// ���ݷ�ҳ��ѯ�γ���Ϣ
	@Select("select * from tb_root_curriculum order by id limit #{arg1},#{arg0}")
	List<Curriculum> findPage(int pageLimit, int pageSize);

	// ģ����ѯ
	@Select("select * from tb_root_curriculum where concat(id,curriculum_name,curriculum_teacher_id,curriculum_date,curriculum_place,curriculum_week,curriculum_type,curriculum_credit) like #{like}")
	List<Curriculum> selectFilter(String like);
}
