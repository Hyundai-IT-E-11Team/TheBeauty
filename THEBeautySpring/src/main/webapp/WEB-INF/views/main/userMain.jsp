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
	<br> <!-- 카테고리 파트-->
	<nav>
		<div class="wrapper">
			<ul class="nav-links">
				<li><a href="#"><img
						src="${pageContext.request.contextPath}/resources/img/menu.png"></a>
					<div class="mega-box">
						<div class="content">
							<div class="row">
								<header>화장품</header>
								<ul class="mega-links">
								</ul>
							</div>
							<div class="row">
								<ul class="mega-links">
									<li><a href="#">& Other Stories</a></li>
									<li><a href="#">CHANNEL BEAUTY</a></li>
									<li><a href="#">Dior</a></li>
									<li><a href="#">아모레퍼시픽</a></li>
									<li><a href="#">SISLEY</a></li>
									<li><a href="#">L'OCCITANE</a></li>
									<li><a href="#">CREED</a></li>
									<li><a href="#">Hermes</a></li>
									<li><a href="#">TOM FORD BEAUTY</a></li>
									<li><a href="#">GUCCI BEAUTY</a></li>
									<li><a href="#">LANCOME</a></li>
									<li><a href="#">GUERLAIN</a></li>
								</ul>
							</div>
							<div class="row">
								<ul class="mega-links">
									<li><a href="#">Augustinus Bader</a></li>
									<li><a href="#">GIVENCHY</a></li>
									<li><a href="#">CLARINS</a></li>
									<li><a href="#">LA MER</a></li>
									<li><a href="#">LA PRAIRIE</a></li>
									<li><a href="#">VALMONT</a></li>
									<li><a href="#">Be CLEAN</a></li>
									<li><a href="#">Oera</a></li>
									<li><a href="#">SK-||</a></li>
									<li><a href="#">NARS</a></li>
									<li><a href="#">메종 마르지엘라</a></li>
									<li><a href="#">리바이리</a></li>
								</ul>
							</div>
						</div>
					</div></li>
				<div class="additional-menu">
					<li><a href="#">SKINCARE</a></li>
					<li><a href="#">FOUNDATION</a></li>
					<li><a href="#">LIP</a></li>
					<li><a href="#">EYE</a></li>
				</div>
			</ul>
		</div>
	</nav>
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
