<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Tạo cửa hàng</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
	<style type="text/css">
		.error {
			color: red;
			font-style: italic;
		}
	
	</style>
</head>
<body>
	<jsp:include page="../layout/header.jsp" />
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-6">
				<div class="card">
					<header class="card-header">
						<h4 class="card-title mt-2">Tạo cửa hàng</h4>
					</header>
					<article class="card-body">
						<form:form class="m-auto"
							action="${pageContext.request.contextPath}/user/form-tao-cua-hang/${nguoiDung.getId()}"
							modelAttribute="cuaHang"
							method="POST">
							<div class="form-group">
								<label>Tên cửa hàng</label> <form:input path="tenCuaHang" name="tenCuaHang"
									class="form-control" type="text" />
									<form:errors path="tenCuaHang" cssClass="error" />
							</div>
							<div class="form-group">
								<label>Địa chỉ lấy hàng</label> <form:input path="diaChiLayHang" name="diaChiLayHang"
									class="form-control" type="text" />
									<form:errors path="diaChiLayHang" cssClass="error" />
							</div>
							<div class="form-group">
								<label>Email</label> <input name="email"
									class="form-control" type="text"  disabled="disabled" value="${nguoiDung.taiKhoan.email }">
							</div>
							<div class="form-group">
								<label>Số điện thoại</label> <input name="sdt"
									class="form-control" disabled="disabled" type="text" value="${nguoiDung.soDienThoai }">
							</div>
							<div class="form-group">
								<button type="submit" class="btn btn-success btn-block">
									Tạo cửa hàng</button>
							</div>
						</form:form>
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