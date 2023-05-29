<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome The Beauty</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/product/brand.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>
	<!-- header추가 -->
	<%@ include file="/WEB-INF/views/header/header.jsp"%>
	brandSeq : ${brand.brandSeq}
	<div class="container">
		<div class="brand">
			<img class="brand-imgurl" src="${brand.brandImgurl}"
				alt="Brand Image">
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