<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/cart/cartPage.css" />
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
	   
	      <div class="product">
	      	<!-- 체크 영역 -->
	      	<div class="check-group">
	      		<div class="icheckbox type-green" style="position: relative;"></div>
	      	</div>
	     	<!-- 이미지 영역 -->
	        <div class="product-img"><img src="${item.productVO.productImgurl}"></div>
	        <!-- 상품 내용 -->
	        <div class="product-info">
	        	<!-- 상품명 -->
	           <div class="item-name">${item.productVO.productName}</div>
	           <div class="item-count">${item.cartVO.productCount}개</div>
	           <!-- 상품옵션 -->
	           <div class="option-info">
					<p class="cnt-ctrl">
						<a href="javascript:void(0);" class="cnt-up" onclick="minusOrdQty(this, '', '40A0135074', '00002', '01'); return false;">－</a>
						<input type="text" class="onlyNumberInput" name="cnt" title="inputarea" value="1" style="ime-mode:disabled;" onclick="this.focus();" onblur="checkOrdQty(this, 3, '40A0135074', '00002', '01')" maxlength="2">
						<a href="javascript:void(0);" class="cnt-down" onclick="plusOrdQty(this, '', 3, '40A0135074', '00002', '01'); return false;">＋</a>
					</p>
					<!-- 기본구성 / 추가구성 정보 -->
					<p class="cnt-deliver">
						<span class="deliver">
                                   	 무료배송
                               <input type="hidden" name="dlvCost" value="0">
						</span>
					</p>
			</div>
	           <!-- 상품가격 및 버튼 -->
	           <div class="option-price">
	           		<div class="item-price">${item.productVO.productPrice}</div>
	           		<div class="btn-area">
	           			<button class="btn size4 color15" type="button">옵션변경</button>
	           			<button class="btn size4 color4" type="button">바로주문</button>
	           		</div>
	           </div>
	        </div>
	     </div>
	  </c:forEach>
	  </div>
	   
	   <div class="cart-bill-gap"></div>
	   <div class="billprice-wrap">
	   		<h3>결제금액</h3>
	   		<ul class="billprice" style="padding-left: 0px;">
				<li>
					<div>
						<h4>총 주문금액</h4>
						<p><strong><span id="totOrdPrc">128,000</span></strong> 원</p>
					</div>
					<ul class="sub plus" style="padding-left: 0px;">
						<li>
							<h5>상품금액</h5>
							<p><span id="totProdPrc">128,000</span> 원</p>
						</li>
						<li>
							<h5>배송비</h5>
							<p><span id="totDlvCost">무료</span></p>
						</li>
					</ul>
				</li>

				<li class="total">
					<div>
						<h4>결제 예정 금액</h4>
						<p><strong><span id="payPrc">128,000</span></strong> 원</p>
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
      src="${pageContext.request.contextPath}/resources/js/product/productDetail.js"></script>
</body>
</html>