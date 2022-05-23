<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Đăng ký</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
	<style type="text/css">
		.error {
			color: red;
			font-style: italic;
		}
	
	</style>
</head>
<body>
	<jsp:include page="layout/header.jsp" />
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-6">
				<c:choose>
					<c:when test="${param.failure}">
						<p style="color: red;" class="error">Email đã tồn tại!. Hãy thử với email khác.</p>
					</c:when>
				</c:choose>
				<div class="card">
					<header class="card-header">
						<h4 class="card-title mt-2">Đăng ký</h4>
					</header>
					<article class="card-body">
						<form:form class="m-auto"
							action="${pageContext.request.contextPath}/user/register"
							modelAttribute="nguoiDungDTO"
							method="POST">

							<div class="form-row">
								<div class="col form-group">
									<label>Họ Tên đệm </label> <form:input path="hoTenDem" name="hoTenDem" type="text"
										class="form-control" placeholder="" />
										<form:errors path="hoTenDem" cssClass="error" />									
								</div>
								<div class="col form-group">
									<label>Tên</label> <form:input path="ten" name="ten" type="text"
										class="form-control" placeholder=" " />
										<form:errors path="hoTenDem" cssClass="error" />	
										
								</div>
							</div>
							<div class="form-group">
								<label>Email address</label> <form:input path="email" name="email"
									class="form-control" placeholder="" />
									<form:errors path="email" cssClass="error" />	
									
							</div>
							<div class="form-group">
								<label>Số điện thoại</label> <form:input path="soDienThoai"  name="soDienThoai"
									type="text" class="form-control" placeholder="" />
									<form:errors path="soDienThoai" cssClass="error" />	
								
							</div>
							<div class="form-group">
								<label>Địa chỉ </label> <form:input path="diaChi"  name="diaChi" type="text"
									class="form-control" placeholder="" />
									<form:errors path="diaChi" cssClass="error" />	
									
							</div>
							<div class="form-group">
								<label>Mật khẩu</label> <form:input path="matKhau"  name="matKhau"
									class="form-control" type="password" />
									<form:errors path="matKhau" cssClass="error" />	
									
							</div>
							<div class="form-group">
								<form:button type="submit" class="btn btn-success btn-block">
									Đăng ký</form:button>
							</div>
						</form:form>
					</article>

				</div>
			</div>

		</div>
	</div>
	<jsp:include page="layout/footer.jsp" />
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>