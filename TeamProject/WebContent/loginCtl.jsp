<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="sh.USER.UserMgr" %>
<%@ page import="sh.USER.UserDTO" %>
    <%
     request.setCharacterEncoding("UTF-8");//request 해오는 글씨 인코딩설정
     String id = request.getParameter("id");
     String password = request.getParameter("password");
     
     System.out.println("id : " + id);
     System.out.println("pw : " + password);
     
     UserMgr um = new UserMgr();
     UserDTO dto=um.login(id, password);
     
     if(dto.getId() != null){//하나라도 null이 아니면 성공
      session.setAttribute("id", dto.getId());
      session.setAttribute("password", dto.getPassword());
      session.setAttribute("name", dto.getName());
      session.setAttribute("nickname", dto.getNickname());
      session.setAttribute("email", dto.getEmail());
      session.setAttribute("area", dto.getArea()); 
      session.setMaxInactiveInterval(600);//10분동안 아무것도 하지않으면 로그아웃
      response.sendRedirect("./main.jsp");
     } 
     
    %>
   
    <SCRIPT>
    if(<%=dto.getId()==null%>){ //로그인 실패시
     alert('로그인 실패');
     history.back(); //전화면으로 돌아감(로그인화면)
    }
    </SCRIPT>
