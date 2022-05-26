<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<style type="text/css">
table {
	width: 100%;
	border-collapse: collapse;
}

.cart-info {
	display: flex;
	flex-wrap: wrap;
}

th {
	text-align: left;
	padding: 5px;
	color: #FFF;
	background: #7fad39;
	font-weight: normal;
}

td {
	padding: 10px 5px;
}

td input {
	width: 50px;
	height: 30px;
	padding: 5px;
}

td a {
	color: #ff523b;
	font-size: 12px;
}

.total-price {
	display: flex;
	justify-content: flex-end;
}

.total-price table {
	border-top: 3px solid #ff523b;
	max-width: 350px;
}

td:last-child {
	text-align: right;
}

th:last-child {
	text-align: right;
}
</style>
<title>Giỏ hàng</title>
</head>
<body>
	<c:url var="login" value="/user/login" />
	<c:url var="homePageUrl" value="/" />
	<div class="container">
		<jsp:include page="layout/header.jsp" />
		<c:if test="${pageContext.request.userPrincipal.name == null}">
			Bạn chưa đăng nhập
			<a class="navbar-brand" href="${login }">Đăng nhập ngay</a>

		</c:if>
		<c:if test="${pageContext.request.userPrincipal.name != null}">
			<c:choose>
				<c:when test="${cart == null}">
					<div style="text-align: center;"
						class="row cart__list-order-detail">
						<h3>Chưa có sản phẩm nào trong giỏ hàng</h3>
						<br />
						<h3>
							<a class="navbar-brand" href="${homePageUrl }">Mua hàng ngay</a>
						</h3>
					</div>
				</c:when>
				<c:otherwise>
					<form class="m-auto"
						action="${pageContext.request.contextPath}/gioHang/thanhToan"
						method="POST" enctype="application/x-www-form-urlencoded">
						<div class="cart-page">
							<table>
								<tr>
									<th>Sản phẩm</th>
									<th></th>
									<th>Số lượng</th>
									<th>Giá</th>
								</tr>
								<c:forEach items="${cart.sanPhams}" var="chiTietHoaDon">
									<tr>
										<td>
											<div class="cart-info">
												<c:url var="image" value="${chiTietHoaDon.sanPham.hinhAnh}" />
												<img style="height: 80px; width: 80px; margin-right: 10px;"
													src="${image}">
												<div>
													<p>${chiTietHoaDon.sanPham.tenSanPham}</p>
													<small>${chiTietHoaDon.tinhGiaBanFormat()}</small> <br />
													<a href="${pageContext.request.contextPath}/gioHang/deleteGioHang/${chiTietHoaDon.sanPham.sanPhamId}">Xóa</a>
												</div>
											</div>
										</td>
										<td>
										<c:forEach
												items="${chiTietHoaDon.sanPham.chiTietSanPham.mauSacs}"
												var="m">
											${m.tenMau}
										</c:forEach> ,
										<c:forEach
												items="${chiTietHoaDon.sanPham.chiTietSanPham.kichCos}"
												var="k">
											${k.tenKichCo}
										</c:forEach>
										
										
										
										</td>
										<td><input type="number" value="${chiTietHoaDon.soLuong}"
											disabled /></td>
										<td>${chiTietHoaDon.getTongTien()}</td>
									</tr>
								</c:forEach>
							</table>
							<div class="total-price">
								<table>
									<tr>
										<td>Tổng tiền</td>
										<td>${cart.getTongTienChiTietHoaDonFormat()}</td>
									</tr>
								</table>
							</div>
							<div class="">
								<table>
									<tr>
										<td><a class="navbar-brand" href="${homePageUrl }">Tiếp
												tục mua hàng</a></td>
										<td><button type="submit" class="btn btn-warning">Mua
												hàng</button></td>
									</tr>
								</table>
							</div>

						</div>
					</form>
				</c:otherwise>
			</c:choose>
		</c:if>
	</div>
	<jsp:include page="layout/footer.jsp" />
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>