package com.ckm.pojo;


//��ʦʵ����
public class Teacher {
  private int id; //id
  private String teacher_id; //��ʦ���
  private String teacher_name;//����
  private String teacher_gender;//�Ա�
  private String teacher_birth_year;//�������
  private String teacher_education;//ѧ��
  private String teacher_title;//ְ��
  private String teacher_entrydate;//��ְʱ��
  private String teacher_college;//����ѧԺ
  private String password; //��ʦ����
  private String email; //����
  private String curriculum_name; //��ʦ ������ �γ̱���Ϣ

  public Teacher() {
  }

  public Teacher(int id, String teacher_id, String teacher_name, String teacher_gender, String teacher_birth_year, String teacher_education, String teacher_title, String teacher_entrydate, String teacher_college, String password,String email,String curriculum_name) {
      this.id = id;
      this.teacher_id = teacher_id;
      this.teacher_name = teacher_name;
      this.teacher_gender = teacher_gender;
      this.teacher_birth_year = teacher_birth_year;
      this.teacher_education = teacher_education;
      this.teacher_title = teacher_title;
      this.teacher_entrydate = teacher_entrydate;
      this.teacher_college = teacher_college;
      this.password = password;
      this.email = email;
      this.curriculum_name = curriculum_name;
  }

  public int getId() {
      return id;
  }

  public void setId(int id) {
      this.id = id;
  }

  public String getTeacher_id() {
      return teacher_id;
  }

  public void setTeacher_id(String teacher_id) {
      this.teacher_id = teacher_id;
  }

  public String getTeacher_name() {
      return teacher_name;
  }

  public void setTeacher_name(String teacher_name) {
      this.teacher_name = teacher_name;
  }

  public String getTeacher_gender() {
      return teacher_gender;
  }

  public void setTeacher_gender(String teacher_gender) {
      this.teacher_gender = teacher_gender;
  }

  public String getTeacher_birth_year() {
      return teacher_birth_year;
  }

  public void setTeacher_birth_year(String teacher_birth_year) {
      this.teacher_birth_year = teacher_birth_year;
  }

  public String getTeacher_education() {
      return teacher_education;
  }

  public void setTeacher_education(String teacher_education) {
      this.teacher_education = teacher_education;
  }

  public String getTeacher_title() {
      return teacher_title;
  }

  public void setTeacher_title(String teacher_title) {
      this.teacher_title = teacher_title;
  }

  public String getTeacher_entrydate() {
      return teacher_entrydate;
  }

  public void setTeacher_entrydate(String teacher_entrydate) {
      this.teacher_entrydate = teacher_entrydate;
  }

  public String getTeacher_college() {
      return teacher_college;
  }

  public void setTeacher_college(String teacher_college) {
      this.teacher_college = teacher_college;
  }

  public String getPassword() {
      return password;
  }

  public void setPassword(String password) {
      this.password = password;
  }
  public String getEmail() {
      return email;
  }

  public void setEmail(String email) {
      this.email = email;
  }
  public String getCurriculum_name() {
      return curriculum_name;
  }

  public void setCurriculum_name(String curriculum_name) {
      this.curriculum_name = curriculum_name;
  }
}
