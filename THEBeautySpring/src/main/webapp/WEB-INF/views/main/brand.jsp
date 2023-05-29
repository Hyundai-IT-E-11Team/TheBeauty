<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome The Beauty</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main/brand.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>
	<!-- header추가 -->
	<%@ include file="/WEB-INF/views/header/header.jsp"%>
	<div class="container">
		<div class="brand-consulting">
			<div>
			</div>
			<div>
				<img class="brand-imgurl" src="${brand.brandImgurl}"
					alt="Brand Image">
			</div>
			<div>
				<form action="/reservationPage" method="POST">
					<input type="hidden" type="userSeq" value="user.userSeq"> <!-- 수정필요 -->
			        <input type="hidden" name="brandName" value="${brand.brandName}">
			        <button class="consulting-btn" type="submit">▶ 상담예약</button>
				</form>
			</div>
		</div>
		<div class="product">
			<div class="product-img">
				<img class="product-img-1" src="${brand.brandImg1}"
					alt="Brand Image">
			</div>
			<div class="product-img">
				<img class="product-img-2" src="${brand.brandImg2}"
					alt="Brand Image">
			</div>
			<div class="product-img">
				<img class="product-img-3" src="${brand.brandImg3}"
					alt="Brand Image">
			</div>
			<div class="product-img">
				<img class="product-img-4" src="${brand.brandImg4}"
					alt="Brand Image">
			</div>
		</div>
	</div>
</body>
</html>