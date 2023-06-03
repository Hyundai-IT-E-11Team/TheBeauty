<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>openvidu-hello-world</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<link rel="styleSheet"
	href="${pageContext.request.contextPath}/resources/consult/style.css"
	type="text/css" media="screen">
<script
	src="${pageContext.request.contextPath}/resources/consult/openvidu-browser-2.27.0.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/consult/app.js"></script>
</head>
<body>
	<div id="consult-container">
		<div id="join" style="display: block;">
			<h1>${currUser.userName }님환영합니다.</h1>
			<p>상담 브랜드</p>
			<p>${reservation.brandName }</p>
			<p>
				<input type="button"
					onclick="joinSession('${currUser.roleNum}', '${reservation.consultRoomId }')"
					value="상담 시작하기">
			</p>
		</div>

		<div id="session" style="display: none;">
			<div id="video-container">
				<div id="publisher"></div>
				<div id="subscriber"></div>
			</div>
		</div>
		<c:if test="${currUser.roleNum > 0}">
			<div id="c-container" style="display: none;">
				<div>
					<input type="text" class="search-input" placeholder="검색어를 입력하세요">
					<button class="button" onclick="search('${currUser.roleNum}')">검색</button>

					<button class="button" onclick="getProducts('${currUser.roleNum}')">전체
						보기</button>
					<input class="button" type="button" onclick="leaveSession()"
						value="LEAVE">
				</div>
				<div class="items" id="c-items"></div>
			</div>
		</c:if>
		<c:if test="${currUser.roleNum == 0}">
			<div id="u-container" style="display: none;">
				<div>
					<input class="button" type="button" onclick="leaveSession()"
						value="LEAVE">
				</div>
				<div class="items" id="u-items"></div>
			</div>
		</c:if>
	</div>
</body>

</html>