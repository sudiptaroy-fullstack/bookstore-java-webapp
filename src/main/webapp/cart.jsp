<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<title>Cart | BookStore</title>

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- FontAwesome -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">

<!-- Main CSS -->
<link rel="stylesheet"
href="${pageContext.request.contextPath}/assets/css/style.css">

</head>

<body class="cart-page">

<!-- NAVBAR -->
<jsp:include page="components/navbar.jsp"/>

<div class="cart-container">

<h2 class="mb-4">Shopping Cart</h2>

<!-- HEADER -->
<div class="row cart-header">

<div class="col-md-4">Book</div>
<div class="col-md-2">Price</div>
<div class="col-md-2">Quantity</div>
<div class="col-md-2">Total</div>
<div class="col-md-2">Remove</div>

</div>

<c:set var="subtotal" value="0"/>

<c:choose>

<c:when test="${empty sessionScope.cart}">

<div class="empty-cart">

<h4>Your cart is empty</h4>

<a href="${pageContext.request.contextPath}/home"
class="btn btn-warning mt-3">

Continue Shopping

</a>

</div>

</c:when>

<c:otherwise>

<c:forEach var="item" items="${sessionScope.cart}">

<div class="row cart-row align-items-center">

<div class="col-md-4 d-flex align-items-center">

<img
src="${pageContext.request.contextPath}/assets/images/${item.image}"
onerror="this.src='${pageContext.request.contextPath}/assets/images/placeholders/book-placeholder.jpeg'"
class="cart-book-img me-3">

<div>
<strong>${item.title}</strong><br>
<small>${item.author}</small>
</div>

</div>

<div class="col-md-2">₹ ${item.price}</div>

<div class="col-md-2">

<div class="d-flex align-items-center">

<!-- DECREASE -->

<form action="${pageContext.request.contextPath}/update-cart" method="post">

<input type="hidden" name="bookId" value="${item.bookId}">
<input type="hidden" name="action" value="decrease">

<button class="btn btn-light btn-sm">−</button>

</form>

<span class="mx-2">${item.quantity}</span>

<!-- INCREASE -->

<form action="${pageContext.request.contextPath}/update-cart" method="post">

<input type="hidden" name="bookId" value="${item.bookId}">
<input type="hidden" name="action" value="increase">

<button class="btn btn-light btn-sm">+</button>

</form>

</div>

</div>

<div class="col-md-2">₹ ${item.total}</div>

<div class="col-md-2">

<form action="${pageContext.request.contextPath}/remove-cart" method="post">

<input type="hidden" name="bookId" value="${item.bookId}">

<button class="btn btn-outline-danger btn-sm">
<i class="fas fa-trash"></i>
</button>

</form>

</div>

</div>

<c:set var="subtotal" value="${subtotal + item.total}"/>

</c:forEach>

<div class="cart-total">

<h5>Subtotal : ₹ ${subtotal}</h5>
<h4>Total : ₹ ${subtotal}</h4>

<br>

<a href="${pageContext.request.contextPath}/home"
class="btn btn-light continue-btn">
Continue Shopping
</a>

<a href="${pageContext.request.contextPath}/order.jsp"
   class="checkout-btn">

<i class="fas fa-credit-card"></i> Proceed to Checkout

</a>

</div>

</c:otherwise>

</c:choose>

</div>

<!-- FOOTER -->
<jsp:include page="components/footer.jsp"/>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>