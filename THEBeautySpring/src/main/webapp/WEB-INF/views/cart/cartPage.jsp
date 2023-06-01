<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/cart/cart.css" />
<title>장바구니 페이지</title>
</head>
<body>
	<!-- header추가 -->
	<%@ include file="/WEB-INF/views/header/header.jsp"%>
<div class="container">

	<div class="title-head">
	<h2>장바구니</h2>
		<div class="stepwrap">

			<div class="step-box 01 current">
				<span class="mark"><img
						src="${pageContext.request.contextPath}/resources/images/step01.png"
						alt="img"></span>
				<div class="pcontainer current">
					<p>STEP 01</p>
					<p>장바구니</p>
				</div>
			</div>
			
			<span class="step-mark"><img
						src="${pageContext.request.contextPath}/resources/images/nextstep.png"
						alt="img"></span>
			<div class="step-box 02">
				<span class="mark"><img
						src="${pageContext.request.contextPath}/resources/images/step02.png"
						alt="img"></span>
				<div class="pcontainer">
					<p>STEP 02</p>
					<p>주문서작성</p>
				</div>
			</div>

			<span class="step-mark"><img
						src="${pageContext.request.contextPath}/resources/images/nextstep.png"
						alt="img"></span>
			<div class="step-box 03">
				<span class="mark"><img
						src="${pageContext.request.contextPath}/resources/images/step03.png"
						alt="img"></span>
				<div class="pcontainer">
					<p>STEP 03</p>
					<p>주문완료</p>
				</div>
			</div>
		</div>
	</div>

	
	<!-- 상품 부분  -->
	<c:forEach var="item" items="${cartList}">
		<div class="product">
			<div class="product-img"><img src="${item.productVO.productImgurl}"></div>
			<div class="product-info">
				<div class="item-name">${item.productVO.productName}</div>
				<div class="item-count">${item.cartVO.productCount}개</div>
               <div class="item-price">${item.productVO.productPrice}</div>
			</div>
		</div>
	</c:forEach>
</div>	

 <script
      src="${pageContext.request.contextPath}/resources/js/product/productDetail.js"></script>
</body>
</html>