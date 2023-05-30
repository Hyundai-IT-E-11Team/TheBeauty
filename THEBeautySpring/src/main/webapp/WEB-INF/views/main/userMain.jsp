<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome The Beauty</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main/userMain.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<!-- 상위 헤더 파트-->
	<div id=totalContatiner">
		<div id="header">
			<div id="mainLogo">
				<a href="mainPage"><img
					src="${pageContext.request.contextPath}/resources/images/mainlogo.png"></a>
			</div>
			<form id="searchBox" action="searchItem">
				<input type="text" class="search-input" id="kewword" name="keyword">
				<button type="submit" id="searchClick" onclick="checkEmpty()">
					<img
						src="${pageContext.request.contextPath}/resources/images/searchButton.png">
				</button>
			</form>
			<div id="userInterface">
				<a class="bigButton" href="../user/login">로그인 / 회원가입</a>
				<a class="smallButton" href="">마이뷰티</a> 
				<a class="smallButton" href="">장바구니</a>
				<a class="smallButton" href="">바로상담</a>
			</div>
		</div>
		<!-- 카테고리 파트-->
		<div class="category">
				<ul class="nav-links">
					<li class="dropdown"><a href="#"><img
							src="${pageContext.request.contextPath}/resources/images/menu.png"></a>
						<div class="mega-box">
							<div class="content">
								<div class="row">
									<header>화장품</header>
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
				</ul>
				<div class="additional-menu">
					<a href="#">SKINCARE</a> <a href="#">FOUNDATION</a> <a href="#">LIP</a>
					<a href="#">EYE</a>
				</div>
			</div>
		<!-- 이미지 슬라이드 파트-->
		<div id="mainImg">
			<div class="wrapper">
				<div class="title">
					<img
						src="${pageContext.request.contextPath}/resources/images/premiumconsulting_logo.png"
						alt="img">
				</div>
				<i id="left" class="fa-solid fa-angle-left"></i>
				<div class="carousel">
					<a href="#"><img
						src="${pageContext.request.contextPath}/resources/images/img01.jpg"
						alt="img"></a> <a href="#"><img
						src="${pageContext.request.contextPath}/resources/images/img02.jpg"
						alt="img"></a> <a href="#"><img
						src="${pageContext.request.contextPath}/resources/images/img03.jpg"
						alt="img"></a> <a href="#"><img
						src="${pageContext.request.contextPath}/resources/images/img04.jpg"
						alt="img"></a> <a href="#"><img
						src="${pageContext.request.contextPath}/resources/images/img08.jpg"
						alt="img"></a> <a href="#"><img
						src="${pageContext.request.contextPath}/resources/images/img09.jpg"
						alt="img"></a> <a href="#"><img
						src="${pageContext.request.contextPath}/resources/images/img10.jpg"
						alt="img"></a>
				</div>
				<i id="right" class="fa-solid fa-angle-right"></i>
			</div>
		</div>
	</div>
	<script
		src="${pageContext.request.contextPath}/resources/js/main/userMain.js"></script>
</body>
</html>
