<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="http://fonts.googleapis.com/earlyaccess/hanna.css" rel="stylesheet">
<script>
	function logout(){
	     var frm=document.login;
	     frm.method="post";
	     frm.action="./logoutCtl.jsp";
	     frm.submit();  
	}
</script>
<style type="text/css">
		.next-button{
			margin-top:5%;
		}
		.next-button a {
		  text-decoration: none;
		  display: inline-block;
		  padding: 8px 16px;
		}
		.num-button{
			background-color:#FFE4E1;
			border-radius: 40%;
		}
		
		a:hover {
		  background-color: hotpink;
		  color: white;
		}
		
		.previous {
		  background-color: pink;
		  color: white;
		}
		
		.next {
		  background-color: pink;
		  color: white;
		}
		.
		.round {
		  border-radius: 50%;
		}
		.button {
			background-color: pink;
		 	border: none;
		  	color: white;
			padding: 6px 10px;
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
		.land {
			fill: white;
			fill-opacity: 1;
			stroke:pink;
			stroke-opacity: 1;
			stroke-width: 2;
		}
		.land:hover {
			fill: pink;
		}
		.TEXT {
			fill: black;
			font-size: 10;
			font-family: Hanna, sans-serif;
			text-anchor: middle;
			alignment-baseline: middle;
		}
		.list {
			list-style-type: none;
			text-align: right;
			padding: 5px 0;
			padding-bottom: 8px;
			border-bottom: 2px solid pink;
		}
		.list2 {
			list-style-type: none;
			text-align: center;
			padding: 5px 0;
			border-bottom: 2px solid pink;
		}
		.list3 {
			list-style-type: none;
			text-align: center;
			padding: 5px 0;
		}
		.list4 {
			list-style-type: none;
			text-align: right;
			padding: 5px 0;
			padding-bottom: 3px;
			border-bottom: 2px solid pink;
		}
		.login, .joinus {
			display : inline;
			text-align: right;
			letter-spacing : 3px;
			font-family: Hanna, sans-serif;
			text-transform : uppercase;
			color: pink;
		}
		.aa {
		color: pink;
		text-decoration: none;
		}
		.board2 {
			font-family: Hanna, sans-serif;
		}
		.full {
			width: 60%;
			padding: 10px;
			height: 100%;
			float: left;
		}
		.board {
			margin-right:2%;
			color: pink;
			display : inline;
			letter-spacing : 3px;
			text-transform : uppercase;
			border: 2px solid pink;
			padding: 10px;
			margin-top: 30px;
			width: 15%;
			float: left;
			text-align: center;
		}
		table.type09 {
			margin-left:13%;
			color:gray;
			margin-right:2%;
			font-family: Hanna, sans-serif;
		    border-collapse: collapse;
		    text-align: center;
		    line-height: 1.5;
		
		}
		table.type09 thead th {
		    padding: 10px;
		    font-weight: bold;
		    vertical-align: top;
		    color: hotpink;
		    border-bottom: 3px solid pink;
		}
		
		

		table.type09 tbody th {
			width:5%;
		    padding: 10px;
		    font-weight: bold;
		    vertical-align: top;
		    border-bottom: 1px solid #ccc;
		    background: #FFE4E1;
		}
		table.type09 td {
		    width: 10%;
		    padding: 10px;
		    vertical-align: top;
		    border-bottom: 1px solid #ccc;
		}
		table.type09 th .num{
		    width:3%;
		}
		table.type09 tbody .num{
			width:3%;
		}


		
</style>
</head>
<body>
<% 
   String jdbcUrl = "jdbc:mysql://localhost:3306/storage";
   String dbid = "root";
   String dbPass = "wjdqhqhdks";
   Connection con = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   
%>

	
<% 
	if (session.getAttribute("id") == null) {

   	try{
	      Class.forName("com.mysql.jdbc.Driver");
	      con = DriverManager.getConnection(jdbcUrl, dbid, dbPass);
	      String sql = "select * from member_board";
	      pstmt = con.prepareStatement(sql);
	      rs =pstmt.executeQuery();
      
%>
	<form name="login">
	<div class="p1">
	<a href="main.jsp" class="aa">길나들이</a>
	<p class="p2">A moment Walking the Flower road</p>
	</div>
	<div>
		<ul class="list">
			<li class="login"><a href="login.jsp" class="aa">Login</a></li>
			<li class="login">│</li>
			<li class="joinus"><a href="SignUp.jsp" class="aa">Join us</a></li>
			<li class="joinus">│</li>
			
			<div class="board">
			<ul class="list2">
				<br><br>
				<li class="board2">이달의 HOT<p class="board2">PlACE</p></li><br>
			</ul>
			<ul class="line">
			</ul>
			<ul class="list2">
				<br><br>
				<li class="board2">여행지 추천</li>
				<br><br>
			</ul>
			<ul class="list2">
				<br><br>
				<li class="board2">후기 게시판</li>
				<br><br>
			</ul>
			<ul class="list3">
				<br><br>
				<li class="board2">자유 게시판</li>
				<br><br>
			</ul>
		</div>
		</ul>
		<div>
		<table class="type09">
    <thead>
   <tr>
        <th scope="cols" class="no">no</th>
        <th scope="cols">글 제목</th>
        <th scope="cols">글쓴이</th>
        <th scope="cols">날짜</th>
        <th scope="cols" class="num">조회수</th>
        <th scope="cols" class="num">추천수</th>
        <th scope="cols" class="num">댓글수</th>
    </tr>
    </thead>
    <tbody>
<%
	while(rs.next()){
%>
    <tr>
        <th scope="row"><%=rs.getString("board_num")%></th>
        <td><%=rs.getString("board_subject")%></td>
        <td><%=rs.getString("board_nick")%></td>
        <td><%=rs.getString("Board_date")%></td>
        <td class="num">2</td>
        <td class="num">2</td>
        <td class="num">4</td>
    </tr>
<%
	}
%>
</tbody>
</table></div>
<center>
<div class="next-button">
	
	<a href="#" class="previous round">&#8249;</a>
	<a href="#" class="num-button">1</a>
	<a href="#" class="num-button">2</a>
	<a href="#" class="num-button">3</a>
	<a href="#" class="next round">&#8250;</a>
</div></center>
</div>
		</form>
			</div>
	
		
</body>
</html>
<% 
   }
   catch(Exception e){
         
   }
   finally{
      if(rs != null ){
         try{
            rs.close();
         }
         catch(Exception e){
            out.println("SQLException : " + e.getMessage());
         }
      }
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
   }}
   
%>   

<% 
if(session.getAttribute("id") != null){
	try{
	      Class.forName("com.mysql.jdbc.Driver");
	      con = DriverManager.getConnection(jdbcUrl, dbid, dbPass);
	      String sql = "select * from member_board";
	      pstmt = con.prepareStatement(sql);
	      rs =pstmt.executeQuery();
%>

	<form name="login">
	<div class="p1">
	
	<a href="main.jsp" class="aa">길나들이</a>
	<p class="p2">A moment Walking the Flower road</p>
	</div>
		<div>
		<ul class="list4">
			<li class="login"><%=session.getAttribute("id") %>님 </li>
			<li class="login"><input type="submit" onClick="logout()" class="button" value="로그아웃"></li>
			<li class="login">│</li>
			<li class="joinus"><a href="SignUp.jsp" class="aa">My Page</a></li>
			<li class="joinus">│</li>
			
			<div class="board">
			<ul class="list2">
				<br><br>
				<li class="board2">이달의 HOT<p class="board2">PlACE</p></li><br>
			</ul>
			<ul class="line">
			</ul>
			<ul class="list2">
				<br><br>
				<li class="board2">여행지 추천</li>
				<br><br>
			</ul>
			<ul class="list2">
				<br><br>
				<li class="board2">후기 게시판</li>
				<br><br>
			</ul>
			<ul class="list3">
				<br><br>
				<li class="board2">자유 게시판</li>
				<br><br>
			</ul>
		</div>
		</ul>
		<div>
		<table class="type09">
    <thead>
    <tr>
        <th scope="cols" class="no">no</th>
        <th scope="cols">글 제목</th>
        <th scope="cols">글쓴이</th>
        <th scope="cols">날짜</th>
        <th scope="cols" class="num">조회수</th>
        <th scope="cols" class="num">추천수</th>
        <th scope="cols" class="num">댓글수</th>
    </tr>
    </thead>
    <tbody>
<%
	while(rs.next()){
%>
    <tr>
        <th scope="row"><%=rs.getString("board_num")%></th>
        <td><%=rs.getString("board_subject")%></td>
        <td><%=rs.getString("board_nick")%></td>
        <td><%=rs.getString("Board_date")%></td>
        <td class="num">2</td>
        <td class="num">2</td>
        <td class="num">4</td>
    </tr>
<%
	}
%>
<% 
   }
   catch(Exception e){
         
   }
   finally{
      if(rs != null ){
         try{
            rs.close();
         }
         catch(Exception e){
            out.println("SQLException : " + e.getMessage());
         }
      }
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
   }}
   
%>   
</tbody>
</table>
<center>
<div class="next-button">
	<a href="boardWriteForm.jsp" class="previous round">글쓰기</a><br>
	<a href="#" class="previous round">&#8249;</a>
	<a href="#" class="num-button">1</a>
	<a href="#" class="num-button">2</a>
	<a href="#" class="num-button">3</a>
	<a href="#" class="next round">&#8250;</a>
</div></center>
</div>
		</form>
			</div>
	
		
</body>
</html>
		