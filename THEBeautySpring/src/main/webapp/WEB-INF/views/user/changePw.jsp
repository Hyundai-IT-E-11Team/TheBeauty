<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 변경</title>
    <link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/user/changePw.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>
    <h1>비밀번호 변경</h1>
   	<hr>
   	<div id="outter">
		<div id="container">
    <h3>더뷰티닷컴 비밀번호 변경</h3>

	    <form id="passwordChangeForm" class="content" action="updatePassword" method="post">
	    	<div>
		        <input placeholder="더현대닷컴 이메일" class="textInput" name="userMail" type="mail" required/><br>
    		    <input placeholder="새 비밀번호" class="textInput" name="userPw" type="password" id="newPassword"required/><br>
		        <input placeholder="새 비밀번호 확인" class="textInput" name="confirmPassword" type="password" id="confirmPassword"required/><br>
			</div>
        	<input type="submit" id="changeUserInfoBtn" value="비밀번호 변경">
	    </form>
        </div>
	</div>
	<script
      src="${pageContext.request.contextPath}/resources/js/user/changePw.js"></script>
	
</body>
</html>
