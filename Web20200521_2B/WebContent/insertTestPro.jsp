<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	String str="";
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name= request.getParameter("name");
	Timestamp register =  new Timestamp(System.currentTimeMillis());
	Connection conn = null;
	PreparedStatement pstmt = null;
	try{
		String jdbcUrl ="jdbc:mysql://localhost:3306/unbi";
		String dbId = "root";
		String dbPass = "wjdqhqhdks";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
		String sql = "insert into member values (?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,id);
		pstmt.setString(2,passwd);
		pstmt.setString(3,name);
		pstmt.setTimestamp(4,register);
		pstmt.executeUpdate();
		str="member 테이블에 새로운 레코드를 추가하였습니다.";
	}catch(Exception e){
		str="member 테이블에 새로운 레코드를 추가할 수 없습니다!"+e.getMessage();
	}finally{
		if(pstmt!=null){
			try{
				pstmt.close();
			}catch(Exception e){
				str += "<br>conn Exception : "+ e.getMessage();
			}
		}
	}

%>
<%=str%>