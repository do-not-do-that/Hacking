package sh.USER;
//디비에서 정보를 가져오는 것을 자바로 가공하는것, 가져온값을 저장하는것
public class UserDTO {

  private String id;
  private String password;
  private String name;
  private String nickname;
  private String email;
  private String area;
  
  public String getId() {
   return id;
  }
  public void setId(String id) {
   this.id = id;
  }
  public String getPassword() {
   return password;
  }
  public void setPassword(String password) {
   this.password = password;
  }
  public String getName() {
   return name;
  }
  public void setName(String name) {
   this.name = name;
  }
  public String getNickname() {
   return nickname;
  }
  public void setNickname(String nickname) {
   this.nickname = nickname;
  }
  public String getEmail() {
   return email;
  }
  public void setEmail(String email) {
   this.email = email;
  }
  public String getArea() {
   return area;
  }
  public void setArea(String area) {
   this.area = area;
  }
  @Override
  public String toString() {
   return "UserDTO [id=" + id + ", password=" + password +  ", name="+ name+", nickname=" + nickname
     + ", email=" + email + ", area=" + area + "]";
  }


} 