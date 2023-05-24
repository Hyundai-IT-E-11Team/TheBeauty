<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main/userMain.css" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
<%-- <script src="${pageContext.request.contextPath}/resources/js/main/.js" defer></script> --%>
</head>
<body>
	<br>
	<div class="wrapper">
	<div class="title">
		<img src="${pageContext.request.contextPath}/resources/images/premiumconsulting_logo.png" alt="img">
	</div>
	<i id="left" class="fa-solid fa-angle-left"></i>
		<div class="carousel">
			<a href="#"><img src="${pageContext.request.contextPath}/resources/images/img01.jpg" alt="img"></a>
			<a href="#"><img src="${pageContext.request.contextPath}/resources/images/img02.jpg" alt="img"></a>
			<a href="#"><img src="${pageContext.request.contextPath}/resources/images/img03.jpg" alt="img"></a>
			<a href="#"><img src="${pageContext.request.contextPath}/resources/images/img04.jpg" alt="img"></a>
			<a href="#"><img src="${pageContext.request.contextPath}/resources/images/img08.jpg" alt="img"></a>
			<a href="#"><img src="${pageContext.request.contextPath}/resources/images/img09.jpg" alt="img"></a>
			<a href="#"><img src="${pageContext.request.contextPath}/resources/images/img10.jpg" alt="img"></a>
		</div>
	<i id="right" class="fa-solid fa-angle-right"></i>
	
	</div>
	<script src="${pageContext.request.contextPath}/resources/js/main/userMain.js" defer></script>
</body>
</html>