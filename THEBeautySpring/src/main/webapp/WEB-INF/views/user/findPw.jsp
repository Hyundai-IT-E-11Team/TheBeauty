<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 찾기</title>
    <link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/user/findPw.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>
    <h1>비밀번호 찾기</h1>
    <hr>
   	<div id="outter">
		<div id="container">
	    <h3>더뷰티닷컴 비밀번호 찾기</h3>
	    <form id="passwordFindForm" class="content" action="changePassword" method="post">
	        <div>
	            <input placeholder="더현대닷컴 이메일" class="textInput" name="userMail" type="email" required /> <br>
	            <input placeholder="더현대닷컴 주민번호" class="textInput" name="userRegistration" id="userRegistration" type="text" required />
   	        </div>
	        <input type="submit" value="회원정보 찾기" id="findUserInfoBtn">
	    </form>
        </div>
	</div>
    <script src="findPw.js"></script>
</body>
</html>
