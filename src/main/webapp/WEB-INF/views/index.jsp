<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>

<title>OSPing-Easy Shopping</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<style type="text/css">
</style>

</head>
<body>
	<c:url var="admin" value="/admin/" />
	<sec:authorize access="hasRole('ROLE_ADMIN') and isAuthenticated()">
		<h3 style="text-align: center;">
			Đến <a style="text-decoration: none;"
				href="${pageContext.request.contextPath }/admin/">trang admin </a>ngay
		</h3>
	</sec:authorize>
	<sec:authorize access="!hasRole('ROLE_ADMIN')">
		<jsp:include page="layout/header.jsp" />
		<section class="hero hero-normal">
			<div class="container">
				<c:if test="${param.success}">
					<p style="color: red;" class="error">Cập nhật tài khoản thành
						công!</p>
				</c:if>
				<div class="row">
					<div class="col-lg-3"></div>
					<div class="col-lg-9">
						<div
							style="background-image: url('/ShopMV/images/banner111.jpg');"
							class="hero__item set-bg">
							<div class="hero__text">
								<span>EASY SHOPPING</span>
								<h2>
									vs <br /> OSPING
								</h2>
								<p>Go Online and Shopping With Us</p>
								<a href="#" class="primary-btn">SHOP NOW</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- Sản phẩm nổi bật -->
		<section class="featured spad">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="section-title">
							<h2>Sản phẩm nổi bật</h2>
						</div>
						<div class="featured__controls">
							<ul>
								<li class="active" data-filter="*">Tất cả</li>
								<li data-filter=".oranges">Nước hoa</li>
								<li data-filter=".fresh-meat">Thời trang nam</li>
								<li data-filter=".vegetables">Thời trang nữ</li>
								<li data-filter=".fastfood">Đồng hồ</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="row featured__filter">
					<c:forEach items="${sanPhamNoiBat}" var="sp">
						<c:url var="image" value="${sp.hinhAnh}" />
						<div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
							<div class="featured__item">
								<div style="background-image: url('${image}');"
									class="featured__item__pic set-bg">
									<ul class="featured__item__pic__hover">
										<li><a href="#"><svg
													xmlns="http://www.w3.org/2000/svg" width="16" height="16"
													fill="currentColor" class="bi bi-suit-heart-fill"
													viewBox="0 0 16 16">
  <path
														d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z" />
</svg></a></li>
										<li><a
											href="${pageContext.request.contextPath }/chiTietSP/${sp.sanPhamId }"><svg
													xmlns="http://www.w3.org/2000/svg" width="16" height="16"
													fill="currentColor" class="bi bi-box-arrow-right"
													viewBox="0 0 16 16">
  <path fill-rule="evenodd"
														d="M10 12.5a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v2a.5.5 0 0 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-2a.5.5 0 0 0-1 0v2z" />
  <path fill-rule="evenodd"
														d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z" />
</svg></a></li>
										<li><a href="#"><svg
													xmlns="http://www.w3.org/2000/svg" width="16" height="16"
													fill="currentColor" class="bi bi-cart-fill"
													viewBox="0 0 16 16">
  <path
														d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
</svg></i></a></li>
									</ul>
								</div>
								<div class="featured__item__text">
									<h6>
										<a href="#">${sp.tenSanPham}</a>
									</h6>
									<h5>${sp.getGiaFormat()}</h5>

								</div>

							</div>
						</div>
					</c:forEach>
				</div>

			</div>
		</section>
		<!-- Sản phẩm mới -->
		<section class="featured spad">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="section-title">
							<h2>Sản phẩm mới</h2>
						</div>
					</div>
				</div>
				<div class="row featured__filter">
					<c:forEach items="${sanPhamMoi}" var="sp">
						<c:url var="image" value="${sp.hinhAnh}" />
						<div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
							<div class="featured__item">
								<div style="background-image: url('${image}');"
									class="featured__item__pic set-bg">
									<ul class="featured__item__pic__hover">
										<li><a href="#"><svg
													xmlns="http://www.w3.org/2000/svg" width="16" height="16"
													fill="currentColor" class="bi bi-suit-heart-fill"
													viewBox="0 0 16 16">
  <path
														d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z" />
</svg></a></li>
										<li><a
											href="${pageContext.request.contextPath }/chiTietSP/${sp.sanPhamId }"><svg
													xmlns="http://www.w3.org/2000/svg" width="16" height="16"
													fill="currentColor" class="bi bi-box-arrow-right"
													viewBox="0 0 16 16">
  <path fill-rule="evenodd"
														d="M10 12.5a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v2a.5.5 0 0 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-2a.5.5 0 0 0-1 0v2z" />
  <path fill-rule="evenodd"
														d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z" />
</svg></a></li>
										<li><a href="#"><svg
													xmlns="http://www.w3.org/2000/svg" width="16" height="16"
													fill="currentColor" class="bi bi-cart-fill"
													viewBox="0 0 16 16">
  <path
														d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
</svg></i></a></li>
									</ul>
								</div>
								<div class="featured__item__text">
									<h6>
										<a href="#">${sp.tenSanPham}</a>
									</h6>
									<h5>${sp.getGiaFormat()}</h5>

								</div>

							</div>
						</div>
					</c:forEach>
				</div>

			</div>
		</section>

		<!-- Tất cả sản phẩm -->
		<jsp:useBean id="pagedListHolder" scope="request"
			type="org.springframework.beans.support.PagedListHolder" />
		<c:url value="/" var="pagedLink">
			<c:param name="p" value="~" />
		</c:url>
		<section class="featured spad">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="section-title">
							<a style="text-decoration: none;"
								href="${pageContext.request.contextPath }/danhmuc/tat-ca-san-pham"><h2>Tất
									cả sản phẩm</h2></a>
						</div>
					</div>
				</div>
				<div class="row featured__filter">
					<c:forEach items="${pagedListHolder.pageList}" var="sp">
						<c:url var="image" value="${sp.hinhAnh}" />
						<div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
							<div class="featured__item">
								<div style="background-image: url('${image}');"
									class="featured__item__pic set-bg">
									<ul class="featured__item__pic__hover">
										<li><a href="#"><svg
													xmlns="http://www.w3.org/2000/svg" width="16" height="16"
													fill="currentColor" class="bi bi-suit-heart-fill"
													viewBox="0 0 16 16">
  <path
														d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z" />
</svg></a></li>
										<li><a
											href="${pageContext.request.contextPath }/chiTietSP/${sp.sanPhamId }"><svg
													xmlns="http://www.w3.org/2000/svg" width="16" height="16"
													fill="currentColor" class="bi bi-box-arrow-right"
													viewBox="0 0 16 16">
  <path fill-rule="evenodd"
														d="M10 12.5a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v2a.5.5 0 0 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-2a.5.5 0 0 0-1 0v2z" />
  <path fill-rule="evenodd"
														d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z" />
</svg></a></li>
										<li><a href="#"><svg
													xmlns="http://www.w3.org/2000/svg" width="16" height="16"
													fill="currentColor" class="bi bi-cart-fill"
													viewBox="0 0 16 16">
  <path
														d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
</svg></i></a></li>
									</ul>
								</div>
								<div class="featured__item__text">
									<h6>
										<a href="#">${sp.tenSanPham}</a>
									</h6>
									<h5>${sp.getGiaFormat()}</h5>

								</div>

							</div>
						</div>
					</c:forEach>
				</div>
				<tg:paging pagedListHolder="${pagedListHolder}"
					pagedLink="${pagedLink}" />
			</div>
		</section>

		<jsp:include page="layout/footer.jsp" />
	</sec:authorize>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>