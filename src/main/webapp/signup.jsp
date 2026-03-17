<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>

<title>Sign Up | BookStore</title>

<link rel="stylesheet"
href="${pageContext.request.contextPath}/assets/css/style.css">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">

</head>

<body class="auth-page">

<!-- NAVBAR -->
<jsp:include page="components/navbar.jsp"/>

<div class="auth-container">

<div class="auth-card">

<h3 class="mb-4 text-center">Create Account</h3>

<!-- ERROR MESSAGE -->
<c:if test="${not empty error}">
<div class="alert alert-danger">
${error}
</div>
</c:if>

<form action="${pageContext.request.contextPath}/signup" method="post">

<!-- NAME -->
<div class="mb-3">

<label>Name</label>

<input type="text"
name="name"
class="form-control"
placeholder="Enter your name"
required>

</div>

<!-- EMAIL -->
<div class="mb-3">

<label>Email</label>

<div class="input-group">

<span class="input-group-text">
<i class="fas fa-envelope"></i>
</span>

<input type="email"
name="email"
class="form-control"
placeholder="Enter your email"
required>

</div>

</div>

<!-- PASSWORD -->
<div class="mb-3">

<label>Password</label>

<div class="input-group">

<span class="input-group-text">
<i class="fas fa-lock"></i>
</span>

<input type="password"
name="password"
class="form-control"
placeholder="Enter password"
required>

</div>

</div>

<!-- SIGNUP BUTTON -->
<button class="btn btn-warning w-100">

<i class="fas fa-user-plus"></i>

Sign Up

</button>

</form>

<!-- LOGIN LINK -->
<p class="mt-3 text-center">

Already have an account?

<a href="${pageContext.request.contextPath}/login.jsp">
Login
</a>

</p>

</div>

</div>

</body>

</html>