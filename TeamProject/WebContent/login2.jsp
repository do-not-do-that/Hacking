<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="http://fonts.googleapis.com/earlyaccess/hanna.css" rel="stylesheet">
<script>
		function gologin() {
			  var frm3 = document.login;
			  frm3.method = "post";
			  frm3.action = "./login.jsp";
			  frm3.submit();
			 }

			 function gohome() {
			  var frm = document.login;
			  frm.method = "post";
			  frm.action = "./main.jsp"; //넘어간화면
			  frm.submit(); //등록이 될수 있는 조건이면, 정보를 보내겠다.
			 }
			 
			 function gojoin() {
			  var frm = document.login;
			  frm.method = "post";
			  frm.action = "./SignUp.jsp";
			  frm.submit();
			 }
			 function check() {
					var frm = document.login;
					{
					  if(frm.id.value== "")
					{
					  alert("아이디를 입력하세요");
						 return false;
					}
					  if(frm.password.value== "")
						{
						  alert("비밀번호를 입력하세요");
							 return false;
						}
					 if(frm.password.value.length <8 || frm.password.value.length >16)
					 {
					   alert("비밀번호는 8~16자리 사이로 입력해주세요");
					   frm.password.value="";
					   frm.password.focus();
					   return false;
					 }
					  frm.method = "post";
					  frm.action = "./loginCtl.jsp";
					  frm.submit();
					 }
					}
		</script>
<style type="text/css">
		#logindom{
			margin-top:5%;
		}
		.button {
			  width:75%;
			  background-color: pink;
			  border: none;
			  color: white;
			  padding: 8px 13px;
			  margin-left:25%;
			  
			  text-align: center;
			  text-decoration: none;
			  display: inline-block;
			  font-size: 15px;
			  font-family: Hanna, sans-serif;
			  margin-top:5%;
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
			width:25%;
			color: pink;
			border: 2px solid;
			padding: 10px;
			margin-top: 30px;
			padding-right:7%;
		}
		.css {
			text-align: center;
			font-size: 35px;
			font-family: Hanna, sans-serif;
			color: pink;
			}
		.css2 {
			margin-left:10%;
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
		.form__group {
			font-family: Hanna, sans-serif;
			  position: relative;
			  padding: 15px 0 0;
			  margin-top: 10px;
			  width: 50%;
			}
			
		.form__field {
			  font-family: inherit;
			  width: 150%;
			  border: 0;
			  border-bottom: 2px solid pink;
			  outline: 0;
			  font-size: 1.3rem;
			  color: hotpink;
			  padding: 7px 0;
			  background: transparent;
			  transition: border-color 0.2s;
			}
		.form__field::placeholder {
			  color: transparent;
			}
		.form__field:placeholder-shown ~ .form__label {
			  font-size: 1.3rem;
			  cursor: text;
			  top: 20px;
			}
			
		.form__label {
			  position: absolute;
			  top: 0;
			  display: block;
			  transition: 0.2s;
			  font-size: 1rem;
			  color: pink;
			}
			
		.form__field:focus {
			  padding-bottom: 6px;
			  font-weight: 700;
			  border-width: 3px;
			  border-image: linear-gradient(to right, hotpink, pink);
			  border-image-slice: 1;
			}
		.form__field:focus ~ .form__label {
			  position: absolute;
			  top: 0;
			  display: block;
			  transition: 0.2s;
			  font-size: 1rem;
			  color: hotpink;
			  font-weight: 700;
			}
			
		/* reset input */
		.form__field:required, .form__field:invalid {
			  box-shadow: none;
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
			<li class="joinus"><a href="SignUp.jsp" class="aa">Join us</a></li>
			<li class="joinus">│</li>
			<li class="joinus"><a href="idfind.jsp" class="aa">ID 찾기</a></li>
			<li class="joinus">│</li>
			<li class="joinus"><a href="pwfind.jsp" class="aa">PW 찾기</a></li>
			<li class="joinus">│</li>
		</ul>
	</div><div id="logindom">
	
	<div class="css">
	LOGIN
	</div>
	<div> 
	  <form name="login" method="post">
	  <center><div class="box">
	  	<div class="form__group field">
  		<input type="text" class="form__field" placeholder="ID" name="id" id='name' required />
  		<label for="name" class="form__label">ID</label></div>
	  	<br>
	  	<div class="form__group field">
  		<input type="password" class="form__field" placeholder="Password" name="password" id='name' required />
  		<label for="name" class="form__label">Password</label></div>
	  <br>
	  <input type="submit" class="button" onClick="check()" value="로그인">
	  </center></div><br></div></div>
	  </form>
	
</body>
</html>