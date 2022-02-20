
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
	<c:url var="socola" value="/danhmuc/socola-admin" />
	<c:url var="keo" value="/danhmuc/keo-admin" />
	<c:url var="addKeo" value="/danhmuc/form-add-keo" />
	<div class="d-flex" id="wrapper">
		<!-- Sidebar-->
		<div class="border-end bg-white" id="sidebar-wrapper">
			<div class="sidebar-heading border-bottom bg-light">Start
				Bootstrap</div>
			<div class="list-group list-group-flush">
				<a
					class="list-group-item list-group-item-action list-group-item-light p-3"
					href="#!">Dashboard</a>
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingOne">
						<button class="accordion-button" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapseOne"
							aria-expanded="true" aria-controls="collapseOne">Sản
							phẩm</button>
					</h2>
					<div id="collapseOne" class="accordion-collapse collapse show"
						aria-labelledby="headingOne" data-bs-parent="#accordionExample">
						<div class="accordion-body">
							<a
								class="list-group-item list-group-item-action list-group-item-light p-3"
								href="${keo}">Kẹo</a> <a
								class="list-group-item list-group-item-action list-group-item-light p-3"
								href="${socola}">Socola</a>
						</div>
					</div>
				</div>

				<a
					class="list-group-item list-group-item-action list-group-item-light p-3"
					href="#!">Shortcuts</a> <a
					class="list-group-item list-group-item-action list-group-item-light p-3"
					href="${addKeo }">Overview</a> <a
					class="list-group-item list-group-item-action list-group-item-light p-3"
					href="#!">Events</a>

			</div>

		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>