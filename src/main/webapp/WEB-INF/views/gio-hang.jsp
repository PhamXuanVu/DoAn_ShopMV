<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link <%@ page contentType="text/html;charset=UTF-8" language="java"%>
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<c:url var="cssCart" value="/css/cart.css" />
<link rel="stylesheet" href="${cssCart }" />
<title>Giỏ hàng</title>
</head>
<body>
	<c:url var="homePageUrl" value="/" />
	<div class="container">
		<jsp:include page="layout/header.jsp" />
		<c:choose>
			<c:when test="${cart == null}">
				<div style="text-align: center;" class="row cart__list-order-detail">
					<h3>Chưa có sản phẩm nào trong giỏ hàng</h3> <br/>
					<h3><a class="navbar-brand" href="${homePageUrl }">Mua hàng ngay</a></h3>
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
								<th>Số lượng</th>
								<th>Giá</th>
							</tr>
							<c:forEach items="${cart.sanPhams}" var="chiTietHoaDon">
								<tr>
									<td>
										<div class="cart-info">
											<c:url var="image" value="${chiTietHoaDon.sanPham.hinhAnh}" />
											<img src="${image}">
											<div>
												<p>${chiTietHoaDon.sanPham.tenSanPham}</p>
												<small>${chiTietHoaDon.tinhGiaBanFormat()}</small> <br /> <a
													href="">Xóa</a>
											</div>
										</div>
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
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>