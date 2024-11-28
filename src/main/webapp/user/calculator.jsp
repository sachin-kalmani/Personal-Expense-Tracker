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
.container {
  background-color: #ffffff;
  position: absolute;
  transform: translate(-50%, -50%);
  top: 50%;
  left: 50%;
  width: 80vw;
  max-width: 600px;
  min-width: 350px;
  padding: 60px 30px;
  border-radius: 10px;
  box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
}
label {
  display: block;
  font-size: 22px;
  margin-bottom: 10px;
  font-weight: 500;
}
input {
  margin-bottom: 20px;
  border: none;
  font-size: 20px;
  border-bottom: 2px solid #585858;
  color: #42c2ff;
  padding: 2px 15px;
}
input:focus {
  outline: none;
  border-bottom: 2.4px solid #01e26e;
}
.input-wrapper {
  display: flex;
  justify-content: space-between;
  gap: 20px;
}
.input-wrapper input {
  width: 100%;
}
.time-wrapper input {
  width: 60%;
}
select {
  width: 35%;
  border: 1px solid #42c2ff;
  font-size: 20px;
  margin-left: 3%;
  padding: 8px 0;
  border-radius: 5px;
}
button {
  display: block;
  background-color: #42c2ff;
  border: none;
  color: #ffffff;
  margin: 20px auto 0 auto;
  padding: 15px 40px;
  font-size: 20px;
  border-radius: 5px;
}
#result {
  background-color: #42c2ff;
  margin-top: 30px;
  color: #fffff;
  text-align: center;
  font-size: 18px;
  padding: 20px;
  border-radius: 5px;
}
#result div {
  margin-bottom: 10px;
}
#result span {
  color: #000000;
  font-weight: 500;
}
</style>
<%@include file="component/allcdn.jsp" %>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script>
    $(document).ready(function() {
      $('#interestForm').submit(function(event) {
        event.preventDefault();
        var principal = $('#principal').val();
        var rate = $('#rate').val();
        var time = $('#time').val();
        var url = $(this).attr('action');
        
        $.get(url, { principal: principal, rate: rate, time: time }, function(data) {
          $('#result').html(data);
        });
      });
    });
  </script>
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
	<a href="addincome.jsp"><i class="fa-solid fa-piggy-bank"></i><span>Add Income</span></a>
	</li>
	<li>
	<a href="addexpense.jsp"><i class="fa-solid fa-piggy-bank"></i><span>Add Expense</span></a>
	</li>
	<li>
	<a href="Category.jsp" class="active"><i class="fa-solid fa-tags"></i><span>Category</span></a>
	</li>
	</ul>
	<ul>
	<li>
	<a href="calculator.jsp"><i class="fa-solid fa-percent"></i><span>Interest Calculator</span></a>
	</li>
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
       <form id="interestform" action="../interest" action="get">
	 <div class="container">
      <div class="input-wrapper">
        <div class="wrapper">
          <label for="principal" required>Principal($):</label>
          <input type="text" id="principal" value="1000" />
        </div>
        <div class="wrapper">
          <label for="rate" required>Rate:</label>
          <input type="text" id="rate" value="5" />
        </div>
      </div>
      <label for="time" required>Time:</label>
      <div class="time-wrapper">
        <input type="text" id="time" name="time" value="1" />
        <select name="duration" id="duration">
          <option value="year">Year</option>
          <option value="month">Month</option>
        </select>
      </div>
      <button type="submit" >Calculate</button>
      <div id="result"></div>
    </div>
        </form>
</body>
</html>