package com.ckm.pojo;

//课程实体类
public class Curriculum {
	private int id;// id
	private String curriculum_name;// 课程名称
	private String curriculum_teacher_id;// 授课老师编号
	private String curriculum_date;// 上课时间
	private String curriculum_place;// 上课地点
	private String curriculum_week;// 周数
	private String curriculum_type;// 课程类型
	private String curriculum_credit;// 学分
	private String curriculum_success;// 成绩
	private String student_id; // 学生学号

	public Curriculum() {
	}

	public Curriculum(int id, String curriculum_name, String curriculum_teacher_id, String curriculum_date,
			String curriculum_place, String curriculum_week, String curriculum_type, String curriculum_credit,
			String student_id, String curriculum_success) {
		this.id = id;
		this.curriculum_name = curriculum_name;
		this.curriculum_teacher_id = curriculum_teacher_id;
		this.curriculum_date = curriculum_date;
		this.curriculum_place = curriculum_place;
		this.curriculum_week = curriculum_week;
		this.curriculum_type = curriculum_type;
		this.curriculum_credit = curriculum_credit;
		this.curriculum_success = curriculum_success;
		this.student_id = student_id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCurriculum_name() {
		return curriculum_name;
	}

	public void setCurriculum_name(String curriculum_name) {
		this.curriculum_name = curriculum_name;
	}

	public String getCurriculum_teacher_id() {
		return curriculum_teacher_id;
	}

	public void setCurriculum_teacher_id(String curriculum_teacher_id) {
		this.curriculum_teacher_id = curriculum_teacher_id;
	}

	public String getCurriculum_date() {
		return curriculum_date;
	}

	public void setCurriculum_date(String curriculum_date) {
		this.curriculum_date = curriculum_date;
	}

	public String getCurriculum_place() {
		return curriculum_place;
	}

	public void setCurriculum_place(String curriculum_place) {
		this.curriculum_place = curriculum_place;
	}

	public String getCurriculum_week() {
		return curriculum_week;
	}

	public void setCurriculum_week(String curriculum_week) {
		this.curriculum_week = curriculum_week;
	}

	public String getCurriculum_type() {
		return curriculum_type;
	}

	public void setCurriculum_type(String curriculum_type) {
		this.curriculum_type = curriculum_type;
	}

	public String getCurriculum_credit() {
		return curriculum_credit;
	}

	public void setCurriculum_credit(String curriculum_credit) {
		this.curriculum_credit = curriculum_credit;
	}

	public String getCurriculum_success() {
		return curriculum_success;
	}

	public void setCurriculum_success(String curriculum_success) {
		this.curriculum_success = curriculum_success;
	}

	public String getStudent_id() {
		return student_id;
	}

	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}
}
