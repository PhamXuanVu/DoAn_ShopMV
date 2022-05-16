<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-12">
				<jsp:include page="../layout/header-admin.jsp" />
			</div>
		</div>
		<div class="row">
			<div class="col-4">
				<jsp:include page="../layout/sidebar-admin.jsp" />
			</div>
			<div class="col-8">
				<c:choose>
					<c:when test="${param.failure}">
						<p style="color: red;" class="error">Email đã tồn tại !</p>
					</c:when>
				</c:choose>
				<div class="card">
					<header class="card-header">
						<h4 class="card-title mt-2">Thêm người mua</h4>
					</header>
					<article class="card-body">
						<form class="m-auto"
							action="${pageContext.request.contextPath}/user/form-add-nguoi-ban/"
							method="POST" enctype="application/x-www-form-urlencoded">
							<div class="form-row">
								<div class="col form-group">
									<label>Họ Tên đệm </label> <input name="hoTenDem" type="text"
										class="form-control" placeholder="">
								</div>
								<div class="col form-group">
									<label>Tên</label> <input name="ten" type="text"
										class="form-control" placeholder=" ">
								</div>
							</div>
							<div class="form-group">
								<label>Email address</label> <input name="email" type="email"
									class="form-control" placeholder="">
							</div>
							<div class="form-group">
								<label>Số điện thoại</label> <input name="soDienThoai"
									type="text" class="form-control" placeholder="">
								<form:errors path="soDienThoai" cssClass="error" />
							</div>
							<div class="form-group">
								<label>Địa chỉ </label> <input name="diaChi" type="text"
									class="form-control" placeholder="">
							</div>

							<div class="form-group">
								<label>Tên cửa hàng </label> <input name="tenCuaHang"
									type="text" class="form-control" placeholder="">
							</div>

							<div class="form-group">
								<label>Địa chỉ lấy hàng</label> <input name="diaChiLayHang"
									type="text" class="form-control" placeholder="">
							</div>

							<div class="form-group">
								<label>Mật khẩu</label> <input name="matKhau"
									class="form-control" type="password">
							</div>
							<div class="form-group">
								<button type="submit" class="btn btn-success btn-block">
									Thêm</button>
							</div>

						</form>

					</article>

				</div>
			</div>

		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>