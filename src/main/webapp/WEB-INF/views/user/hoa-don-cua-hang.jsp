<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>Cửa hàng</title>
</head>
<body>
	<c:url var="addSP" value="/danhmuc/form-add-san-pham" />
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
				<form class="m-auto" enctype="application/x-www-form-urlencoded"
					method="get">
					<table class="table" style="text-align: center;">
						<thead>
							<tr>
								<th scope="col">ID</th>
								<th scope="col">Họ tên đệm</th>
								<th scope="col">Tên</th>
								<th scope="col">Ngày mua</th>
								<th scope="col">Địa chỉ nhận hàng</th>
								<th scope="col"></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${pagedListHolder.pageList}" var="hoaDon">
								<tr>
									<th>${hoaDon.hoaDonId}</th>
									<td>${hoaDon.nguoiDung.hoTenDem}</td>
									<td>${hoaDon.nguoiDung.ten}</td>
									<td>${hoaDon.ngayMua}</td>
									<td>${hoaDon.nguoiDung.diaChi}</td>
									<td>
										<div class="col">
											<button type="button" class="btn btn-outline-warning">
												<a style="text-decoration: none" class="link-warning"
													href="${pageContext.request.contextPath}/user/hoa-don-cua-hang/${cuaHangId}/chi-tiet-hoa-don-cua-hang/${hoaDon.hoaDonId}">Xem
													chi tiết</a>
											</button>
										</div>
									</td>

								</tr>

							</c:forEach>
						</tbody>
					</table>
					<jsp:useBean id="pagedListHolder" scope="request"
						type="org.springframework.beans.support.PagedListHolder" />
					<c:url value="/user/hoa-don-cua-hang/${cuaHangId}" var="pagedLink">
						<c:param name="p" value="~" />
					</c:url>
					<tg:paging pagedListHolder="${pagedListHolder}"
						pagedLink="${pagedLink}" />
				</form>
			</div>
		</div>
		<jsp:include page="../layout/footer.jsp" />
	</div>
</body>
</html>