
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<c:url var="cssHeaderAdmin" value="/css/styles.css" />
<link rel="stylesheet" href="${cssHeaderAdmin }" />
</head>
<body>
	<c:url var="danhMucAd" value="/danhmuc/" />
	<div class="d-flex" id="wrapper">
		<!-- Sidebar-->
		<div class="border-end bg-white" id="sidebar-wrapper">
			<div class="sidebar-heading border-bottom bg-light">Admin</div>
			<div class="list-group list-group-flush">
				<a
					class="list-group-item list-group-item-action list-group-item-light p-3"
					href="${pageContext.request.contextPath }/user/nguoimua">Người mua</a> <a
					class="list-group-item list-group-item-action list-group-item-light p-3"
					href="${pageContext.request.contextPath }/user/nguoiban">Người bán</a><a
					class="list-group-item list-group-item-action list-group-item-light p-3"
					href="">Hóa đơn</a> <a
					class="list-group-item list-group-item-action list-group-item-light p-3"
					href="#!">Thanh toán</a>
					<a
					class="list-group-item list-group-item-action list-group-item-light p-3"
					href="#!">Vận chuyển</a>

			</div>

		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>