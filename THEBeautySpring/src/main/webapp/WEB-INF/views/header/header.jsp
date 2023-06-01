<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <title>Welcome The Beauty</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link
    rel="stylesheet"
    href="${pageContext.request.contextPath}/resources/css/header/header.css"
  />
  <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
  />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script>
    let nextReservation = "${nextReservation}";
    let [year, month, day] = "${nextReservation.reserveDate}".split("-");
    let [hour, min] = "${nextReservation.reserveTime}".split(":");
    let open = new Date(year, month - 1, day, hour, min);

    function remaindTime() {
      if (nextReservation) {
        let now = new Date();
        let nt = now.getTime();
        let ot = open.getTime();
        if (nt < ot) {
          // 현재시간이 오픈시간보다 이르면 오픈시간까지의 남은 시간을 구한다.
          sec = parseInt(ot - nt) / 1000;
          hour = parseInt(sec / 60 / 60);
          sec = sec - hour * 60 * 60;
          min = parseInt(sec / 60);
          sec = parseInt(sec - min * 60);

          if (hour < 10) {
            hour = "0" + hour;
          }
          if (min < 10) {
            min = "0" + min;
          }
          if (sec < 10) {
            sec = "0" + sec;
          }
          $("#d-day-hour").html(hour);
          $("#d-day-min").html(min);
          $("#d-day-sec").html(sec);
        } else {
          // 현재시간이 종료시간보다 크면
          clearInterval(counter);
          $("#alert-box").html(
            "<a href='/theBeauty/consult'>상담 시작하기</a>"
          );
        }
      }
    }
    let counter = setInterval(remaindTime, 1000);
  </script>
</head>
<body>
	<!-- 상위 헤더 파트-->
	<div id=totalContatiner">
		<div id="header">
			<div id="mainLogo">
				<a href="/theBeauty/main/mainPage"><img
					src="${pageContext.request.contextPath}/resources/images/mainlogo.png"></a>
			</div>
			<form id="searchBox"
				action="${pageContext.request.contextPath}/product/search"
				method="get">
				<input type="text" class="search-input" id="keyword"
					name="productName">
				<button type="submit" id="searchClick" onclick="checkEmpty()">
					<img
						src="${pageContext.request.contextPath}/resources/images/searchButton.png">
				</button>
			</form>

			<div id="userInterface">
				<a class="bigButton" href="/theBeauty/user/login">로그인 / 회원가입</a> <a
					class="smallButton" href="">마이뷰티</a> <a class="smallButton" href="">장바구니</a>
				<c:if test="${not empty nextReservation }">
					<div id="alert-box">
						<div>상담까지 남은 시간</div>
						<div>
							<span id="d-day-hour">00</span> <span class="col">:</span> <span
								id="d-day-min">00</span> <span class="col">:</span> <span
								id="d-day-sec">00</span>
						</div>
					</div>
				</c:if>
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
				<a href="/theBeauty/product/category/SKINCARE">SKINCARE</a> <a
					href="/theBeauty/product/category/FOUNDATION">FOUNDATION</a> <a
					href="/theBeauty/product/category/LIP">LIP</a> <a
					href="/theBeauty/product/category/EYE">EYE</a>
			</div>
		</div>
	</div>
</body>
</html>