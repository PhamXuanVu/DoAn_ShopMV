<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>Admin</title>
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
</head>
<body>
	<c:url var="addSP" value="/danhmuc/form-add-san-pham" />
	<div class="container">
		<div class="row">
			<div class="col-12">
				<jsp:include page="../layout/header-admin.jsp" />
			</div>
		</div>
		<div class="row">
			<div class="col-2">
				<jsp:include page="../layout/sidebar-admin.jsp" />
			</div>
			<div class="col-10">
				<div class="cart-page">
					<table class="">
						<tr>
							<th>Sản phẩm</th>
							<th></th>
							<th>Số lượng</th>
							<th>Giá</th>
							<th>Tổng</th>
						</tr>
						<c:forEach items="${chiTietHoaDon}" var="chiTietHoaDon">
							<tr>
								<td>
									<div class="cart-info">
										<div>
											<p name="tenSanPham">${chiTietHoaDon.tenSanPham}</p>
										</div>
									</div>
								</td>
								<td>${chiTietHoaDon.mauSac}, ${chiTietHoaDon.kichCo}</td>
								<td><input name="soLuong" type="number"
									value="${chiTietHoaDon.soLuong}" disabled /></td>
								<td name="donGia">${chiTietHoaDon.getDonGiaFormat()}</td>
								<td>${chiTietHoaDon.getDonGiaDaCongFormat()}</td>
							</tr>
						</c:forEach>
					</table>
					<div class="total-price">
						<table>
							<tr>
								<td>Tổng tiền hàng</td>
								<td>${tongHoaDon}</td>
							</tr>
							<tr>
								<td>Phí vận chuyển</td>
								<td>0 VND</td>
							</tr>
							<tr>
								<td>Giảm giá</td>
								<td>${giamGia }</td>
							</tr>
							<tr>
								<td>Tổng tiền thanh toán</td>
								<td>${tongHoaDonDaGiam}</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
</body>
</html>