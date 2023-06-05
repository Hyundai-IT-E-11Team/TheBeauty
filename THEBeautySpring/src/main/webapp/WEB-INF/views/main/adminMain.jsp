<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			<div></div>
			<div>
				<img class="brand-imgurl" src="${adminBrand.brandImgurl}"
					alt="Brand Image">
			</div>
			<div>
				<form action="/theBeauty/reserve/reserveManaging" method="POST">
					<input type="hidden" type="userSeq" value="user.userSeq">
					<input type="hidden" name="brandSeq" value="${adminBrand.brandSeq}">
					<button class="consulting-btn" type="submit">▶ 상담진행하기</button>
				</form>
			</div>
		</div>
		<div class="product">
			<div class="product-img">
				<img class="product-img-1" src="${adminBrand.brandImg1}"
					alt="Brand Image">
			</div>
			<div class="product-img">
				<img class="product-img-2" src="${adminBrand.brandImg2}"
					alt="Brand Image">
			</div>
			<div class="product-img">
				<img class="product-img-3" src="${adminBrand.brandImg3}"
					alt="Brand Image">
			</div>
			<div class="product-img">
				<img class="product-img-4" src="${adminBrand.brandImg4}"
					alt="Brand Image">
			</div>
		</div>

	</div>
</body>
</html>