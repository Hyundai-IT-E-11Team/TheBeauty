<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<h1>회원가입</h1>
	<form action="${pageContext.request.contextPath}/register"
		method="post">
		<div>
			<label for="email">이메일:</label> <input type="email" id="email"
				name="userMail" required>
			<button type="button" onclick="checkEmail()">중복확인</button>
		</div>
		<div>
			<label for="password">비밀번호:</label> <input type="password"
				id="password" name="userPw" required>
		</div>
		<div>
			<label for="confirmPassword">비밀번호 확인:</label> <input type="password"
				id="confirmPassword" name="confirmPassword" required>
		</div>
		<div>
			<label for="name">이름:</label> <input type="text" id="name"
				name="userName" required>
		</div>
		<div>
			<label for="registration">주민등록번호:</label> <input type="text"
				id="registration" name="userRegistration" required>
		</div>
		<div>
			<label for="mobile">전화번호:</label> <input type="tel" id="mobile"
				name="userMobile" required>
		</div>
		<div>
			<input type="submit" value="회원가입">
		</div>
	</form>

	<script>
		function checkEmail() {
			var email = document.getElementById("email").value;

			// AJAX 요청을 통해 서버에 이메일 중복확인 요청
			var xhr = new XMLHttpRequest();
			xhr.open("GET",
					"${pageContext.request.contextPath}/checkEmail?email="
							+ email, true);
			xhr.onreadystatechange = function() {
				if (xhr.readyState === XMLHttpRequest.DONE
						&& xhr.status === 200) {
					var response = JSON.parse(xhr.responseText);
					if (response.duplicated) {
						alert("중복된 이메일입니다.");
					} else {
						alert("사용 가능한 이메일입니다.");
					}
				}
			};
			xhr.send();
		}
	</script>

</body>
</html>
