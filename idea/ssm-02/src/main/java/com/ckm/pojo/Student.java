package com.ckm.pojo;



//学生实体类
public class Student {
  private int id;//id
  private String student_id;//学号
  private String student_name;//姓名
  private String student_gender;//性别
  private String student_birth_year;//出生年份
  private String student_entrance;//入学时间
  private String student_college;//所属学院
  private String password; //学生密码
  private String email; //邮箱

  public Student() {
  }

  public Student(int id, String student_id, String student_name, String student_gender, String student_birth_year, String student_entrance, String student_college, String password,String email) {
      this.id = id;
      this.student_id = student_id;
      this.student_name = student_name;
      this.student_gender = student_gender;
      this.student_birth_year = student_birth_year;
      this.student_entrance = student_entrance;
      this.student_college = student_college;
      this.password = password;
      this.email = email;
  }

  public int getId() {
      return id;
  }

  public void setId(int id) {
      this.id = id;
  }

  public String getStudent_id() {
      return student_id;
  }

  public void setStudent_id(String student_id) {
      this.student_id = student_id;
  }

  public String getStudent_name() {
      return student_name;
  }

  public void setStudent_name(String student_name) {
      this.student_name = student_name;
  }

  public String getStudent_gender() {
      return student_gender;
  }

  public void setStudent_gender(String student_gender) {
      this.student_gender = student_gender;
  }

  public String getStudent_birth_year() {
      return student_birth_year;
  }

  public void setStudent_birth_year(String student_birth_year) {
      this.student_birth_year = student_birth_year;
  }

  public String getStudent_entrance() {
      return student_entrance;
  }

  public void setStudent_entrance(String student_entrance) {
      this.student_entrance = student_entrance;
  }

  public String getStudent_college() {
      return student_college;
  }

  public void setStudent_college(String student_college) {
      this.student_college = student_college;
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
}
