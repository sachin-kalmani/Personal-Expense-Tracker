<%@page import="com.dao.UserDao"%>
<%@page import="java.time.Month"%>
<%@page import="com.google.common.collect.Multimap"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.dao.IncomeDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Map"%>
<%@page import="com.entity.Expense"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="com.dao.ExpenseDao"%>
<%@page import="com.db.HibernateUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Personal Finance Tracker</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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

.wrapper .main{
	width:100%;
	margin-left:250px;
}
.wrapper .main-content{
		padding:15px 20px;
		border-bottom: 1px solid #00000040;
		display:flex; 
		justify-content:space-between;
		align-items:center;
}

.wrapper .main-content .right{
	margin-right:30px;
}
.wrapper .main-content .right a{
	margin: 0 10px;
	color:#42c2ff;
}
.wrapper .main-content .right a span{
	font-size:19px;
	margin-right:8px;	
}
.main .dashboard{
	position:relative;
	width:100%;
	padding:20px;
	display:grid;
	grid-template-columns:repeat(3,1fr);
	grid-gap:20px;
}
.dashboard .card{
	position:relative;
	padding:30px;
	border-radius:20px;
	display:flex;
	justify-content:space-between;
	box-shadow: 0 7px 25px rgba(0,0,0,0.08);
}
.dashboard .card .num{
	position:relative;
	font-weight:500;
	font-size:2.5em;
	color:#42c2ff;
}
.dashboard .card .name{
	color:#00000090;
	font-size:1.1em;
	line-height:20px;
	margin-bottom:5px;
}
.dashboard .card .icon{
	font-size:3.5em;
	color:#00000090;
}
.dashboard .card:hover{
	background:#42c2ff;
}
.dashboard .card:hover .num,
.dashboard .card:hover .name,
.dashboard .card:hover .icon{
	color:#fff;
}


	.graphbox{
		position:relative;
		width:100%;
		padding:20px;
		display:grid;
		grid-template-columns:1fr 2fr;
		grid-gap:30px;
		min-height:200px;
	}
	.graphbox .box{
		position:relative;
		background:#fff;
		padding:20px;
		width:100%;
		box-shadow:0 7px 25px rgba(0,0,0,0.08);
		border-radius:20px;
	}
	.graphbox 
.expense{
	position:relative;
	width:100%;
	padding:20px;
	display:grid;
	grid-template-columns:2fr;
	grid-gap:30px;
}

.expense .recent{
	position:relative;
	display:grid;
	min-height:200px;
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
.btn{
position:relative;
padding:10px 10px;
background:#42c2ff;
text-decoration:none;
color:#fff;
border-radius:10px;	
}
.expense table{
	position:relative;
	width:100%;
	border-collapse:collapse;
	margin-top:20px;
}

.expense table thead td{
	font-weight:600;
}
.expense .recent table tr{
	color:#00000090;
	border-bottom:1px solid rgba(0,0,0,0.1);
}
.expense .recent table tr:last-child{
	border-bottom:none;
}
.expense .recent table tbody tr:hover{
	background:#42c2ff;
	color:#fff;
}
.expense .recent table tr td{
	padding:10px;
}

.expense .recent table tr td:last-child{
	text-align:end;
}
.expense .recent table tr td:nth-child(2){
	text-align:end; 
}

.expense .recent table tr td:nth-child(3){
	text-align:center;
}
.add{
	position:fixed;
	bottom:6%;
	right:5%;
	padding:15px 10px;
	background:#42c2ff;
	border-radius:20px;
}
.add a{
	color:#fff;
}
.add a span{
	margin-left:7px;
}
</style>
		
</head>

	<body>
<c:if test="${empty loginUser}">
	<c:redirect url="../login.jsp"></c:redirect>
</c:if>
						<%User user=(User)session.getAttribute("loginUser");
						ExpenseDao dao=new ExpenseDao(HibernateUtil.getSessionFactory());
						IncomeDao dao1=new IncomeDao(HibernateUtil.getSessionFactory());
						UserDao dao2=new UserDao(HibernateUtil.getSessionFactory());
						%>
			<!-- Sidebar -->
	<div class="wrapper">
	<div class="sidebar">
	<div class="User"><h2>DelightExpense</h2></div>
	<div class="nav">
	<ul>
	<li>
	<a href="dashboard.jsp" class="active"><i class="fa-solid fa-wallet"></i><span>Dashboard</span></a>
	</li>
	<li>
	<a href="addincome.jsp"><i class="fa-solid fa-piggy-bank"></i><span>Add Income</span></a>
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
	
			<!-- main header -->
		<div class="main">
				<c:if test="${not empty loginUser}">
			<div class="main-content">
				<div class="right">
				</div>
				<div class="right">
				<a><span>${loginUser.email }</span> <i class="fa-solid fa-user"></i></a>
				</div>
			</div>
				</c:if>
		
						
					<!-- Expense header -->
				<div class="dashboard">
				
				<div class="card">
				<div class="icon">
				<i class="fa-solid fa-indian-rupee-sign"></i>
				</div>
				<div>
					<div class="name">Total Income</div>
					<div class="num"><%int sum1=dao1.getSumOfIncome(user); %><%=sum1 %></div>
				</div>
				</div>
				
				<div class="card">
				<div class="icon">
				<i class="fa-solid fa-indian-rupee-sign"></i>
				</div>
				<div>
					<div class="name">Total Expense</div>
					<div class="num"><%int sum=dao.getSumOfExpense(user); %><%=sum %></div>
				</div>
				</div>
				
				<div class="card">
				<div class="icon">
				<i class="fa-solid fa-indian-rupee-sign"></i>
				</div>
				<div>
					<div class="name">Balance</div>
					<div class="num"><%int sum3=sum1-sum; %><%=sum3 %></div>
				</div>
				</div>
				</div>
					
					<!--Charts  -->
						<div class="graphbox">
						
							<div class="box">
							<canvas id="myChart"></canvas>
							</div>
							<div class="box"><canvas id="myChart1"></canvas>
							</div>
						</div>
						
				
					<!-- RecentTransactions and accept expense  -->
					<div class="expense">
					<div class="recent">
					<div class="card-header">
					<h2>Recent Transactions</h2>
					<a href="history.jsp" class="btn">View All</a>
					</div>
					<table>
					<thead>
					<tr>
					<td>Name</td>
					<td>Amount</td>
					<td>Date</td>
					<td>Category</td>
					</tr>
					</thead>
					<tbody>
					<%
						List<Expense> list=dao.getAllExpenseByUser(user);
						for(Expense ex:list)
						{
						%>
					  	<tr>	
					  	<td><%=ex.getTitle() %></td>
					  	<td><%=ex.getAmount() %></td>
					  	<td><%=ex.getCurrentMonth()%> <%=ex.getCurrentYear()%></td>
					  	<td><%=ex.getCategory() %></td>
					  	</tr>
					  	<%
					  	}
					  %>
					</tbody>
					</table>					
					
					</div>
					
					
					</div>
					<div class="add">
					<a href="addexpense.jsp"><i class="fa-solid fa-plus"></i> <span>Add Expense</span></a>
					</div>
			</div>
		</div>
		<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
		<script type="text/javascript">
		
		 
	<%	Multimap<String,Integer>list1=dao.getExpenseByCategory(user);%>
	<%	List<String> labels=new ArrayList<String>();%>
	<%	List<Integer> amount=new ArrayList<Integer>();%>
	
	<%
	for (String category : list1.keySet()) {
        int sum7 = 0;
        for (int amount4 : list1.get(category)) {
            sum7 += amount4;
        }
        labels.add(category);
        amount.add(sum7);
    }
	request.setAttribute("labels", labels);
    request.setAttribute("amount", amount); 
	%>
	
	 var label = <%=new Gson().toJson(labels) %>;
     var amount= <%=new Gson().toJson(amount) %>;
		    
		var ctx = document.getElementById('myChart').getContext('2d');
		var myChart = new Chart(ctx, {
		    type: 'doughnut',
		    data: {
		        labels:label,
		        datasets: [{
		            label:"expense" ,
		            data:amount,
		            backgroundColor: [
		                'rgba(255, 99, 132, 0.2)',
		                'rgba(54, 162, 235, 0.2)',
		                'rgba(255, 206, 86, 0.2)',
		                'rgba(75, 192, 192, 0.2)',
		                'rgba(153, 102, 255, 0.2)',
		                'rgba(255, 159, 64, 0.2)'
		            ],
		            borderColor: [
		                'rgba(255, 99, 132, 1)',
		                'rgba(54, 162, 235, 1)',
		                'rgba(255, 206, 86, 1)',
		                'rgba(75, 192, 192, 1)',
		                'rgba(153, 102, 255, 1)',
		                'rgba(255, 159, 64, 1)'
		            ],
		            borderWidth: 1
		        }]
		    },
		    options: {
		        scales: {
		            y: {
		                beginAtZero: true
		            }
		        }
		    }
		});

		 
		<%	Multimap<String,Integer>list3=dao1.getIncomeByCategory(user);%>
		<%	List<String> labels3=new ArrayList<String>();%>
		<%	List<Integer> amount3=new ArrayList<Integer>();%>
		
		<%
		for (String income : list3.keySet()) {
	        int sum8 = 0;
	        for (int amount5 : list3.get(income)) {
	            sum8 += amount5;
	        }
	        labels3.add(income);
	        amount3.add(sum8);
	    }
		request.setAttribute("labels3", labels3);
	    request.setAttribute("amount3", amount3); 
		%>
		
		 var label4 = <%=new Gson().toJson(labels3) %>;
	     var amount4 = <%=new Gson().toJson(amount3) %>;
		var ctx = document.getElementById("myChart1").getContext("2d");

		var myChart = new Chart(ctx, {
		   type: 'line',
		   data: {
		      labels:label4 ,
		      datasets: [{
		         label: "Income",
		         data: amount4,
		         backgroundColor: 'rgba(255, 99, 132, 0.2)',
		         borderColor: 'rgba(255, 99, 132, 1)',
		         borderWidth: 1
		      }]
		   },
		   options: {
		      scales: {
		         yAxes: [{
		            ticks: {
		               beginAtZero: true
		            }
		         }]
		      }
		   }
		});

		</script>
</body>
</html>