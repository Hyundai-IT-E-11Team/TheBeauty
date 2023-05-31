<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/product/pagination.css" />
<!-- Fontawesome CDN Link -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
	
</head>
<body>
	<div class="container">
		<button class="button" id="startBtn" >
			<i class="fa-solid fa-angles-left"></i>
		</button>
		<button class="button prevNext" id="prev" >
			<i class="fa-solid fa-angle-left"></i>
		</button>

		<div class="links">
			<%-- 자식 페이지에서 받은 int 변수 --%>
			<%
				int paginationNum = Integer.parseInt(request.getParameter("paginationNum"));
				int currentPage = Integer.parseInt(request.getParameter("page"));
				int displayPageRange = 10;
			%>

			<%-- 일반적인 for 루프를 사용하여 반복 작업 수행 --%>
			<%
				int startPage = (currentPage - 1) / displayPageRange * displayPageRange + 1;
				int endPage = Math.min(startPage + displayPageRange - 1, paginationNum); // 페이지 수를 넘지 않도록 제한

				for (int i = startPage; i <= endPage; i++) {
					int pageNum = i;
					String linkClass = (pageNum == currentPage) ? "link active" : "link";
			%>
			<a
				href="${pageContext.request.contextPath}/product/search?productName=${productName}&page=<%= pageNum %>"
				class="<%= linkClass %>"><%=pageNum%></a>
			<%
				}
			%>

		</div>

		<button class="button prevNext" id="next">
			<i class="fa-solid fa-angle-right"></i>
		</button>
		<button class="button" id="endBtn">
			<i class="fa-solid fa-angles-right"></i>
		</button>
	</div>

	<script
		src="${pageContext.request.contextPath}/resources/js/product/pagination.js"></script>
</body>
</html>