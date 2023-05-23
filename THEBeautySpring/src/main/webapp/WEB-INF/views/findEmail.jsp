<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
아이디 찾기 화면입니다
<form action="/user/findEmail" method="post">
	이름 : <input type="text" id="userName" name="userName" >
	주민번호 : <input type="text" id="userRegistration" name="userRegistration">
	<input type="submit" value="아이디찾기">  
</form>
</body>
</html>