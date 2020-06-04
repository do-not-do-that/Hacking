<%@page import="javax.sql.DataSource"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import ="javax.naming.*" %>

<style>
	body{
		background-color:hotpink;
	}
</style>
<h2>회원 정보수정</h2>


<a href="list.jsp">동물원</a>

<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try{

		Context initCtx = new InitialContext();
	      Context envCtx = (Context)initCtx.lookup("java:comp/env");
	      DataSource ds = (DataSource)envCtx.lookup("jdbc/basicjsp");
	      conn = ds.getConnection();
	      String sql = "select *from member2";
	      pstmt = conn.prepareStatement(sql);
	      rs =pstmt.executeQuery();
		
		if(rs.next()){
%>
			<form action='memUpProc.jsp' method='post'><br>
				아이디: <input type="text" name="id" readonly value= <%=rs.getString("fUserId") %> ><br>
				비밀번호 : <input type="password" name="passwd" value= <%=rs.getString("fPasswd") %> ><br>
				이름 : <input type="text" name="name" value=<%=rs.getString("fUserName") %> ><br>
				성별 : 
				<%if(rs.getString("fUserName").equals("man")){ %>
					<input type="radio" name="gender" value="man" checked>남
					<input type="radio" name="gender" value="woman">여
				<% 
				}else{
				%> 
				<input type="radio" name="gender" value="man" >남
				<input type="radio" name="gender" value="woman" checked>여
				<br>
				학과 : 
					
				<select name="department">
					<option value="security">보안과</option>
					<option value="computer">컴공과</option>
					<option value="animal">애동과</option>
				</select>

				<input type="submit" value="수정"><input type="button" onclick="location.href='list.jsp'" value="회원리스트">

			</form>
<%
		}}else{
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

