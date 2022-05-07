<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Admin</title>
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
				<jsp:include page="../layout/sidebar-admin.jsp" />
			</div>
			<div class="col-10">
				<button type="button" class="btn btn-success">
					<a style="text-decoration: none" class="link-light" href="<%-- ${pageContext.request.contextPath }/danhmuc/form-add-san-pham/${danhMucId} --%>">Thêm người mua</a>
				</button>
				<table class="table" style="text-align: center;">
					<thead>
						<tr>
							<th scope="col">ID</th>
							<th scope="col">Họ tên đệm</th>
							<th scope="col">Tên</th>
							<th scope="col">Số điện thoại</th>
							<th scope="col">Địa chỉ</th>
							<th scope="col"></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${nguoiMua}" var="nguoiMua">
							<tr>
								<th>${nguoiMua.id}</th>
								<td>${nguoiMua.hoTenDem}</td>
								<td>${nguoiMua.ten}</td>
								<td>${nguoiMua.soDienThoai}</td>
								<td>${nguoiMua.diaChi}</td>
								<td>
									<div class="col">
										<button type="button" class="btn btn-outline-warning">
											<a style="text-decoration: none" class="link-warning"
												href="<%-- ${pageContext.request.contextPath }/danhmuc/update/${sp.getSanPhamId() } --%>">Sửa</a>
										</button>
									</div>
									<div class="col">
										<button type="button" class="btn btn-outline-danger">
											<a style="text-decoration: none" class="link-danger"
												href="<%-- ${pageContext.request.contextPath }/danhmuc/delete/${sp.getSanPhamId()} --%>"
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