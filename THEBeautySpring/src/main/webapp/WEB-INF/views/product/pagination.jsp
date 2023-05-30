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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
</head>
<body>
	<div class="container">
		<button class="button">
			<i class="fa-solid fa-angles-left"></i>
		</button>
		<button class="button">
			<i class="fa-solid fa-angle-left"></i>
		</button>
		
		<div class="button">
			<a href="#" class="link">1</a>
			<a href="#" class="link">2</a>
			<a href="#" class="link">3</a>
			<a href="#" class="link">4</a>
			<a href="#" class="link">5</a>
			<a href="#" class="link">6</a>
			<a href="#" class="link">7</a>
			<a href="#" class="link">8</a>
			<a href="#" class="link">9</a>
			<a href="#" class="link">10</a>
		</div>
		
		<button class="button">
			<i class="fa-solid fa-angles-right"></i>
		</button>
		<button class="button">
			<i class="fa-solid fa-angle-right"></i>
		</button>
	</div>
	
	<script
		src="${pageContext.request.contextPath}/resources/js/product/productList.js"></script>
</body>
</html>