<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="UTF-8">
        <title>${book.title} | BookStore</title>

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

    <body class="product-page">

        <!-- NAVBAR -->
        <jsp:include page="components/navbar.jsp"/>

        <!-- PRODUCT SECTION -->
        <div class="container">

            <div class="product-box">

                <div class="row align-items-center">

                    <!-- BOOK IMAGE -->

                    <div class="col-md-4 text-center">

                        <img class="img-fluid product-img"

                             src="${pageContext.request.contextPath}/assets/images/${book.image}"

                             onerror="this.src='${pageContext.request.contextPath}/assets/images/placeholders/book-placeholder.jpeg'">

                    </div>

                    <!-- BOOK DETAILS -->

                    <div class="col-md-8">

                        <h2>${book.title}</h2>

                        <p class="text-light">${book.author}</p>

                        <div class="mb-2">

                            ⭐ ${book.rating}

                        </div>

                        <div class="product-price">

                            ₹ ${book.price}

                        </div>

                        <c:choose>

                            <c:when test="${book.stock > 5}">
                                <span class="text-success">
                                    <i class="fas fa-check-circle"></i>
                                    In Stock (${book.stock} available)
                                </span>
                            </c:when>

                            <c:when test="${book.stock > 0}">
                                <span class="text-warning">
                                    Only ${book.stock} left!
                                </span>
                            </c:when>

                            <c:otherwise>
                                <span class="text-danger">
                                    Out of Stock
                                </span>
                            </c:otherwise>

                        </c:choose>
                        <c:if test="${book.stock <= 3 && book.stock > 0}">
                            <p class="text-danger fw-bold">
                                🔥 Hurry! Only ${book.stock} left in stock!
                            </p>
                        </c:if>
                        <p class="mt-3">

                            A great book available in our bookstore.  
                            Read and explore amazing stories and knowledge.

                        </p>

                        <div class="product-actions">

                            <!-- ADD TO CART -->

                            <c:choose>

                              

                                <c:when test="${book.stock > 0}">

                                    <form action="${pageContext.request.contextPath}/add-cart" method="post">

                                        <input type="hidden" name="bookId" value="${book.id}">

                                        <button class="btn btn-warning btn-lg mt-3">

                                            <i class="fas fa-cart-plus"></i> Add to Cart

                                        </button>

                                    </form>

                                </c:when>

                                

                                <c:otherwise>

                                    <button class="btn btn-secondary btn-lg mt-3" disabled>

                                        Out of Stock

                                    </button>

                                </c:otherwise>

                            </c:choose>

                            <form action="${pageContext.request.contextPath}/add-wishlist" method="post">
                                <input type="hidden" name="bookId" value="${book.id}">
                                <button class="btn-wishlist">
                                    <i class="fas fa-heart"></i>
                                </button>
                            </form>

                        </div>
                    </div>

                </div>

            </div>

            <!-- SIMILAR BOOKS -->

            <div class="similar-section">

                <h4 class="text-white">You may also like</h4>

                <div class="similar-books">

                    <c:forEach var="b" items="${similarBooks}">
                        <c:if test="${b.id != book.id}">

                            <a href="${pageContext.request.contextPath}/product?id=${b.id}"
                               class="text-decoration-none text-dark">

                                <div class="book-card">

                                    <img

                                        src="${pageContext.request.contextPath}/assets/images/${b.image}"

                                        onerror="this.src='${pageContext.request.contextPath}/assets/images/placeholders/book-placeholder.jpeg'">

                                    <div class="book-info">

                                        <h6>${b.title}</h6>

                                        <small>${b.author}</small>

                                        <div class="rating">

                                            ⭐ ${b.rating}

                                        </div>

                                        <div class="price">

                                            ₹ ${b.price}

                                        </div>

                                    </div>

                                </div>

                            </a>
                        </c:if>
                    </c:forEach>

                </div>

            </div>

        </div>

        <!-- FOOTER -->
        <jsp:include page="components/footer.jsp"/>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    </body>

</html>