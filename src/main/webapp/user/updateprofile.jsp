<%@page import="com.entity.User"%>
<%@page import="com.dao.UserDao"%>
<%@page import="com.entity.Expense"%>
<%@page import="com.db.HibernateUtil"%>
<%@page import="com.dao.ExpenseDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.card-sh{
	box-shadow:0 0 6px 0 rgba(0,0,0,0.3);
}

</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
rel="stylesheet" 
integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
 crossorigin="anonymous">
 <title>Personal Finance Tracker</title>
</head>
<body class="bg-light">

<c:if test="${empty loginUser}">
	<c:redirect url="../login.jsp"></c:redirect>
</c:if>
<div class="container mt-3">
<div class="row">
<div class="col-md-4 offset-md-4" >
	<div class="card card-sh">
	<div class="card-header text-center">
	<p class="fs-3">Update Profile
	<c:if test="${not empty msg}">
	<p class="text-center text-success fs-4">${ msg } </p>
		<c:remove var="msg"/>
		</c:if>
	</p>
<%

int id=Integer.parseInt(request.getParameter("id"));
User user=(User)session.getAttribute("loginUser");
UserDao dao=new UserDao(HibernateUtil.getSessionFactory());
user=dao.getUserById(id);
%>
	</div>
	<div class="car-body p-3">
	<form action="../profile" method="post">
	<div class="mb-3">
	<label>Username</label>
	<input type="text" name="name" class="form-control"value=<%=user.getName()%>>
	</div>
	<div class="mb-3">
	<label>Email</label><input type="email" name="email" class="form-control"value=<%=user.getEmail()%>>
	</div>
	<div class="mb-3">
	<label>Mobile</label><input type="text" name="mobile" class="form-control"value=<%=user.getPhone()%>>
	</div>
	<div class="mb-3">
	<label>Change Password</label><input type="password" name="password" class="form-control"value=<%=user.getPassword()%>>
	</div>
	<div class="mb-3">
	<label>Date of Birth</label><input type="text" name="dob" class="form-control"value=<%=user.getBirth()%>>
	</div>
	<input type="hidden" name="id" value=<%=user.getId() %>>
	<button class="btn btn-primary col-md-12 mb-3">Update</button>
	</form>
	</div>
	</div>

</div>
</div>
</div>
</body>
</html>
