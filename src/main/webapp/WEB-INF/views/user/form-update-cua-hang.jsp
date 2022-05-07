<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Update cửa hàng</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
</head>
<body>
	<jsp:include page="../layout/header.jsp" />
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-6">
				<div class="card">
					<header class="card-header">
						<h4 class="card-title mt-2">Update cửa hàng</h4>
					</header>
					<article class="card-body">
						<form class="m-auto"
							action="${pageContext.request.contextPath}/user/form-update-cua-hang/${nguoiDung.cuaHang.getCuaHangId()}"
							method="POST">
							<div class="form-group">
								<label>Tên cửa hàng</label> <input name="tenCuaHang"
									class="form-control" type="text" value="${nguoiDung.cuaHang.tenCuaHang}" >
							</div>
							<div class="form-group">
								<label>Địa chỉ lấy hàng</label> <input name="diaChiLayHang"
									class="form-control" type="text" value="${nguoiDung.cuaHang.getDiaChiLayHang() }">
							</div>
							<div class="form-group">
								<label>Email</label> <input name="email"
									class="form-control" type="text"  disabled="disabled" value="${nguoiDung.cuaHang.email }">
							</div>
							<div class="form-group">
								<label>Số điện thoại</label> <input name="sdt"
									class="form-control" disabled="disabled" type="text" value="${nguoiDung.cuaHang.sdt }">
							</div>
							<div class="form-group">
								<button type="submit" class="btn btn-success btn-block">
									Update cửa hàng</button>
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