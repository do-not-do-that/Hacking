<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="sh.USER.UserMgr" %>
<%@ page import="sh.USER.UserDTO" %>
    <%
    session.invalidate(); //세션자체를 없애줌
    response.sendRedirect("./main.jsp");
   %>