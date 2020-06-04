<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>회원등록</h1>

<form action="memProc.jsp">
	<table border="2">
		<tr>
			<td>아이디</td>
			<td><input type="text" name="id"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="password"></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<td>성별</td>
			<td><input type="radio" value="man" name="gender">남<input type="radio" name="gender" value="woman">여</td>
		</tr>
		<tr>
			<td>학과</td>
			<td>
				<select name="department">
					<option value="security">보안과</option>
					<option value="computer">컴공과</option>
					<option value="animal">애동과</option>
				</select>
			
			</td>
		</tr>
		<tr>
		<td>취미</td>
			<td>
				<input type="checkbox" name="hobby" value="sleep">잠자기
				<input type="checkbox" name="hobby" value="dance">춤추기
				<input type="checkbox" name="hobby" value="sing">노래하기
			</td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="등록"></td>
		</tr>
	
	</table>

</form>