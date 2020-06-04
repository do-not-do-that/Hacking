<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	body{
		background-color:pink;
	}
</style>

<h2>회원 등록</h2> 
<form action='insertProc.jsp' method='post'><br>
	아이디: <input type="text" name="id"><br>
	비밀번호 : <input type="password" name="passwd"><br>
	이름 : <input type="text" name="name"><br>
	<input type="submit" value="회원가입"><br>
	<input type="button" value="메인 화면으로 가쨔!" onclick="location.href='index.jsp'">

</form>

