<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Josefin+Sans:ital,wght@0,100;0,200;0,300;0,400;0,700;1,100;1,200;1,300;1,400;1,500;1,700&family=Poppins:wght@100;200;300;500&display=swap');
*{
	margin:0;
	padding:0;
	box-sizing: border-box;
    list-style: none;
    text-decoration: none;
    font-family: 'Josefin Sans', sans-serif
}

body{
 background-color:#fff;
}
.wrapper{
	display:flex;
	position:relative;
}
.wrapper .sidebar{
	position:fixed;
	width:250px;
	height:100%;
	background:#42c2ff;
	border-radius:0 0 25px 0;
	padding:30px 0;
}	
.wrapper .sidebar .User{
	position:relative;
	transform:translateY(-10%);
	padding:20px 10px;
	text-align:center;
	color:#fff;
	border-radius:20px;
}
.wrapper .sidebar .User h2{
	text-shadow:2px 2px 2px rgba(0,0,0,0.3);
}

.wrapper .sidebar .nav ul {
	position:relative;	
	width:100%;
	padding:10px 0;
	border-bottom:1px solid #ffffff90;
}
.wrapper .sidebar .nav ul li{
	text-decoration:none;
	width:100%;
	display:block;
	margin:10px 10px 0 0;
}
.wrapper .sidebar .nav ul li a{
	color:#fff;
	display:block;
	width:100%;
	font-size:17px;
	padding:10px 10px;
	line-height:20px;	
	font-weight:400;	
}
.wrapper .sidebar .nav span{
	margin-left:25px;
}

.wrapper .sidebar .nav ul li:hover,
.wrapper .sidebar .nav ul li:hover a{
	background-color:#fff;
	color:#42c2ff;
	text-shadow:0 0 1px #00000080;	
}
.wrapper .sidebar .nav ul li a.active{
	background-color:#fff;
	color:#42c2ff;
	text-shadow:0 0 1px #00000080;
}

#logout{
	border:none;
}
</style>
</head>
<body>
<div class="wrapper">
	<div class="sidebar">
	<div class="User"><h2>DelightExpense</h2></div>
	<div class="nav">
	<ul>
	<li>
	<a href="Dashboard.jsp" class="active"><i class="fa-solid fa-wallet"></i><span>Dashboard</span></a>
	</li>
	<li>
	<a href="#"><i class="fa-solid fa-piggy-bank"></i><span>Add Income</span></a>
	</li>
	<li>
	<a href="#"><i class="fa-solid fa-tags"></i><span>Category</span></a>
	</li>
	</ul>
	<ul>
	<li>
	<a href="#"><i class="fa-solid fa-chart-line"></i><span>Reports</span></a>
	</li>
	<li>
	<a href="#"><i class="fa-solid fa-clock-rotate-left"></i><span>History</span></a>
	</li>
	<li>
	<a href="#"><i class="fa-solid fa-gear"></i><span>Settings</span></a>
	</li>
	</ul>
	<ul id="logout">
	<li><a href="#"><i class="fa-solid fa-right-from-bracket"></i><span>Logout</span></a></li>
	</ul>
	</div>
	</div>
	</div>
</body>
</html>