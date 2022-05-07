<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>

<title>OSPing-Easy Shopping</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
</head>
<body>
	<jsp:include page="layout/header.jsp" />
	
	
		<img style="display: block; margin-left: auto; margin-right: auto; " src="/ShopMV/images/spnb.jpg" alt="">
		<div class="row">
		<c:forEach items="${sanPhamNoiBat}" var="sp">
			<div class="card"
				style="width: 200px; margin-left: 50px; margin-top: 50px; text-align: center;">
				<p class="card-text" style="font-weight: 700;">${sp.getCuaHang().getTenCuaHang()}</p>
				<c:url var="image" value="${sp.hinhAnh}" />
				<img class="rounded" style="heigth: 250px" src="${image}"
					alt="Card image cap">
				<div class="card-body">
					<p class="card-text" style="font-weight: 700;">${sp.tenSanPham}</p>
					<p class="card-text">${sp.getGiaFormat()}</p>
					<div class="button_actions clearfix">

						<button id="btnSubmit"
							class="btn btn_base btn_add_cart btn-cart add_to_cart"
							style="background-color: red">
							<span class="text_1"><a style="text-decoration: none"
								class="link-warning"
								href="${pageContext.request.contextPath }/chiTietSP/${sp.sanPhamId }">Xem
									chi tiết</a></span>
						</button>

					</div>
				</div>
			</div>

		</c:forEach>
	</div>
	
	<img style="display: block; margin-left: auto; margin-right: auto; " src="/ShopMV/images/spm.jpg" alt="">
		<div class="row">
		<c:forEach items="${sanPhamMoi}" var="sp">
			<div class="card"
				style="width: 200px; margin-left: 50px; margin-top: 50px; text-align: center;">
				<p class="card-text" style="font-weight: 700;">${sp.getCuaHang().getTenCuaHang()}</p>
				<c:url var="image" value="${sp.hinhAnh}" />
				<img class="rounded" style="heigth: 250px" src="${image}"
					alt="Card image cap">
				<div class="card-body">
					<p class="card-text" style="font-weight: 700;">${sp.tenSanPham}</p>
					<p class="card-text">${sp.getGiaFormat()}</p>
					<div class="button_actions clearfix">

						<button id="btnSubmit"
							class="btn btn_base btn_add_cart btn-cart add_to_cart"
							style="background-color: red">
							<span class="text_1"><a style="text-decoration: none"
								class="link-warning"
								href="${pageContext.request.contextPath }/chiTietSP/${sp.sanPhamId }">Xem
									chi tiết</a></span>
						</button>

					</div>
				</div>
			</div>

		</c:forEach>
	</div>
	
	
	<img style="display: block; margin-left: auto; margin-right: auto;" src="/ShopMV/images/tcsp.jpg" alt="">
	<div class="row">
	<jsp:useBean id="pagedListHolder" scope="request"
			type="org.springframework.beans.support.PagedListHolder" />
		<c:url value="/" var="pagedLink">
			<c:param name="p" value="~" />
		</c:url>
		<c:forEach items="${pagedListHolder.pageList}" var="sp">
			<div class="card"
				style="width: 200px; margin-left: 50px; margin-top: 50px; text-align: center;">
				<p class="card-text" style="font-weight: 700;">${sp.getCuaHang().getTenCuaHang()}</p>
				<c:url var="image" value="${sp.hinhAnh}" />
				<img class="rounded" style="heigth: 250px" src="${image}"
					alt="Card image cap">
				<div class="card-body">
					<p class="card-text" style="font-weight: 700;">${sp.tenSanPham}</p>
					<p class="card-text">${sp.getGiaFormat()}</p>
					<div class="button_actions clearfix">

						<button id="btnSubmit"
							class="btn btn_base btn_add_cart btn-cart add_to_cart"
							style="background-color: red">
							<span class="text_1"><a style="text-decoration: none"
								class="link-warning"
								href="${pageContext.request.contextPath }/chiTietSP/${sp.sanPhamId }">Xem
									chi tiết</a></span>
						</button>
					</div>
				</div>
			</div>

		</c:forEach>
		<tg:paging pagedListHolder="${pagedListHolder}"
			pagedLink="${pagedLink}" />
	</div>
	<jsp:include page="layout/footer.jsp" />
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>