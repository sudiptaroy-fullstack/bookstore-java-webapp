<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<nav class="navbar navbar-expand-lg premium-navbar">
    <div class="container"> <!-- 🔥 CHANGED from container-fluid -->

        <!-- LOGO -->
        <a class="navbar-brand" href="${pageContext.request.contextPath}/home">
            <div class="navbar-logo">
                <img src="${pageContext.request.contextPath}/assets/images/logo/logo.jpeg" alt="Logo">
            </div>
            <span class="brand-text">BookStore</span>
        </a>

        <!-- TOGGLER -->
        <button class="navbar-toggler text-white" type="button"
                data-bs-toggle="collapse"
                data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- LINKS -->
        <div class="collapse navbar-collapse" id="navbarNav">

            <ul class="navbar-nav me-auto mb-3 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" href="${pageContext.request.contextPath}/home">Home</a>
                </li>
                <li class="nav-item dropdown">

                    <a class="nav-link dropdown-toggle"
                       href="#"
                       role="button"
                       data-bs-toggle="dropdown">

                        Categories

                    </a>

                    <ul class="dropdown-menu">

                        <c:forEach var="c" items="${categories}">

                            <li>
                                <a class="dropdown-item"
                                   href="${pageContext.request.contextPath}/category?id=${c.id}">
                                    ${c.name}
                                </a>
                            </li>

                        </c:forEach>

                    </ul>

                </li>
                <li class="nav-item">
                    <a class="nav-link
                       ${param.id == 1 ? 'active' : ''}"
                       href="${pageContext.request.contextPath}/category?id=1">
                        Best Sellers
                    </a>
                </li>
            </ul>

            <!-- SEARCH -->
            <form class="d-flex nav-search"
                  action="${pageContext.request.contextPath}/search"
                  method="get">

                <input class="form-control search-input"
                       type="search"
                       name="keyword"
                       placeholder="Search books">

                <button class="btn btn-warning ms-2">
                    Search
                </button>

            </form>

            <!-- AUTH SECTION -->
            <div class="d-flex align-items-center gap-3 ms-lg-3 nav-auth">

                <c:choose>


                    <c:when test="${not empty sessionScope.user}">

                        <span class="text-light">
                            <i class="fas fa-user"></i>
                            ${sessionScope.user.name}
                        </span>

                        <a href="${pageContext.request.contextPath}/wishlist"
                           class="nav-icon">

                            <i class="fas fa-heart"></i>

                        </a>

                        <a href="${pageContext.request.contextPath}/cart"
                           class="nav-icon">

                            <i class="fas fa-shopping-cart"></i>

                        </a>

                        <a href="${pageContext.request.contextPath}/logout"
                           class="btn btn-outline-light btn-auth">

                            Logout

                        </a>

                    </c:when>


                    <c:otherwise>

                        <a href="${pageContext.request.contextPath}/login.jsp"
                           class="btn btn-outline-light btn-auth">

                            Login

                        </a>

                        <a href="${pageContext.request.contextPath}/signup.jsp"
                           class="btn btn-warning btn-auth">

                            Sign Up

                        </a>

                    </c:otherwise>

                </c:choose>

            </div>

        </div>
    </div>
</nav>