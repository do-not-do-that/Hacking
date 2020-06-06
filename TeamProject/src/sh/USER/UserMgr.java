package sh.USER;

public class UserMgr {

 UserDAO dao=new UserDAO();
 
 public UserDTO login(String id, String password){
  return dao.login(id, password);
 	}
 public String pw_search(String id, String email){
	  return dao.pw_search(id, email);
	 }
 public String id_search(String name, String email){
	  return dao.id_search(name, email);
	 }
}