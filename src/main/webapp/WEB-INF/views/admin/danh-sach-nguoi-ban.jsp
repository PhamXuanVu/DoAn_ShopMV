<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
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
				<c:choose>
					<c:when test="${param.addSuccess}">
						<p style="color: red;" class="error">Thêm thành công 1 người
							bán!</p>
					</c:when>
					<c:when test="${param.updateSuccess}">
						<p style="color: red;" class="error">Cập nhật thành công 1
							người bán!</p>
					</c:when>
					<c:when test="${param.deleteSuccess}">
						<p style="color: red;" class="error">Xóa thành công 1 người
							bán!</p>
					</c:when>
				</c:choose>
				<button type="button" class="btn btn-success">
					<a style="text-decoration: none" class="link-light"
						href="${pageContext.request.contextPath }/user/form-add-nguoi-ban">Thêm
						người bán</a>
				</button>
				<table class="table" style="text-align: center;">
					<thead>
						<tr>
							<th scope="col">ID</th>
							<th scope="col">Tên cửa hàng</th>
							<th scope="col">Họ tên đệm</th>
							<th scope="col">Tên</th>
							<th scope="col">Số điện thoại</th>
							<th scope="col">Địa chỉ</th>
							<th scope="col"></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${pagedListHolder.pageList}" var="nguoiBan">
							<tr>
								<th>${nguoiBan.id}</th>
								<td>${nguoiBan.cuaHang.tenCuaHang}</td>
								<td>${nguoiBan.hoTenDem}</td>
								<td>${nguoiBan.ten}</td>
								<td>${nguoiBan.soDienThoai}</td>
								<td>${nguoiBan.diaChi}</td>
								<td>
									<div class="col">
										<button type="button" class="btn btn-outline-warning">
											<a style="text-decoration: none" class="link-warning"
												href="${pageContext.request.contextPath}/user/form-update-nguoi-ban/${nguoiBan.id}">Sửa</a>
										</button>
									</div>
									<div class="col">
										<button type="button" class="btn btn-outline-danger">
											<a style="text-decoration: none" class="link-danger"
												href="${pageContext.request.contextPath }/user/deleteNguoiBan/${nguoiBan.id}"
												onclick="return confirm('Bạn có muốn xóa?')">Xóa</a>
										</button>
									</div>
								</td>

							</tr>

						</c:forEach>
					</tbody>
				</table>
				<jsp:useBean id="pagedListHolder" scope="request"
					type="org.springframework.beans.support.PagedListHolder" />
				<c:url value="/user/nguoiban" var="pagedLink">
					<c:param name="p" value="~" />
				</c:url>
				<tg:paging pagedListHolder="${pagedListHolder}"
					pagedLink="${pagedLink}" />
			</div>
		</div>
	</div>
</body>
</html>