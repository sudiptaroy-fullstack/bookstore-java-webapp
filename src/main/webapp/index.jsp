<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Rough Pages | Online Bookstore</title>

        <!-- Bootstrap & Icons -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
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

        <!-- ================= HERO ================= -->
        <section class="hero-section">

            <div class="hero-slider">

                <div class="hero-slide active"
                     style="background-image:url('${pageContext.request.contextPath}/assets/images/slider/slider1.jpeg')">
                </div>

                <div class="hero-slide"
                     style="background-image:url('${pageContext.request.contextPath}/assets/images/slider/slider2.jpeg')">
                </div>

                <div class="hero-slide"
                     style="background-image:url('${pageContext.request.contextPath}/assets/images/slider/slider3.jpeg')">
                </div>

                <button class="hero-nav hero-prev">
                    <i class="fas fa-chevron-left"></i>
                </button>

                <button class="hero-nav hero-next">
                    <i class="fas fa-chevron-right"></i>
                </button>

            </div>

        </section>

        <!-- ================= CATEGORIES ================= -->
        <section class="category-section container">
            <div class="d-flex flex-wrap gap-3 justify-content-center">

                <a href="${pageContext.request.contextPath}/category?id=1"
                   class="category-btn">
                    <i class="fas fa-fire"></i> Best Sellers
                </a>

                <a href="${pageContext.request.contextPath}/category?id=2"
                   class="category-btn">
                    <i class="fas fa-bolt"></i> New Arrivals
                </a>

                <a href="${pageContext.request.contextPath}/category?id=3"
                   class="category-btn">
                    <i class="fas fa-book"></i> World Classics
                </a>

                <a href="${pageContext.request.contextPath}/category?id=4"
                   class="category-btn">
                    <i class="fas fa-dragon"></i> Manga & Manhwa
                </a>

                <a href="${pageContext.request.contextPath}/category?id=5"
                   class="category-btn">
                    <i class="fas fa-mask"></i> Comics
                </a>

            </div>
        </section>
        <!-- ================= BEST SELLERS ================= -->
        <section class="container-fluid">
            <h3 class="section-title">Best Sellers</h3>

            <div class="slider-wrapper">

                <button class="slider-btn left"><i class="fas fa-chevron-left"></i></button>

                <div class="book-row">

                    <c:forEach var="b" items="${bestSellers}">
                        <a href="${pageContext.request.contextPath}/product?id=${b.id}" class="text-decoration-none text-dark">
                            <div class="book-card">

                                <img src="${pageContext.request.contextPath}/assets/images/${b.image}"
                                     onerror="this.src='${pageContext.request.contextPath}/assets/images/placeholders/book-placeholder.jpeg'">

                                <div class="book-info">

                                    <h6>${b.title}</h6>
                                    <small>${b.author}</small>

                                    <div class="rating">⭐ ${b.rating}</div>
                                    <div class="price">₹ ${b.price}</div>

                                    <div class="book-actions">

                                        <form action="${pageContext.request.contextPath}/add-cart" method="post">

                                            <input type="hidden" name="bookId" value="${b.id}">

                                            <button class="btn-cart">
                                                <i class="fas fa-cart-plus"></i>
                                            </button>

                                        </form>

                                        <form action="${pageContext.request.contextPath}/add-wishlist" method="post">
                                            <input type="hidden" name="bookId" value="${b.id}">
                                            <button class="btn-wishlist">
                                                <i class="fas fa-heart"></i>
                                            </button>
                                        </form>

                                    </div>

                                </div>
                            </div>
                        </a>

                    </c:forEach>

                </div>

                <button class="slider-btn right"><i class="fas fa-chevron-right"></i></button>

            </div>
        </section>

        <!-- ================= NEW ARRIVALS ================= -->
        <section class="container-fluid">

            <h3 class="section-title">New Arrivals</h3>

            <div class="slider-wrapper">

                <button class="slider-btn left"><i class="fas fa-chevron-left"></i></button>

                <div class="book-row">

                    <c:forEach var="b" items="${newArrivals}">
                        <a href="${pageContext.request.contextPath}/product?id=${b.id}" class="text-decoration-none text-dark">
                            <div class="book-card">

                                <img src="${pageContext.request.contextPath}/assets/images/${b.image}"
                                     onerror="this.src='${pageContext.request.contextPath}/assets/images/placeholders/book-placeholder.jpeg'">

                                <div class="book-info">

                                    <h6>${b.title}</h6>
                                    <small>${b.author}</small>

                                    <div class="rating">⭐ ${b.rating}</div>
                                    <div class="price">₹ ${b.price}</div>

                                    <div class="book-actions">

                                        <form action="${pageContext.request.contextPath}/add-cart" method="post">

                                            <input type="hidden" name="bookId" value="${b.id}">

                                            <button class="btn-cart">
                                                <i class="fas fa-cart-plus"></i>
                                            </button>

                                        </form>

                                        <form action="${pageContext.request.contextPath}/add-wishlist" method="post">
                                            <input type="hidden" name="bookId" value="${b.id}">
                                            <button class="btn-wishlist">
                                                <i class="fas fa-heart"></i>
                                            </button>
                                        </form>

                                    </div>

                                </div>
                            </div>
                        </a>
                    </c:forEach>

                </div>

                <button class="slider-btn right"><i class="fas fa-chevron-right"></i></button>

            </div>
        </section>

        <!-- ================= WORLD CLASSICS ================= -->
        <section class="container-fluid">

            <h3 class="section-title">World Classics</h3>

            <div class="slider-wrapper">

                <button class="slider-btn left"><i class="fas fa-chevron-left"></i></button>

                <div class="book-row">

                    <c:forEach var="b" items="${worldClassics}">
                        <a href="${pageContext.request.contextPath}/product?id=${b.id}" class="text-decoration-none text-dark">
                            <div class="book-card">

                                <img src="${pageContext.request.contextPath}/assets/images/${b.image}"
                                     onerror="this.src='${pageContext.request.contextPath}/assets/images/placeholders/book-placeholder.jpeg'">

                                <div class="book-info">

                                    <h6>${b.title}</h6>
                                    <small>${b.author}</small>

                                    <div class="rating">⭐ ${b.rating}</div>
                                    <div class="price">₹ ${b.price}</div>

                                    <div class="book-actions">

                                        <form action="${pageContext.request.contextPath}/add-cart" method="post">

                                            <input type="hidden" name="bookId" value="${b.id}">

                                            <button class="btn-cart">
                                                <i class="fas fa-cart-plus"></i>
                                            </button>

                                        </form>

                                        <form action="${pageContext.request.contextPath}/add-wishlist" method="post">
                                            <input type="hidden" name="bookId" value="${b.id}">
                                            <button class="btn-wishlist">
                                                <i class="fas fa-heart"></i>
                                            </button>
                                        </form>

                                    </div>

                                </div>
                            </div>
                        </a>
                    </c:forEach>

                </div>

                <button class="slider-btn right"><i class="fas fa-chevron-right"></i></button>

            </div>
        </section>

        <!-- ================= MANGA & MANHWA ================= -->
        <section class="container-fluid">

            <h3 class="section-title">Manga & Manhwa</h3>

            <div class="slider-wrapper">

                <button class="slider-btn left"><i class="fas fa-chevron-left"></i></button>

                <div class="book-row">

                    <c:forEach var="b" items="${mangaManhwa}">
                        <a href="${pageContext.request.contextPath}/product?id=${b.id}" class="text-decoration-none text-dark">
                            <div class="book-card">

                                <img src="${pageContext.request.contextPath}/assets/images/${b.image}"
                                     onerror="this.src='${pageContext.request.contextPath}/assets/images/placeholders/book-placeholder.jpeg'">

                                <div class="book-info">

                                    <h6>${b.title}</h6>
                                    <small>${b.author}</small>

                                    <div class="rating">⭐ ${b.rating}</div>
                                    <div class="price">₹ ${b.price}</div>

                                    <div class="book-actions">

                                        <form action="${pageContext.request.contextPath}/add-cart" method="post">

                                            <input type="hidden" name="bookId" value="${b.id}">

                                            <button class="btn-cart">
                                                <i class="fas fa-cart-plus"></i>
                                            </button>

                                        </form>

                                        <form action="${pageContext.request.contextPath}/add-wishlist" method="post">
                                            <input type="hidden" name="bookId" value="${b.id}">
                                            <button class="btn-wishlist">
                                                <i class="fas fa-heart"></i>
                                            </button>
                                        </form>

                                    </div>

                                </div>
                            </div>
                        </a>
                    </c:forEach>

                </div>

                <button class="slider-btn right"><i class="fas fa-chevron-right"></i></button>

            </div>
        </section>

        <!-- ================= COMICS ================= -->
        <section class="container-fluid">

            <h3 class="section-title">Comics</h3>

            <div class="slider-wrapper">

                <button class="slider-btn left"><i class="fas fa-chevron-left"></i></button>

                <div class="book-row">

                    <c:forEach var="b" items="${comics}">
                        <a href="${pageContext.request.contextPath}/product?id=${b.id}" class="text-decoration-none text-dark">
                            <div class="book-card">

                                <img src="${pageContext.request.contextPath}/assets/images/${b.image}"
                                     onerror="this.src='${pageContext.request.contextPath}/assets/images/placeholders/book-placeholder.jpeg'">

                                <div class="book-info">

                                    <h6>${b.title}</h6>
                                    <small>${b.author}</small>

                                    <div class="rating">⭐ ${b.rating}</div>
                                    <div class="price">₹ ${b.price}</div>

                                    <div class="book-actions">

                                        <form action="${pageContext.request.contextPath}/add-cart" method="post">

                                            <input type="hidden" name="bookId" value="${b.id}">

                                            <button class="btn-cart">
                                                <i class="fas fa-cart-plus"></i>
                                            </button>

                                        </form>

                                        <form action="${pageContext.request.contextPath}/add-wishlist" method="post">
                                            <input type="hidden" name="bookId" value="${b.id}">
                                            <button class="btn-wishlist">
                                                <i class="fas fa-heart"></i>
                                            </button>
                                        </form>

                                    </div>

                                </div>
                            </div>
                        </a>
                    </c:forEach>

                </div>

                <button class="slider-btn right"><i class="fas fa-chevron-right"></i></button>

            </div>
        </section>

        <!-- FOOTER -->
        <jsp:include page="components/footer.jsp"/>

        <!-- SCRIPTS -->
        <script src="${pageContext.request.contextPath}/assets/js/hero-slider.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    </body>
</html>