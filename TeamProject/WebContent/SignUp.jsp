<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="http://fonts.googleapis.com/earlyaccess/hanna.css" rel="stylesheet">
<script>
		function check()
		{
		  if(signup.id.value== "")
		{
		  alert("���̵� �Է��ϼ���");
			 return false;
		}
		 if(signup.password.value.length <8 || signup.password.value.length >16)
		 {
		   alert("��й�ȣ�� 8~16�ڸ� ���̷� �Է����ּ���");
		   signup.password.value="";
		   signup.password.focus();
		   return false;
		 }
		 if(signup.password.value != signup.reconfirm.value)
		 {
		   alert("��й�ȣ�� ��ġ���� �ʽ��ϴ� \n��й�ȣ�� �ٽ� �Է����ּ���");
		   signup.password.value="";
		   signup.reconfirm.value="";
		   signup.password.focus();
		   return false;
		 }
		 if(signup.nikname.value == "")
		 {
		   alert("���̸��� �Է��ϼ���");
		   return false;
		 }
		 if(signup.name.value == "")
		 {
		   alert("�̸��� �Է��ϼ���");
		   return false;
		 }
		 if(signup.email.value == "")
		{
	  		alert("�̸����� �Է��ϼ���");
			 return false;
		}
		if(signup.area.value == "")
		{
	  		alert("������ �Է��ϼ���");
			 return false;
		}
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
			font-size: 35px;
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
	<a href="main.jsp" class="aa">�泪����</a>
	<p class="p2">A moment Walking the Flower road</p>
	</div>
	<div>
		<ul class="list">
			<li class="login"><a href="login.jsp" class="aa">Login</a></li>
			<li class="login">��</li>
		</ul>
	</div>
	<div class="css">
	Sign Up
	</div>
	<div> 
	  <form name="signup" onsubmit="return check()" action="SignUpJSP.jsp" method="post">
  	  <table class="box" align="center">
	  <tr>
	    <th class="css2">ID</th>
		<td><input type="text" name="id" class="textbox" size="21" maxlength="16"> <input type="button" class="button" value="�ߺ�Ȯ��"></td>
	  </tr>
	  <tr>
		<th class="css2">PW</th>
		<td><input type="password" name="password" class="textbox" size="21" maxlength="15"></td>
	  </tr>
	    <tr>
		<th class="css2">PW ��Ȯ��</th>
		<td><input type="password" name="reconfirm" class="textbox" size="21" maxlength="15"></td>
	  </tr>
	    <tr>
		<th class="css2">�г���</th>
		<td><input type="text" name="nikname" class="textbox" size="21"></td>
	  </tr>
	  <tr>
		<th class="css2">�̸�</th>
		<td><input type="text" name="name" class="textbox" size="21">
		</td>
	  </tr>
	  <tr>
		<th class="css2">E-Mail</th>
		<td><input type="text" name="email" class="textbox" size="21">
		</td>
	  </tr>
	  <tr>
		<th class="css2">����</th>
		<td><input type="text" name="area" class="textbox" size="21">
		</td>
	  </tr>
	   <tr align="center">
	   <td colspan="2"><br><input type="submit" class="button" value="�����ϱ�"></td>
	  </tr>
	  </table>
	  </form>
	</div>
</body>
</html>