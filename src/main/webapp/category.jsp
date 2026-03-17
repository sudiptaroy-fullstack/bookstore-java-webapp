<%-- 
    Document   : category
    Created on : 8 Mar 2026
    Author     : Sudip
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>

<title>Category Books</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link rel="stylesheet"
      href="${pageContext.request.contextPath}/assets/css/style.css">

</head>

<body>

<!-- NAVBAR -->
<jsp:include page="components/navbar.jsp"/>

<!-- CATEGORY BOOKS -->
<div class="container mt-4">

<h3 class="mb-4 fw-bold">Category Books</h3>

<div class="row g-4">

<c:forEach var="b" items="${books}">

<div class="col-lg-3 col-md-4 col-sm-6">

<div class="card h-100 shadow-sm">

<img src="${pageContext.request.contextPath}/assets/images/${b.image}"
     class="card-img-top"
     alt="${b.title}">

<div class="card-body">

<h6 class="card-title">${b.title}</h6>

<p class="text-warning fw-bold mb-2">
₹${b.price}
</p>

<a href="${pageContext.request.contextPath}/product?id=${b.id}"
   class="btn btn-warning btn-sm">

View

</a>

</div>

</div>

</div>

</c:forEach>

</div>

</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>