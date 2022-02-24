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
				<jsp:include page="../layout/sidebar-admin.jsp" />
			</div>
			<div class="col-8">
				<div class="card">
					<header class="card-header">
						<h4 class="card-title mt-2">Thêm sản phẩm</h4>
					</header>
					<article class="card-body">
						<form class="m-auto"
							action="${pageContext.request.contextPath}/danhmuc/form-add-san-pham"
							method="POST" enctype="application/x-www-form-urlencoded">

							<div class="form-row">
								<div class="col form-group">
									<div class="input-group mb-3">
										<select class="custom-select" id="danhMuc">
											<option selected>Danh mục sản phẩm</option>
											<c:forEach items="${danhMuc}" var="sp">
												<option value="danhMuc">${sp.tenDanhMuc}</option>
											</c:forEach>
										</select>
									</div>
									<label>Tên sản phẩm </label> <input name="tenSanPham"
										type="text" class="form-control" placeholder="">
								</div>
								<div class="col form-group">
									<label>Đơn giá</label> <input name="donGia" type="number"
										class="form-control" placeholder=" ">
								</div>
							</div>
							<div class="form-group">
								<label>Số lương</label> <input name="soLuong" type="text"
									class="form-control" placeholder="">
							</div>
							<div class="form-group">
								<label>Mô tả</label> <input name="moTa" type="text"
									class="form-control" placeholder="">
							</div>
							<div class="col form-group">
								<label>Hình ảnh </label> <input name="hinhAnh" type="file"
									class="form-control" placeholder="">
							</div>
							<div class="form-group">
								<button type="submit" class="btn btn-primary btn-block">
									Thêm</button>
							</div>
						</form>
					</article>

				</div>
			</div>

		</div>
	</div>
</body>
</html>