package com.ckm.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.ckm.pojo.Root;
import com.ckm.pojo.Student;
import com.ckm.pojo.Teacher;

public interface LoginDao {
	// 管理员
	@Select("select * from tb_root_user where username=#{username} and password=#{password}")
	Root rootSelect(@Param("username") String username, @Param("password") String password);

	// 教师
	@Select("select * from tb_root_teacher where (teacher_id=#{username} or email=#{username}) and password=#{password}")
	Teacher teacherSelect(@Param("username") String username, @Param("password") String password);

	// 学生
	@Select("select * from tb_root_student where (student_id=#{username} or email=#{username}) and password=#{password}")
	Student studentSelect(@Param("username") String username, @Param("password") String password);

	// 教师注册
	@Insert("update tb_root_teacher set password=#{password},email=#{email} where teacher_id=#{teacher_id}")
	int teacherUpdate(Teacher teacher);

	// 学生注册
	@Insert("update tb_root_student set password=#{password},email=#{email} where student_id=#{student_id}")
	int studentUpdate(Student student);
	
	 //root用户修改密码
	@Update("update tb_root_user set password=#{password} where username=#{username}")
    int root_update_password(@Param("username") String username,@Param("password") String password);
    //学生修改密码
	@Update("update tb_root_student set password=#{password} where student_id=#{username}")
    int student_update_password(@Param("username") String username,@Param("password") String password);
    //教师修改密码
	@Update("update tb_root_teacher set password=#{password} where teacher_id=#{username}")
    int teacher_update_password(@Param("username") String username,@Param("password") String password);
}
