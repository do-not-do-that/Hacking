<%@page import="javax.sql.DataSource"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 
<%@ page import ="javax.naming.*" %>

<%
	request.setCharacterEncoding("utf-8");
	String id=request.getParameter("id");
	String password=request.getParameter("password");
	String name=request.getParameter("name");
	String gender=request.getParameter("gender");
	String department=request.getParameter("department");
	String hobbys[]=request.getParameterValues("hobby");
	String hobby="";
	
	for(String h :hobbys ){
		hobby+=h+" ";
	}
	
	Timestamp regdate = new Timestamp(System.currentTimeMillis());
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try{
		Context initCtx = new InitialContext();
	    Context envCtx = (Context)initCtx.lookup("java:comp/env");
	    DataSource ds = (DataSource)envCtx.lookup("jdbc/basicjsp");
	    conn = ds.getConnection();
	    
	    String sql = "insert into member2 value(?,?,?,?,?,?,?)";
	    pstmt = conn.prepareStatement(sql);
	    pstmt.setString(1,id);
	    pstmt.setString(2,password);
	    pstmt.setString(3,name);
	    pstmt.setString(4,gender);
	    pstmt.setString(5,department);
	    pstmt.setString(6,hobby);
	    pstmt.setTimestamp(7, regdate);
	    pstmt.executeUpdate();
%>
		<script>alert("회원가입을 축하합니다."); location.href="memList.jsp"</script>	    
<%		
	}catch(Exception e){
		out.println("Exception : " + e.getMessage());
	      out.println();
	}
	finally{
		if(pstmt!=null){
			try{
				pstmt.close();
			}catch(SQLException e){
				out.println("SQLException : "+e.getMessage());
			}
		}
		if(conn!=null){
			try{
	             conn.close();
	          }
	          catch(SQLException e){
	             out.println("SQLException : " + e.getMessage());
	          }
		}
	}

%>
