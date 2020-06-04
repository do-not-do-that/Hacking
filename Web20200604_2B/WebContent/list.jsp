<%@page import="javax.sql.DataSource"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import ="javax.naming.*" %>

<style>
body{
 background-color : "red"
 }
</style>
<% 
   //String jdbcUrl = "jdbc:mysql://localhost:3306/basicjsp";
   //String dbid = "jspid";
   //String dbPass = "jsppass";
   Connection conn = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   try{
      //Class.forName("com.mysql.jdbc.Driver");
      //conn = DriverManager.getConnection(jdbcUrl, dbid, dbPass);
      
      Context initCtx = new InitialContext();
      Context envCtx = (Context)initCtx.lookup("java:comp/env");
      //DataSource 는 javax.sql 패키지에서 가져와야만 함!
      DataSource ds = (DataSource)envCtx.lookup("jdbc/basicjsp");
      conn = ds.getConnection();
      String sql = "select *from member";
      pstmt = conn.prepareStatement(sql);
      rs =pstmt.executeQuery();
%>
      <table border =1>
      <tr>
       
      <td width = 100>아이디</td>
      <td width = 100>비밀번호</td>
      <td width = 100>이름</td>
      <td width = 200>등록일</td>
      <td width = 100>간편기능 </td>
      </tr>
      
<%      
      while(rs.next()){
%>         
         <tr>
          
         <td><%= rs.getString("id")%> </td>
         <td><%=rs.getString ("passwd") %></td>
         <td><%=rs.getString("name") %></td>
         <td><%=rs.getTimestamp("reg_date") %></td>
         <td>
            <input type="button" value =수정 onClick="location.href ='updateForm.jsp?id=<%=rs.getString("id")%>'">
            <input type="button" value= 삭제 
            onClick="location.href ='deleteProc.jsp?id=<%=rs.getString("id") %>&passwd=<%=rs.getString("passwd")%>'">
         </td>
         </tr>
<% 
         
      }
%>
         </table>
         <a href="index.jsp">메인화면으로 가쨔!</a>
<% 
   }
   catch(Exception e){
         
   }
   finally{
      if(rs != null ){
         try{
            rs.close();
         }
         catch(Exception e){
            out.println("SQLException : " + e.getMessage());
         }
      }
      if(pstmt!=null){
          try{
          pstmt.close();
          }
          catch(SQLException e){
             out.println("SQLException : " + e.getMessage());
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

   
   