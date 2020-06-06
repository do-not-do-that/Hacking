package sh.USER;
//디비에서 값을 가져오는것, 직접 붙는애.
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import sh.DB.DBConnection;
import sh.DB.DBClose;

//로그인 성공여부를 알수있다.

public class UserDAO {

 DBConnection cm = new DBConnection();
 Connection con = null;
 
 //로그인 성공여부만을 저장
 
 public UserDTO login(String id, String password){
  UserDTO dto = new UserDTO();
  con = cm.getConnection();
  ResultSet rs = null;
  PreparedStatement pstmt =null; //보안적으로좋다
  int cnt = 0;
  String sql = "select * from member where id = ? and password = ?";
  
  try{
   pstmt = con.prepareStatement(sql); //쿼리
   pstmt.setString(1, id); //첫번째 ?를 스트링 id로 넣음
   pstmt.setString(2, password);//두번째 ?에 스트링 pw 넣음
   
   rs=pstmt.executeQuery();//쿼리를 실행해서 결과값을 rs로 저장
   
   while(rs.next()){ //rs가 끝날때까지 반복
    dto.setId(rs.getString("id"));
    dto.setPassword(rs.getString("password"));
    dto.setName(rs.getString("name"));
    dto.setNickname(rs.getString("nickname"));
    dto.setEmail(rs.getString("email"));
    dto.setArea(rs.getString("area"));    
   }  
  
  }catch(Exception e){
   System.out.println(e);
  }finally{
   new DBClose().close(con,pstmt,rs); //디비연결 종료
  }
  return dto;
}
 public String pw_search(String id, String email){
	  con = cm.getConnection(); //con 디비정보연결
	  ResultSet rs = null;  //resultset은 디비에서 넘어 온값 저장
	  PreparedStatement pstmt = null; //보안적으로좋다 pstmt:쿼리넘기는것
	  String password = null;//찾을비밀번호
	  String sql = "select password from member where id = ? and email = ?";
	  
	  try{
	   pstmt=con.prepareStatement(sql); //쿼리
	   pstmt.setString(1, id); //첫번째 ?를 스트링 id로 넣음
	   pstmt.setString(2, email);//두번째 ?에 스트링 pw 넣음
	   
	   rs=pstmt.executeQuery();//쿼리를 실행해서 결과값을 rs로 저장
	   while(rs.next()){ //rs가 끝날때까지 반복
		   password = rs.getString("password"); //cnt를 디비에서 가져온 cnt에 저장  
	   }
	   System.out.println(password);
	   new DBClose().close(con,pstmt,rs); //디비연결 종료

	  }catch(Exception e){
	   System.out.println(e);
	  }
	  return password;
	 }
 public String id_search(String name, String email){
	  con = cm.getConnection(); //con 디비정보연결
	  ResultSet rs = null;  //resultset은 디비에서 넘어 온값 저장
	  PreparedStatement pstmt = null; //보안적으로좋다 pstmt:쿼리넘기는것
	  String id = null;//찾을비밀번호
	  String sql = "select id from member where name = ? and email = ?";
	  
	  try{
	   pstmt=con.prepareStatement(sql); //쿼리
	   pstmt.setString(1, name); //첫번째 ?를 스트링 id로 넣음
	   pstmt.setString(2, email);//두번째 ?에 스트링 pw 넣음
	   
	   rs=pstmt.executeQuery();//쿼리를 실행해서 결과값을 rs로 저장
	   while(rs.next()){ //rs가 끝날때까지 반복
		   id = rs.getString("id"); //cnt를 디비에서 가져온 cnt에 저장  
	   }
	   System.out.println(id);
	   new DBClose().close(con,pstmt,rs); //디비연결 종료

	  }catch(Exception e){
	   System.out.println(e);
	  }
	  return id;
	 }
} 