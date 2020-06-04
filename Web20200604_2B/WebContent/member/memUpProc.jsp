<%@page import="javax.sql.DataSource"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import ="javax.naming.*" %>

<%
   request.setCharacterEncoding("utf-8");
   String id = request.getParameter("id");
   String passwd = request.getParameter("passwd");
   String name = request.getParameter("name");
   String gender = request.getParameter("gender");
   Connection conn = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   
   try{
	   Context initCtx = new InitialContext();
	      Context envCtx = (Context)initCtx.lookup("java:comp/env");
	      //DataSource 는 javax.sql 패키지에서 가져와야만 함!
	      DataSource ds = (DataSource)envCtx.lookup("jdbc/basicjsp");
	      conn = ds.getConnection();
   String sql = "update member2 set fPasswd= ? , fUserName = ?, fSex = ?  where fUserId= ? ";
   pstmt = conn.prepareStatement(sql);
   pstmt.setString(1,passwd);
   pstmt.setString(2,name);
   pstmt.setString(3,gender);
   pstmt.setString(4,id);
   pstmt.executeUpdate();
   out.println("<h2> 회원정보가 수정 되었습니다 </h2>");
   response.sendRedirect("memList.jsp");
   }
   catch(Exception e){
      out.println("Exception : " + e.getMessage());
   }
   finally{
      if(pstmt!=null){
         try{
            pstmt.close();
         }
         catch(Exception e){
            out.println("SQLException:" +e.getMessage());
         }
      }
      if(conn!=null){
         try{
         conn.close();
         }
         catch(Exception e){
            out.println("SQLException "+e.getMessage());
            
         }
      }

   }
   
%>