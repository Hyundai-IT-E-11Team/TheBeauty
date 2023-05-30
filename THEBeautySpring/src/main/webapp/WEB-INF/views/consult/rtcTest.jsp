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
		<div id="join">
			<h1>${currUser.userName }님환영합니다.</h1>
			<form onsubmit="joinSession(); return false">
				<p>
					<label>상담 브랜드:</label> <input type="text" id="sessionId"
						value="chanel" required>
				</p>
				<p>
					<input type="submit" value="상담 시작하기">
				</p>
			</form>
		</div>

		<div id="session" style="display: none;">
			<h1 id="session-header"></h1>
			<div id="video-container">
				<div id="publisher"></div>
				<div id="subscriber"></div>
			</div>
		</div>


		<div id="c-container"
			${currUser.roleName.equals('user') ? "style='display:none'" : ""}>
			<div>
				<c:if test="${!empty currUser && currUser.roleName ne 'user'}">
					<button onclick="getProducts('${currUser.roleName}')">우리
						제품 불러오기</button>
				</c:if>
				<input type="button" onclick="leaveSession()" value="LEAVE">
			</div>
			<div class="items" id="c-items">
			</div>
		</div>
		<div id="u-container"
			${!currUser.roleName.equals('user') ? "style='display:none'" : ""}>
			<div>
			<input type="button" onclick="leaveSession()" value="LEAVE">
			</div>
			<div class="items" id="u-items">
			</div>
		</div>
	</div>
</body>

</html>