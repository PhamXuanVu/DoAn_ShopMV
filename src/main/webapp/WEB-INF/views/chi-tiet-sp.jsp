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
	<section class="featured spad">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="section-title">
							<h2>Các sản phẩm cùng loại</h2>
						</div>
					</div>
				</div>
				<div class="row featured__filter">
					<c:forEach items="${danhMucSP}" var="sp">
						<c:url var="image" value="${sp.hinhAnh}" />
						<div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
							<div class="featured__item">
								<div style="background-image: url('${image}');"
									class="featured__item__pic set-bg">
									<ul class="featured__item__pic__hover">
										<li><a href="#"><svg
													xmlns="http://www.w3.org/2000/svg" width="16" height="16"
													fill="currentColor" class="bi bi-suit-heart-fill"
													viewBox="0 0 16 16">
  <path
														d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z" />
</svg></a></li>
										<li><a
											href="${pageContext.request.contextPath }/chiTietSP/${sp.sanPhamId }"><svg
													xmlns="http://www.w3.org/2000/svg" width="16" height="16"
													fill="currentColor" class="bi bi-box-arrow-right"
													viewBox="0 0 16 16">
  <path fill-rule="evenodd"
														d="M10 12.5a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v2a.5.5 0 0 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-2a.5.5 0 0 0-1 0v2z" />
  <path fill-rule="evenodd"
														d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z" />
</svg></a></li>
										<li><a href="#"><svg
													xmlns="http://www.w3.org/2000/svg" width="16" height="16"
													fill="currentColor" class="bi bi-cart-fill"
													viewBox="0 0 16 16">
  <path
														d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
</svg></i></a></li>
									</ul>
								</div>
								<div class="featured__item__text">
									<h6>
										<a href="#">${sp.tenSanPham}</a>
									</h6>
									<h5>${sp.getGiaFormat()}</h5>

								</div>

							</div>
						</div>
					</c:forEach>
				</div>

			</div>
		</section>
	<jsp:include page="layout/footer.jsp" />
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>