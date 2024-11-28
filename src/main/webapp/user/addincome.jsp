<%@page import="com.entity.IncomeCategory"%>
<%@page import="com.dao.InCatDao"%>
<%@page import="com.entity.Income"%>
<%@page import="java.util.List"%>
<%@page import="com.db.HibernateUtil"%>
<%@page import="com.dao.IncomeDao"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Personal Finance Tracker</title>
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
.main{
	position:relative;
	width:80%;
	margin-left:260px;
	padding:20px;
	display:grid;
	grid-template-columns:1fr 2fr;
	grid-gap:30px;
}
.main .recent{
	position:relative;
	display:grid;
	padding:20px;
	box-shadow:0 7px 25px rgba(0,0,0,0.08);
	border-radius:20px;
}
.recent .card-header{
display:flex;
justify-content:space-between;
align-items:flex-start;
}

.card-header h2{
	font-weight:600;
	color:#42c2ff;
}
.main table{
	position:relative;
	top:10%;
	padding:10px 10px;
	width:100%;
	border-collapse:collapse;
	margin-top:20px;
}

.expense table thead td{
	font-weight:600;
}
.exoense .recent table tr{
	color:#00000090;
	border-bottom:1px solid rgba(0,0,0,0.1);
}
.expense .recent table tr:last-child{
	border-bottom:none;
}
.expense .recent table tbody tr:hover{
	background:#42c2ff;
	color:#fff;
	border-radius:20px;
}
.expense .recent table tbody tr:hover #btn{
	background:#fff;
	color:#42c2ff;
}
.expense .recent table tr td{
	padding:10px;
	color:#00000090;
}
.expense .recent table tr td:last-child{
	text-align:end;
}
.expense .recent table tr td:nth-child(2){
	text-align:end; 
}

.expense.recent table tr td:nth-child(3){
	text-align:center;
}
.expense.recent table thead tr td:last-child{
	text-align:center;	
}
.login{
	position:relative;
	display:grid;
	min-height:200px;
	padding:20px;
	box-shadow:0 7px 25px rgba(0,0,0,0.08);
	border-radius:20px;
}
.login{
	position:relative;
	display:grid;
	min-height:200px;
	padding:20px;
	box-shadow:0 7px 25px rgba(0,0,0,0.08);
	border-radius:20px;
}
.login h2{
	text-align:center;
	color:#42c2ff;
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
.btn{
position:relative;
padding:5px 10px;
background:#42c2ff;
text-decoration:none;
color:#fff;
border-radius:10px;	
}
#category{
	position:relative;
	display:block;
	outline:none;
	border:none;
	transform:translateY(-50%);
	width:200px;
	background:#42c2ff;
	font-size:17px;
	color:#fff;
	padding:10px 20px;
	border-radius:10px;
}
.edits{
	display:flex;
	margin:0 4px;
}
</style>
<%@include file="component/allcdn.jsp" %>

</head>
<body>
<c:if test="${empty loginUser}">
	<c:redirect url="../login.jsp"></c:redirect>
</c:if>
<div class="wrapper">
	<div class="sidebar">
	<div class="User"><h2>DelightExpense</h2></div>
	<div class="nav">
	<ul>
	<li>
	<a href="dashboard.jsp"><i class="fa-solid fa-wallet"></i><span>Dashboard</span></a>
	</li>
	<li>
	<a href="addincome.jsp" class="active"><i class="fa-solid fa-piggy-bank"></i><span>Add Income</span></a>
	</li>
	<li>
	<a href="addexpense.jsp"><i class="fa-solid fa-piggy-bank"></i><span>Add Expense</span></a>
	</li>
	<li>
	<a href="Category.jsp"><i class="fa-solid fa-tags"></i><span>Category</span></a>
	</li>
	</ul>
	<ul>
	
	<li>
	<a href="history.jsp"><i class="fa-solid fa-clock-rotate-left"></i><span>History</span></a>
	</li>
	<li>
	<a href="profile.jsp"><i class="fa-solid fa-user"></i><span>Profile</span></a>
	</li>
	</ul>
	<ul id="logout">
	<li><a href="../logout"><i class="fa-solid fa-right-from-bracket"></i><span>Logout</span></a></li>
	</ul>
	</div>
	</div>
	</div>
	<div class="main">
	<div class="login">
		<h2>Add Income
	</h2>
		<form action="../saveIncome" method="post">
			<div class="txt">
			<input type="text" name="title">
			<label>Title</label>
			</div>
			<div class="txt">
			<input type="text" name="amount">		
			<label>Amount</label>
			</div>
			<div class="txt">
			<input type="text" name="description">		
			<label>Description</label>
			</div>
			<div class="txt">
			<input type="text" name="Category">		
			<label>Category</label>
			<select name="category" id="category">
    	<option value=" ">Select Category</option>
    	<%User user=(User)session.getAttribute("loginUser");
		InCatDao dao1=new InCatDao(HibernateUtil.getSessionFactory());%>
		<%List<IncomeCategory> list2=dao1.getAllCategoryByUser(user);
		for(IncomeCategory incat:list2)
			{%>
			<option value=<%=incat.getCategory() %>><%=incat.getCategory() %></option>
			<%} %>
  </select>
			</div>
			<input type="submit" value="Add Income">
		</form>
			</div>
			<div class="expense">
					<div class="recent">
					<div class="card-header">
					<h2>Recent Income
					<c:if test="${not empty msg}">
					<p class="text">${ msg } </p>
					<c:remove var="msg"/>
					</c:if>
					</h2>
					</div>
					<table>
					<thead>
					<tr>
					<td>Name</td>
					<td>Amount</td>
					<td>Date</td>
					<td>Category</td>
					<td>Action</td>
					</tr>
					</thead>
					<%
						IncomeDao dao=new IncomeDao(HibernateUtil.getSessionFactory());
						%>
					<tbody>
					<%
						List<Income> list=dao.getAllExpenseByUser(user);
						for(Income inc:list)
						{%>
					  	<tr>	
					  	<td><%=inc.getTitle() %></td>
					  	<td><%=inc.getAmount() %></td>
					  	<td><%=inc.getCurrentMonth()%> <%=inc.getCurrentYear()%></td>
					  	<td><%=inc.getCategory() %></td>
					  		<td class='edits'><a href="editIncome.jsp?id=<%=inc.getId() %>" class="btn">Edit</a>
		  	<a href="../deleteIncome?id=<%=inc.getId() %>" class="btn">Delete</a></td>
					  	<%
					  	}
					  %>
					</tbody>
					</table>					
					
					</div>
					
			</div>
</div>
</body>
</html>