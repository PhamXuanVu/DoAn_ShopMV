<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
						<h4 class="card-title mt-2">Thêm sản phẩm</h4>
					</header>
					<article class="card-body">
						<form class="m-auto"
							action="${pageContext.request.contextPath}/user/form-add-san-pham/${nguoiDung.getId()}"
							method="POST" enctype="application/x-www-form-urlencoded">
							<form:form modelAttribute="danhMucSP" method="get">
								<div class="form-row">
									<div class="col form-group">
										
										<form:select path="danhMuc">
											<c:forEach var="danhMuc" items="${danhMuc }">
												<form:option value="${danhMuc.tenDanhMuc }"></form:option>
											</c:forEach>
										</form:select>
										
									</div>
									<div class="col form-group">

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
								</form:form>
						</form>

					</article>

				</div>
			</div>

		</div>
	</div>
</body>
</html>