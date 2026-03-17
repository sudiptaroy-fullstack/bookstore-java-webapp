<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<title>Search Results | BookStore</title>

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- FontAwesome -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<!-- Main CSS -->
<link rel="stylesheet"
href="${pageContext.request.contextPath}/assets/css/style.css">

</head>

<body>

<!-- NAVBAR -->
<jsp:include page="components/navbar.jsp"/>

<div class="container mt-5">

<h3 class="mb-3">
Search Results for "<strong>${keyword}</strong>"
</h3>

<hr>

<c:choose>

<c:when test="${empty searchResults}">

<div class="alert alert-warning">
No books found."<strong>${keyword}</strong>"
</div>

</c:when>

<c:otherwise>

<div class="row g-4">

<c:forEach var="b" items="${searchResults}">

<div class="col-lg-3 col-md-4 col-sm-6">

<a href="${pageContext.request.contextPath}/product?id=${b.id}"
class="text-decoration-none text-dark">

<div class="book-card">

<img src="${pageContext.request.contextPath}/assets/images/${b.image}"
onerror="this.src='${pageContext.request.contextPath}/assets/images/placeholders/book-placeholder.jpeg'">

<div class="book-info">

<h6>${b.title}</h6>

<small>${b.author}</small>

<div class="price">₹ ${b.price}</div>

</div>

</div>

</a>

</div>

</c:forEach>

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