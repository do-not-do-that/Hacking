<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="sh.USER.UserMgr"%>
<%
 request.setCharacterEncoding("UTF-8");
 String id = request.getParameter("id");
 String email = request.getParameter("email");
 
 System.out.println("id : " + id);
 System.out.println("E-Mail : " + email);

 UserMgr um3 = new UserMgr();
 String password = um3.pw_search(id, email);//비밀번호를 디비에서 가져옴..실패시 널
 if (password != null) {//비밀번호 찾기 성공시
  //response.sendRedirect("./home.jsp");
  //메인화면으로 이동
 }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="http://fonts.googleapis.com/earlyaccess/hanna.css" rel="stylesheet">
<script>
		if(<%=password == null%>){ //로그인 실패시
		    alert('비밀번호 찾기 실패');
		    history.back(); //전화면으로 돌아감(로그인화면)
		  }
		function gologin() {
			  var frm3 = document.idfind;
			  frm3.method = "post";
			  frm3.action = "./login.jsp";
			  frm3.submit();
			 }
			 function gohome() {
			  var frm = document.idfind;
			  frm.method = "post";
			  frm.action = "./main.jsp"; //넘어간화면
			  frm.submit(); //등록이 될수 있는 조건이면, 정보를 보내겠다.
			 }
			 
			 function gojoin() {
			  var frm = document.idfind;
			  frm.method = "post";
			  frm.action = "./SignUp.jsp";
			  frm.submit();
			 }
			 function goidfind(){
			  var frm = document.idfind;
			  frm.method = "post";
			  frm.action = "./idfind.jsp";
			  frm.submit();
			 } 
			 function gopwfind(){
			  var frm = document.idfind;
			  frm.method = "post";
			  frm.action = "./pwfind.jsp";
			  frm.submit();
			 }
		</script>
<style type="text/css">
		.button {
			  background-color: pink;
			  border: none;
			  color: white;
			  padding: 8px 13px;
			  text-align: center;
			  text-decoration: none;
			  display: inline-block;
			  font-size: 15px;
			  font-family: Hanna, sans-serif;
		}
		.p1 {
			color: pink;
			font-size: 50px;
			font-family: Hanna, sans-serif;
		}
		.p2 {
			color: pink;
			font-size: 15px;
		}
		.list {
			list-style-type: none;
			border-bottom: 2px solid pink;
			text-align: right;
			padding: 5px 0;
			padding-bottom: 8px;
		}
		.login, .joinus {
			display: inline;
			text-align: right;
			letter-spacing : 3px;
			text-transform : uppercase;
			font-family: Hanna, sans-serif;
			color: pink;
		}
		.box {
			color: pink;
			border: 2px solid;
			padding: 10px;
			margin-top: 30px;
		}
		.css {
			text-align: center;
			font-size: 30px;
			font-family: Hanna, sans-serif;
			color: pink;
			}
		.css2 {
			text-align: left;
			font-family: Hanna, sans-serif;
			color: pink;
			}
		.textbox {
			border: 2px solid pink;
			border-radius: 2px;
			height: 25px;
			padding: 1px;
			font-family: Hanna, sans-serif;
			color: pink;
		}
		.aa {
			color: pink;
			text-decoration: none;
		}
</style>
</head>
<body>
	<div class="p1">
	<a href="main.jsp" class="aa">길나들이</a>
	<p class="p2">A moment Walking the Flower road</p>
	</div>
	<div>
		<ul class="list">
			<li class="login"><a href="login.jsp" class="aa">Login</a></li>
			<li class="login">│</li>
			<li class="joinus">Join us</li>
			<li class="joinus">│</li>
		</ul>
	</div>
	<div class="css">
	등록한 이메일로 비밀번호 찾기
	</div>
	<div> 
	  <form name="idfind" method="post">
  	  <table class="box" align="center">
	  <tr>
	    <th class="css2">회원님의 비밀번호는 </th>
		<td><p type="text" name="name" size="23" maxlength="16" class="css2"><%=password %> 입니다</p></td>
	  </tr>
	  </table>
	  </form>
	</div>
</body>
</html>