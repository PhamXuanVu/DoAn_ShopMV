<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Đăng nhập</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
</head>
<body>
	<c:url var="register" value="/user/register" />
	<jsp:include page="layout/header.jsp" />

	<section class="vh-100">
		<c:url var="actionLoginFormUrl" value="/j_spring_security_check" />
		<form class="m-auto" action="${actionLoginFormUrl}" method="POST">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-md-9 col-lg-6 col-xl-5">
					<img
						src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp"
						class="img-fluid" alt="Sample image">
				</div>
				<div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
					<div class="container-fluid h-custom">
						<div class="col">
							<c:choose>
								<c:when test="${param.error}">
									<p style="color: red;" class="error">Email hoặc mật khẩu
										không chính xác!</p>
								</c:when>
							</c:choose>
						</div>
					</div>
					<h2 style="text-align: center;">Đăng nhập</h2>
					<!-- Email input -->
					<div class="form-outline mb-4">
						<input name="email" type="email" id="form3Example3"
							class="form-control form-control-lg" placeholder="Email" />
					</div>

					<!-- Password input -->
					<div class="form-outline mb-3">
						<input name="password" type="password" id="form3Example4"
							class="form-control form-control-lg" placeholder="Password" />

					</div>
					<div class="text-center text-lg-start mt-4 pt-2">
						<button type="submit" class="btn btn-primary btn-lg"
							style="text-align: center; padding-left: 2.5rem; padding-right: 2.5rem;">Đăng
							nhập</button>
						<p class="small fw-bold mt-2 pt-1 mb-0">
							Bạn chưa có tài khoản? <a href="${register }" class="link-danger">Đăng
								ký</a>
						</p>
					</div>
				</div>
			</div>

		</form>
	</section>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>