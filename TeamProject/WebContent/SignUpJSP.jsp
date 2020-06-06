<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<% request.setCharacterEncoding("UTF-8");%>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String nikname = request.getParameter("nikname");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String area = request.getParameter("area");
	Timestamp register = new Timestamp(System.currentTimeMillis());
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	String str = "";

try {
	String jdbcUrl="jdbc:mysql://localhost:3306/storage";
	String dbld="root";
	String dbPass="wjdqhqhdks";
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(jdbcUrl, dbld, dbPass);
	
	String sql = "insert into member(id,password,nickname,name,email,area,createtime) values(?, ?, ?, ?, ?, ?, ?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, password);
	pstmt.setString(3, nikname);
	pstmt.setString(4, name);
	pstmt.setString(5, email);
	pstmt.setString(6, area);
	pstmt.setTimestamp(7, register);
	pstmt.executeUpdate();
	str = "회원가입이 정상적으로 되었습니다.";
}catch(Exception e){
	out.print("Error : "+e.getMessage());
	str = "다시 회원가입을 해주세요";
}finally{
	if(pstmt != null)
		try{
			pstmt.close();
		}catch(SQLException sqle){
			
		}
	if(conn != null)
		try{
			conn.close();
		}catch(SQLException sqle){
			
		}
}
%>
<html>
	<head>
	</head>
		<body>
			<%=str %>
		</body>	
</html>