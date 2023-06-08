<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user/findEmail.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>			
<script src="${pageContext.request.contextPath}/resources/js/user/findEmail.js"></script>
<style>
#idSearchBtn {
	background-color: #000000;
	color: #ffffff;
	border: none;
	text-decoration: none;
	text-align: center;
	cursor: pointer;
	height: 40px;
	width: 150px;
	margin-top: 10px;
	margin-left: auto;
	margin-right: auto;
	display: block;
}
</style>
</head>
<body>
	<h1>아이디 찾기</h1>
	<hr>
	<div id="outter">
		<div id="container">
			<h3>회원정보입력</h3>
			<form action="findEmail" method="POST">
				<div>
					<input placeholder="이  름" class="textInput" id="userName" name="userName"> <br> 
					<input placeholder="주민등록번호" class="textInput" type="password" id="userRegistration" name="userRegistration"><br>
					<input id="idSearchBtn" type="submit" value="아이디찾기" onclick="findEmail()">
				</div>
			</form>
</body>
</html>