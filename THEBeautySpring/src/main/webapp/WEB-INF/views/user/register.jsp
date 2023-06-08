<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TheBeauty 회원가입</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/user/register.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<h1>회원가입</h1>
	<div id="outter">
		<div></div>
		<div id="container">
			<h3>더뷰티닷컴 회원가입</h3>
			<div class="signup-form">
				<div>
					<input placeholder="이메일" class="textInput" type="email"
						id="userMail" name="userMail">
					<button id="checkBtn" type="button" onclick="checkMail()">중복확인</button>
					<br> 
					<input placeholder="비밀번호" class="textInput" type="password" id="userPw" name="userPw"> <br> 
					<input placeholder="비밀번호 확인" class="textInput" type="password"id="checkPassword" name="checkPassword"> <br> 
					<input placeholder="이름" class="textInput" type="text" id="userName" name="userName"><br> 
					<input placeholder="주민등록번호" class="textInput" type="text" id="userRegistration" name="userRegistration"> <br> 
					<input placeholder="전화번호" class="textInput" type="text" id="userMobile" name="userMobile"><br>
				</div>
				<div>
					<button id="registerBtn" onclick="register()">회원가입</button>
				</div>
			</div>
			<script
				src="${pageContext.request.contextPath}/resources/js/user/register.js"></script>
		</div>
		<br>
	</div>
</body>
</html>