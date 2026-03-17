<%-- 
    Document   : login
    Created on : 21 Feb 2026, 10:15:46 pm
    Author     : sudip
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<title>Login | BookStore</title>

<link rel="stylesheet"
href="${pageContext.request.contextPath}/assets/css/style.css">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">
<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

</head>

<body class="auth-page">

<jsp:include page="components/navbar.jsp"/>

<div class="auth-container">

<div class="auth-card">

<h3 class="mb-4 text-center">Login</h3>

<form action="${pageContext.request.contextPath}/login" method="post">

<div class="mb-3">

<label>Email</label>

<div class="input-group">

<span class="input-group-text">
<i class="fas fa-envelope"></i>
</span>

<input type="email" name="email"
class="form-control" required>

</div>

</div>

<div class="mb-3">

<label>Password</label>

<div class="input-group">

<span class="input-group-text">
<i class="fas fa-lock"></i>
</span>

<input type="password" name="password"
class="form-control" required>

</div>

</div>

<button class="btn btn-warning w-100">

Login

</button>

</form>

<p class="mt-3 text-center">

Don't have an account?
<a href="signup.jsp">Sign Up</a>

</p>

</div>

</div>

</body>
</html>
