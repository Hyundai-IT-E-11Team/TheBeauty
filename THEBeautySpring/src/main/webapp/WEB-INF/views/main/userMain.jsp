<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome The Beauty</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/main/userMain.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script	src="${pageContext.request.contextPath}/resources/js/main/userMain.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/main/userMain.js" defer></script>
</head>
<body>
  <!-- 상위 로고 파트-->
  <div id="outter">
			<div id="mainlogo">
				<a href="mainPage"><img	src="${pageContext.request.contextPath}/resources/img/mainlogo.png"></a>
			</div>
			<div id="mainsearch">
				<form action="searchItem">
					<input type="text" class="top-con-search-input" id="kewword" name="keyword">
					<button type="submit" id="searchItem" onclick="checkEmpty()">
						<img src="${pageContext.request.contextPath}/resources/img/searchButton.png">
					</button>
				</form>
			</div>
			<div id="userInterface">
				<a href="../user/login">로그인 / 회원가입</a>
				<a href="">마이뷰티</a>
				<a href="">장바구니</a>
				<a href="">바로상담</a>
			</div>
	</div>
	<br> <!-- 이미지 슬라이드 파트-->
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
</body>
</html>

