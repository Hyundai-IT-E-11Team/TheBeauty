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
	<div class="productlist-wrap">
	<div class="brand-container">
		<div class="brand-consulting">
			<div></div>
			<div>
				<img class="brand-imgurl" src="${brand.brandImgurl}"
					alt="Brand Image">
			</div>
			<div>
				<form action="/theBeauty/reserve/reservePage" method="POST">
					<input type="hidden" type="userSeq" value="user.userSeq"> <input
						type="hidden" name="brandSeq" value="${brand.brandSeq}">
					<button class="consulting-btn" type="submit">▶ 상담예약</button>
				</form>
			</div>
		</div>
		<div class="product">
			<div id="prodImgset">
				<div class="product-img">
					<img class="product-img-1" src="${brand.brandImg1}"	alt="Brand Image">
				</div>
				<div class="product-img">
					<img class="product-img-2" src="${brand.brandImg2}" alt="Brand Image">
				</div>
			</div>
			<div id="prodImgset">
				<div class="product-img">
					<img class="product-img-3" src="${brand.brandImg3}" alt="Brand Image">
				</div>
				<div class="product-img">
					<img class="product-img-4" src="${brand.brandImg4}"	alt="Brand Image">
				</div>
			</div>
		</div>
		<div class="product-list">
			<c:forEach var="productDetail" items="${products}">
				<a
					href="${pageContext.request.contextPath}/product/detailPage/${productDetail.productVO.productSeq}"
					class="product"><img
					src="${productDetail.productVO.productImgurl}" width="256px"
					height="256px">
					<div class="product-price">${productDetail.productVO.productPrice}</div>
					<div class="product-name">${productDetail.productVO.productName}</div>
				</a>
			</c:forEach>
		</div>
	</div>
	</div>
	<!-- pagination 추가 -->
	<jsp:include page="/WEB-INF/views/main/brandPagination.jsp">
		<jsp:param name="brandSeq" value="${brandSeq }" />
		<jsp:param name="paginationNum" value="${paginationNum }" />
		<jsp:param name="page" value="${page}" />

	</jsp:include>
</body>
</html>