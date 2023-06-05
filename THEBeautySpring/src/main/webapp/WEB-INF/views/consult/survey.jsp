<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="styleSheet"
	href="${pageContext.request.contextPath}/resources/css/consult/survey.css"
	type="text/css" media="screen">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.2.1/css/fontawesome.min.css"
	integrity="sha384-QYIZto+st3yW+o8+5OHfT6S482Zsvz2WfOzpFSXMF9zqeLcFV0/wlZpMtyFcZALm"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div id="container">
		<h1>상담은 어떠셨나요?</h1>
		<h2>별점과 의견을 남겨주세요</h2>
		<div class="rating-container">
			<div id="star-container">
				<span class="star"> ★★★★★ 
				<span>★★★★★</span> 
				<input id="score"
					type="range" oninput="drawStar(this)" value="1" step="1" min="0"
					max="10">
				</span>
			</div>
			<textarea id="comment" placeholder="의견을 입력하세요..." rows="5" cols="30"></textarea>
		</div>
		<button id="submit" onclick="upload()">제출</button>
	</div>
	<script
		src="${pageContext.request.contextPath}/resources/js/consult/survey.js"></script>
</body>
</html>