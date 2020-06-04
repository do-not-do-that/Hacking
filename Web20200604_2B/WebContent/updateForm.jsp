<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<style>
	body{
		background-color:hotpink;
	}
</style>
<h2>회원 등록</h2>


<a href="list.jsp">동물원</a>

<%
	String userId = request.getParameter("id");
	String jdbcUrl="jdbc:mysql://localhost:3306/basicjsp";
	String dbId="jspid";
	String dbPass="jsppass";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try{
		Class.forName("com.mysql.jdbc.Driver");
		conn = 
				DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		String sql = "select * from member where id= ?";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userId);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
%>
			<form action='updateProc.jsp' method='post'><br>
				아이디: <input type="text" name="id" readonly value= <%=rs.getString("id") %> ><br>
				비밀번호 : <input type="password" name="passwd" value= <%=rs.getString("passwd") %> ><br>
				이름 : <input type="text" name="name" value=<%=rs.getString("name") %> ><br>
				
				<input type="submit" value="수정"><input type="button" onclick="location.href='list.jsp'" value="회원리스트">

			</form>
<%		
		}else{
			out.println("<h2>존재하지 않는 회원 정보입니다.</h2>");
			out.println("<input type=button onClick=location.href='index.jsp' value='메인으로 가쨔!'>");
		}
		
	}catch(Exception e){
		out.println("Exception : "+e.getMessage());
	}finally{
		try{
			if(rs!=null){
				rs.close();
			}
		}catch(SQLException e){
			out.println("SQLException e : "+e.getMessage());
		}
		try{
			if(pstmt!=null){
				pstmt.close();
			}
		}catch(SQLException e){
			out.println("SQLException e : "+e.getMessage());
		}
		try{
			if(conn!=null){
				conn.close();
			}
		}catch(SQLException e){
			out.println("SQLException e : "+e.getMessage());
		}
		
		
	}
	
%>

