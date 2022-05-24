<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/nice-select.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css" type="text/css">

<style type="text/css">

</style>
<title>Insert title here</title>
</head>
<body>

	<c:url var="cuaHang" value="/user/cuahang" />
	<c:url var="homePageUrl" value="/" />
	<c:url var="login" value="/user/login" />
	<c:url var="admin" value="/admin/" />
	<c:if test="${pageContext.request.userPrincipal.name == null}">
		<div class="container">
			<div class="row" style="justify-content: center;">
				<div class="col-lg-3">
					<div class="header__logo">
						<a href="${homePageUrl}"><img src="/ShopMV/images/logo.jpg"
							alt=""></a>
					</div>
				</div>
				<div class="col-lg-5">
					<nav class="header__menu">
						<ul>

							<li><a href="${homePageUrl}">TRANG CHỦ</a></li>
							<li><a href="">Shop</a></li>
							<li><a href="${pageContext.request.contextPath }/lien-he">LIÊN HỆ</a></li>
						</ul>
					</nav>
				</div>
				<div class="col-lg-4">
					<div class="header__cart">
						<div class="header__top__right__auth">
							<a href="${login}"><svg xmlns="http://www.w3.org/2000/svg"
									width="16" height="16" fill="currentColor"
									class="bi bi-person-fill" viewBox="0 0 16 16">
  <path
										d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
</svg> ĐĂNG NHẬP </a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Header Section End -->

		<!-- Hero Section Begin -->
		<section class="hero hero-normal">
			<div class="container">
				<div class="row">
					<div class="col-lg-3">
						<div class="hero__categories">
							<div class="hero__categories__all">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="#fff" class="bi bi-border-width" viewBox="0 0 16 16">
  <path
										d="M0 3.5A.5.5 0 0 1 .5 3h15a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.5.5H.5a.5.5 0 0 1-.5-.5v-2zm0 5A.5.5 0 0 1 .5 8h15a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H.5a.5.5 0 0 1-.5-.5v-1zm0 4a.5.5 0 0 1 .5-.5h15a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5z" />
</svg>
								&ensp;<span>Tất cả danh mục</span>
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="#fff" class="bi bi-chevron-down" viewBox="0 0 16 16">
  <path fill-rule="evenodd"
										d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z" />
</svg>
							</div>
							<ul>
								<c:forEach items="${danhMuc}" var="sp">
									<li><a class="dropdown-item"
										href="${pageContext.request.contextPath }/danhmuc/${sp.danhMucId}">${sp.tenDanhMuc}</a></li>
								</c:forEach>
							</ul>
						</div>
					</div>
					<div class="col-lg-9">
						<div class="hero__search">
							<div class="hero__search__form">
								<form class="d-flex"
									action="${pageContext.request.contextPath}/danhmuc/timkiem"
									method="POST" enctype="application/x-www-form-urlencoded">
									<input name="tenSanPham" type="text" placeholder="Tìm kiếm...">
									<button type="submit" class="site-btn">TÌM KIẾM</button>
								</form>
							</div>
							<div class="hero__search__phone">
								<div class="hero__search__phone__icon">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
										fill="currentColor" class="bi bi-telephone-fill"
										viewBox="0 0 16 16">
  <path fill-rule="evenodd"
											d="M1.885.511a1.745 1.745 0 0 1 2.61.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z" />
</svg>
								</div>
								<div class="hero__search__phone__text">
									<h5>0999999999</h5>
									<span>Hổ trợ 24/7</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</c:if>


	<c:if test="${pageContext.request.userPrincipal.name != null}">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="header__logo">
						<a href="${homePageUrl}"><img src="/ShopMV/images/logo.jpg"
							alt=""></a>
					</div>
				</div>
				<div class="col-lg-5">
					<nav class="header__menu">
						<ul>
							<li><a href="${ homePageUrl}">TRANG CHỦ</a></li>
							<li class="active"><a href="">Shop</a></li>
							<li><a href="${pageContext.request.contextPath }/lien-he">LIÊN HỆ</a></li>
						</ul>
					</nav>
				</div>
				<div class="col-lg-4">
					<div class="header__cart">
						<div class="header__top__right__auth">
							<nav class="header__menu">
								<ul>
									<li><svg xmlns="http://www.w3.org/2000/svg" width="16"
											height="16" fill="currentColor" class="bi bi-person-fill"
											viewBox="0 0 16 16">
  <path
												d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
</svg> <c:out value="${nguoiDung.getHoTenDem() }" /> <c:out
											value="${nguoiDung.getTen() }" />
										<ul class="header__menu__dropdown">
											<sec:authorize
												access="hasRole('ROLE_ADMIN') and isAuthenticated()">
												<li><a href="${admin }">Trang admin</a></li>
											</sec:authorize>
											<sec:authorize
												access="hasRole('ROLE_MEMBER') and !hasRole('ROLE_ADMIN')">
												<li><a
													href="${pageContext.request.contextPath}/user/cuahang/${nguoiDung.getId()}">Shop
														của bạn</a></li>
												<li><a
													href="${pageContext.request.contextPath}/user/form-update-user/${nguoiDung.getId()}">Tài
														khoản</a></li>
											</sec:authorize>
											<li><a
												href="${pageContext.request.contextPath}/user/hoa-don-nguoi-dung/${nguoiDung.getId()}">Đơn mua</a></li>
											<li><a
												href="${pageContext.request.contextPath}/perform_logout">Đăng
													xuất</a></li>
										</ul></li>

								</ul>
							</nav>
						</div>
						<ul>
							<li><a href="${pageContext.request.contextPath}/gioHang"><svg
										xmlns="http://www.w3.org/2000/svg" width="16" height="16"
										class="bi bi-cart-plus-fill" viewBox="0 0 16 16">
  <path
											d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zM9 5.5V7h1.5a.5.5 0 0 1 0 1H9v1.5a.5.5 0 0 1-1 0V8H6.5a.5.5 0 0 1 0-1H8V5.5a.5.5 0 0 1 1 0z" />
</svg> <span>3</span></a></li>
						</ul>
						<div class="header__cart__price">
							<span>${cart.getTongTienChiTietHoaDonFormat()}</span>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Header Section End -->

		<!-- Hero Section Begin -->
		<section class="hero hero-normal">
			<div class="container">
				<div class="row">
					<div class="col-lg-3">
						<div class="hero__categories">
							<div class="hero__categories__all">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="#fff" class="bi bi-border-width" viewBox="0 0 16 16">
  <path
										d="M0 3.5A.5.5 0 0 1 .5 3h15a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.5.5H.5a.5.5 0 0 1-.5-.5v-2zm0 5A.5.5 0 0 1 .5 8h15a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H.5a.5.5 0 0 1-.5-.5v-1zm0 4a.5.5 0 0 1 .5-.5h15a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5z" />
</svg>
								&ensp;<span>Tất cả danh mục</span>
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="#fff" class="bi bi-chevron-down" viewBox="0 0 16 16">
  <path fill-rule="evenodd"
										d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z" />
</svg>
							</div>
							<ul>
								<c:forEach items="${danhMuc}" var="sp">
									<li><a class="dropdown-item"
										href="${pageContext.request.contextPath }/danhmuc/${sp.danhMucId}">${sp.tenDanhMuc}</a></li>
								</c:forEach>
							</ul>
						</div>
					</div>
					<div class="col-lg-9">
						<div class="hero__search">
							<div class="hero__search__form">
								<form class="d-flex"
									action="${pageContext.request.contextPath}/danhmuc/timkiem"
									method="POST" enctype="application/x-www-form-urlencoded">
									<input name="tenSanPham" type="text" placeholder="Tìm kiếm...">
									<button type="submit" class="site-btn">TÌM KIẾM</button>
								</form>
							</div>
							<div class="hero__search__phone">
								<div class="hero__search__phone__icon">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
										fill="currentColor" class="bi bi-telephone-fill"
										viewBox="0 0 16 16">
  <path fill-rule="evenodd"
											d="M1.885.511a1.745 1.745 0 0 1 2.61.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z" />
</svg>
								</div>
								<div class="hero__search__phone__text">
									<h5>0999999999</h5>
									<span>Hổ trợ 24/7</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

	</c:if>
	<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/jquery.nice-select.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.slicknav.js"></script>
	<script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/main.js"></script>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
</body>
</html>