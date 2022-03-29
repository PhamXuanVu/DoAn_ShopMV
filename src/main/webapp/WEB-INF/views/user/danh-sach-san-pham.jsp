<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Cửa hàng của tôi</title>
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
			<div class="col-4">
				<jsp:include page="../layout/sidebar-user.jsp" />
			</div>
			<div class="col-8">
				<button type="button" class="btn btn-primary">
					<a style="text-decoration: none" class="link-light" href="${pageContext.request.contextPath }/user/form-add-san-pham/${nguoiDung.getId()}">Đăng sản phẩm</a>
				</button>
				<table class="table" style="text-align: center;">
					<thead>
						<tr>
							<th scope="col">ID</th>
							<th scope="col">Hình ảnh</th>
							<th scope="col">Tên sản phẩm</th>
							<th scope="col">Đơn giá</th>
							<th scope="col">Số lượng</th>
							<th scope="col">Mô tả</th>
							<th scope="col"></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${sanPhamCuaHang}" var="sp">
							<tr>
								<th>${sp.getSanPhamId()}</th>
								<c:url var="image" value="${sp.hinhAnh}" />
								<td><img width="60px" height="60px" src="${image}"
									alt="Card image cap"></td>
								<td>${sp.tenSanPham}</td>
								<td>${sp.getGiaFormat()}</td>
								<td>${sp.soLuong}</td>
								<td>${sp.moTa}</td>
								<td>
									<div class="col">
										<button type="button" class="btn btn-outline-warning">
											<a style="text-decoration: none" class="link-warning"
												href="${pageContext.request.contextPath }/user/form-update-san-pham/${sp.sanPhamId }">Sửa</a>
										</button>
									</div>
									<div class="col">
										<button type="button" class="btn btn-outline-danger">
											<a style="text-decoration: none" class="link-danger"
												href="${pageContext.request.contextPath }/user/delete/${sp.sanPhamId }"
												onclick="return confirm('Bạn có muốn xóa?')">Xóa</a>
										</button>
									</div>
								</td>

							</tr>

						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>