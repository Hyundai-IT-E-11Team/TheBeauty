<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/cart/cartPage.css" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<title>장바구니 페이지</title>
</head>
<body>

	<div class="header">
		<a href="/theBeauty/main/mainPage"><img
			src="${pageContext.request.contextPath}/resources/images/mainlogo.png"></a>
	</div>

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
		<div class="cart-bill-container">
			<div class="cart-list-wrapper">
				<c:forEach var="item" items="${cartList}">

					<c:set var="productPrice" value="${item.productVO.productPrice}" />
					<c:set var="formattedPrice"
						value="${productPrice.replace(',', '').replace('원', '')}" />
					<c:set var="itemPrice"
						value="${formattedPrice * item.cartVO.productCount}" />


					<div class="product">
						<!-- 체크박스 영역 -->
						<div class="check-group">
							<input type="checkbox"
								class="product-checkbox icheckbox type-green"
								style="position: relative;">
						</div>
						<!-- 이미지 영역 -->
						<div class="product-img">
							<img src="${item.productVO.productImgurl}">
						</div>
						<!-- 상품 내용 -->
						<div class="product-info">
							<!-- 상품명 -->
							<div class="item-name">
								<a
									href="${pageContext.request.contextPath}/product/detailPage/${item.productVO.productSeq}">${item.productVO.productName}</a>
							</div>
							<!-- 상품옵션 -->
							<div class="option-info">
								<p class="cnt-ctrl">
									<button id="cnt-down-${item.cartVO.productSeq}"
										onclick="productCounting('-', '${item.cartVO.productSeq}')">-</button>
									<input type="text" id="productCount-${item.cartVO.productSeq}"
										class="onlyNumberInput" name="cnt" onclick="this.focus();"
										value="${item.cartVO.productCount}">
									<button id="cnt-up-${item.cartVO.productSeq}"
										onclick="productCounting('+', '${item.cartVO.productSeq}',)">+</button>
								</p>
								<!-- 기본구성 / 추가구성 정보 -->
								<p class="cnt-deliver">
									<span class="deliver"> 무료배송 <input type="hidden"
										name="dlvCost" value="0">
									</span>
								</p>
							</div>
							<!-- 상품가격 및 버튼 -->
							<div class="option-price">
								<div id="itemPrice-${item.cartVO.productSeq}" class="item-price"
									data-price="${formattedPrice}">
									<c:out value="${itemPrice}" />
								</div>
								<div class="btn-area">
									<button class="btn size4 color15" type="button"
										data-product-id="${item.cartVO.productSeq}">상품삭제</button>
									<button class="btn size4 color4" type="button">바로주문</button>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>

			<div class="cart-bill-gap"></div>
			<div class="billprice-wrap">
				<h3 style="margin-top: 0px">결제금액</h3>
				<ul class="billprice" style="padding-left: 0px;">
					<li>
						<div style="margin-bottom: 0px; padding-bottom: 40px;">
							<h4 style="margin-top: 0px; margin-bottom: 0px;">총 주문금액</h4>
							<p style="margin-top: 0px; margin-bottom: 0px;">
								<strong><span id="totOrdPrc"></span></strong>
							</p>
						</div>
						<ul class="sub plus" style="padding-left: 0px;">
							<li>
								<h5>상품금액</h5>
								<p style="margin-top: 0px;">
									<span id="totProdPrc"></span>
								</p>
							</li>
							<li>
								<h5 style="margin-bottom: 0px; margin-top: 50px;">배송비</h5>
								<p>
									<span id="totDlvCost">무료</span>
								</p>
							</li>
						</ul>
					</li>

					<li class="total" style="margin-top: 30px;">
						<div>
							<h4 style="margin-bottom: 0px; margin-top: 0px;">결제 예정 금액</h4>
							<p style="padding-top: 0px; margin-top: 0px; margin-bottom: 0px;">
								<strong><span id="payPrc"></span></strong>
							</p>
						</div>

					</li>
				</ul>
				<p class="attention">* 실제 결제 금액은 할인 및 추가혜택에 따라 달라질 수 있습니다.</p>
				<div class="btn-wrap">
					<a href="#" class="btn size7 color9 full" onclick="#">주문하기</a>
				</div>
			</div>
		</div>
	</div>

	<script
		src="${pageContext.request.contextPath}/resources/js/cart/cartPage.js"></script>

</body>
</html>