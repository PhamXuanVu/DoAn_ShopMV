<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Admin</title>
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-12">
				<jsp:include page="../layout/header.jsp" />
			</div>
		</div>
		<div class="row">
			<div class="col-4">
				<jsp:include page="../layout/sidebar-user.jsp" />
			</div>
			<div class="col-8">
				<div class="card">
					<header class="card-header">
						<h4 class="card-title mt-2">Cập nhật sản phẩm</h4>
					</header>
					<article class="card-body">
						<form class="m-auto"
							action="${pageContext.request.contextPath}/user/form-update-san-pham/${sanPham.sanPhamId}"
							method="POST" enctype="application/x-www-form-urlencoded">

							<div class="form-row">
								<div class="col form-group">
									<input name="sanPhamId" type="hidden" class="form-control"
										value="${sanPham.sanPhamId}">
								</div>
								<div class="col form-group">
									<label>Tên sản phẩm </label> <input name="tenSanPham"
										type="text" class="form-control" value="${sanPham.tenSanPham}">
								</div>
								<div class="col form-group">
									<label>Đơn giá</label> <input name="donGia" type="number"
										class="form-control" value="${sanPham.donGia}">
								</div>
							</div>
							<div class="form-group">
								<label>Số lượng</label> <input name="soLuong" type="text"
									class="form-control" value="${sanPham.soLuong}">
							</div>
							<div class="form-group">
								<label>Mô tả</label> <input name="moTa" type="text"
									class="form-control" value="${sanPham.moTa}">
							</div>
							<div class="col form-group">
								<label>Hình ảnh </label> <input name="hinhAnh" type="file"
									class="form-control">
							</div>
							<c:url var="image" value="${sanPham.hinhAnh}" />
							<img width="60px" height="60px" src="${image}"
								alt="Card image cap">
							<div class="form-group">
								<button type="submit" class="btn btn-primary btn-block">
									Cập nhật</button>
							</div>
						</form>
					</article>

				</div>
			</div>

		</div>
	</div>
</body>
</html>