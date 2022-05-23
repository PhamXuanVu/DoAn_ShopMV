<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Admin</title>
<style type="text/css">
.error {
	color: red;
	font-style: italic;
}
</style>
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-12">
				<jsp:include page="../layout/header.jsp" />
			</div>
		</div>
		<div class="row">
			<div class="col-2">
				<jsp:include page="../layout/sidebar-user.jsp" />
			</div>
			<div class="col-10">
				<div class="card">
					<header class="card-header">
						<h4 class="card-title mt-2">Cập nhật sản phẩm</h4>
					</header>
					<article class="card-body">
						<form:form class="m-auto"
							action="${pageContext.request.contextPath}/user/form-update-san-pham/${sanPham.sanPhamId}"
							modelAttribute="sanPhamDTO"
							method="POST" enctype="application/x-www-form-urlencoded">

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
							<div class="col form-group">
								<label>Số lượng</label> <input name="soLuong" type="text"
									class="form-control" value="${sanPham.soLuong}">
							</div>
							<div class="col form-group">
								<label>Mô tả</label> <input name="moTa" type="text"
									class="form-control" value="${sanPham.moTa}">
							</div>
							<div class="col form-group">
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

							<div class="col form-group">
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

							<div class="col form-group">
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

							<div class="col form-group">
								<label>Hình ảnh </label>
								<form:input path="hinhAnh" name="hinhAnh" type="file"
									class="form-control" placeholder="" />
								<form:errors path="hinhAnh" cssClass="error" />
							</div>
							<c:url var="image" value="${sanPham.hinhAnh}" />
							<img width="60px" height="60px" src="${image}"
								alt="Card image cap">
							<div class="col form-group">
								<br/><button type="submit" class="btn btn-success btn-block">
									Cập nhật</button>
							</div>
						</form:form>
					</article>

				</div>
			</div>

		</div>
	</div>
</body>
</html>