package com.ckm.pojo;


//�û�ʵ����
public class Root {
  private int id; //id
  private String username; //�û���
  private String password; //����
  private String role; //Ȩ��

  public Root() {
  }

  public Root(int id, String username, String password, String role) {
      this.id = id;
      this.username = username;
      this.password = password;
      this.role = role;
  }

  public int getId() {
      return id;
  }

  public void setId(int id) {
      this.id = id;
  }

  public String getUsername() {
      return username;
  }

  public void setUsername(String username) {
      this.username = username;
  }

  public String getPassword() {
      return password;
  }

  public void setPassword(String password) {
      this.password = password;
  }

  public String getRole() {
      return role;
  }

  public void setRole(String role) {
      this.role = role;
  }
}
