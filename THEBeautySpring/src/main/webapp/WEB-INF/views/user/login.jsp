<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>THEBeauty 로그인</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/user/login.css" />
</head>
<body>
	<h1>로그인</h1>
	<hr>
	<div id="outter">
		<div id="container">
			<h3>더뷰티닷컴 회원</h3>
			<form action="" method="POST">
				<div>
					<input placeholder="더현대닷컴 이메일" class="textInput" type="email" name="mail"> <br> 
					<input placeholder="더현대닷컴 비밀번호" class="textInput"
						type="password" name="pw">
				</div>
				<input id="loginBtn"  type="submit" value="로그인">
			</form>
			<div id="bottom">
			<div>
				<input type="checkbox"> 아이디 저장하기
			</div>
				<div>
				<a href="findEmail">
				<button>아이디 찾기</button>
				</a>
				<a href="password">
				<button>비밀번호 찾기</button>
				</a>
				</div>
			</div>
			<a href="registerPage">회원가입</a>
		</div>
	</div>
</body>
</html>