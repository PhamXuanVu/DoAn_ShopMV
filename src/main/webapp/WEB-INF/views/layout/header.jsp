<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>
<style>
body {
	font-family: sans-serif;
}
</style>
</head>
<body>
	<c:url var="homePageUrl" value="/" />
	<c:url var="login" value="/user/login" />
	<div>
		<h1 style="text-align: center; color: red;">MTV-Shop</h1>
	</div>
	<c:if test="${pageContext.request.userPrincipal.name == null}">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container-fluid">
				<a class="navbar-brand" href="${homePageUrl }">Trang chủ</a>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="nav justify-content-center">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="${login}">Đăng nhập</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								Danh mục sản phẩm </a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<c:forEach items="${danhMuc}" var="sp">
									<li><a class="dropdown-item" href="">${sp.tenDanhMuc}</a></li>
								</c:forEach>
							</ul></li>

					</ul>
				</div>
			</div>
		</nav>
	</c:if>
	<c:if test="${pageContext.request.userPrincipal.name != null}">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container-fluid">
				<a class="navbar-brand" href="${homePageUrl }">Trang chủ</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="nav justify-content-center">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								<c:out value="${nguoiDung.getHoTenDem() }" /> <c:out
									value="${nguoiDung.getTen() }" />
						</a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<sec:authorize
									access="hasRole('ROLE_ADMIN') and isAuthenticated()">
									<li><a class="dropdown-item" href="${admin }">Trang
											Admin</a></li>
								</sec:authorize>
								<sec:authorize
									access="hasRole('ROLE_MEMBER') and isAuthenticated()">
									<li><a class="dropdown-item" href="">Cửa hàng của bạn
									</a></li>
								</sec:authorize>
								<li><a class="dropdown-item"
									href="${pageContext.request.contextPath}/perform_logout">Đăng
										xuất</a></li>
							</ul></li>
						<li class="nav-item"><a class="nav-link" href="">Kẹo</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								Danh mục sản phẩm </a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<c:forEach items="${danhMuc}" var="sp">
									<li><a class="dropdown-item" href="">${sp.tenDanhMuc}</a></li>
								</c:forEach>
							</ul></li>

						<li class="nav-item"><a class="nav-link" href="#">Giỏ
								hàng</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</c:if>
</body>
</html>