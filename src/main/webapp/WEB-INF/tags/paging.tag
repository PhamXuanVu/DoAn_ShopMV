<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ tag import="org.springframework.util.StringUtils"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ attribute name="pagedListHolder" required="true"
	type="org.springframework.beans.support.PagedListHolder"%>
<%@ attribute name="pagedLink" required="true" type="java.lang.String"%>
<!-- <link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"> -->
<!-- <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> -->
<!-- <script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script> -->

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<%-- <c:if test="${pagedListHolder.pageCount > 1}">
	<ul class="pagination">
		<c:if test="${!pagedListHolder.firstPage}">
			<li class="previous"><a
				href="<%=StringUtils.replace(pagedLink, "~", String.valueOf(pagedListHolder.getPage() - 1))%>"><</a></li>
		</c:if>
		<c:if test="${pagedListHolder.firstLinkedPage > 0}">
			<li><a href="<%=StringUtils.replace(pagedLink, "~", "0")%>">1</a></li>
		</c:if>
		<c:if test="${pagedListHolder.firstLinkedPage > 1}">
			<li><span class="pagingDots">...</span>
			<li>
		</c:if>
		<c:forEach begin="${pagedListHolder.firstLinkedPage}"
			end="${pagedListHolder.lastLinkedPage}" var="i">
			<c:choose>
				<c:when test="${pagedListHolder.page == i}">
					<li class="active"><a href="#">${i+1}</a></li>
				</c:when>
				<c:otherwise>
					<li><a
						href="<%=StringUtils.replace(pagedLink, "~", String.valueOf(jspContext.getAttribute("i")))%>">${i+1}</a>
					</li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if
			test="${pagedListHolder.lastLinkedPage < pagedListHolder.pageCount - 2}">
			<li><span class="pagingDots">...</span></li>
		</c:if>
		<c:if
			test="${pagedListHolder.lastLinkedPage < pagedListHolder.pageCount - 1}">
			<li><a
				href="<%=StringUtils.replace(pagedLink, "~", String.valueOf(pagedListHolder.getPageCount() - 1))%>">${pagedListHolder.pageCount}</a></li>
		</c:if>
		<c:if test="${!pagedListHolder.lastPage}">
			<li class="next"><a
				href="<%=StringUtils.replace(pagedLink, "~", String.valueOf(pagedListHolder.getPage() + 1))%>">></a></li>
		</c:if>
	</ul>
</c:if> --%>

<c:if test="${pagedListHolder.pageCount > 1}">
	<nav aria-label="Page navigation example">
		<ul class="pagination">
			<c:if test="${!pagedListHolder.firstPage}">
				<li class="page-item"><a class="page-link"
					href="<%=StringUtils.replace(pagedLink, "~", String.valueOf(pagedListHolder.getPage() - 1))%>"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						<span class="sr-only">Previous</span>
				</a></li>
			</c:if>
			<c:if test="${pagedListHolder.firstLinkedPage > 0}">
				<li class="page-item"><a class="page-link"
					href="<%=StringUtils.replace(pagedLink, "~", "0")%>">1</a></li>
			</c:if>
<%-- 			<c:if test="${pagedListHolder.firstLinkedPage > 1}">
				<li class="page-item"><span class="pagingDots">...</span></li>
			</c:if> --%>
			<c:forEach begin="${pagedListHolder.firstLinkedPage}"
				end="${pagedListHolder.lastLinkedPage}" var="i">
				<c:choose>
					<c:when test="${pagedListHolder.page == i}">
						<li class="page-item"><a class="page-link" href="#">${i+1}</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link"
							href="<%=StringUtils.replace(pagedLink, "~", String.valueOf(jspContext.getAttribute("i")))%>">${i+1}</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if
				test="${pagedListHolder.lastLinkedPage < pagedListHolder.pageCount - 2}">
				<li class="page-item"><span class="pagingDots">...</span></li>
			</c:if>
			<c:if
				test="${pagedListHolder.lastLinkedPage < pagedListHolder.pageCount - 1}">
				<li class="page-item"><a class="page-link"
					href="<%=StringUtils.replace(pagedLink, "~", String.valueOf(pagedListHolder.getPageCount() - 1))%>">${pagedListHolder.pageCount}</a></li>
			</c:if>
			<c:if test="${!pagedListHolder.lastPage}">
				<li class="page-item"><a class="page-link"
					href="<%=StringUtils.replace(pagedLink, "~", String.valueOf(pagedListHolder.getPage() + 1))%>"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
						class="sr-only">Next</span>
				</a></li>
			</c:if>
		</ul>
	</nav>
</c:if>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>