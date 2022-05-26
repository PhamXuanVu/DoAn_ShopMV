<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page import="com.www.repository.HoaDonRepository"%>
<%@page import="com.www.entity.HoaDon"%>
<%@page import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link <%@ page contentType="text/html;charset=UTF-8" language="java"%>
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
<title>Thanh toán</title>
</head>
<body>
	<div class="container">
		<jsp:include page="layout/header.jsp" />
				<div class="row">
					<div class="col-12">
						<div class="alert alert-success" role="alert">Voucher đã
							được áp dụng.</div>
					</div>
				</div>
		<form class="m-auto"
			action="${pageContext.request.contextPath}/gioHang/voucher/pay" method="POST"
			enctype="application/x-www-form-urlencoded">
			<input name="nguoiDungId" type="hidden" value="${nguoiDung.id}" />
			<div class="row">
				<div class="col-xs-6 col-sm-6 col-md-6">
					<address>
						<strong name="">${nguoiDung.getHoTenDem()}
							${nguoiDung.getTen()}</strong> <br name="diaChi">
						${nguoiDung.getDiaChi()} <br>
						<p name="soDienThoai">${nguoiDung.getSoDienThoai()}</p>
					</address>
				</div>
				<div class="col-xs-6 col-sm-6 col-md-6 text-right date">
					<p>
						<em><%=new Date()%></em>
					</p>
					<p>
						<em>Mã hóa đơn #: 34522677W</em>
					</p>
				</div>
			</div>
			<div class="row">
				<div class="text-center">
					<h1>HÓA ĐƠN</h1>
				</div>
				<div class="">
					<table class="">
						<tr>
							<th>Sản phẩm</th>
							<th></th>
							<th>Số lượng</th>
							<th>Giá</th>
							<th>Tổng</th>
						</tr>
						<c:forEach items="${cart.sanPhams}" var="chiTietHoaDon">
							<input name="price" type="hidden"
								value="${cart.getTongGiaHoaDon()}" />
							<tr>
								<td>
									<div class="cart-info">
										<div>
											<p name="tenSanPham">${chiTietHoaDon.sanPham.tenSanPham}</p>
										</div>
									</div>
								</td>
								<td><c:forEach
										items="${chiTietHoaDon.sanPham.chiTietSanPham.mauSacs}"
										var="m">
											${m.tenMau}
										</c:forEach> , <c:forEach
										items="${chiTietHoaDon.sanPham.chiTietSanPham.kichCos}"
										var="k">
											${k.tenKichCo}
										</c:forEach></td>
								<td><input name="soLuong" type="number"
									value="${chiTietHoaDon.soLuong}" disabled /></td>
								<td name="donGia">${chiTietHoaDon.tinhGiaBanFormat()}</td>
								<td>${chiTietHoaDon.getTongTien()}</td>
							</tr>
						</c:forEach>
					</table>
					<div class="total-price">
						<table>
							<tr>
								<td>Tổng tiền hàng</td>
								<td>${cart.getTongTienChiTietHoaDonFormat()}</td>
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
								<td>${cart.getTongGiaHoaDonFormat()}</td>
							</tr>
						</table>
					</div>
				</div>
				<c:choose>
					<c:when test="${ param.success}">
					</c:when>
					<c:when test="${ param.failure}">
						<button type="submit" class="btn btn-warning btn-lg btn-block">
							Thanh toán<span class="glyphicon glyphicon-chevron-right"></span>
						</button>
					</c:when>
					<c:otherwise>
						<button type="submit" class="btn btn-warning btn-lg btn-block">
							Thanh toán<span class="glyphicon glyphicon-chevron-right"></span>
						</button>
					</c:otherwise>
				</c:choose>


			</div>
		</form>
	</div>
	<jsp:include page="layout/footer.jsp" />
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>