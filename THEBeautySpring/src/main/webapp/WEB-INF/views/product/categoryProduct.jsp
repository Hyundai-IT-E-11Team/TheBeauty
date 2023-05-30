<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
    href="${pageContext.request.contextPath}/resources/css/product/productList.css" />
<title>Product List</title>
<!-- Fontawesome CDN Link -->
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
</head>
<body>
    <!-- header추가 -->
    <%@ include file="/WEB-INF/views/header/header.jsp"%>

    <!-- productList 시작  -->
    <div class="productlist-wrap">
        <div class="products">
            <div class="keyword-wrap">
                <div class="keyword">
                    <span>${productCategory}</span>
                    <p>
                        <span>검색결과</span> 상품 <em id="totalCnt">${ products.size() }</em> 개
                    </p>
                </div>
            </div>
            <div class="product-list">
                <c:forEach items="${products}" var="product">
                    <a href="${pageContext.request.contextPath}/product/detailPage/${product.productSeq}" class="product"> <img src="${product.productImgurl}" width="256px" height="256px">
                        <div class="product-price">${product.productPrice}</div>
                        <div class="product-name">${product.productName}</div>
                    </a>
                </c:forEach>
            </div>
        </div>
    </div>
    
    <script
        src="${pageContext.request.contextPath}/resources/js/product/productList.js"></script>
</body>
</html>
