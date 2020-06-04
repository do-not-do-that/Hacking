<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<style>
	body{
		background-color:gold;
	}
</style>
<h2>회원삭제</h2>
<form action="deleteProc.jsp">
	아이디 : <input type="text" name="id"><br>
	비밀번호 : <input type="password" name="passwd"><br>
	<input type="submit" value="회원삭제">
	<input type="button" value="메인 화면으로 가쨔!" onclick="location.href='index.jsp'">
</form>
