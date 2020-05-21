<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	body{
		background-color:skyblue;
	}
</style>
<h1>로또 구하기(폼)</h1>
<form action="lottoProc2.jsp">
	시작번호 : <input type="text" value="1" name="startNum"><br>
	끝 번호 : <input type="text" value="45" name="endNum"><br>
	갯수 : <input type="text" value="6" name="count"><br>
	<input type="submit" value="로또번호 구하기">
</form>