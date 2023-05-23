<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 찾기</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
        .btn-find{
            background-color: black;
            color: white;
        }
        .textbox {
            border-bottom: 2px solid gray;
            padding-bottom: 5px;
        }
    </style>
</head>
<body>
    <h1>비밀번호 찾기</h1>
    <h2>더뷰티닷컴 비밀번호 찾기</h2>

    <form id="passwordFindForm" class="content" action="passwordChange" method="post">
        <div class="textbox">
            <input id="email" name="userMail" type="email" />
            <label for="email">이메일</label>
        </div>
        <div class="textbox">
            <input id="registration" name="userRegistration" type="text" />
            <label for="registration">주민등록번호</label>
        </div>
        <br><br>
        <input type="submit" value="회원정보찾기" class="btn-find">
    </form>

    <script>
	    $("#passwordFindForm").submit(function(event) {
	
	        var userMail = $("#email").val();
	        var userRegistration = $("#registration").val();
	
	        $.post("/passwordChange",
	        {
	            'userMail': userMail,
	            'userRegistration': userRegistration
	        },
	        function(data, status) {
	            if (status === 'success') {
	                if(data) {
	                    window.location.href = "/passwordChange";  // 비밀번호 변경 페이지로 이동
	                } else {
	                    alert("잘못된 요청입니다. 다시 입력해주세요.");
	                }
	            } else {
	            }
	        });
	    });

    </script>
</body>
</html>
