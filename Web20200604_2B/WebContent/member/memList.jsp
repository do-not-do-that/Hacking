<%@page import="javax.sql.DataSource"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import ="javax.naming.*" %>

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
%>
      <table border =1>
      <tr>
       
      <td width = 100>아이디</td>
      <td width = 100>이름</td>
      <td width = 100>학과</td>
      <td width = 100>성별</td>
      <td width = 200>등록일 </td>
      <td width = 100>기능 </td>
      </tr>
      
<%      
      while(rs.next()){
%>         
         <tr>
          
         <td><%= rs.getString("fUserId")%> </td>
         <td><%=rs.getString ("fUserName") %></td>
         <td><%=rs.getString("fDepartment") %></td>
         <td><%=rs.getString("fSex") %></td>
         <td><%=rs.getTimestamp("fRegdate") %></td>
         <td>
            <input type="button" value ="수정" 
            onClick="location.href ='memUpForm.jsp?id=<%=rs.getString("fUserId")%>'">
            <input type="button" value= "삭제" onClick="location.href ='memDelForm.jsp'">
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

