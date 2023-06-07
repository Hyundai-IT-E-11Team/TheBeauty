<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>THEBeauty 로그인</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user/login.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<h1>로그인</h1>
	<hr>
	<div id="outter">
		<div id="container">
			<h3>더뷰티닷컴 회원</h3>
			<form>
				<div>
					<input placeholder="더현대닷컴 이메일" class="textInput" type="email" id="userMail" name="userMail"> <br> 
					<input placeholder="더현대닷컴 비밀번호" class="textInput" type="password" id="userPw" name="userPw">
				</div>
				<input id="loginBtn" type="button" onclick="checklogin()" value="로그인">
			</form>
			<div class="text-box" id="bottom">
				<a href="registerPage" id="registerPage">회원가입</a>
				<a href="findEmail" id="findEmail">아이디 찾기</a>
				<a href="password" id="password">비밀번호 찾기</a>
			</div>
		</div>
	</div>
	<script	src="${pageContext.request.contextPath}/resources/js/user/register.js"></script>
</body>
</html>