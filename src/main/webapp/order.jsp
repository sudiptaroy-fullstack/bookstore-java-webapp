<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>

<title>Checkout | BookStore</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet"
href="${pageContext.request.contextPath}/assets/css/style.css">

</head>

<body class="cart-page">

<!-- NAVBAR -->
<jsp:include page="components/navbar.jsp"/>

<div class="container cart-container">

<div class="row">

<!-- ================= SHIPPING DETAILS ================= -->

<div class="col-md-6">

<h4 class="mb-4">Checkout</h4>

<form action="${pageContext.request.contextPath}/place-order" method="post">

<div class="mb-3">

<label class="form-label">Name</label>

<input type="text"
       name="name"
       class="form-control"
       value="${sessionScope.user.name}"
       required>

</div>

<div class="mb-3">

<label class="form-label">Email</label>

<input type="email"
       name="email"
       class="form-control"
       value="${sessionScope.user.email}"
       required>

</div>

<div class="mb-3">

<label class="form-label">Phone</label>

<input type="text"
       name="phone"
       class="form-control"
       required>

</div>

<div class="mb-3">

<label class="form-label">Address</label>

<textarea name="address"
          class="form-control"
          rows="3"
          required></textarea>

</div>

<button class="checkout-btn">
Place Order
</button>

</form>

</div>

<!-- ================= ORDER SUMMARY ================= -->

<div class="col-md-6">

<h4 class="mb-4">Order Summary</h4>

<c:set var="total" value="0"/>

<c:forEach var="item" items="${sessionScope.cart}">

<div class="d-flex justify-content-between mb-2">

<span>${item.title}</span>

<span>₹${item.price}</span>

</div>

<c:set var="total" value="${total + item.price}" />

</c:forEach>

<hr>

<h5>Total : ₹${total}</h5>

</div>

</div>

</div>

<!-- FOOTER -->
<jsp:include page="components/footer.jsp"/>

</body>
</html>