<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %> 


    <%
    request.setCharacterEncoding("utf-8");
    String id = request.getParameter("id");
    String pwd = request.getParameter("passwd");
    String name = request.getParameter("name");
    Timestamp regdate = new Timestamp(System.currentTimeMillis());
    Connection con= null;
    PreparedStatement pstmt = null;
    try{
    Class.forName("com.mysql.jdbc.Driver");
    String jdbcUrl = "jdbc:mysql://localhost/basicjsp";
    String dbId = "jspid";
    String dbPass = "jsppass";
    con = DriverManager.getConnection(jdbcUrl , dbId , dbPass);
    String sql = "insert into member values(?,?,?,?)";
    pstmt = con.prepareStatement(sql);
    pstmt.setString(1, id);
    pstmt.setString(2, pwd);
    pstmt.setString(3, name);
    pstmt.setTimestamp(4, regdate);
    pstmt.executeUpdate(); // 엑시트큐트 업데이트할때 리턴값이 인트
    out.println("<h2>회원가입을 축하드립니다아라ㅏ랄아알알아랑라알</h2>");
    response.sendRedirect("list.jsp");
    
    }
    catch(Exception e){
       out.println("Exception : " + e.getMessage());
      out.println();
      //System.out.println();
    }
    finally{
       if(pstmt!=null){
          try{
          pstmt.close();
          }
          catch(SQLException e){
             out.println("SQLException : " + e.getMessage());
          }
       }
       if(con!=null){
          try{
             con.close();
          }
          catch(SQLException e){
             out.println("SQLException : " + e.getMessage());
          }
          
       }
    }
    
    
    %>
   
