<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 페이지</title>
</head>
<body>
	<!-- header추가 -->
	<%@ include file="/WEB-INF/views/header/header.jsp"%>
	<h2>장바구니 페이지</h2>
	<c:forEach var="item" items="${cartList}">
		<img src="${item.productVO.productImgurl}">
		<div class="item-name">${item.productVO.productName}</div>
		<div class="item-price">${item.productVO.productPrice}</div>
		<div class="item-count">${item.cartVO.productCount}</div>
	</c:forEach>	
</body>
</html>