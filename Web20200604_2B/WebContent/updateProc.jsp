<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import ="java.sql. *" %>

<%
   request.setCharacterEncoding("utf-8");
   String id = request.getParameter("id");
   String passwd = request.getParameter("passwd");
   String name = request.getParameter("name");
   String jdbcUrl = "jdbc:mysql://localhost:3306/basicjsp";
   String dbid= "jspid";
   String dbPass= "jsppass";
   Connection con = null;
   PreparedStatement pstmt = null;
   
   try{
   Class.forName("com.mysql.jdbc.Driver");
   con = DriverManager.getConnection(jdbcUrl,dbid,dbPass);
   String sql = "update member set passwd= ? , name = ?  where id= ? ";
   pstmt = con.prepareStatement(sql);
   pstmt.setString(1,passwd);
   pstmt.setString(2,name);
   pstmt.setString(3,id);
   pstmt.executeUpdate();
   out.println("<h2> 회원정보가 수정 되었습니다 </h2>");
   response.sendRedirect("list.jsp");
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
      if(con!=null){
         try{
         con.close();
         }
         catch(Exception e){
            out.println("SQLException "+e.getMessage());
            
         }
      }

   }
   
%>