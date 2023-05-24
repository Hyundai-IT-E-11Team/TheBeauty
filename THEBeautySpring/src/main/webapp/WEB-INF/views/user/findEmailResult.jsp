<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>THEBeauty 아이디 찾기 결과</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user/findEmail.css" />
</head>
<body>
	<h1>아이디 검색 결과</h1>
	<hr>
	<div id="outter">
		<div id="container">
		<c:if test="${not empty userEmail}">
		<div class="text-box">
			<p>고객님의 아이디는</p>
			<p><h3>${ userEmail }</h3></p>
			<p>입니다!</p>
		</div>
		</c:if>
		<c:if test="${empty userEmail}">
			<p>입력하신 정보에 맞는 아이디가 존재하지 않습니다.</p>
		</c:if>
		
			<div id="bottom123"  style="font-size: 10px;">
				<a href="login">로그인하러가기</a>&nbsp;/&nbsp;
				<a href="findEmail">아이디재검색</a>&nbsp;/&nbsp;
				<a href="password">비밀번호찾기</a>
			</div>
</body>
</html>