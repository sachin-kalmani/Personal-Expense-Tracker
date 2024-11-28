<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/c51a42b11c.js" crossorigin="anonymous"></script>
<title>Delight_Expense</title>
<style type="text/css">


body{
 	background-color:#42c2ff;
	overflow:hidden;
	height:100vh;
	margin:0;
	padding:0;
	box-sizing: border-box;
    list-style: none;
    text-decoration: none;
    font-family: 'Josefin Sans', sans-serif
}
.login{
	position:absolute;
	top:50%;
	left:50%;
	transform:translate(-50%,-50%);
	width:400px;
	background:#ffffff;
	border-radius:10px;
}
.login h2{
text-align:center;
padding:0 0 20px 0;
border-bottom: 1px solid silver;
}
.login form{
padding:0 40px;
box-sizing:border-box;
}

form .txt{
	position:relative;
	border-bottom:2px solid #adadad;
	margin:30px 0;
}
.txt input{
	width:100%;
	padding :0 5px;
	height:40px;
	font-size:16px;
	border:none;
	background:none;
	outline:none;
}

.txt label{
	position:absolute;
	top:50%;
	right:0;
	color:#adadad;
	transform:translateY(-50%);
	font-size:16px;
	pointer-events:none;
}

.frgt{
	margin:-5px 0 20px 5px;
	color:#a6a6a6;
	cursor:pointer;
}

.frgt:hover{
	text-decoration:underline;
}

input[type="submit"]{
	width:100%;
	height:40px;
	background:#42c2ff;
	color:#e9f4fb;
	font-size:18px;
	border-radius:25px; 
	font-weight:700;
	cursor:pointer;
	outline:none;
	border:none;
}

input[type="submit"]:hover{
	border:1px solid #42c2ff;
	transition:.5s;
}

.signup{
	margin:30px 0;
	text-align:center;
	font-sixe:16px;
	color:#666666;
}
.signup a{
	color:#42c2ff;
	text-decoration:none;
}
.signup a:hover{
	text-decoration:underline;
}
</style>
</head>
<body>
		<div class="login">
		<h2>Login
		<c:if test="${not empty msg}">
		<p style="color:#00000080;">${msg}</p>
	<c:remove var="msg"/>
	</c:if>
	</h2>
		<form action="login" method="post">
			<div class="txt">
			<input type="email" name="email">
			<label>Email</label>
			</div>
			<div class="txt">
			<input type="password" name="password">		
			<label>Password</label>
			</div>
			<div class="frgt">Forgot Password?</div>
			<input type="submit" value="login">
			<div class="signup">
			Not a member? <a href="register.jsp">Signup</a>
			</div>
		</form>
		</div>
</body>
</html>