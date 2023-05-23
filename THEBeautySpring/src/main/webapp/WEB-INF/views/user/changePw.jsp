<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 변경</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
        .btn-change{
            background-color: black;
            color: white;
        }
    </style>
</head>
<body>
    <h1>비밀번호 변경</h1>
    <h2>더뷰티닷컴 비밀번호 변경</h2>

    <form id="passwordChangeForm" action="updatePassword" method="post">
        <label for="userMail">이메일:</label>
        <input type="email" id="userMail" name="userMail" required><br>

        <label for="newPassword">새 비밀번호:</label>
        <input type="password" id="newPassword" name="newPassword" required><br>
        
        <label for="confirmPassword">새 비밀번호 확인:</label>
        <input type="password" id="confirmPassword" name="confirmPassword" required><br>

        <input type="submit" class="btn-change" value="비밀번호 변경">
    </form>

	<script
      src="${pageContext.request.contextPath}/resources/js/user/changePw.js"></script>
	
</body>
</html>
