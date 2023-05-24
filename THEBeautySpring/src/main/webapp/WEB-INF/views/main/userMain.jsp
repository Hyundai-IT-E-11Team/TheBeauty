<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome The Beauty</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main/userMain.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/main/userMain.js"></script>
</head>
<body>
	<div id="outter">
			<div id="mainlogo">
				<a href="mainPage"><img	src="${pageContext.request.contextPath}/resources/img/mainlogo.png"></a>
			</div>
			<div id="mainsearch">
				<form action="searchItem">
					<input type="text" class="top-con-search-input" id="kewword" name="keyword">
					<button type="submit" id="searchItem" onclick="checkEmpty()">
						<img src="${pageContext.request.contextPath}/resources/img/searchButton.png">
					</button>
				</form>
			</div>
			<div id="userInterface">
				<a href="../user/login">로그인 / 회원가입</a>
				<a href="">마이뷰티</a>
				<a href="">장바구니</a>
				<a href="">바로상담</a>
			</div>
	</div>
</body>
</html>

