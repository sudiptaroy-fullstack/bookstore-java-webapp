<%-- 
    Document   : order-success
    Created on : 8 Mar 2026, 1:03:06 pm
    Author     : sudip
--%>

<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>

<title>Order Successful</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet"
href="${pageContext.request.contextPath}/assets/css/style.css">

</head>

<body class="cart-page">

<jsp:include page="components/navbar.jsp"/>

<div class="container text-center cart-container">

<h2 class="text-success mb-4">

<i class="fas fa-check-circle"></i>

Order Placed Successfully!

</h2>

<p>Your order has been placed successfully.</p>

<a href="${pageContext.request.contextPath}/home"
   class="checkout-btn">

Continue Shopping

</a>

</div>

<jsp:include page="components/footer.jsp"/>

</body>
</html>
