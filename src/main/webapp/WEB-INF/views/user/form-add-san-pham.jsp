<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Thêm sản phẩm</title>
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
		<div class="col-md-4">
			<jsp:include page="../layout/sidebar-user.jsp" />
		</div>
			<div class="col-md-8">
				<div class="card">
					<header class="card-header">
						<h4 class="card-title mt-2">Thêm sản phẩm</h4>
					</header>
					<article class="card-body">
						<form:form class="m-auto"
							action="${pageContext.request.contextPath}/user/form-add-san-pham/${nguoiDung.getId()}"
							modelAttribute="sanPhamCuaHang" method="POST">
							<div class="form-group">
								<form:select path="danhMuc">
									<c:forEach var="danhMuc" items="${danhMuc }">
										<form:option value="${danhMuc.tenDanhMuc }"></form:option>
									</c:forEach>
								</form:select>

								<div class="form-group">
									<label>Tên sản phẩm </label>
									<form:input path="tenSanPham" name="tenSanPham" type="text"
										class="form-control" placeholder="" />
									<form:errors path="tenSanPham" cssClass="error" />
								</div>
								<div class="form-group">
									<label>Đơn giá</label>
									<form:input path="donGia" name="donGia" type="number"
										class="form-control" placeholder=" " />
									<form:errors path="donGia" cssClass="error" />
								</div>
							</div>
							<div class="form-group">
								<label>Số lương</label>
								<form:input path="soLuong" name="soLuong" type="text"
									class="form-control" placeholder="" />
								<form:errors path="soLuong" cssClass="error" />
							</div>
							<div class="form-group">
								<label>Mô tả</label>
								<form:input path="moTa" name="moTa" type="text"
									class="form-control" placeholder="" />
								<form:errors path="moTa" cssClass="error" />
							</div>
							<div class="form-group">
								<label>Màu sắc</label> <br />
								<form:checkbox path="mauSac" name="mauSac" value="Đỏ" />
								Đỏ &nbsp
								<form:checkbox path="mauSac" name="mauSac" value="Xanh Lá" />
								Xanh Lá &nbsp
								<form:checkbox path="mauSac" name="mauSac" value="Xanh Navy" />
								Xanh Navy &nbsp
								<form:checkbox path="mauSac" value="Xanh Dương" />
								Xanh Dương &nbsp
								<form:checkbox path="mauSac" name="mauSac" value="Trắng" />
								Trắng &nbsp
								<form:checkbox path="mauSac" name="mauSac" value="Đen" />
								Đen &nbsp
								<form:checkbox path="mauSac" name="mauSac" value="Tím" />
								Tím &nbsp
								<form:checkbox path="mauSac" name="mauSac" value="Vàng" />
								Vàng &nbsp
								<form:checkbox path="mauSac" name="mauSac" value="Cam" />
								Cam &nbsp
								<form:checkbox path="mauSac" name="mauSac" value="NULL" />
								NULL &nbsp <br />
								<form:errors path="mauSac" cssClass="error" />
							</div>

							<div class="form-group">
								<label>Kích cở (quần,áo,...)</label><br />
								<form:checkbox path="kichCo" name="kichCo" value="S" />
								S &nbsp
								<form:checkbox path="kichCo" name="kichCo" value="M" />
								M &nbsp
								<form:checkbox path="kichCo" name="kichCo" value="L" />
								L &nbsp
								<form:checkbox path="kichCo" name="kichCo" value="XL" />
								XL &nbsp
								<form:checkbox path="kichCo" name="kichCo" value="NULL" />
								NULL &nbsp <br />
							</div>

							<div class="form-group">
								<label>Kích cở (giày,dép,...)</label><br />
								<form:checkbox path="kichCo" name="kichCo" value="35" />
								35 &nbsp
								<form:checkbox path="kichCo" name="kichCo" value="36" />
								36 &nbsp
								<form:checkbox path="kichCo" name="kichCo" value="37" />
								37 &nbsp
								<form:checkbox path="kichCo" name="kichCo" value="38" />
								38 &nbsp
								<form:checkbox path="kichCo" name="kichCo" value="39" />
								39 &nbsp
								<form:checkbox path="kichCo" name="kichCo" value="40" />
								40 &nbsp
								<form:checkbox path="kichCo" name="kichCo" value="41" />
								41 &nbsp
								<form:checkbox path="kichCo" name="kichCo" value="42" />
								42 &nbsp
								<form:checkbox path="kichCo" name="kichCo" value="NULL" />
								NULL &nbsp <br />
								<form:errors path="kichCo" cssClass="error" />
							</div>

							<div class="form-group">
								<label>Hình ảnh </label>
								<form:input path="hinhAnh" name="hinhAnh" type="file"
									class="form-control" placeholder="" />
								<form:errors path="hinhAnh" cssClass="error" />
							</div>

							<div class="form-group">
								<form:button type="submit" class="btn btn-success btn-block">
										Thêm</form:button>
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