<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="../resources/js/checkMailDuplicate.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	회원가입 페이지
	<br>
	<form id="register" action="register" method="post">
		이메일 : <input type="email" id="userMail" name="userMail">
		<button type="button" onclick="checkMail()">중복확인</button><br>
		비밀번호 : <input type="password" id="userPw" name="userPw"><br>
		비밀번호 확인: <input type="password" id="checkPassword" name="checkPassword"><br>
		이름 : <input type="text" id="userName" name="userName"><br>
		주민번호 : <input type="text" id="userRegistration" name="userRegistration"><br>
		전화번호 : <input type="text" id="userMobile" name="userMobile"><br>
		<input type="submit" value="회원가입">
	</form>

<script>
$("#register").submit(function(event) {
	let status = $('#userMail').attr('status');
    var userPw = $("#userPw").val();
    var checkPassword = $("#checkPassword").val();
    
    if(status !== "yes"){
    	alert("이메일 중복확인을 하십시오.");
        event.preventDefault();
        return;
	}
    if (userPw !== checkPassword) {
        alert("비밀번호와 확인 비밀번호가 일치하지 않습니다.");
        event.preventDefault();
        return;
    }
    
});
</script>
</body>
</html>