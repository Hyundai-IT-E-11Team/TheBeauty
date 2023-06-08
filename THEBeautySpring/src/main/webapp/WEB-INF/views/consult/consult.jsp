<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TheBeauty 화상상담</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<link rel="styleSheet"
	href="${pageContext.request.contextPath}/resources/css/consult/style.css"
	type="text/css" media="screen">
<script
	src="${pageContext.request.contextPath}/resources/js/consult/openvidu-browser-2.27.0.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/consult/app.js"></script>
</head>
<body>
	<div id="consult-container">
		<div id="join" style="display: block;">
			<h1>${currUser.userName }님 환영합니다.</h1>
			<p>
				<input type="button"
					onclick="joinSession('${currUser.roleNum}', '${reservation.consultRoomId }')"
					value="상담 시작하기">
			</p>
		</div>
		<div id="after-join" style="display: none;">
			<c:if test="${currUser.roleNum > 0}">
				<div id="control-box">
					<input type="text" class="search-input" placeholder="검색어를 입력하세요">
					<button class="button" onclick="search('${currUser.roleNum}')">검색</button>

					<button class="button" onclick="getProducts('${currUser.roleNum}')">전체
						보기</button>
					<input class="button" type="button"
						onclick="leaveSession(${reservation.reservationSeq})"
						value="LEAVE">
				</div>
			</c:if>
			<c:if test="${currUser.roleNum == 0}">
				<div id="control-box">
					<input class="button" type="button"
						onclick="leaveSession('${reservation.reservationSeq}')"
						value="LEAVE">
				</div>
			</c:if>
			<div id="main-container">
				<div id="session">
					<div id="video-container">
						<div id="publisher"></div>
						<c:if test="${currUser.roleNum > 0}">
							<div id="user-info">
								<p>이름 : ${userInfo.userName }</p>
								<p>피부타입 : ${userInfo.surveySkintype }</p>
								<p>퍼스널 컬러 : ${userInfo.surveyPersonalColor }</p>
								<p>선호 주얼리 색 : ${userInfo.surveyJewelryColor }</p>
								<p>피부 톤 : ${userInfo.surveySkintone }</p>
							</div>
						</c:if>
						<div id="subscriber"></div>
					</div>
				</div>
				<c:if test="${currUser.roleNum > 0}">
					<div id="c-container">
						<div class="items" id="c-items"></div>
					</div>
				</c:if>
				<c:if test="${currUser.roleNum == 0}">
					<div id="u-container">
						<div class="items" id="u-items"></div>
					</div>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>