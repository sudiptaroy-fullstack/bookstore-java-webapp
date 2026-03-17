<%-- 
    Document   : wishlist
    Created on : 21 Feb 2026, 10:16:42 pm
    Author     : sudip
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>

<title>Wishlist | BookStore</title>

<link rel="stylesheet"
href="${pageContext.request.contextPath}/assets/css/style.css">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">

</head>

<body class="cart-page">

<jsp:include page="components/navbar.jsp"/>

<div class="cart-container">

<h2 class="mb-4">My Wishlist</h2>

<div class="row cart-header">

<div class="col-md-5">Book</div>
<div class="col-md-2">Price</div>
<div class="col-md-3">Add to Cart</div>
<div class="col-md-2">Remove</div>

</div>

<c:choose>

<c:when test="${empty sessionScope.wishlist}">

<div class="empty-cart">

<h4>Your wishlist is empty</h4>

<a href="${pageContext.request.contextPath}/home"
class="btn btn-warning mt-3">

Browse Books

</a>

</div>

</c:when>

<c:otherwise>

<c:forEach var="item" items="${sessionScope.wishlist}">

<div class="row cart-row align-items-center">

<div class="col-md-5 d-flex align-items-center">

<img
src="${pageContext.request.contextPath}/assets/images/${item.image}"
class="cart-book-img me-3"
onerror="this.src='${pageContext.request.contextPath}/assets/images/placeholders/book-placeholder.jpeg'">

<div>

<strong>${item.title}</strong><br>
<small>${item.author}</small>

</div>

</div>

<div class="col-md-2">
₹ ${item.price}
</div>

<div class="col-md-3">

<form action="${pageContext.request.contextPath}/add-cart" method="post">

<input type="hidden" name="bookId" value="${item.bookId}">

<button class="btn btn-warning btn-sm">
<i class="fas fa-cart-plus"></i> Add to Cart
</button>

</form>

</div>

<div class="col-md-2">

<form action="${pageContext.request.contextPath}/remove-wishlist" method="post">

<input type="hidden" name="bookId" value="${item.bookId}">

<button class="btn btn-outline-danger btn-sm">
<i class="fas fa-trash"></i>
</button>

</form>

</div>

</div>

</c:forEach>

</c:otherwise>

</c:choose>

</div>

<jsp:include page="components/footer.jsp"/>

</body>
</html>