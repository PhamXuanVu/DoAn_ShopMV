<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Chi tiết sản phẩm</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<c:url var="productDetail" value="/css/product-detail.css" />
<link rel="stylesheet" href="${productDetail }" />
</head>
<body>
	<jsp:include page="layout/header.jsp" />
	<form class="m-auto"
		action="${pageContext.request.contextPath}/gioHang/add" method="POST">
		<div style="margin-top: 50px;" class="container">
			<div class="row">
				<div class="col-md-5">
					<c:url var="image" value="${sanPham.hinhAnh}" />
					<img src="${image}" class="card-img-top">
				</div>
				<div class="col-md-7">
					<input name="id" type="hidden" value="${sanPham.getSanPhamId()}">
					<div class="newarrival text-center">NEW</div>
					<h2>${sanPham.getCuaHang().getTenCuaHang()}</h2>
					<h2>${sanPham.tenSanPham}</h2>
					<b>Mô tả</b>
					<p>${sanPham.moTa }</p>
					<b>Kích Cở: </b> <br />
					<c:forEach items="${sanPham.chiTietSanPham.kichCos}" var="k">
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" checked="checked"
								name="kichCo" id="inlineRadio1" value="${k.tenKichCo }" />
							<label class="form-check-label" for="inlineRadio1">${k.tenKichCo }</label>
						</div>
					</c:forEach> 
					<br /><b>Màu: </b> <br />
					<c:forEach items="${sanPham.chiTietSanPham.mauSacs}" var="m">
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" checked="checked"
								name="mauSac" id="inlineRadio1" value="${m.tenMau }" />
							<label class="form-check-label" for="inlineRadio1">${m.tenMau }</label>
						</div>
					</c:forEach>
					<P class="price">${sanPham.getGiaFormat()}</P>
					<label>Số lượng:</label> <input name="soLuong" type="number"
						value="1"> &nbsp ${sanPham.soLuong} sản phẩm có sẳn <br />
					<br />
					<button type="submit" class="btn btn btn-secondary cart">Thêm
						vào giỏ hàng</button>
						
						<p class="small fw-bold mt-2 pt-1 mb-0">
							Xem các sản phẩm khác của cửa hàng <a href="${pageContext.request.contextPath}/danhmuc/san-pham-cua-hang/${sanPham.cuaHang.cuaHangId}" class="link-danger">tại đây</a>
						</p>
				</div>
			</div>
		</div>
	</form>
	<jsp:include page="layout/footer.jsp" />
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>