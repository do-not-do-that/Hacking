<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	String jdbcUrl = "jdbc:mysql://localhost:3306/basicjsp";
	String dbId="jspid";
	String dbPass ="jsppass";
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try{
		
		conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
		String sql ="delete from member where id=? and passwd=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,id);
		pstmt.setString(2,passwd);
		pstmt.executeUpdate();
		response.sendRedirect("list.jsp");
	}catch(Exception e){
		out.println("Exception : "+e.getMessage());
	}finally{
		System.out.println("finally block is called");
		try{
			if(pstmt!=null){
				pstmt.close();
			}
		}catch(SQLException e){
			out.println("SQLException : "+e.getMessage());
		}
		try{
			if(conn!=null){
				conn.close();
			}
		}catch(SQLException e){
			out.println("SQLException : "+e.getMessage());
		}
	}
%>
