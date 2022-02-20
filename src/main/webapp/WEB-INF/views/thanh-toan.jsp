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
<c:url var="cssCart" value="/css/cart.css" />
<link rel="stylesheet" href="${cssCart }" />
<title>Thanh toán</title>
</head>
<body>
	<c:url var="homePageUrl" value="/" />
	<div class="container">
		<jsp:include page="layout/header.jsp" />
		<c:if test="${param.success}">
			<div class="row">
				<div class="col-12">
					<div class="alert alert-success" role="alert">Đặt hàng thành
						công. Tiếp tục mua hàng nào.</div>
				</div>
			</div>
		</c:if>

		<c:if test="${param.failure}">
			<div class="row">
				<div class="col-12">
					<div class="alert alert-danger" role="alert">Đặt hàng không
						thành công, có lỗi xảy ra.</div>
				</div>
			</div>
		</c:if>
		<form class="m-auto"
			action="${pageContext.request.contextPath}/hoaDon/add"
			method="POST" enctype="application/x-www-form-urlencoded">
			<div class="row">
				<div class="col-xs-6 col-sm-6 col-md-6">
					<address>
						<strong name="">${nguoiDung.getHoTenDem()} ${nguoiDung.getTen()}</strong>
						<br name="diaChi"> ${nguoiDung.getDiaChi()} <br>
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
							<th>Số lượng</th>
							<th>Giá</th>
							<th>Tổng</th>
						</tr>
						<c:forEach items="${cart.sanPhams}" var="chiTietHoaDon">
							<tr>
								<td>
									<div class="cart-info">
										<div>
											<p name="tenSanPham">${chiTietHoaDon.sanPham.tenSanPham}</p>
										</div>
									</div>
								</td>
								<td><input name= "soLuong" type="number" value="${chiTietHoaDon.soLuong}"
									disabled /></td>
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
								<td>Tổng tiền thanh toán</td>
								<td>${cart.getTongTienChiTietHoaDonFormat()}</td>
							</tr>
						</table>
					</div>
				</div>
				<button type="submit" class="btn btn-warning btn-lg btn-block">
					Thanh toán<span class="glyphicon glyphicon-chevron-right"></span>
				</button>
			</div>
		</form>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>