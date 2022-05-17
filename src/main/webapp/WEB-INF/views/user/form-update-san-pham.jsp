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
			<div class="col-2">
				<jsp:include page="../layout/sidebar-user.jsp" />
			</div>
			<div class="col-10">
				<div class="card">
					<header class="card-header">
						<h4 class="card-title mt-2">Cập nhật sản phẩm</h4>
					</header>
					<article class="card-body">
						<form class="m-auto"
							action="${pageContext.request.contextPath}/user/form-update-san-pham/${sanPham.sanPhamId}"
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
							<div class=" col form-group">
								<label>Màu sắc</label> <br />
									<input type="checkbox" name="mauSac" value="Đỏ" /> Đỏ &nbsp<input
										type="checkbox" name="mauSac" value="Xanh Lá" /> Xanh Lá &nbsp<input
										type="checkbox" name="mauSac" value="Xanh Navy" /> Xanh Navy &nbsp
										<input
										type="checkbox" name="mauSac" value="Xanh Dương" /> Xanh Dương &nbsp
										<input
										type="checkbox" name="mauSac" value="Trắng" /> Trắng &nbsp
										<input
										type="checkbox" name="mauSac" value="Đen" /> Đen &nbsp
										<input
										type="checkbox" name="mauSac" value="Tím" /> Tím &nbsp
										<input
										type="checkbox" name="mauSac" value="Vàng" /> Vàng &nbsp
										<input
										type="checkbox" name="mauSac" value="Cam" /> Cam &nbsp
										<input
										type="checkbox" name="mauSac" value="" /> NULL &nbsp
										<br /> 
								</div>
								
								<div class="col form-group">
								<label>Kích cở (quần,áo,...)</label><br />
									<input type="checkbox" name="kichCo" value="Java" /> S &nbsp<input
										type="checkbox" name="kichCo" value="M" /> M &nbsp<input
										type="checkbox" name="kichCo" value="L" /> L &nbsp
										<input
										type="checkbox" name="kichCo" value="XL" /> XL &nbsp
										<input
										type="checkbox" name="kichCo" value="" /> NULL &nbsp
										<br /> 
								</div>
								
								<div class="col form-group">
								<label>Kích cở (giày,dép,...)</label><br />
									<input type="checkbox" name="kichCo" value="35" /> 35 &nbsp<input
										type="checkbox" name="kichCo" value="36" /> 36 &nbsp<input
										type="checkbox" name="kichCo" value="37" /> 37 &nbsp
										<input
										type="checkbox" name="kichCo" value="38" /> 38 &nbsp
										<input
										type="checkbox" name="kichCo" value="39" /> 39 &nbsp
										<input
										type="checkbox" name="kichCo" value="40" /> 40 &nbsp
										<input
										type="checkbox" name="kichCo" value="41" /> 41 &nbsp
										<input
										type="checkbox" name="kichCo" value="42" /> 42 &nbsp
										<input
										type="checkbox" name="kichCo" value="" /> NULL &nbsp
										<br /> 
								</div>
							<div class="col form-group">
								<label>Hình ảnh </label> <input name="hinhAnh" type="file"
									class="form-control">
							</div>
							<c:url var="image" value="${sanPham.hinhAnh}" />
							<img width="60px" height="60px" src="${image}"
								alt="Card image cap">
							<div class="col form-group">
								<br/><button type="submit" class="btn btn-success btn-block">
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