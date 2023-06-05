<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome The Beauty</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/product/productDetail.css" />
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
   // productDetail 정보를 JavaScript 변수로 초기화
   var productDetail = {
      productVO : {
         productPrice : "${productDetail.productVO.productPrice}"
      }
   };
</script>
</head>
<body>
   <!-- header추가 -->
   <%@ include file="/WEB-INF/views/header/header.jsp"%>
   <!-- 상품 상세정보파트-->
   <hr class='line'>
   <div class="prd-detail-content">
      <div class="prd-info">
         <div class="prd-info-box left">
            <div class="imgview">
               <img class="oracledb"
                  src="${productDetail.productVO.productImgurl}" alt="Product Image">
               <a href="#" class="show-zoom" id="zoom_btn"></a>
            </div>
         </div>
         <div class="prd-info-box">
            <div class="prd-shop">
              <form id="prd-shop-form" action="/theBeauty/main/brandPage" method="post">
                <input type="hidden" name="brandSeq" value="${productDetail.brandVO.brandSeq}" />
                <input type="hidden" name="brandName" value="${productDetail.brandVO.brandName}" />
                <input type="hidden" name="brandImgurl" value="${productDetail.brandVO.brandImgurl}" />
                <input type="hidden" name="brandImg1" value="${productDetail.brandVO.brandImg1}" />
                <input type="hidden" name= "brandImg2" value="${productDetail.brandVO.brandImg2}" />
                <input type="hidden" name="brandImg3" value="${productDetail.brandVO.brandImg3}" />
                <input type="hidden" name="brandImg4" value="${productDetail.brandVO.brandImg4}" />
                <button type="submit" class="moveBrandButton">
                  <img id="logoImg" src="${productDetail.brandVO.brandImgurl}" alt="Brand Image">
                </button>
              </form>
            </div>

            <div class="prd-title">
               <h2>${productDetail.productVO.productName}</h2>
            </div>
            <div class="prd-price-wrap">
               <h3 id="productPrice">${productDetail.productVO.productPrice}</h3>
               <ul class="benefit-info-list">
                  <li><span class="benefit-title">카드혜택</span> <span
                     class="benefit-desc" id="card-benefit"></span></li>
                  <li><span class="benefit-title">무이자</span> <span
                     class="benefit-desc">최대 6개월 (5만원 이상 결제시)</span></li>
                  <li><span class="benefit-title">더머니</span> <span
                     class="benefit-desc">더머니 5% 적립</span></li>
                  <li><span class="benefit-title">적립금</span> <span
                     class="benefit-desc">H.Point 80P 적립<br>KB제휴카드 결제시 최대 1.5% 추가
                        적립</span></li>
                  <li><span class="benefit-title">배송비</span><span
                     class="benefit-desc"><strong id="shipping-fee"></strong></span></li>
               </ul>
            </div>

            <div class="product-control" id="product-control">
            	<button id="decrease-button" onclick="productCounting('-')">-</button>
            	<div id="currCount">1</div>
                <button id="increase-button" onclick="productCounting('+')">+</button>
                <div class="sumPrice">합계</div>
                <div class="sumPrice">${productDetail.productVO.productPrice}</div>
            </div>
            <div class="button-option">
               <form action="/theBeauty/cart/addToCart" method="post">
            	  <input type="hidden" id="productCount" name="productCount"/>
                  <input type="hidden" id="productSeq" name="productSeq" value="${productDetail.productVO.productSeq}"/>
                  <button type="submit" class="cart-button">장바구니</button>
               </form>
               <form action="/theBeauty/reserve/reservePage" method="post">
                  <input type="hidden" id="brandSeq" name="brandSeq" value="${productDetail.brandVO.brandSeq}" />
                  <button type="submit" class="consulting-button">상담신청</button>
               </form>
         
               <button type="button" class="pay-button">바로구매</button>
            </div>
         </div>
      </div>
   </div>

   <script
      src="${pageContext.request.contextPath}/resources/js/product/productDetail.js"></script>
	<script>
	   var defaultCount = 1;
	   document.getElementById("currCount").innerHTML = Number(defaultCount);
   	   document.getElementById("productCount").value = Number(defaultCount);
   </script>
</body>
</html>