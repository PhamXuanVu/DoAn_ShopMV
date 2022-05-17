<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Cửa hàng của tôi</title>

<style type="text/css">
body {
	width: 100%;
	height: 100%;
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
			<div class="col-4">
				<jsp:include page="../layout/sidebar-user.jsp" />
			</div>
			<c:if test="${nguoiDung.cuaHang.tenCuaHang != null}">
				<div class="col-8">
					<c:if test="${param.success}">
						<p style="color: red;" class="error">Cập nhật cửa hàng thành
							công!</p>
					</c:if>
					<img src="/ShopMV/images/banner-ch.png" alt="hi">
				</div>
			</c:if>
		</div>
	</div>
</body>
</html>