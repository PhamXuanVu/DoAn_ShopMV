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
				<div class="cart-page">
					<table class="">
						<tr>
							<th>Hình ảnh</th>
							<th>Sản phẩm</th>
							<th></th>
							<th>Số lượng</th>
							<th>Giá</th>
							<th>Tổng</th>
						</tr>
						<c:forEach items="${pagedListHolder.pageList}" var="chiTietHoaDon">
							<tr>
							<td><c:url var="image" value="${chiTietHoaDon.hinhAnh}" />
												<img style="height: 80px; width: 80px; margin-right: 10px;"
													src="${image}"></td>
								<td>
									<div class="cart-info">
										<div>
											<p name="tenSanPham">${chiTietHoaDon.tenSanPham}</p>
										</div>
									</div>
								</td>
								<td>${chiTietHoaDon.mauSac},${chiTietHoaDon.kichCo}</td>
								<td><input name="soLuong" type="number"
									value="${chiTietHoaDon.soLuong}" disabled /></td>
								<td>${chiTietHoaDon.getDonGiaFormat()}</td>
								<td>${chiTietHoaDon.getDonGiaDaCongFormat()}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<jsp:useBean id="pagedListHolder" scope="request"
					type="org.springframework.beans.support.PagedListHolder" />
				<c:url value="/admin/hoadon" var="pagedLink">
					<c:param name="p" value="~" />
				</c:url>
				<tg:paging pagedListHolder="${pagedListHolder}"
					pagedLink="${pagedLink}" />
			</div>
		</div>
		<jsp:include page="../layout/footer.jsp" />
	</div>
</body>
</html>